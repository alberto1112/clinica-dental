--PRUEBAS TABLA CLINICAS
CREATE OR REPLACE 
PACKAGE PRUEBAS_CLINICAS AS
    
    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_nombre clinicas.nombre%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_c clinicas.oid_c%TYPE, w_nombre clinicas.nombre%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_c clinicas.oid_c%TYPE, salidaEsperada BOOLEAN);
    
END PRUEBAS_CLINICAS;
/

CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_CLINICAS AS
    
    PROCEDURE inicializar AS
    BEGIN
        DELETE FROM clinicas;
    END inicializar;
    
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_nombre clinicas.nombre%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        clinica clinicas%ROWTYPE;
        w_oid_c clinicas.oid_c%TYPE;
    BEGIN
    
        INSERT INTO clinicas (oid_c, nombre) VALUES (SEC_clinicas.nextval, w_nombre);
        
        w_oid_c := SEC_clinicas.currval;
        SELECT * INTO clinica FROM clinicas WHERE oid_c = w_oid_c;
        IF (clinica.nombre <> w_nombre) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
    END insertar;
    
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_c clinicas.oid_c%TYPE, w_nombre clinicas.nombre%TYPE,
                          salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        clinica clinicas%ROWTYPE;
    BEGIN
        
        UPDATE clinicas SET nombre = w_nombre WHERE oid_c = w_oid_c;

        SELECT * INTO clinica FROM clinicas WHERE oid_c = w_oid_c;
        IF (clinica.nombre <> w_nombre) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END actualizar;
    
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_c clinicas.oid_c%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        n_clinicas INTEGER;
    BEGIN
    
        DELETE FROM clinicas WHERE oid_c = w_oid_c;
        
        SELECT COUNT(*) INTO n_clinicas FROM clinicas WHERE oid_c = w_oid_c;
        IF (n_clinicas <> 0) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END eliminar;
        

END PRUEBAS_CLINICAS;
/

--PRUEBA PACIENTES
CREATE OR REPLACE 
PACKAGE PRUEBAS_PACIENTES AS
    
    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_dni pacientes.dni%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_pc pacientes.oid_pc%TYPE, w_dni pacientes.dni%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_pc pacientes.oid_pc%TYPE, salidaEsperada BOOLEAN);
    
END PRUEBAS_PACIENTES;
/

CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_PACIENTES AS
    
    PROCEDURE inicializar AS
    BEGIN
        DELETE FROM pacientes;
    END inicializar;
    
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_dni pacientes.dni%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        paciente pacientes%ROWTYPE;
        w_oid_pc pacientes.oid_pc%TYPE;
    BEGIN
    
        INSERT INTO pacientes (oid_pc, dni) VALUES (SEC_pacientes.nextval, w_dni);
        
        w_oid_pc := SEC_pacientes.currval;
        SELECT * INTO paciente FROM pacientes WHERE oid_pc = w_oid_pc;
        IF (paciente.dni <> w_dni) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
    END insertar;
    
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_pc pacientes.oid_pc%TYPE, w_dni pacientes.dni%TYPE,
                          salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        paciente pacientes%ROWTYPE;
    BEGIN
        
        UPDATE pacientes SET dni = w_dni WHERE oid_pc = w_oid_pc;

        SELECT * INTO paciente FROM pacientes WHERE oid_pc = w_oid_pc;
        IF (paciente.dni <> w_dni) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END actualizar;
    
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_pc pacientes.oid_pc%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        n_pacientes INTEGER;
    BEGIN
    
        DELETE FROM pacientes WHERE oid_pc = w_oid_pc;
        
        SELECT COUNT(*) INTO n_pacientes FROM pacientes WHERE oid_pc = w_oid_pc;
        IF (n_pacientes <> 0) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END eliminar;
        

END PRUEBAS_PACIENTES;
/

--PRUEBAS FACTURAS
CREATE OR REPLACE 
PACKAGE PRUEBAS_FACTURAS AS
    
    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_cobro facturas.fecha_cobro%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_f facturas.oid_f%TYPE, w_fecha_cobro facturas.fecha_cobro%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_f facturas.oid_f%TYPE, salidaEsperada BOOLEAN);
    
END PRUEBAS_FACTURAS;
/

CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_FACTURAS AS
    
    PROCEDURE inicializar AS
    BEGIN
        DELETE FROM facturas;
    END inicializar;
    
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_cobro facturas.fecha_cobro%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        factura facturas%ROWTYPE;
        w_oid_f facturas.oid_f%TYPE;
    BEGIN
    
        INSERT INTO facturas (oid_f, fecha_cobro) VALUES (SEC_facturas.nextval, w_fecha_cobro);
        
        w_oid_f := SEC_facturas.currval;
        SELECT * INTO factura FROM facturas WHERE oid_f = w_oid_f;
        IF (factura.fecha_cobro <> w_fecha_cobro) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
    END insertar;
    
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_f facturas.oid_f%TYPE, w_fecha_cobro facturas.fecha_cobro%TYPE,
                          salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        factura facturas%ROWTYPE;
    BEGIN
        
        UPDATE facturas SET fecha_cobro = w_fecha_cobro WHERE oid_f = w_oid_f;

        SELECT * INTO factura FROM facturas WHERE oid_f = w_oid_f;
        IF (factura.fecha_cobro <> w_fecha_cobro) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END actualizar;
    
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_f facturas.oid_f%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        n_facturas INTEGER;
    BEGIN
    
        DELETE FROM facturas WHERE oid_f = w_oid_f;
        
        SELECT COUNT(*) INTO n_facturas FROM facturas WHERE oid_f = w_oid_f;
        IF (n_facturas <> 0) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END eliminar;
        

END PRUEBAS_FACTURAS;
/

--PRUEBAS ENCARGOS
CREATE OR REPLACE 
PACKAGE PRUEBAS_ENCARGOS AS
    
    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_entrada encargos.fecha_entrada%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_e encargos.oid_e%TYPE, w_fecha_entrada encargos.fecha_entrada%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_e encargos.oid_e%TYPE, salidaEsperada BOOLEAN);
    
END PRUEBAS_ENCARGOS;
/

CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_ENCARGOS AS
    
    PROCEDURE inicializar AS
    BEGIN
        DELETE FROM encargos;
    END inicializar;
    
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_entrada encargos.fecha_entrada%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        encargo encargos%ROWTYPE;
        w_oid_e encargos.oid_e%TYPE;
    BEGIN
    
        INSERT INTO encargos (oid_e, fecha_entrada) VALUES (SEC_encargos.nextval, w_fecha_entrada);

        w_oid_e := SEC_encargos.currval;
        SELECT * INTO encargo FROM encargos WHERE oid_e = w_oid_e;
        IF (encargo.fecha_entrada <> w_fecha_entrada) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
    END insertar;
    
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_e encargos.oid_e%TYPE, w_fecha_entrada encargos.fecha_entrada%TYPE,
                          salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        encargo encargos%ROWTYPE;
    BEGIN
        
        UPDATE encargos SET fecha_entrada = w_fecha_entrada WHERE oid_e = w_oid_e;

        SELECT * INTO encargo FROM encargos WHERE oid_e = w_oid_e;
        IF (encargo.fecha_entrada <> w_fecha_entrada) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END actualizar;
    
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_e encargos.oid_e%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        n_encargos INTEGER;
    BEGIN
    
        DELETE FROM encargos WHERE oid_e = w_oid_e;
        
        SELECT COUNT(*) INTO n_encargos FROM encargos WHERE oid_e = w_oid_e;
        IF (n_encargos <> 0) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END eliminar;
        

END PRUEBAS_ENCARGOS;
/

--PRUEBAS PROVEEDORES
CREATE OR REPLACE 
PACKAGE PRUEBAS_PROVEEDORES AS
    
    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_nombre proveedores.nombre%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_pr proveedores.oid_pr%TYPE, w_nombre proveedores.nombre%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_pr proveedores.oid_pr%TYPE, salidaEsperada BOOLEAN);
    
END PRUEBAS_PROVEEDORES;
/

CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_PROVEEDORES AS
    
    PROCEDURE inicializar AS
    BEGIN
        DELETE FROM proveedores;
    END inicializar;
    
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_nombre proveedores.nombre%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        proveedor proveedores%ROWTYPE;
        w_oid_pr proveedores.oid_pr%TYPE;
    BEGIN
    
        INSERT INTO proveedores (oid_pr, nombre) VALUES (SEC_proveedores.nextval, w_nombre);

        w_oid_pr := SEC_proveedores.currval;
        SELECT * INTO proveedor FROM proveedores WHERE oid_pr = w_oid_pr;
        IF (proveedor.nombre <> w_nombre) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
    END insertar;
    
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_pr proveedores.oid_pr%TYPE, w_nombre proveedores.nombre%TYPE,
                          salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        proveedor proveedores%ROWTYPE;
    BEGIN
        
        UPDATE proveedores SET nombre = w_nombre WHERE oid_pr = w_oid_pr;

        SELECT * INTO proveedor FROM proveedores WHERE oid_pr = w_oid_pr;
        IF (proveedor.nombre <> w_nombre) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END actualizar;
    
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_pr proveedores.oid_pr%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        n_proveedores INTEGER;
    BEGIN
    
        DELETE FROM proveedores WHERE oid_pr = w_oid_pr;
        
        SELECT COUNT(*) INTO n_proveedores FROM proveedores WHERE oid_pr = w_oid_pr;
        IF (n_proveedores <> 0) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END eliminar;
        

END PRUEBAS_PROVEEDORES;
/

--PRUEBAS PEDIDOS
CREATE OR REPLACE 
PACKAGE PRUEBAS_PEDIDOS AS
    
    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_solicitud pedidos.fecha_solicitud%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_pd pedidos.oid_pd%TYPE, w_fecha_solicitud pedidos.fecha_solicitud%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_pd pedidos.oid_pd%TYPE, salidaEsperada BOOLEAN);
    
END PRUEBAS_PEDIDOS;
/

CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_PEDIDOS AS
    
    PROCEDURE inicializar AS
    BEGIN
        DELETE FROM pedidos;
    END inicializar;
    
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_fecha_solicitud pedidos.fecha_solicitud%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        pedido pedidos%ROWTYPE;
        w_oid_pd pedidos.oid_pd%TYPE;
    BEGIN
    
        INSERT INTO pedidos (oid_pd, fecha_solicitud) VALUES (SEC_pedidos.nextval, w_fecha_solicitud);

        w_oid_pd := SEC_pedidos.currval;
        SELECT * INTO pedido FROM pedidos WHERE oid_pd = w_oid_pd;
        IF (pedido.fecha_solicitud <> w_fecha_solicitud) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
    END insertar;
    
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_pd pedidos.oid_pd%TYPE, w_fecha_solicitud pedidos.fecha_solicitud%TYPE,
                          salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        pedido pedidos%ROWTYPE;
    BEGIN
        
        UPDATE pedidos SET fecha_solicitud = w_fecha_solicitud WHERE oid_pd = w_oid_pd;

        SELECT * INTO pedido FROM pedidos WHERE oid_pd = w_oid_pd;
        IF (pedido.fecha_solicitud <> w_fecha_solicitud) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END actualizar;
    
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_pd pedidos.oid_pd%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        n_pedidos INTEGER;
    BEGIN
    
        DELETE FROM pedidos WHERE oid_pd = w_oid_pd;
        
        SELECT COUNT(*) INTO n_pedidos FROM pedidos WHERE oid_pd = w_oid_pd;
        IF (n_pedidos <> 0) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END eliminar;
        

END PRUEBAS_PEDIDOS;
/

--PRUEBAS MATERIALES
CREATE OR REPLACE 
PACKAGE PRUEBAS_MATERIALES AS
    
    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_nombre materiales.nombre%TYPE, w_categoria materiales.categoria%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_m materiales.oid_m%TYPE, w_nombre materiales.nombre%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_m materiales.oid_m%TYPE, salidaEsperada BOOLEAN);
    
END PRUEBAS_MATERIALES;
/

CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_MATERIALES AS
    
    PROCEDURE inicializar AS
    BEGIN
        DELETE FROM materiales;
    END inicializar;
    
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_nombre materiales.nombre%TYPE, w_categoria materiales.categoria%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        material materiales%ROWTYPE;
        w_oid_m materiales.oid_m%TYPE;
    BEGIN
    
        INSERT INTO materiales (oid_m, nombre, categoria) VALUES (SEC_materiales.nextval, w_nombre, w_categoria);

        w_oid_m := SEC_materiales.currval;
        SELECT * INTO material FROM materiales WHERE oid_m = w_oid_m;
        IF (material.nombre <> w_nombre OR material.categoria <> w_categoria) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
    END insertar;
    
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_m materiales.oid_m%TYPE, w_nombre materiales.nombre%TYPE,
                          salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        material materiales%ROWTYPE;
    BEGIN
        
        UPDATE materiales SET nombre = w_nombre WHERE oid_m = w_oid_m;

        SELECT * INTO material FROM materiales WHERE oid_m = w_oid_m;
        IF (material.nombre <> w_nombre) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END actualizar;
    
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_m materiales.oid_m%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        n_materiales INTEGER;
    BEGIN
    
        DELETE FROM materiales WHERE oid_m = w_oid_m;
        
        SELECT COUNT(*) INTO n_materiales FROM materiales WHERE oid_m = w_oid_m;
        IF (n_materiales <> 0) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END eliminar;
        

END PRUEBAS_MATERIALES;
/

--PRUEBAS LINEA PEDIDO
CREATE OR REPLACE 
PACKAGE PRUEBAS_LINEAS AS
    
    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_cantidad linea_pedido.cantidad%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_lp linea_pedido.oid_lp%TYPE, w_cantidad linea_pedido.cantidad%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_lp linea_pedido.oid_lp%TYPE, salidaEsperada BOOLEAN);
    
END PRUEBAS_LINEAS;
/

CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_LINEAS AS
    
    PROCEDURE inicializar AS
    BEGIN
        DELETE FROM linea_pedido;
    END inicializar;
    
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_cantidad linea_pedido.cantidad%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        linea linea_pedido%ROWTYPE;
        w_oid_lp linea_pedido.oid_lp%TYPE;
    BEGIN
    
        INSERT INTO linea_pedido (oid_lp, cantidad) VALUES (SEC_linea_pedido.nextval, w_cantidad);

        w_oid_lp := SEC_linea_pedido.currval;
        SELECT * INTO linea FROM linea_pedido WHERE oid_lp = w_oid_lp;
        IF (linea.cantidad <> w_cantidad) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
    END insertar;
    
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_lp linea_pedido.oid_lp%TYPE, w_cantidad linea_pedido.cantidad%TYPE,
                          salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        linea linea_pedido%ROWTYPE;
    BEGIN
        
        UPDATE linea_pedido SET cantidad = w_cantidad WHERE oid_lp = w_oid_lp;

        SELECT * INTO linea FROM linea_pedido WHERE oid_lp = w_oid_lp;
        IF (linea.cantidad <> w_cantidad) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END actualizar;
    
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_lp linea_pedido.oid_lp%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        n_lineas INTEGER;
    BEGIN
    
        DELETE FROM linea_pedido WHERE oid_lp = w_oid_lp;
        
        SELECT COUNT(*) INTO n_lineas FROM linea_pedido WHERE oid_lp = w_oid_lp;
        IF (n_lineas <> 0) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END eliminar;
        

END PRUEBAS_LINEAS;
/

--PRUEBAS PRODUCTOS
CREATE OR REPLACE 
PACKAGE PRUEBAS_PRODUCTOS AS
    
    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_nombre productos.nombre%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_p productos.oid_p%TYPE, w_nombre productos.nombre%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_p productos.oid_p%TYPE, salidaEsperada BOOLEAN);
    
END PRUEBAS_PRODUCTOS;
/

CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_PRODUCTOS AS
    
    PROCEDURE inicializar AS
    BEGIN
        DELETE FROM productos;
    END inicializar;
    
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_nombre productos.nombre%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        producto productos%ROWTYPE;
        w_oid_p productos.oid_p%TYPE;
    BEGIN
    
        INSERT INTO productos (oid_p, nombre) VALUES (SEC_productos.nextval, w_nombre);

        w_oid_p := SEC_productos.currval;
        SELECT * INTO producto FROM productos WHERE oid_p = w_oid_p;
        IF (producto.nombre <> w_nombre) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
    END insertar;
    
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_p productos.oid_p%TYPE, w_nombre productos.nombre%TYPE,
                          salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        producto productos%ROWTYPE;
    BEGIN
        
        UPDATE productos SET nombre = w_nombre WHERE oid_p = w_oid_p;

        SELECT * INTO producto FROM productos WHERE oid_p = w_oid_p;
        IF (producto.nombre <> w_nombre) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END actualizar;
    
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_p productos.oid_p%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        n_productos INTEGER;
    BEGIN
    
        DELETE FROM productos WHERE oid_p = w_oid_p;
        
        SELECT COUNT(*) INTO n_productos FROM productos WHERE oid_p = w_oid_p;
        IF (n_productos <> 0) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END eliminar;
        

END PRUEBAS_PRODUCTOS;
/

--PRUEBAS REQIUERE
CREATE OR REPLACE 
PACKAGE PRUEBAS_REQUIERE AS
    
    PROCEDURE inicializar;
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_cantidad requiere.cantidad%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_r requiere.oid_r%TYPE, w_cantidad requiere.cantidad%TYPE, salidaEsperada BOOLEAN);
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_r requiere.oid_r%TYPE, salidaEsperada BOOLEAN);
    
END PRUEBAS_REQUIERE;
/

CREATE OR REPLACE 
PACKAGE BODY PRUEBAS_REQUIERE AS
    
    PROCEDURE inicializar AS
    BEGIN
        DELETE FROM requiere;
    END inicializar;
    
    PROCEDURE insertar (nombre_prueba VARCHAR2, w_cantidad requiere.cantidad%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        fila requiere%ROWTYPE;
        w_oid_r requiere.oid_r%TYPE;
    BEGIN
    
        INSERT INTO requiere (oid_r, cantidad) VALUES (SEC_requiere.nextval, w_cantidad);

        w_oid_r := SEC_requiere.currval;
        SELECT * INTO fila FROM requiere WHERE oid_r = w_oid_r;
        IF (fila.cantidad <> w_cantidad) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
    END insertar;
    
    PROCEDURE actualizar (nombre_prueba VARCHAR2, w_oid_r requiere.oid_r%TYPE, w_cantidad requiere.cantidad%TYPE,
                          salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        fila requiere%ROWTYPE;
    BEGIN
        
        UPDATE requiere SET cantidad = w_cantidad WHERE oid_r = w_oid_r;

        SELECT * INTO fila FROM requiere WHERE oid_r = w_oid_r;
        IF (fila.cantidad <> w_cantidad) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END actualizar;
    
    PROCEDURE eliminar (nombre_prueba VARCHAR2, w_oid_r requiere.oid_r%TYPE, salidaEsperada BOOLEAN) AS
        salida BOOLEAN := true;
        n_filas INTEGER;
    BEGIN
    
        DELETE FROM requiere WHERE oid_r = w_oid_r;
        
        SELECT COUNT(*) INTO n_filas FROM requiere WHERE oid_r = w_oid_r;
        IF (n_filas <> 0) THEN
            salida := false;
        END IF;
        COMMIT WORK;
        
        DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(salida,salidaEsperada));
        
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(nombre_prueba || ': ' || ASSERT_EQUALS(false,salidaEsperada));  
            ROLLBACK;
        END eliminar;
        

END PRUEBAS_REQUIERE;
/