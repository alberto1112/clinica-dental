<?php
    session_start();

    if(isset($_SESSION["formulario"])){
        $nuevoMaterial = $_SESSION["formulario"];
        $_SESSION["formulario"]=null;
        $_SESSION["errores"]=null;
    }else{
        Header("Location: form-material.php");
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <tittle>Registro nuevo material: Completado</tittle>
    </head>
    <body>
        <h1>Material registrado con los siguientes datos:</h1>
        <ul>
            <li>Nombre: <?php echo $nuevoMaterial["name"]?></li>
            <li>Categoría: <?php echo $nuevoMaterial["categoría"]?></li>
            <li>Stock: <?php echo $nuevoMaterial["stock"]?></li>
            <li>Stock Mínimo: <?php echo $nuevoMaterial["stockMin"]?></li>
            <li>Stock Crítico: <?php echo $nuevoMaterial["stockCrit"]?></li>
        </ul>
    </body>
</html>