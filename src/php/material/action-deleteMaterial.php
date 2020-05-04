<?php	
	session_start();	
	
	if (isset($_SESSION["material"])) {
		$material = $_SESSION["material"];
		unset($_SESSION["material"]);
		
		require_once("../gestionBD.php");
		require_once("gestionMaterial.php");
		
		$conexion = estableceConexion();		
		$excepcion = eliminaMaterial($conexion,$material["OID_M"]);
		cierraConexion($conexion);
			
		if ($excepcion<>"") {
			$_SESSION["excepcion"] = $excepcion;
			$_SESSION["destino"] = "consultaMateriales.php";
			Header("Location: ../excepcion.php");
		}
		else Header("Location: consultaMateriales.php");
	}
	else Header("Location: consultaMateriales.php"); // Se ha tratado de acceder directamente a este PHP
?>