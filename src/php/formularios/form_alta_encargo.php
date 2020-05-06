<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
</style>
</head>
<body>  
<?php
$fechaEntregaErr = $fechaEntradaErr = "";
$fechaEntrega = $fechaEntrada = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (empty($_POST["fechaEntrega"])) {
        $fechaEntregaErr = "";
      } else {
        $fechaEntrega = test_input($_POST["fechaEntrega"]);
        }
      }

      if (empty($_POST["fechaEntrada"])) {
        $fechaEntradaErr = "";
      } else {
        $fechaEntrada = test_input($_POST["fechaEntrada"]);
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
    Fecha de entrada: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaEntrada" value="<?php echo $fechaEntrada;?>">
    <span class="error"> <?php echo $fechaEntradaErr;?></span>
    <br>
    Fecha de entrega: <input placeholder="dd/mm/yyyy" maxlength="10" type="text" name="fechaEntrega" value="<?php echo $fechaEntrega;?>">
    <span class="error"> <?php echo $fechaEntregaErr;?></span> 
	<br>         
    <input type="submit" name="submit">
	<input type="submit" name="atrás">
</form>

<?php
echo "<h2>Datos introducidos:</h2>";
echo $fechaEntrada;
echo "<br>";
echo $fechaEntrega;
?>
