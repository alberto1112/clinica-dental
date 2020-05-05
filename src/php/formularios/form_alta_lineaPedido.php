<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php
$cantidadErr = $costeErr = "";
$cantidad = $coste = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["cantidad"])) {
      $cantidadErr = "Este campo es obligatorio";
    } else {
      $cantidad = test_input($_POST["cantidad"]);
      if ($_POST["cantidad"] < 0) {
        $cantidadErr = "El valor debe de ser mayor o igual que 0";
      }
    }

    if (empty($_POST["coste"])) {
        $costeErr = "Este campo es obligatorio";
      } else {
        $coste = test_input($_POST["coste"]);
        if ($_POST["coste"] < 0) {
          $costeErr = "El valor debe de ser mayor o igual que 0";
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
    Cantidad*: <input required placeholder="Cantidad" type="text" name="cantidad" value="<?php echo $cantidad;?>">
    <span class="error"> <?php echo $cantidadErr;?></span>
	<br>
    Coste*: <input required placeholder="Coste" type="text" name="coste" value="<?php echo $coste;?>">
    <span class="error"> <?php echo $costeErr;?></span> 
	<br>         
  <input type="submit" name="submit">
	<input type="submit" name="atrás">
</form>

<?php
echo "<h2>Datos introducidos:</h2>";
echo $cantidad;
echo "<br>";
echo $coste;
echo "<br>";
?>