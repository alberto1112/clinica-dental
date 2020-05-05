<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php
$dniErr = $fechaNacimientoErr = $sexoErr ="";
$dni = $fechaNacimiento = $sexo = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["dni"])) {
        $dniErr = "Este campo es obligatorio";
      } else {
        $dni = test_input($_POST["dni"]);
        if (!preg_match("/^[0-9]{8,8}[A-Za-z]$/",$dni)) {
          $dniErr = "Introduce un dni adecuado";
        }
      }

      if (empty($_POST["fechaNacimiento"])) {
        $fechaNacimientoErr = "";
      } else {
        $fechaNacimiento = test_input($_POST["fechaNacimiento"]);
        }
      } 
      
      if (empty($_POST["sexo"])) {
        $sexoErr = "";
      } else {
        $sexo = test_input($_POST["sexo"]);
      }
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }
?>
</body>
  <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
    <p><span class="error">* campo requerido</span></p>
	<br>
    DNI*: <input  required placeholder="DNI" maxlength="9" type="text" name="dni" value="<?php echo $dni;?>">
    <span class="error"> <?php echo $dniErr;?></span>
    <br>
    Fecha de Nacimiento: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaNacimiento" value="<?php echo $fechaNacimiento;?>">
    <span class="error"> <?php echo $fechaNacimientoErr;?></span>
    <br>
    Sexo:
    <input type="radio" name="sexo" <?php if (isset($sexo) && $sexo=="Hombre") echo "checked";?> value="H">Hombre
    <input type="radio" name="sexo" <?php if (isset($sexo) && $sexo=="Mujer") echo "checked";?> value="M">Mujer
    <span class="error"> <?php echo $sexoErr;?></span>
    <br><br>
    <input type="submit" name="submit">
	<input type="submit" name="atrás">
  </form>
  <?php
echo "<h2>Datos introducidos:</h2>";
echo $dni;
echo "<br>";
echo $fechaNacimiento;
echo "<br>";
echo $sexo;
echo"<br>";
?>