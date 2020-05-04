<?php
    session_start();

    if(!isset($_SESSION["formulario"])){
        $formulario["name"]="";
        $formulario["categoría"]="";
        $formulario["stock"]=100;
        $formulario["stockMin"]=10;
        $formulario["stockCrit"]=0;
        $_SESSION["formulario"]=$formulario;
    }else{
        $formulario=$_SESSION["formulario"];
    }

    if(isset($_SESSION["errores"])){
		$errores=$_SESSION["errores"];
    }

    ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" lang="es">
        <title>Nuevo Material</title>
        <link rel="stylesheet" type="text/css" href="../../css/Formulario.css">
    </head>
    <body>
        <?php include_once("../cabecera.php");?>

        <div id="dev_errores">
			<?php 
			if (isset($errores) && !empty($errores)){
		        foreach($errores as $error){
		            print("<div class='error'>");
		            print("$error");
		            print("</div>");
		        }
	    	}
			?>
        </div>
        
        <div class="propiedades">
            <form name="nuevo-material" action="./action-createMaterial.php" method="POST">
                <fieldset>
                    <legend>Propiedades del Material</legend>
                    <p>Nombre: <input id="name" name="name" type="text" maxlength="30" placeholder="Nombre del material"
                    value="<?php echo $formulario["name"];?>" required></p>
                    <label for="categoría">Categoría:</label>
                    <input list="opcionesCategoría" name="categoría" id="categoría" 
                    value="<?php echo $formulario["categoría"];?>" required>
                    <datalist id="opcionesCategoría">
                        <option value="Alambre">Alambre</option>
                        <option value="Dientes">Dientes</option>
                        <option value="Empress">Empress</option>
                        <option value="Ferula">Ferula</option>
                        <option value="Metal Ceramica">Metal Ceramica</option>
                        <option value="Metal">Metal</option>
                        <option value="Resina">Resina</option>
                        <option value="Revestimiento">Revestimiento</option>
                        <option value="Ceramica Zirconio">Ceramica Zirconio</option>
                    </datalist>
                    <p>Establece el Stock inicial: <input type="number" name="stock" min="1"
                     value="<?php echo $formulario["stock"];?>" required></p>
                    <p>Establece el Stock mínimo: <input type="number" name="stockMin" min="1"
                     value="<?php echo $formulario["stockMin"];?>" required></p>
                    <p>Establece el Stock crítico: <input type="number" name="stockCrit" min="1" 
                     value="<?php echo $formulario["stockCrit"];?>" required></p>
                </fieldset>
                <input type="submit" value="Crear">
            </form>
        </div>
        
        <<?php include_once("../pie.php");?>
    </body>
</html>

<?php
if(isset($_POST["formulario"])){
    $nombre = $formulario["name"];
    $categoria = $formulario["categoría"];
    $stock = $formulario["stock"];
    $min = $formulario["stockMin"];
    $crit = $formulario["stockCrit"];
    $insertaDato = "crear_material('$nombre','$categoria','$stock','$min','$crit')";
    $ejecuta = mysqli_query($link,$insertaDato);

    if(!$ejecuta){
        echo "Error en la inserción";
    }
}
    
?>