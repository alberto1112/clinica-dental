<?php
    session_start();

    if(!isset($_SESSION["formulario"])){
        $formulario["name"]="";
        $formulario["lastname"]="";
        $formulario["perfil"]="clinica";
        $formulario["correo"]="";
        $formulario["user"]="";
        $formulario["pass"]="";
        $_SESSION["formulario"] = $formulario; 
    }else{
        $formulario = $_SESSION["formulario"];
    }
	
	if(isset($_SESSION["errores"])){
		$errores=$_SESSION["errores"];
	}

?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" lang="es">
        <title> Sign in</title>
        <link rel="stylesheet" type="text/css" href="../../css/Formulario.css">
    </head>
    <body>
    	<?php include_once("../cabecera.php");?>
        
    	<div id="dev_errores">
			<?php 
			if (isset($errores) && !empty($errores)){
		        foreach($errores as $error){
		            print("<div class='error'>");
		            print("$error");
		            print("</div>");
		        }
	    	}
			?>
		</div>
    	
 
        <div class="propiedades">
            <form name="altaUsuario" action="validation-register.php" method="post" novalidate>
                <fieldset>
                    <legend>Datos Personales</legend>
                    <!--<p>NIF: <input id="NIF" name="NIF" pattern="^[09]{8}[A-Z]" placeholder="12345678X" required></p>-->
                    <p>Nombre: <input id="name" name="name" type="text" value="<?php echo $formulario['name'];?>" maxlength="40" placeholder="Nombre" required></p>
                    <p>Apellidos: <input id="lastname" name="lastname" value="<?php echo $formulario['lastname'];?>" type="text" placeholder="Apellidos" maxlength="80"></p>
                    <p>Perfil:
                        <input type="radio" id="clinica" name="perfil" <?php if($formulario['perfil']=='clinica') echo ' checked ';?> value="clinica"> Director de Clinica
                        <input type="radio" id="proveedor" name="perfil" <?php if($formulario['perfil']=='proveedor') echo ' checked ';?> value="proveedor"> Proveedor
                    </p>
                    <p>Email: <input id="correo" name="correo" value="<?php echo $formulario['correo'];?>" type="email" placeholder="Correo electronico" required> </p>
                </fieldset>
        <div class="reg-user">
                <fieldset>
                    <legend>Nuevo Usuario</legend>
                    <p>Nombre de Usuario: <input id="user" name="user" type="text" value="<?php echo $formulario['user'];?>" placeholder="Nombre de Usuario" required></p>
                    <p>Contraseña: <input id="pass" name="pass" type="password" value="<?php echo $formulario['pass'];?>" placeholder="Contraseña" required></p>
                    <p>Confirmar Contraseña: <input id="passConf" name="passConf" type="password" placeholder="Contraseña" required></p>              
                </fieldset>
        </div> 
        <input type="submit" value="Registrarse">       
            </form>
        </div>
 
        <?php include_once("../pie.php");?>
    </body>
</html>