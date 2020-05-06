<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php
$fechaFinErr = $accionesErr = "";
$fechaFin = $acciones = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["fechaFin"])) {
        $fechaFinErr = "";
      } else {
        $fechaFin = test_input($_POST["fechaFin"]);
        }
      }
      
      if (empty($_POST["acciones"])) {
        $acciones = "";
      } else {
        $acciones = test_input($_POST["acciones"]);
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
    Fecha fin: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaFin" value="<?php echo $fechaFin;?>">
    <span class="error"> <?php echo $fechaFinErr;?></span>
    <br><br>
    Acciones: <textarea name="acciones" rows="5" cols="40"><?php echo $acciones;?></textarea>
    <br><br>
    <input type="submit" name="submit">
	<input type="submit" name="atrás">
</form>

<?php
echo "<h2>Datos introducidos:</h2>";
echo $fechaFin;
echo "<br>";
echo $acciones;
?>