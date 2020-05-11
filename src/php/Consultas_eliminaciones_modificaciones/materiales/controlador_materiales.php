<?php	
	session_start();
	
	if (isset($_REQUEST["OID_M"])) {
		$material["OID_M"] = $_REQUEST["OID_M"];
		$material["NOMBRE"] = $_REQUEST["NOMBRE"];
		$material["CATEGORIA"] = $_REQUEST["CATEGORIA"];
		$material["STOCK"] = $_REQUEST["STOCK"];
		$material["STOCK_MIN"] = $_REQUEST["STOCK_MIN"];
        $material["STOCK_CRITICO"] = $_REQUEST["STOCK_CRITICO"];
        $material["UNIDAD"] = $_REQUEST["UNIDAD"];
		
		$_SESSION["material"] = $material;
			
		if (isset($_REQUEST["Editar"])) Header("Location: consulta_materiales.php"); 
		else if (isset($_REQUEST["Guardar"])) Header("Location: accion_modificar_material.php");
		else if (isset($_REQUEST["Borrar"])) Header("Location: accion_borrar_material.php"); 
	}
	else 
		Header("Location: consulta_materiales.php");
	
?>