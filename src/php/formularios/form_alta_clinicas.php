<!DOCTYPE HTML>  
<html>
<head>
    <meta charset="UTF-8" lang="es">
    <title>Alta clínicas</title>
    <link rel="stylesheet", type="text/css", href="../../css/formClinicas.css">
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



<img class="imagen" src="../../../images/logo.png" alt="logo.png" width=23% height=23%>
    <div class="block">
        <a href="#" class="acerca">Acerca de nosotros</a>
        <!-- Estos bloques definen las id que se usan para el js de la hora -->
        <div id="box">
            <div id="box-date"></div>
            <div id="box-time"></div>
        </div>
        
        <img class="calendario" src="../../../images/calendario.png" width="1%" height="11%">
        <img class="reloj" src="../../../images/reloj.png" width="1%" height="11%">
        
        <img class="usuario" src="../../../images/user.png" width="1.5%" height="13%">
        
        <img class="flechaA" src="../../../images/flechaA.png" width="20" height="20">
        
        <select class="botonUsuario">
            <option value="1">Usuario</option>
            <option value="2">Opcion 2</option>
            <option value="3">Opcion 3</option>
        </select>
    </div>
    <div class="bloque">
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
          <p><span class="error"> &emsp;* campo requerido</span></p>
      <p>
        &emsp;
        Nombre: &emsp; <input placeholder="Nombre" class = name type="text" name="name" value="<?php echo $name;?>">
        <span class="error"> <?php echo $nameErr;?></span>
      </p>
        &emsp;
        Localización: &emsp;<input placeholder="Localizacion" class=local type="text" name="local" value="<?php echo $local;?>">
        <span class="error"> <?php echo $localErr;?></span> 
      <p>
       &emsp;
      Telefono de contacto: &emsp;<input id="phone" class=phone name="phone" type="text" maxlength="9" placeholder="123456789" value="<?php echo $phone;?>"> </input>
      <span class="error"> <?php echo $phoneErr;?></span>
      </p>
      &emsp;
      Moroso:
        <input type="radio" name="moroso" class = moroso<?php if (isset($moroso) && $moroso=="Si") echo "checked";?> value="Si">Sí
        <input type="radio" name="moroso" class = moroso<?php if (isset($moroso) && $moroso=="No") echo "checked";?> value="No">No
        <span class="error">* <?php echo $morosoErr;?></span>
      <br><p>
      &emsp;
      Nombre Dueño: &emsp;<input placeholder="Nombre del dueño" class = "nameD" type="text" name="nameD" value="<?php echo $nameD;?>">
        <span class="error"> <?php echo $nameDErr;?></span>
      </p>
      &emsp;
        Numero de colegiado:&emsp;<input id="nCol" class="nCol" name="nCol" type="text" maxlength="4" placeholder="1234" value="<?php echo $nCol;?>"> </input>
        <span class="error"> <?php echo $nColErr;?></span>
      <br>
      <input type="submit" name="submit" value="Enviar" class="enviar">
	    <input type="submit" name="atrás" value="Atrás" class="atrás">

      </form>
      <div class="results">
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
        </div>
    </div>
    <img src= "../../../images/elementoAdd.png" class="elementoAdd" width="10%" height="18%">
    <script src="../../js/hora.js"></script>
  
</body>