<?php

class Rutinas_TablaClase{
    
    private $_reflexion;
    private $_obj;
    
    public function __construct($obj){

        $this->_obj = $obj;
        $this->_reflexion = new ReflectionClass($obj);
    }

    public function getNombreTabla(){

        $className = $this->_reflexion->getName();
        return strtolower(substr($className, strrpos($className, '_') + 1));
    }

    public function getValores(){

        $valores = array();
        $propiedades = $this->_reflexion->getProperties();

        foreach ($propiedades as $propiedad){
            $nombrePropiedad = substr($propiedad->getName(), 1);

            //Incluir la propiedad si es leible y escribible
            if ($this->_obj->isCampo($nombrePropiedad)){

                $nombreGetter = 'get' . ucfirst(substr($propiedad->getName(), 1));
                //Convertir de formato camelcase a undescore
                $campo = preg_replace_callback('/([A-Z])/', function($c){
                    return '_' . strtolower($c[1]);
                }, substr($propiedad->getName(), 1));

                $valores[$campo] = $this->_obj->$nombreGetter();
            }
        }

        return $valores;
    }

    public function getId(){

        $valores = $this->getValores();
        $id = array();
        foreach ($valores as $campo => $valor){
            if ('id_' == substr($campo, 0, 3)){
                $id[] = $campo;
            }
        }
        return $id;
    }

    public function setValores($valores){

        $propiedades = $this->_reflexion->getProperties();

        foreach($valores as $campo => $valor){
            $nombrePropiedad = preg_replace_callback('/_([a-z])/', function($c){
                    return strtoupper($c[1]);
                }, $campo);

            try{
                $propiedad = $this->_reflexion->getProperty('_' . $nombrePropiedad);
            }catch(ReflectionExcepcion $e){
                throw new Rutinas_TablaClase_Excepcion("El campo '$campo' no tiene la " .
                    "propiedad '_$nombrePropiedad' en la clase " . $this->_reflexion->getName());
            }

            $setter = 'set' . ucfirst($nombrePropiedad);

            $this->_obj->$setter($valor);
        }
    }
}