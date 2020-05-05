<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php
$nameErr = $precioErr = "";
$name = $precio = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["name"])) {
      $nameErr = "Este campo es obligatorio";
    } else {
      $name = test_input($_POST["name"]);
      if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
        $nameErr = "Solo puedes introducir espacios y letras";
      }
    }

    if (empty($_POST["precio"])) {
        $precioErr = "Este campo es obligatorio";
      } else {
        $precio = test_input($_POST["precio"]);
        if ($_POST["precio"] < 0) {
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
    Nombre*: <input required placeholder="Nombre" type="text" name="name" value="<?php echo $name;?>">
    <span class="error"> <?php echo $nameErr;?></span>
	<br>
    Precio*: <input required placeholder="Precio" type="text" name="precio" value="<?php echo $precio;?>">
    <span class="error"> <?php echo $precioErr;?></span> 
	<br>         
  <input type="submit" name="submit">
	<input type="submit" name="atrás">
</form>

<?php
echo "<h2>Datos introducidos:</h2>";
echo $name;
echo "<br>";
echo $precio;
echo "<br>";
?>