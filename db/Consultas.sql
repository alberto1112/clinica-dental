--Consultas
--mostrar paciente cuya oid sea la dada
CREATE OR REPLACE PROCEDURE PR_Pacientes(
    w_OID_PC in pacientes.OID_PC%TYPE
) IS
    CURSOR C IS
            SELECT * FROM pacientes WHERE w_OID_PC = OID_PC;
    w_Paciente C%ROWTYPE;  
BEGIN
    OPEN C;
    FETCH C INTO w_paciente;
    DBMS_OUTPUT.PUT_LINE(RPAD('OID_PC',6)|| ' | ' ||RPAD('DNI',9)|| ' | ' ||RPAD('Fecha_Nacimiento', 10)
    || ' | ' ||RPAD('E_sexo',6)|| ' | ' ||RPAD('OID_C',10));
    WHILE C%Found LOOP DBMS_Output.put_line(RPAD(w_paciente.OID_PC,6)|| ' | ' ||RPAD(w_paciente.DNI,9)
    || ' | ' ||RPAD(w_paciente.Fecha_Nacimiento, 10)|| ' | ' ||RPAD(w_paciente.E_sexo,6)|| ' | ' ||RPAD(w_paciente.OID_C,10));
    FETCH C INTO w_paciente;
    END LOOP;
    CLOSE C;
END PR_Pacientes;
/

--RF-01-02 Consulta sobre clinicas (listar las clinicas)
CREATE OR REPLACE PROCEDURE PR_clinicas
IS
	CURSOR C IS
		SELECT * FROM clinicas ORDER BY OID_C;
	w_Clinica C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO w_Clinica;
	DBMS_Output.put_line(RPAD('OID_C',10)||RPAD('nombre', 30)||RPAD('localización',40)||RPAD('Tlf_Contacto', 9)||RPAD('Moroso', 1)
    ||RPAD('Nombre_Dueño', 15)||RPAD('Num_Colegiado', 4));
	WHILE C%Found LOOP Dbms_output.put_line(RPAD(w_Clinica.OID_C,10)||RPAD(w_Clinica.nombre, 30)||RPAD(w_clinica.localización,40)
    ||RPAD(w_clinica.Tlf_Contacto, 9)||RPAD(w_clinica.Moroso, 1)||RPAD(w_clinica.Nombre_Dueño, 15)||RPAD(w_clinica.Num_Colegiado, 4));
	FETCH C INTO w_Clinica;
	END LOOP;
	CLOSE C;
END;
/

--RF-01-01 Consulta datos sobre pacientes (listar pacientes)
Create or replace procedure PR_Pacientes
is
	cursor C is
		Select * from pacientes order by OID_PC;
	w_Paciente C%ROWTYPE;
Begin
	Open C;
	Fetch C into w_paciente;
	DBMS_Output.put_line(RPAD('OID_PC',10)||RPAD('DNI',15)||RPAD('Fecha_Nacimiento', 20)||RPAD('E_sexo',10)||RPAD('OID_C',10));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_paciente.OID_PC,10)||RPAD(w_paciente.DNI,15)||RPAD(w_paciente.Fecha_Nacimiento, 20)
    ||RPAD(w_paciente.E_sexo,10)||RPAD(w_paciente.OID_C,10));
	Fetch C into w_paciente;
	End loop;
	Close C;
End;
/

--RF-03-01 Consultas sobre inventario (listar inventario)
Create or replace procedure PR_Inventario
is
	cursor C is
		Select * from materiales order by OID_M;
	w_material C%ROWTYPE;
Begin
	Open C;
	Fetch c into w_material;
	DBMS_Output.put_line(RPAD('OID_M',10)||RPAD('nombre',15)||RPAD('categoria',20)||RPAD('stock',10)||RPAD('stock_min',13)
    ||RPAD('stock_critico', 15)||RPAD('unidad',10));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_material.OID_M,10)||RPAD(w_material.nombre,15)||RPAD(w_material.categoria,20)
    ||RPAD(w_material.stock,10)||RPAD(w_material.stock_min,13)||RPAD(w_material.stock_critico, 15)||RPAD(w_material.unidad,10));
	FETCH c INTO w_material;
    End Loop;
	Close C;
End;
/

--RF-03-02 Consultas sobre pedidos (listar pedidos)
Create or replace procedure PR_pedidos
is
	cursor C is
		Select * from pedidos order by OID_PD;
	w_pedido C%ROWTYPE;
Begin
	Open C;
	Fetch c into w_pedido;
	DBMS_Output.put_line(RPAD('OID_PD',10)||RPAD('Fecha_Solicitud',20)||RPAD('Fecha_Entrega',17)||RPAD('OID_PR', 10)||RPAD('OID_F',10));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_pedido.OID_PD,10)||RPAD(w_pedido.Fecha_Solicitud,20)||RPAD(w_pedido.Fecha_entrega,17)
    ||RPAD(w_pedido.OID_PR, 10)||RPAD(w_pedido.OID_F,10));
	FETCH c INTO w_pedido;
    End Loop;
	Close C;
End;
/

--RF-04-01 Consultas sobre productos
Create or replace procedure PR_productos
is
	cursor C is
		Select * from productos order by OID_P;
	w_producto C%ROWTYPE;
Begin
	Open C;
	Fetch C into w_producto;
	DBMS_Output.put_line(RPAD('OID_P',10)||RPAD('nombre',20)||RPAD('precio',10)||RPAD('OID_E',10));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_producto.OID_P,10)||RPAD(w_producto.nombre,20)||RPAD(w_producto.precio,10)||RPAD(w_producto.OID_E,10));
	Fetch C into w_producto;
	End Loop;
	Close C;
End;
/

--RF-04-02 Consulta sobre facturas
Create or replace procedure PR_facturas
is
	cursor C is
		Select * from facturas order by OID_F;
	w_factura C%ROWTYPE;
Begin
	Open C;
	Fetch C into w_factura;
	DBMS_Output.put_line(RPAD('OID_F',10)||RPAD('FECHA_COBRO',17)||RPAD('FECHA_VENCIMIENTO',20)||RPAD('FECHA_FACTURA',17)||RPAD('PRECIO_TOTAL',15));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_factura.OID_F,10)||RPAD(w_factura.FECHA_COBRO,17)||RPAD(w_factura.FECHA_VENCIMIENTO,20)
    ||RPAD(w_factura.FECHA_FACTURA,17)||RPAD(w_factura.PRECIO_TOTAL,15));
	Fetch C into w_factura;
	End Loop;
	Close C;
End;
/

--RF-02-01 Consulta sobre encargos
Create or replace procedure PR_encargos
is
	cursor C is
		Select * from encargos order by OID_E;
	w_encargo C%ROWTYPE;
Begin
	Open C;
	Fetch C into w_encargo;
	DBMS_Output.put_line(RPAD('OID_E',10)||RPAD('FECHA_ENTRADA',20)||RPAD('FECHA_ENTREGA',20)||RPAD('Acciones',50)||RPAD('OID_PC',10)||RPAD('OID_F',10));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_encargo.OID_E,10)||RPAD(w_encargo.FECHA_ENTRADA,20)||RPAD(w_encargo.FECHA_ENTREGA,20)
    ||RPAD(w_encargo.Acciones,50)||RPAD(w_encargo.OID_PC,10)||RPAD(w_encargo.OID_F,10));
	Fetch C into w_encargo;
	End Loop;
	Close C;
End;
/

--CONSULTA MATERIALES EN STOCK MINIMO
CREATE OR REPLACE PROCEDURE PR_STOCK_MINIMO
IS
    CURSOR C IS
        SELECT * FROM MATERIALES WHERE stock <= stock_min;
    w_material C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO w_material;
    DBMS_OUTPUT.PUT_LINE(RPAD('OID_M',10)||RPAD('NOMBRE',10)||RPAD('CATEGORIA',20)||RPAD('STOCK',10)||RPAD('STOCK_MIN',10)||RPAD('STOCK_CRIT',12)
    ||RPAD('UNIDAD',10));
    WHILE C%FOUND LOOP DBMS_OUTPUT.PUT_LINE(RPAD(w_material.oid_m,10)||RPAD(w_material.nombre,10)||RPAD(w_material.categoria,20)
    ||RPAD(w_material.stock,10)||RPAD(w_material.stock_min,10)||RPAD(w_material.stock_critico,12)||RPAD(w_material.unidad,10));
    FETCH C INTO w_material;
    END LOOP;
    CLOSE C;
END;
/

--CONSULTA MATERIALES EN STOCK CRITICO
CREATE OR REPLACE PROCEDURE PR_STOCK_CRITICO
IS
    CURSOR C IS
        SELECT * FROM MATERIALES WHERE stock <= stock_critico;
    w_material C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO w_material;
    DBMS_OUTPUT.PUT_LINE(RPAD('OID_M',10)||RPAD('NOMBRE',10)||RPAD('CATEGORIA',20)||RPAD('STOCK',10)||RPAD('STOCK_MIN',10)||RPAD('STOCK_CRIT',12)
    ||RPAD('UNIDAD',10));
    WHILE C%FOUND LOOP DBMS_OUTPUT.PUT_LINE(RPAD(w_material.oid_m,10)||RPAD(w_material.nombre,10)||RPAD(w_material.categoria,20)
    ||RPAD(w_material.stock,10)||RPAD(w_material.stock_min,10)||RPAD(w_material.stock_critico,12)||RPAD(w_material.unidad,10));
    FETCH C INTO w_material;
    END LOOP;
    CLOSE C;
END;
/

--CONSULTA ENCARGOS DADO UNA CLINICA
CREATE OR REPLACE PROCEDURE PR_ENCARGOS_CLINICA(
    w_oid_c IN clinicas.oid_c%TYPE
) IS
    CURSOR C IS
        SELECT * FROM Encargos NATURAL JOIN pacientes WHERE oid_c = w_oid_c ORDER BY fecha_entrega;
    w_encargos C%ROWTYPE;
BEGIN
    OPEN C;
    FETCH C INTO w_encargos;
    DBMS_OUTPUT.PUT_LINE(RPAD('OID_E',10)||RPAD('FECHA_ENTRADA',20)||RPAD('FECHA_ENTREGA',20)||RPAD('OID_PC',10)||RPAD('OID_F',10));
    WHILE C%FOUND LOOP DBMS_OUTPUT.PUT_LINE(RPAD(w_encargos.oid_e,10)||RPAD(w_encargos.fecha_entrada,20)
    ||RPAD(w_encargos.fecha_entrega,20)||RPAD(w_encargos.oid_pc,10)||RPAD(w_encargos.oid_f,10));
    FETCH C INTO w_encargos;
    END LOOP;
    CLOSE C;
END;
/

--Mostrar Productos de un encargo dado
Create or replace procedure PR_productos(
	W_OID_E in productos.OID_E%TYPE
)is
	cursor C is
		Select * from productos where W_OID_E = OID_E order by OID_P;
	w_producto C%ROWTYPE;
Begin
	Open C;
	Fetch C into w_producto;
	DBMS_Output.put_line(RPAD('OID_P',10)||RPAD('nombre',20)||RPAD('precio',10)||RPAD('OID_E',10));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_producto.OID_P,10)||RPAD(w_producto.nombre,20)||RPAD(w_producto.precio,10)||RPAD(w_producto.OID_E,10));
	Fetch C into w_producto;
	End Loop;
	Close C;
End;
/

--Mostrar pacientes de una clinica dada
Create or replace procedure PR_Pacientes(
	W_OID_C in pacientes.OID_C%TYPE
)is
	cursor C is
		Select * from pacientes where W_OID_C = OID_C order by OID_PC;
	w_Paciente C%ROWTYPE;
Begin
	Open C;
	Fetch C into w_paciente;
	DBMS_Output.put_line(RPAD('OID_PC',10)||RPAD('DNI',15)||RPAD('Fecha_Nacimiento', 20)||RPAD('E_sexo',10)||RPAD('OID_C',10));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_paciente.OID_PC,10)||RPAD(w_paciente.DNI,15)||RPAD(w_paciente.Fecha_Nacimiento, 20)
    ||RPAD(w_paciente.E_sexo,10)||RPAD(w_paciente.OID_C,10));
	Fetch C into w_paciente;
	End loop;
	Close C;
End;
/

--Mostrar pedidos de un proveedor
Create or replace procedure PR_pedidos(
	W_OID_PR in pedidos.OID_PR%TYPE
)is
	cursor C is
		Select * from pedidos where W_OID_PR = OID_PR order by OID_PD;
	w_pedido C%ROWTYPE;
Begin
	Open C;
	Fetch c into w_pedido;
	DBMS_Output.put_line(RPAD('OID_PD',10)||RPAD('Fecha_Solicitud',20)||RPAD('Fecha_Entrega',17)||RPAD('OID_PR', 10)||RPAD('OID_F',10));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_pedido.OID_PD,10)||RPAD(w_pedido.Fecha_Solicitud,20)||RPAD(w_pedido.Fecha_entrega,17)
    ||RPAD(w_pedido.OID_PR, 10)||RPAD(w_pedido.OID_F,10));
	FETCH c INTO w_pedido;
    	End Loop;
	Close C;
End;
/

--Listado de proveedores
Create or replace procedure PR_proveedores
is
	cursor C is
		Select * from proveedores order by OID_PR;
	w_proveedor C%ROWTYPE;
Begin
	Open C;
	Fetch c into w_proveedor;
	DBMS_Output.put_line(RPAD('OID_PR',10)||RPAD('NOMBRE',30)||RPAD('LOCALIZACIÓN',30)||RPAD('TLF_CONTACTO',20));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_proveedor.OID_PR,10)||RPAD(w_proveedor.NOMBRE,30)
    ||RPAD(w_proveedor.LOCALIZACIÓN,30)||RPAD(w_proveedor.TLF_CONTACTO,20));
	Fetch c into w_proveedor;
	End Loop;
	Close C;
End;
/

--Mostrar encargos por factura
Create or replace procedure PR_encargos(
	W_OID_F in encargos.OID_F%TYPE
)is
	cursor C is
		Select * from encargos where W_OID_F = OID_F order by OID_E;
	w_encargo C%ROWTYPE;
Begin
	Open C;
	Fetch C into w_encargo;
	DBMS_Output.put_line(RPAD('OID_E',10)||RPAD('FECHA_ENTRADA',20)||RPAD('FECHA_ENTREGA',20)||RPAD('OID_PC',10)||RPAD('OID_F',10));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_encargo.OID_E,10)||RPAD(w_encargo.FECHA_ENTRADA,20)||RPAD(w_encargo.FECHA_ENTREGA,20)
    ||RPAD(w_encargo.OID_PC,10)||RPAD(w_encargo.OID_F,10));
	Fetch C into w_encargo;
	End Loop;
	Close C;
End;
/

--Mostrar pedidos por factura
Create or replace procedure PR_pedidos(
	W_OID_F in pedidos.OID_F%TYPE
)is
	cursor C is
		Select * from pedidos where W_OID_F = OID_F order by OID_PD;
	w_pedido C%ROWTYPE;
Begin
	Open C;
	Fetch c into w_pedido;
	DBMS_Output.put_line(RPAD('OID_PD',10)||RPAD('Fecha_Solicitud',20)||RPAD('Fecha_Entrega',17)||RPAD('OID_PR', 10)||RPAD('OID_F',10));
	While C%Found Loop DBMS_Output.put_line(RPAD(w_pedido.OID_PD,10)||RPAD(w_pedido.Fecha_Solicitud,20)||RPAD(w_pedido.Fecha_entrega,17)
    ||RPAD(w_pedido.OID_PR, 10)||RPAD(w_pedido.OID_F,10));
	FETCH c INTO w_pedido;
    End Loop;
	Close C;
End;
/