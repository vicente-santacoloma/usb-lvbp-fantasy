<?php

class Controlador_Equipolvbp extends Controlador_Abstracto
{
    public function Crear()
    {

        $equipo = new Modelo_Equipolvbp(
            $_POST['idNombreEquipo'],
            $_POST['ubicacion'],
            $_POST['estadio'],
            $_POST['fechaFundacion']
        );
        $equipo->crear();
        
    }
    public function Modificar()
    {

        $equipo = new Modelo_Equipolvbp(
            $_POST['idNombreEquipo'],
            $_POST['ubicacion'],
            $_POST['estadio'],
            $_POST['fechaFundacion']
        );
        $equipo->modificar();
        
    }
    
}
