<?php
    session_start();

	require_once("../../gestionBD.php");
	require_once("gestionarMateriales.php");
	
	if (isset($_SESSION["material"])){
		$material = $_SESSION["material"];
		unset($_SESSION["material"]);
	}

	$conexion = crearConexionBD();
	$filas = consultarTodosMateriales($conexion);
	cerrarConexionBD($conexion);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gestión de inventario</title>
</head>
<body>
    <main>
        nombre categoria stock stockMinimo stockCritico
        <?php
            foreach($filas as $fila){
        ?>

        <article>
            <form method="post" action="controlador_materiales.php">
                <div>
                    <div>
                        <input id="OID_M" name="OID_M" type="hidden" value="<?php echo $fila["OID_M"]; ?>">
                        <input id="NOMBRE" name="NOMBRE" type="hidden" required value="<?php echo $fila["NOMBRE"];?>">
                        <input name="CATEGORIA" id="CATEGORIA" type= "hidden" required value="<?php echo $fila["CATEGORIA"];?>">
                        <input id="UNIDAD" name="UNIDAD" type="hidden" required value="<?php echo $fila["UNIDAD"];?>">
                        <?php
                            if(isset($material) and ($material["OID_M"] == $fila["OID_M"])){ ?>
                            if
                                <input id="STOCK" name="STOCK" type="number" value="<?php echo $fila["STOCK"];?>">
                                <input id="STOCK_MIN" name="STOCK_MIN" type="number" value="<?php echo $fila["STOCK_MIN"];?>">
                                <input id="STOCK_CRITICO" name="STOCK_CRITICO" type="number" value="<?php echo $fila["STOCK_CRITICO"];?>">
                       <?php }else{ ?>
                                else
                                <input id="NOMBRE" name="NOMBRE" type="hidden" value="<?php echo $fila["NOMBRE"];?>">
                                <?php echo $fila["NOMBRE"] . " " . $fila["CATEGORIA"] . " " . $fila["STOCK"] . " " . $fila["STOCK_MIN"] . " " . $fila["STOCK_CRITICO"];?>
                       <?php } ?>
                    </div>
                    <div>
                        <?php 
                        if (isset($material) and ($material["OID_M"] == $fila["OID_M"])) { ?>
						    <button id="Guardar" name="Guardar" type="submit">Guardar</button>
				  <?php }else{ ?>
						    <button id="Editar" name="Editar" type="submit">Editar</button>
				  <?php } ?>
					<button id="Borrar" name="Borrar" type="submit">Borrar
					</button>
                    </div>
                </div>
            </form>
        </article>
                  <?php } ?>
    </main>
</body>
</html>