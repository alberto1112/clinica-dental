<?php
    function consultarTodosMateriales($conexion){
        $consulta = "SELECT * FROM materiales ORDER BY OID_M";
        return $conexion->query($consulta);
    }

    function quitar_material($conexion,$oidMaterial){
        try{
            $stmt=$conexion->prepare('CALL eliminar_material(:oidMaterial)');
            $stmt->bindParam(':OidMaterial',$oidMaterial);
            $stmt->execute();
            return "";
        }catch(PDOException $e) {
            return $e->getMessage();
        }
    }

    function modificar_material($conexion,$oidMaterial,$stock,$stockMinimo,$stockCritico){
        try{
            $stmt=$conexion->prepare('CALL Modifica_material(:oidMaterial,:stock,:stockMinimo,:stockCritico)');
            $stmt->bindParam(':oidMaterial',$oidMaterial);
            $stmt->bindParam(':stock',$stock);
            $stmt->bindParam(':stockMinimo',$stockMinimo);
            $stmt->bindParam(':stockCritico',$stockCritico);
            $stmt->execute();
            return "";
        }catch(PDOException $e) {
            return $e->getMessage();
        }
    }

?>
