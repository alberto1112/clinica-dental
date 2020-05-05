<?php
    function consultaMateriales($conexion){
        return $conexion->query($conexion->prepare('CALL PR_Inventario'));
    }

    function eliminaMaterial($conexion,$OID_M){
        try {
            $stmt=$conexion->prepare('CALL eliminar_material(:w_oid_m)');
            $stmt->bindParam(':w_oid_m',$OID_M);
            $stmt->execute();
            return "";
        } catch(PDOException $e) {
            return $e->getMessage();
        }
    }

    function modificarMaterial($conexion,$OID_M,$stock,$min,$crit){
        try {
            $stmt=$conexion->prepare('CALL Modifica_material(:Oid_m,:stock,:stockMin,:stockCrit)');
            $stmt->bindParam(':Oid_m',$OID_M);
            $stmt->bindParam(':stock',$stock);
            $stmt->bindparam(':stockMin',$min);
            $stmt->bindparam(':stockCrit',$crit);
            $stmt->execute();
            return "";
        } catch(PDOException $e) {
            return $e->getMessage();
        }
    }
?>