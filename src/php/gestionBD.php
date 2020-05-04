<?php

    function estableceConexion(){
        $serverName = "oci:dbname=localhost/XE;charset=UTF8";
        $userName = "system";
        $key="";

        try{
            $conexion = new PDO($serverName,$userName,$key,array(PDO::ATTR_PERSISTENT => true));
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            if($conexion){
                si;
            }
		    return $conexion;
        }catch(PDOException $e){
            $_SESSION["excepcion"] = $e->GetMessage();
            header("Location: excepcion.php");
        }
    }

    function cierraConexion($conexion){
        $conexion = null;
    }
?>