<?php
    require_once("../gestionBD.php");
    require_once("gestionMaterial.php");
    require_once("../paginacion_consulta.php");

    if (!isset($_SESSION['login']))
	Header("Location: login.php");
else {
	if (isset($_SESSION["material"])) {
		$material = $_SESSION["material"];
		unset($_SESSION["material"]);
    }
    if (isset($_SESSION["paginacion"]))
		$paginacion = $_SESSION["paginacion"];
	
	$pagina_seleccionada = isset($_GET["PAG_NUM"]) ? (int)$_GET["PAG_NUM"] : (isset($paginacion) ? (int)$paginacion["PAG_NUM"] : 1);
	$pag_tam = isset($_GET["PAG_TAM"]) ? (int)$_GET["PAG_TAM"] : (isset($paginacion) ? (int)$paginacion["PAG_TAM"] : 5);

	if ($pagina_seleccionada < 1) 		$pagina_seleccionada = 1;
    if ($pag_tam < 1) 		$pag_tam = 5;
    
    unset($_SESSION["paginacion"]);

    $conexion = estableceConexion();
    $query = 'SELECT * FROM MATERIALES ORDER BY OID_M';

    $total_registros = total_consulta($conexion, $query);
	$total_paginas = (int)($total_registros / $pag_tam);

	if ($total_registros % $pag_tam > 0)		$total_paginas++;

	if ($pagina_seleccionada > $total_paginas)		$pagina_seleccionada = $total_paginas;

	// Generamos los valores de sesión para página e intervalo para volver a ella después de una operación
	$paginacion["PAG_NUM"] = $pagina_seleccionada;
	$paginacion["PAG_TAM"] = $pag_tam;
	$_SESSION["paginacion"] = $paginacion;

	$filas = consulta_paginada($conexion, $query, $pagina_seleccionada, $pag_tam);

	cerrarConexionBD($conexion);
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" lang="es">
        <title>Lista de Materiales</title>
    </head>
    <body>
        <table>
            <tr>
                <th>Nombre</th>
                <th>Categoría</th>
                <th>Stock</th>
                <th>Stock Mínimo</th>
                <th>Stock Crítico</th>
            </tr>
            <?php
            $ejecuta = mysqli_query($link,$consulta);
            $numeroDeFilas = mysqli_num_rows($ejecuta);
            $fila = mysqli_fetch_array($ejecuta);

            if(!$ejecuta){
                echo "Error en la consulta";
            }else{
                if($numeroDeFilas<1){
                    echo "<tr><td>No se han encontrado datos</td></tr>";
                }else{
                    for($i=0;i<$fila;$i++){
                        echo "
                        <tr>
                            <td>".$fila[0]."</td>
                            <td>".$fila[1]."</td>
                            <td>".$fila[2]."</td>
                            <td>".$fila[3]."</td>
                            <td>".$fila[4]."</td>
                        </tr>";
                        $fila = mysqli_fetch_array($ejecuta);
                    }
                }
            }?>
    </body>
</html>