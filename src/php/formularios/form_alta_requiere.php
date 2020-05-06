<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php
$cantidadErr = "";
$cantidad =  "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["cantidad"])) {
      $cantidadErr = "Este campo es obligatorio";
    } else {
      $cantidad = test_input($_POST["cantidad"]);
      if ($_POST["cantidad"] < 0) {
        $cantidadErr = "El valor debe de ser mayor o igual que 0";
      }
    }
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
    Cantidad: <input placeholder="Cantidad" type="text" name="cantidad" value="<?php echo $cantidad;?>">
    <span class="error"> <?php echo $cantidadErr;?></span>
	<br>    

    <input type="submit" name="submit">
    <input type="submit" name="atrás">
</form>

<?php
echo "<h2>Datos introducidos:</h2>";
echo $cantidad;
?>