<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>
<?php 
$nameErr = $localErr = $phoneErr = $morosoErr = $nameDErr = $nColErr ="";
$name = $local = $phone = $moroso = $nameD = $nCol ="";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["name"])) {
      $nameErr = "Este campo es obligatorio";
    } else {
      $name = test_input($_POST["name"]);
      if (!preg_match("/^[a-zA-Z ]*$/",$name)) {
        $nameErr = "Solo puedes introducir espacios y letras";
      }
    }

    if (empty($_POST["local"])) {
        $local = "";
      } else {
        $local = test_input($_POST["local"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$local)) {
            $localErr = "Solo puedes introducir espacios y letras";
          }
        }

    if (empty($_POST["phone"])) {
         $phone = "";
        } else {
        $phone = test_input($_POST["phone"]);
        if (!preg_match("^[0-9]{9}^",$phone)) {
            $phoneErr = "Escribe un número adecuado";
             }
        }
    
    if (empty($_POST["moroso"])) {
        $morosoErr = "Es necesario marcar una opcion";
      } else {
        $moroso = test_input($_POST["moroso"]);
      }
    }

    if (empty($_POST["nameD"])) {
        $nameDErr = "";
      } else {
        $nameD = test_input($_POST["nameD"]);
        if (!preg_match("/^[a-zA-Z ]*$/",$nameD)) {
          $nameDErr = "Solo puedes introducir espacios y letras";
        }
      }

      if (empty($_POST["nCol"])) {
        $nCol = "";
       } else {
       $nCol = test_input($_POST["nCol"]);
       if (!preg_match("^[0-9]{4}^",$nCol)) {
           $nColErr = "Escribe un número adecuado";
            }
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
    Nombre: <input placeholder="Nombre" type="text" name="name" value="<?php echo $name;?>">
    <span class="error"> <?php echo $nameErr;?></span>
	<br>
    Localización: <input placeholder="Localizacion" type="text" name="local" value="<?php echo $local;?>">
    <span class="error"> <?php echo $localErr;?></span> 
	<br>
    Telefono de contacto:<input id="phone" name="phone" type="text" maxlength="9" placeholder="123456789" value="<?php echo $phone;?>"> </input>
    <span class="error"> <?php echo $phoneErr;?></span>
	<br>
    Moroso:
    <input type="radio" name="moroso" <?php if (isset($moroso) && $moroso=="Si") echo "checked";?> value="Si">Sí
    <input type="radio" name="moroso" <?php if (isset($moroso) && $moroso=="No") echo "checked";?> value="No">No
    <span class="error">* <?php echo $morosoErr;?></span>
    <br><br>
    Nombre Dueño: <input placeholder="Nombre del dueño" type="text" name="nameD" value="<?php echo $nameD;?>">
    <span class="error"> <?php echo $nameDErr;?></span>
    <br>
    Numero de colegiado:<input id="nCol" name="nCol" type="text" maxlength="4" placeholder="1234" value="<?php echo $nCol;?>"> </input>
    <span class="error"> <?php echo $nColErr;?></span>
    <br>
    <input type="submit" name="submit">
	<input type="submit" name="atrás">

</form>
<?php
echo "<h2>Datos introducidos:</h2>";
echo $name;
echo "<br>";
echo $local;
echo "<br>";
echo $phone;
echo"<br>";
echo $moroso;
echo "<br>";
echo $nameD;
echo "<br>";
echo $nCol;
?>