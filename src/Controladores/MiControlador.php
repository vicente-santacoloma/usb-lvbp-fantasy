<?php

class Controlador_MiControlador extends Controlador_Abstracto{

  public function MiEvento()
  {
    $liga = new Modelo_Liga();
    Rutinas_BaseDatos::getInstance()->getObjeto($liga);
    $this->vista = $liga;
  }
}