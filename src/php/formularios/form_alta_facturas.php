<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
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
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
    <p><span class="error">* campo requerido</span></p>
	<br>
    Fecha de cobro: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaCobro" value="<?php echo $fechaCobro;?>">
    <span class="error"> <?php echo $fechaCobroErr;?></span>
    <br>
    Fecha de vencimiento: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaVencimiento" value="<?php echo $fechaVencimiento;?>">
    <span class="error"> <?php echo $fechaVencimientoErr;?></span>
    <br>
    Fecha de factura: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaFactura" value="<?php echo $fechaFactura;?>">
    <span class="error"> <?php echo $fechaFacturaErr;?></span>
    <br>
    Precio total: <input placeholder="Precio total" type="text" name="precioTotal" value="<?php echo $precioTotal;?>">
    <span class="error"> <?php echo $precioTotalErr;?></span> 
	<br>         
    <input type="submit" name="submit">
	<input type="submit" name="atrás">
</form>

<?php
echo "<h2>Datos introducidos:</h2>";
echo $fechaCobro;
echo "<br>";
echo $fechaVencimiento;
echo "<br>";
echo $fechaFactura;
echo "<br>";
echo $precioTotal;
?>