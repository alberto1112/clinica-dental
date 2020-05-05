<?php
	
	session_start();
	
	require_once("../gestionBD.php");

	if (isset($_SESSION["formulario"])) {
		$nuevoUsuario = $_SESSION["formulario"];
		$_SESSION["formulario"] = null;
		$_SESSION["errores"] = null;
	}
	else 
		Header("Location: form-register.php");	

	$conexion = crearConexionBD();
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Clínica dental: registro finalizado</title>
	</head>
	<body>
	<?php 	
				include_once '../cabecera.php';
				include_once 'gestion-usuario.php';

				if(alta_usuario($conexion, $nuevoUsuario)){							
					$_SESSION['login'] = $nuevoUsuario['correo'];
				?>	
				<ul>
					<li>Nombre: <?php echo $nuevoUsuario["name"] ?></li>
					<li>Apellidos: <?php echo $nuevoUsuario["lastname"] ?></li>
					<li>Perfil: <?php echo $nuevoUsuario["perfil"] ?></li>
					<li>Email: <?php echo $nuevoUsuario["correo"] ?></li>
					<li>Usuario: <?php echo $nuevoUsuario["user"] ?></li>
				</ul>
		<?php
		 		} else { 
		?>
			<h1>El usuario ya existe en la base de datos.</h1>
			<div >	
				Pulsa <a href="form-register.php">aquí</a> para volver al formulario.
			</div>
		<?php } 
		
			include_once '../pie.php';

		?>
	</body>
</html>
<?php
	cerrarConexionBD($conexion);
?>