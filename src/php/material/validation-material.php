<?php
    session_start();

    if(isset($_SESSION["formulario"])){
        $nuevoMaterial["name"]=$_REQUEST["name"];
        $nuevoMaterial["categoría"]=$_REQUEST["categoría"];
        $nuevoMaterial["stock"]=$_REQUEST["stock"];
        $nuevoMaterial["stockMin"]=$_REQUEST["stockMin"];
        $nuevoMaterial["stockCrit"]=$_REQUEST["stockCrit"];
    }else{
        Header("Location: form-material.php");
    }

    $_SESSION["formulario"]=$nuevoMaterial;
    $errores = validarDatosMaterial($nuevoMaterial);

    if(count($errores)>0){
        $_SESSION["errores"]=$errores;
        Header("Location: form-material.php");
    }else{
        Header("Location: action-createMaterial.php");
    }

    function validarDatosMaterial($nuevoMaterial){
        if($nuevoMaterial["name"]==""){
            $errores[]="<p>El nombre no puede estar vacío</p>";
        }
        if($nuevoMaterial["categoría"]=""){
            $errores[]="<p>El material no puede tener categoría vacía</p>";
        }
        if($nuevoMaterial["stock"]=0){
            $errores[]="<p>El material debe tener stock inicial para poder ser registrado</p>";
        }
        if($nuevoMaterial["stockMin"]>$nuevoMaterial["stock"]){
            $errores[]="<p>El stock mínimo no puede ser superior al stock inicial</p>";
        }
        if($nuevoMaterial["stockCrit"]>$nuevoMaterial["stock"]){
            $errores[]="<p>El stock crítico no puede ser superior al stock inicial</p>";
        }
        if($nuevoMaterial["stockCrit"]>$nuevoMaterial["stockMin"]){
            $errores[]="<p>El stock crítico no puede ser superior al stock mínimo</p>";
        }
        return $errores;
    }
    ?>