<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php

$fechaSolicitudErr = $fechaEntregaErr =  "";
$fechaSolicitud = $fechaEntrega = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["fechaSolicitud"])) {
        $fechaSolicitudErr = "";
      } else {
        $fechaSolicitud = test_input($_POST["fechaSolicitud"]);
        }
      }

      if (empty($_POST["fechaEntrega"])) {
        $fechaEntregaErr = "";
      } else {
        $fechaEntrega = test_input($_POST["fechaEntrega"]);
        }


        function test_input($data) {
            $data = trim($data);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
          }
    ?>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
    <p><span class="error">* campo requerido</span></p>
	<br>
    Fecha de solicitud: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaSolicitud" value="<?php echo $fechaSolicitud;?>">
    <span class="error"> <?php echo $fechaSolicitudErr;?></span>
    <br>
    Fecha de de entrega: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaEntrega" value="<?php echo $fechaEntrega;?>">
    <span class="error"> <?php echo $fechaEntregaErr;?></span>
    <br>
    <input type="submit" name="submit">
	<input type="submit" name="atrás">
    </form>

<?php
echo "<h2>Datos introducidos:</h2>";
echo $fechaSolicitud;
echo "<br>";
echo $fechaEntrega;
?>