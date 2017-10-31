<?php

/**
 * @author Vicente
 * @copyright 2011
 */
 
 class Controlador_Jugadorlvbp extends Controlador_Abstracto
 {  
    public function CrearBateador() {
        
        $bateador = new Modelo_Bateador(
            null,
            $_POST["numero"], 
            $_POST["equipolvbp"],
            $_POST["nombre"], 
            $_POST["edad"],
	    $_POST["puntaje"],
	    $_POST["activo"],
            $_POST["fechaNacimiento"], 
            $_POST["lugarNacimiento"],
            $_POST["precio"], 
            $_POST["posicion"],
            $_POST["carrerasAnotadas"],
            $_POST["basesAlcanzadas"], 
            $_POST["carrerasImpulsadas"],
            $_POST["basesRobadas"], 
            $_POST["basesPorBola"],
            $_POST["cantidadPonches"],
            $_POST["cantidadErrores"]
        ); 
        $bateador->crear();
    }
    
    public function CrearPitcher() {
        
        $pitcher = new Modelo_Pitcher(
            null,
            $_POST["numero"], 
            $_POST["equipolvbp"],
            $_POST["nombre"], 
            $_POST["edad"],
	    $_POST["puntaje"],
	    $_POST["activo"],
            $_POST["fechaNacimiento"], 
            $_POST["lugarNacimiento"], 
            $_POST["entradasLanzadas"],
            $_POST["carrerasLimpias"], 
            $_POST["imparables"],
            $_POST["ponches"], 
            $_POST["basesPorBola"],
            $_POST["juegosGanados"]
        ); 
        $pitcher->crear();  
    }
    
    public function ModificarBateador() {
        $bateador = new Modelo_Bateador(
            $_POST["id"],
            $_POST["numero"], 
            $_POST["equipolvbp"],
            $_POST["nombre"], 
            $_POST["edad"],
	    $_POST["puntaje"],
	    $_POST["activo"],
            $_POST["fechaNacimiento"], 
            $_POST["lugarNacimiento"],
            $_POST["precio"], 
            $_POST["posicion"],
            $_POST["carrerasAnotadas"],
            $_POST["basesAlcanzadas"], 
            $_POST["carrerasImpulsadas"],
            $_POST["basesRobadas"], 
            $_POST["basesPorBola"],
            $_POST["cantidadPonches"],
            $_POST["cantidadErrores"]
        ); 
        $bateador->modificar();
    }
    
    public function ModificarPitcher() {
        $pitcher = new Modelo_Pitcher(
            $_POST["id"],
            $_POST["numero"], 
            $_POST["equipolvbp"],
            $_POST["nombre"], 
            $_POST["edad"],
	    $_POST["puntaje"],
	    $_POST["activo"],
            $_POST["fechaNacimiento"], 
            $_POST["lugarNacimiento"], 
            $_POST["entradasLanzadas"],
            $_POST["carrerasLimpias"], 
            $_POST["imparables"],
            $_POST["ponches"], 
            $_POST["basesPorBola"],
            $_POST["juegosGanados"]
        ); 
        $pitcher->modificar();
	$pitcher->getEquipolvbp()->cargar();
	$this->vista->pitcher = $pitcher;
    }
    
    public function EliminarBateador() {
        $bateador = new Modelo_Bateador($_POST["id"]);
        $bateador->eliminar();
    }
    
    public function EliminarPitcher() {
        $pitcher = new Modelo_Pitcher($_POST["id"]);
        $pitcher->eliminar();
    }
    
    public function ListarBateador() {
        $bateadores = Modelo_Bateador::listar();
        $this->vista->$bateadores = $bateadores;
    }
    
    public function ListarPitcher() {
        $pichers = Modelo_Pitcher::listar();
        $this->vista->pichers = $pichers;
    }

    public function ConsultarPitcher(){
	$pitcher = new Modelo_Pitcher($_POST["id"]);
	$pitcher->cargar();
	$this->vista->pitcher = $pitcher;
    }
    
}



?>