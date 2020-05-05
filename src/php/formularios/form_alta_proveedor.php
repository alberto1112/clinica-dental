
<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  

<?php
$nameErr = $localErr = $phoneErr = "";
$name = $local = $phone =  "";

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
    Localización: <input placeholder="Localizacion" type="text" name="local" value="<?php echo $local;?>">
    <span class="error"> <?php echo $localErr;?></span> 
	<br>
    Telefono de contacto:<input id="phone" name="phone" type="text" maxlength="9" placeholder="123456789" value="<?php echo $phone;?>"> </input>
    <span class="error"> <?php echo $phoneErr;?></span>
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
?>
    