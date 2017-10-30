<?php

/**
 * @author Vicente
 * @copyright 2011
 */

// definicion de clase
abstract class Modelo_Jugadorlvbp extends Modelo_Abstracto {


    /**
     * 
     * @var int
     */
    protected $_numero;


    /**
     * 
     * @var Modelo_Equipolvbp
     */
    protected $_equipolvbp;


    /**
     * 
     * @var string
     */
    protected $_nombre;


    /**
     * 
     * @var string
     */
    protected $_apellido;


    /**
     * 
     * @var int
     */
    protected $_edad;


    /**
     * 
     * @var int
     */
    protected $_puntaje;


    /**
     * 
     * @var boolean
     */
    protected $_activo;


    /**
     * 
     * @var date
     */
    protected $_fechaNacimiento;


    /**
     * 
     * @var string
     */
    protected $_lugarNacimiento;
}