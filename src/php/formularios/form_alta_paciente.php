<!DOCTYPE HTML>  
<html>
<head>
    <meta charset="UTF-8" lang="es">
    <title>Alta paciente</title>
    <link rel="stylesheet", type="text/css", href="../../css/formPaciente.css">
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
<a href="../../html/log.html" ><img class="imagen" src="../../../images/logo.png" alt="logo.png" width=23% height=23%></a>
    <div class="block">
        <a href="../../html/about-us.html" class="acerca">Acerca de nosotros</a>
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
        <p><span class="error">&emsp;* campo requerido</span></p>
      <p>
      &emsp;
        DNI*:&emsp; <input  required placeholder="DNI" maxlength="9" type="text" name="dni" value="<?php echo $dni;?>">
        <span class="error"> <?php echo $dniErr;?></span>
      </p>
      &emsp;
        Fecha de Nacimiento:&emsp; <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaNacimiento" value="<?php echo $fechaNacimiento;?>">
        <span class="error"> <?php echo $fechaNacimientoErr;?></span>
      <p>
      &emsp;
        Sexo:
        <input type="radio" name="sexo" <?php if (isset($sexo) && $sexo=="Hombre") echo "checked";?> value="H">Hombre
        <input type="radio" name="sexo" <?php if (isset($sexo) && $sexo=="Mujer") echo "checked";?> value="M">Mujer
        <span class="error"> <?php echo $sexoErr;?></span>
      </p><br>
      &emsp;
        <input type="submit" name="submit" value="Enviar" class="enviar">
        <a href="../../html/listaPDP.html" class="buttonAtras">Atrás</a>
      </form>

      <div class="results">
        <?php
        echo "<h2>Datos introducidos:</h2>";
        echo $dni;
        echo "<br>";
        echo $fechaNacimiento;
        echo "<br>";
        echo $sexo;
        echo"<br>";
        ?>
        </div>
    </div>
    <img src= "../../../images/elementoAdd.png" class="elementoAdd" width="10%" height="18%">
    <script src="../../js/hora.js"></script>
  
</body>
