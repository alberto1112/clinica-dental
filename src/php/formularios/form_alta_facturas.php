<!DOCTYPE HTML>  
<html>
<head>
    <meta charset="UTF-8" lang="es">
    <title>Alta facturas</title>
    <link rel="stylesheet", type="text/css", href="../../css/formFacturas.css">
</head>
<body>  

<?php
$fechaCobroErr = $fechaVencimientoErr = $fechaFacturaErr = $precioTotalErr = "";
$fechaCobro = $fechaVencimiento = $fechaFactura = $precioTotal = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["fechaCobro"])) {
        $fechaCobroErr = "";
      } else {
        $fechaCobro = test_input($_POST["fechaCobro"]);
        }
      }

      if (empty($_POST["fechaVencimiento"])) {
        $fechaVencimientoErr = "";
      } else {
        $fechaVencimiento = test_input($_POST["fechaVencimiento"]);
        }

      if (empty($_POST["fechaFactura"])) {
        $fechaFacturaErr = "";
      } else {
        $fechaFactura = test_input($_POST["fechaFactura"]);
        }

      if (empty($_POST["precioTotal"])) {
        $precioTotalErr = "Este campo es obligatorio";
      } else {
        $precioTotal = test_input($_POST["precioTotal"]);
        if ($_POST["precioTotal"] < 0) {
          $precioTotalErr = "El valor debe de ser mayor o igual que 0";
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
          <p><span class="error">&emsp;* campo requerido</span></p>
        <p>
          &emsp;
          Fecha de cobro: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaCobro" value="<?php echo $fechaCobro;?>">
          <span class="error"> <?php echo $fechaCobroErr;?></span>
        </p>
          &emsp;
          Fecha de vencimiento: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaVencimiento" value="<?php echo $fechaVencimiento;?>">
          <span class="error"> <?php echo $fechaVencimientoErr;?></span>
        <p>
          &emsp;
          Fecha de factura: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaFactura" value="<?php echo $fechaFactura;?>">
          <span class="error"> <?php echo $fechaFacturaErr;?></span>
        </p>
          &emsp;
          Precio total: <input placeholder="Precio total" type="text" name="precioTotal" value="<?php echo $precioTotal;?>">
          <span class="error"> <?php echo $precioTotalErr;?></span> 
        <br>         
        <input type="submit" name="submit" value="Enviar" class="enviar">
	    <input type="submit" name="atrás" value="Atrás" class="atrás">
      </form>
      <div class="results">
        <?php
        echo "<h2>Datos introducidos:</h2>";
        echo $fechaCobro;
        echo "<br>";
        echo $fechaVencimiento;
        echo "<br>";  
        echo $fechaFactura;
        echo"<br>";
        echo $precioTotal;
        ?>
        </div>
    </div>
    <img src= "../../../images/elementoAdd.png" class="elementoAdd" width="10%" height="18%">
    <script src="../../js/hora.js"></script>
  
</body>