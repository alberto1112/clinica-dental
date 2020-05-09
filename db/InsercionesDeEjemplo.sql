--insercion de usuarios
INSERTAR_USUARIO('pepe','gonzalez','pego@email.com','usuariopepe','Contraseña1','clinica');
INSERTAR_USUARIO('manoli','peña','manolita@gmail.com','tumanolita19','Contraseña2','proveedor');
INSERTAR_USUARIO('juan','fresco','frescuan@hotmail.com','juanitofreco','Contraseña3','clinica');
--insercion de clinicas
crear_clinica('Dentalux','Herrera',098123764,'N','José','1029');
crear_clinica('Dientecito','Sevilla',864196403,'N','Candela','6743');
crear_clinica('Zasenlaboca','VillaVerde',013573094,'N','Jacobo','9876');
crear_clinica('Dentinazo','Lebrija',378204561,'N','Javier','3523');
crear_clinica('Dentalclinic','Utrera',993518473,'N','Antonia','7893');
crear_clinica('Clinica dental','Ecija',555555923,'N','Daniel','2596');
crear_clinica('CDental','Burguillos',663555920,'N','Vicente','1234');
crear_clinica('Clinica Muelas','Guillena',749231497,'N','Inmaculada','4321');
crear_clinica('Profident Clinic','Carmona',123456789,'N','Asunción','9876');
crear_clinica('Clinica','Tocina',749214739,'N','Aguas Santas','6789');
crear_clinica('nombreclinica','Cantillana',000111555,'N','Rodrigo','0129');
--inserción de pacientes
crear_paciente('12345678C','23/04/90','H',1);
crear_paciente('12345678M','12/12/62','M',2);
crear_paciente('12341278B','01/05/00','H',3);
crear_paciente('32345678X','11/01/99','H',4);
crear_paciente('12342348Z','22/11/92','H',5);
crear_paciente('12395372T','09/09/99','M',6);
crear_paciente('74924739S','28/04/39','M',7);
crear_paciente('97345983G','12/03/89','M',8);
crear_paciente('32587459K','10/06/94','H',9);
crear_paciente('23459789F','03/04/56','H',10);
crear_paciente('95353675T','07/07/77','M',4);
crear_paciente('36595653A','08/08/88','H',7);
--insercion de facturas
crear_factura(null,'30/06/20','09/05/20',350);
crear_factura('12/02/19','12/03/19','05/02/19',500);
crear_factura('30/10/19','10/11/19','09/10/19',100);
crear_factura(null,'25/02/20','14/01/20',275);
crear_factura('29/08/19','30/08/19','23/07/19',500);
crear_factura('01/06/19','15/06/19','22/04/19',1250);
crear_factura('07/03/20','20/03/20','10/02/20',2000);
crear_factura(null,'30/07/20','20/04/20',200);
crear_factura('10/01/19','15/01/19','20/12/18',230);
crear_factura('07/02/20','19/02/20','30/01/20',775);
crear_factura(null,'30/07/20','09/05/20',900);
--inserción de encargos
crear_encargo();