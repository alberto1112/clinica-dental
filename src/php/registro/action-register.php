<?php
	
	session_start();
	
	if (isset($_SESSION["formulario"])) {
		$nuevoUsuario = $_SESSION["formulario"];
		$_SESSION["formulario"] = null;
		$_SESSION["errores"] = null;
	}
	else 
		Header("Location: form-register.php");	
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Clínica dental: registro finalizado</title>
	</head>
	<body>
		<h1>Usuario dado de alta con los siguientes datos:</h1>
		
		<ul>
			<li>Nombre: <?php echo $nuevoUsuario["name"] ?></li>
			<li>Apellidos: <?php echo $nuevoUsuario["lastname"] ?></li>
			<li>Perfil: <?php echo $nuevoUsuario["perfil"] ?></li>
			<li>Email: <?php echo $nuevoUsuario["correo"] ?></li>
			<li>Usuario: <?php echo $nuevoUsuario["user"] ?></li>
		</ul>
	</body>
</html>