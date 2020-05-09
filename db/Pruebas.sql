SET SERVEROUTPUT ON;

BEGIN
    --PRUEBAS CLINICAS
    PRUEBAS_CLINICAS.INICIALIZAR;
    PRUEBAS_CLINICAS.INSERTAR('Prueba 1 - Insertar clínica', 'Septem', true);
    PRUEBAS_CLINICAS.ACTUALIZAR('Prueba 2 - Actualización cl�nica', SEC_CLINICAS.currval, 'F�tima', true);
    PRUEBAS_CLINICAS.ELIMINAR('Prueba 3 - Eliminar cl�nica', SEC_CLINICAS.currval, true);
    
    --PRUEBAS PACIENTES
    PRUEBAS_PACIENTES.INICIALIZAR;
    PRUEBAS_PACIENTES.INSERTAR('Prueba 1 - Insertar paciente', '45180567C', true);
    PRUEBAS_PACIENTES.ACTUALIZAR('Prueba 2 - Actualización paciente', SEC_PACIENTES.currval, '45789456A', true);
    PRUEBAS_PACIENTES.ELIMINAR('Prueba 3 - Eliminar paciente', SEC_PACIENTES.currval, true);
    
    --PRUEBAS FACTURAS
    PRUEBAS_FACTURAS.INICIALIZAR;
    PRUEBAS_FACTURAS.INSERTAR('Prueba 1 - Insertar factura', '12/02/2020', true);
    PRUEBAS_FACTURAS.ACTUALIZAR('Prueba 2 - Actualizar factura', SEC_FACTURAS.currval, '07/06/2019', true);
    PRUEBAS_FACTURAS.ELIMINAR('Prueba 3 - Eliminar factura', SEC_FACTURAS.currval, true);
    
    --PRUEBAS ENCARGOS
    PRUEBAS_ENCARGOS.INICIALIZAR;
    PRUEBAS_ENCARGOS.INSERTAR('Prueba 1 - Insertar encargo', '10/01/2020', true);
    PRUEBAS_ENCARGOS.ACTUALIZAR('Prueba 2 - Actualizar encargo', SEC_ENCARGOS.currval, '09/01/2020', true);
    PRUEBAS_ENCARGOS.ELIMINAR('Prueba 3 - Eliminar encargo', SEC_ENCARGOS.currval, true);
    
    --PRUEBAS PROVEEDORES
    PRUEBAS_PROVEEDORES.INICIALIZAR;
    PRUEBAS_PROVEEDORES.INSERTAR('Prueba 1 - Insertar proveedor', 'JYP', true);
    PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 2 - Actualizar proveedor', SEC_PROVEEDORES.currval, 'Mnet', true);
    PRUEBAS_PROVEEDORES.ELIMINAR('Prueba 3 - Eliminar proveedor', SEC_PROVEEDORES.currval, true);
    
    --PRUEBAS PEDIDOS
    PRUEBAS_PEDIDOS.INICIALIZAR;
    PRUEBAS_PEDIDOS.INSERTAR('Pruebas 1 - Insertar pedido', '09/01/2020', true);
    PRUEBAS_PEDIDOS.ACTUALIZAR('Pruebas 2 - Actualizar pedido', SEC_PEDIDOS.currval, '11/01/2020', true);
    PRUEBAS_PEDIDOS.ELIMINAR('Prueba 3 - Eliminar pedido', SEC_PEDIDOS.currval, true);
    
    --PRUEBAS MATERIALES
    PRUEBAS_MATERIALES.INICIALIZAR;
    PRUEBAS_MATERIALES.INSERTAR('Prueba 1 - Insertar material', 'Dentina', 'Metal Ceramica', true);
    PRUEBAS_MATERIALES.ACTUALIZAR('Prueba 2 - Actualizar material', SEC_MATERIALES.currval, 'Pasta', true);
    PRUEBAS_MATERIALES.ELIMINAR('Prueba 3 - Eliminar material', SEC_MATERIALES.currval, true);
    
    --PRUEBAS LINEAS PEDIDO
    PRUEBAS_LINEAS.INICIALIZAR;
    PRUEBAS_LINEAS.INSERTAR('Prueba 1 - Insertar línea', 5, true);
    PRUEBAS_LINEAS.ACTUALIZAR('Prueba 2 - Actualizar l�nea', SEC_LINEA_PEDIDO.currval, 6, true);
    PRUEBAS_LINEAS.ELIMINAR('Prueba 3 - Eliminar línea', SEC_LINEA_PEDIDO.currval, true);
    
    --PRUEBAS PRODUCTOS
    PRUEBAS_PRODUCTOS.INICIALIZAR;
    PRUEBAS_PRODUCTOS.INSERTAR('Prueba 1 - Insertar producto', 'Limpieza', true);
    PRUEBAS_PRODUCTOS.ACTUALIZAR('Prueba 2 - Actualizar producto', SEC_PRODUCTOS.currval, 'Empaste', true);
    PRUEBAS_PRODUCTOS.ELIMINAR('Prueba 3 - Eliminar producto', SEC_PRODUCTOS.currval, true);
    
    --PRUEBAS REQUIERE
    PRUEBAS_REQUIERE.INICIALIZAR;
    PRUEBAS_REQUIERE.INSERTAR('Prueba 1 - Insertar requiere', 6, true);
    PRUEBAS_REQUIERE.ACTUALIZAR('Prueba 2 - Actualizar requiere', SEC_REQUIERE.currval, 8, true);
    PRUEBAS_REQUIERE.ELIMINAR('Prueba 3 - Eliminar requiere', SEC_REQUIERE.currval, true);
END;