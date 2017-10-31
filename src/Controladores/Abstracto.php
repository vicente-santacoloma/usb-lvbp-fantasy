<?php

abstract class Controlador_Abstracto
{


    /**
     * Los controladores son singleton. Estas instancias pueden perdurar entre sesiones
     * 
     * @return self
     */
    public static function getInstance(){

//        $nombreClase = get_called_class();
//
//        if (isset($_SESSION[$nombreClase])){
//            return $_SESSION[$nombreClase];
//        }
//        $_SESSION[$nombreClase] = new static();
//        
        return new static();
    }


    /**
     * Los controladores perduran entre instancias. En el momento que se quiera eliminar
     * la memoria de la sesión sobre este controlador, se debe llamar este método
     * 
     * @return void
     */
    public static function deleteSession(){
        unset($_SESSION[get_called_class()]);
    }


    /**
     * Objeto vista al que se le pueden colocar valores arbitrarios que se le van a
     * pasar posteriormente a la vista
     * 
     * @var Vista
     */
    protected $vista;


    /**
     * Constructor privado para evitar que sea instanciado desde afuera (patrón singleton)
     */
    private function __construct(){

    }


    /**
     * Getter para vista
     * 
     * @return Vista objeto vista
     */
    public function getVista(){
        return $this->vista;
    }


    /**
     * Setter para vista donde se guardan los valores para la vista
     * 
     * @param Vista $vista objeto vista
     * 
     * @return void
     */
    public function setVista($vista){
        $this->vista = $vista;
    }
}
