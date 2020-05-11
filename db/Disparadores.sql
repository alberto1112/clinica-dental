--BORRAR DISPARADORES
DROP TRIGGER RN_02;
DROP TRIGGER RN_05;

--CREAR DISPARADORES
--RN_02
CREATE OR REPLACE TRIGGER RN_02 
    AFTER INSERT OR UPDATE OF stock ON materiales
    FOR EACH ROW
BEGIN
    IF :NEW.stock < :OLD.stock_min OR :NEW.stock < :OLD.stock_critico 
    THEN
        IF :NEW.stock < :OLD.stock_critico
        THEN DBMS_OUTPUT.PUT_LINE('EL STOCK ESTÁ POR DEBAJO DEL STOCK CRÍTICO.');
        ELSIF :NEW.stock < :OLD.stock_min
        THEN DBMS_OUTPUT.PUT_LINE('EL STOCK ESTÁ POR DEBAJO DEL STOCK MÍNIMO.');
        END IF;
    END IF;
END;
/

--RN_05
CREATE OR REPLACE TRIGGER RN_05
    BEFORE INSERT ON linea_pedido
    FOR EACH ROW
    DECLARE 
    stock_materiales INTEGER;
    minimo INTEGER;
    suma INTEGER;
BEGIN
    SELECT stock INTO stock_materiales FROM materiales WHERE oid_m = :NEW.oid_m;
    SELECT stock_min INTO minimo FROM materiales WHERE oid_m = :NEW.oid_m;
    suma := :NEW.cantidad + stock_materiales;
    IF suma <  minimo
    THEN raise_application_error
    (-20600,'La suma de la cantidad pedida no hace que el stock supere el stock minimo.');
    END IF;
END;
/

--QUITAR MOROSOS DE LA RN_03
CREATE OR REPLACE TRIGGER quitar_moroso
    AFTER UPDATE OF fecha_cobro ON Facturas
    FOR EACH ROW
BEGIN
    IF :NEW.fecha_cobro IS NOT NULL
    THEN UPDATE Clinicas SET moroso = 'N' WHERE oid_c =  (SELECT OID_C FROM Encargos WHERE Encargos.OID_F = :NEW.oid_f); 
    END IF;
END;
