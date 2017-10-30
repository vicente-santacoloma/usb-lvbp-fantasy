<?php

class Controlador_Liga extends Controlador_Abstracto
{
    public function Consultar()
    {
        //Agregar
        $liga = new Modelo_Liga("magallanes", 1, "vicente");
        $liga->crear();
        //Test de estado
        $liga = new Modelo_Liga("magallanes");
        $liga->cargar();
        $this->vista->liga1 = clone $liga;
        //Modificar
        $liga->setEsPrivada(2);
        $liga->modificar();
        //Test de estado
        $liga = new Modelo_Liga("magallanes");
        $liga->cargar();
        $this->vista->liga2 = $liga;
        //Eliminar
        $liga->eliminar();
    }
}