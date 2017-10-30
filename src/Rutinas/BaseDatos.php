<?php

class Rutinas_BaseDatos{

    private static $_instance = null;

    private $_host;

    private $_username;

    private $_password;

    private $_dbname;

    private $_conexion;

    public static function init($conf){
        if (null != self::$_instance){
            throw new Rutinas_BaseDatos_Excepcion("La base de datos ya fue inicializada");
        }
        self::$_instance = new self($conf);
    }

    public static function getInstance(){
        if (null == self::$_instance){
            throw new Rutinas_BaseDatos_Excepcion("La instancia de base de datos no fue inicializada");
        }
        return self::$_instance;
    }

    private function __construct($conf){
        $this->_host = $conf['host'];
        $this->_username = $conf['username'];
        $this->_password = $conf['password'];
        $this->_dbname = $conf['dbname'];
    }
  
    public function cargarObjeto($obj){

        $tablaClase = new Rutinas_TablaClase($obj);
        
        $query = "SELECT ";
        $valores = $tablaClase->getValores();
        $id = $tablaClase->getId();

        foreach ($valores as $campo => $valor){
            $query .= '`' . $this->_escapar($campo) . '`, ';
        }
        $query = substr($query, 0, -2) . " FROM " . $tablaClase->getNombreTabla() . " WHERE ";

        if (0 == count($id)){
            throw new Rutinas_BaseDatos_Excepcion("No se puede inicializar el objeto si no trae campo de identificador");
        }
        //TODO: implementar las referencias a objetos, no van a ser claves foráneas
        foreach ($id as $campo){
            if (null === $valores[$campo]){
                throw new Rutinas_BaseDatos_Excepcion("El valor para el campo id '$campo' no está definido");
            }
            $query .= '`' . $this->_escapar($campo) . "` = '" . $this->_escapar($valores[$campo]) . "' AND ";
        }
        $query = substr($query, 0, -5);
        
        try{
            $registros = $this->_ejecutarLectura($query);
        }catch(Rutinas_BaseDatos_Excepcion $e){
            throw new Rutinas_BaseDatos_Excepcion("El query para inicialización del objeto falló: " . $e->getMessage());
        }
        
        if (1 != count($registros)){
            throw new Rutinas_BaseDatos_Excepcion("El query para inicializar " .
                "un objeto devolvió  " . count($registros) . " filas: $query");
        }
        
        list($registro) = $registros;
        
        try{
            $tablaClase->setValores($registro);
        }catch(Rutinas_TablaClase_Excepcion $e){
            throw new Rutinas_BaseDatos_Excepcion("La inicialización del objeto falló: " . $e->getMessage());
        }
    }

    public function crearObjeto($obj){

        $tablaClase = new Rutinas_TablaClase($obj);
        
        $query = "INSERT INTO " . $tablaClase->getNombreTabla() . " (";
        $valores = $tablaClase->getValores();
        $id = $tablaClase->getId();

        foreach ($id as $campo){
            if (null === $valores[$campo]){
                throw new Rutinas_BaseDatos_Excepcion("El valor para el campo id '$campo' no está definido");
            }
        }

        //Agregar campos al query
        foreach ($valores as $campo => $valor){
            $query .= "`" . $this->_escapar($campo) . "`, ";
        }
        $query = substr($query, 0, -2) . ") VALUES (";

        //Agregar valores al query
        foreach ($valores as $campo => $valor){
            $query .= "'" . $this->_escapar($valor) . "', ";
        }
        $query = substr($query, 0, -2) . ')';

        //Ejecución
        try{
            $this->_ejecutar($query);
        }catch(Rutinas_BaseDatos_Excepcion $e){
            throw new Rutinas_BaseDatos_Excepcion("El query para inserción del objeto falló: " . $e->getMessage());
        }

	//Valor de la clave postiza generada por mysql
	$obj->setId($this->_conexion->insert_id);
    }

    public function modificarObjeto($obj){

        $tablaClase = new Rutinas_TablaClase($obj);
        
        $query = "UPDATE " . $tablaClase->getNombreTabla() . " SET ";
        $valores = $tablaClase->getValores();
        $id = $tablaClase->getId();
        if (0 == count($id)){
            throw new Rutinas_BaseDatos_Excepcion("No se puede actualizar el objeto si no trae campo de identificador");
        }

        //Agregar los valores a actualizar
        foreach ($valores as $campo => $valor){
            //No hace falta actualizar la clave primaria
            if (in_array($campo, $id)){
                continue;
            }
            $query .= "`" . $this->_escapar($campo) . "`='" . $this->_escapar($valor) . "', ";
        }
        $query = substr($query, 0, -2) . " WHERE ";

        //Agregar las condiciones de actualización
        foreach ($id as $campo){
            if (null === $valores[$campo]){
                throw new Rutinas_BaseDatos_Excepcion("El valor para el campo id '$campo' no está definido");
            }
            $query .= '`' . $this->_escapar($campo) . "` = '" . $this->_escapar($valores[$campo]) . "' AND ";
        }
        $query = substr($query, 0, -5);

        //Ejecución
        try{
            $this->_ejecutar($query);
        }catch(Rutinas_BaseDatos_Excepcion $e){
            throw new Rutinas_BaseDatos_Excepcion("El query para actualización del objeto falló: " . $e->getMessage());
        }
    }

    public function eliminarObjeto($obj){

        $tablaClase = new Rutinas_TablaClase($obj);
        
        $query = "DELETE FROM " . $tablaClase->getNombreTabla() . " WHERE ";
        $valores = $tablaClase->getValores();
        $id = $tablaClase->getId();
        if (0 == count($id)){
            throw new Rutinas_BaseDatos_Excepcion("No se puede actualizar el objeto si no trae campo de identificador");
        }

        //Agregar las condiciones de actualización
        foreach ($id as $campo){
            if (null === $valores[$campo]){
                throw new Rutinas_BaseDatos_Excepcion("El valor para el campo id '$campo' no está definido");
            }
            $query .= '`' . $this->_escapar($campo) . "` = '" . $this->_escapar($valores[$campo]) . "' AND ";
        }
        $query = substr($query, 0, -5);

        //Ejecución
        try{
            $this->_ejecutar($query);
        }catch(Rutinas_BaseDatos_Excepcion $e){
            throw new Rutinas_BaseDatos_Excepcion("El query para eliminación del objeto falló: " . $e->getMessage());
        }
    }

    private function _iniConexion(){
        if (null == $this->_conexion){
            $this->_conexion = new mysqli($this->_host, $this->_username, $this->_password, $this->_dbname);
        }
    }

    private function _ejecutarLectura($query){
        $resultado = $this->_ejecutar($query);

        $registros = array();
        while ($registro = $resultado->fetch_assoc()){
            $registros[] = $registro;
        }

        return $registros;
    }

    private function _ejecutar($query){
        $this->_iniConexion();
        $resultado = $this->_conexion->query($query);

        if (false === $resultado){
            throw new Rutinas_BaseDatos_Excepcion('Error ejecutando el query "' .
                $this->_conexion->error . '" ejecutando el query ' . $query);
        }

        return $resultado;
    }


    private function _escapar($valor){
        $this->_iniConexion();
        return $this->_conexion->real_escape_string($valor);
    }
}