<?php

function alta_usuario($conexion,$usuario) {

	//NOMBRE,APELLIDOS,EMAIL,USER,PASS,PERFIL
	try{
		$stmt = $conexion->prepare("CALL INSERTAR_USUARIO(:nombre,:apellidos,:email,:usuario,:pass,:perfil)");
		$stmt->bindParam(':nombre',$usuario['name']);
		$stmt->bindParam(':apellidos',$usuario['lastname']);
        $stmt->bindParam(':email',$usuario['correo']);
        $stmt->bindParam(':usuario',$usuario['user']);
		$stmt->bindParam(':pass',$usuario['pass']);
		$stmt->bindParam(':perfil',$usuario['perfil']);
		$stmt->execute();
		return true;
	}catch(PDOException $e){
		//echo 'error: ' . $e->getMessage();
		return false;
	}
}

function consultarUsuario($conexion,$email,$pass) {
 	$consulta = "SELECT COUNT(*) AS TOTAL FROM USUARIOS WHERE EMAIL=:email AND PASS=:pass";
	$stmt = $conexion->prepare($consulta);
	$stmt->bindParam(':email',$email);
	$stmt->bindParam(':pass',$pass);
	$stmt->execute();
	return $stmt->fetchColumn();
	
}

?>