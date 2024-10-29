-- Inserts para DEPARTAMENTOS
INSERT INTO departamentos (id, departamento) VALUES (seq_departamentos.NEXTVAL, 'Guatemala');
INSERT INTO departamentos (id, departamento) VALUES (seq_departamentos.NEXTVAL, 'El Progreso');
INSERT INTO departamentos (id, departamento) VALUES (seq_departamentos.NEXTVAL, 'Sacatepéquez');
INSERT INTO departamentos (id, departamento) VALUES (seq_departamentos.NEXTVAL, 'Chimaltenango');
INSERT INTO departamentos (id, departamento) VALUES (seq_departamentos.NEXTVAL, 'Escuintla');
INSERT INTO departamentos (id, departamento) VALUES (seq_departamentos.NEXTVAL, 'Santa Rosa');
INSERT INTO departamentos (id, departamento) VALUES (seq_departamentos.NEXTVAL, 'Sololá');
INSERT INTO departamentos (id, departamento) VALUES (seq_departamentos.NEXTVAL, 'Totonicapán');
INSERT INTO departamentos (id, departamento) VALUES (seq_departamentos.NEXTVAL, 'Quetzaltenango');
INSERT INTO departamentos (id, departamento) VALUES (seq_departamentos.NEXTVAL, 'Suchitepéquez');

-- Inserts para MUNICIPIOS
INSERT INTO municipios (id, municipio, id_departamento) VALUES (seq_municipios.NEXTVAL, 'Ciudad de Guatemala',1);
INSERT INTO municipios (id, municipio, id_departamento) VALUES (seq_municipios.NEXTVAL, 'Mixco',1);
INSERT INTO municipios (id, municipio, id_departamento) VALUES (seq_municipios.NEXTVAL, 'Villa Nueva',1);
INSERT INTO municipios (id, municipio, id_departamento) VALUES (seq_municipios.NEXTVAL, 'Antigua Guatemala',1);
INSERT INTO municipios (id, municipio, id_departamento) VALUES (seq_municipios.NEXTVAL, 'Escuintla',2);
INSERT INTO municipios (id, municipio, id_departamento) VALUES (seq_municipios.NEXTVAL, 'Quetzaltenango',2);
INSERT INTO municipios (id, municipio, id_departamento) VALUES (seq_municipios.NEXTVAL, 'Chimaltenango',4);
INSERT INTO municipios (id, municipio, id_departamento) VALUES (seq_municipios.NEXTVAL, 'Mazatenango',5);
INSERT INTO municipios (id, municipio, id_departamento) VALUES (seq_municipios.NEXTVAL, 'Cobán',6);
INSERT INTO municipios (id, municipio, id_departamento) VALUES (seq_municipios.NEXTVAL, 'Puerto Barrios',7);

-- Inserts para CODIGOS_POSTALES
INSERT INTO codigos_postales (codigo, direccion) VALUES (seq_codigos_postales.NEXTVAL, 'Zona 1, Ciudad de Guatemala');
INSERT INTO codigos_postales (codigo, direccion) VALUES (seq_codigos_postales.NEXTVAL, 'Zona 10, Ciudad de Guatemala');
INSERT INTO codigos_postales (codigo, direccion) VALUES (seq_codigos_postales.NEXTVAL, 'Zona 4 de Mixco');
INSERT INTO codigos_postales (codigo, direccion) VALUES (seq_codigos_postales.NEXTVAL, 'Centro Antigua Guatemala');
INSERT INTO codigos_postales (codigo, direccion) VALUES (seq_codigos_postales.NEXTVAL, 'Zona 1 Quetzaltenango');
INSERT INTO codigos_postales (codigo, direccion) VALUES (seq_codigos_postales.NEXTVAL, 'Centro de Escuintla');
INSERT INTO codigos_postales (codigo, direccion) VALUES (seq_codigos_postales.NEXTVAL, 'Zona 2 de Villa Nueva');
INSERT INTO codigos_postales (codigo, direccion) VALUES (seq_codigos_postales.NEXTVAL, 'Centro de Chimaltenango');
INSERT INTO codigos_postales (codigo, direccion) VALUES (seq_codigos_postales.NEXTVAL, 'Centro de Mazatenango');
INSERT INTO codigos_postales (codigo, direccion) VALUES (seq_codigos_postales.NEXTVAL, 'Centro de Cobán');

-- Inserts para ROLES
INSERT INTO roles (id, rol) VALUES (seq_roles.NEXTVAL, 'Gerente General');
INSERT INTO roles (id, rol) VALUES (seq_roles.NEXTVAL, 'Gerente de Sucursal');
INSERT INTO roles (id, rol) VALUES (seq_roles.NEXTVAL, 'Cajero');
INSERT INTO roles (id, rol) VALUES (seq_roles.NEXTVAL, 'Ejecutivo de Cuenta');
INSERT INTO roles (id, rol) VALUES (seq_roles.NEXTVAL, 'Oficial de Préstamos');
INSERT INTO roles (id, rol) VALUES (seq_roles.NEXTVAL, 'Servicio al Cliente');
INSERT INTO roles (id, rol) VALUES (seq_roles.NEXTVAL, 'Analista de Riesgos');
INSERT INTO roles (id, rol) VALUES (seq_roles.NEXTVAL, 'Auditor Interno');
INSERT INTO roles (id, rol) VALUES (seq_roles.NEXTVAL, 'Supervisor de Operaciones');
INSERT INTO roles (id, rol) VALUES (seq_roles.NEXTVAL, 'Asistente Administrativo');

-- Inserts para TIPO_DE_SUCURSALES_AGENCIAS
INSERT INTO tipo_de_sucursales_agencias (id, nombre_tipo) VALUES (seq_tipo_de_sucursales.NEXTVAL, 'Sucursal Principal');
INSERT INTO tipo_de_sucursales_agencias (id, nombre_tipo) VALUES (seq_tipo_de_sucursales.NEXTVAL, 'Sucursal Regular');
INSERT INTO tipo_de_sucursales_agencias (id, nombre_tipo) VALUES (seq_tipo_de_sucursales.NEXTVAL, 'Agencia Express');
INSERT INTO tipo_de_sucursales_agencias (id, nombre_tipo) VALUES (seq_tipo_de_sucursales.NEXTVAL, 'Centro Financiero');
INSERT INTO tipo_de_sucursales_agencias (id, nombre_tipo) VALUES (seq_tipo_de_sucursales.NEXTVAL, 'Agencia Digital');
INSERT INTO tipo_de_sucursales_agencias (id, nombre_tipo) VALUES (seq_tipo_de_sucursales.NEXTVAL, 'Mini Agencia');
INSERT INTO tipo_de_sucursales_agencias (id, nombre_tipo) VALUES (seq_tipo_de_sucursales.NEXTVAL, 'Agencia Empresarial');
INSERT INTO tipo_de_sucursales_agencias (id, nombre_tipo) VALUES (seq_tipo_de_sucursales.NEXTVAL, 'Punto de Servicio');
INSERT INTO tipo_de_sucursales_agencias (id, nombre_tipo) VALUES (seq_tipo_de_sucursales.NEXTVAL, 'Agencia Virtual');
INSERT INTO tipo_de_sucursales_agencias (id, nombre_tipo) VALUES (seq_tipo_de_sucursales.NEXTVAL, 'Centro de Negocios');

-- Inserts para TIPO_DE_CUENTAS
INSERT INTO tipo_de_cuentas (id, tipo) VALUES (seq_tipo_de_cuentas.NEXTVAL, 'Cuenta de Ahorro');
INSERT INTO tipo_de_cuentas (id, tipo) VALUES (seq_tipo_de_cuentas.NEXTVAL, 'Cuenta Corriente');
INSERT INTO tipo_de_cuentas (id, tipo) VALUES (seq_tipo_de_cuentas.NEXTVAL, 'Cuenta Monetaria');
INSERT INTO tipo_de_cuentas (id, tipo) VALUES (seq_tipo_de_cuentas.NEXTVAL, 'Cuenta de Ahorro Programado');
INSERT INTO tipo_de_cuentas (id, tipo) VALUES (seq_tipo_de_cuentas.NEXTVAL, 'Cuenta Premium');
INSERT INTO tipo_de_cuentas (id, tipo) VALUES (seq_tipo_de_cuentas.NEXTVAL, 'Cuenta Empresarial');
INSERT INTO tipo_de_cuentas (id, tipo) VALUES (seq_tipo_de_cuentas.NEXTVAL, 'Cuenta Juvenil');
INSERT INTO tipo_de_cuentas (id, tipo) VALUES (seq_tipo_de_cuentas.NEXTVAL, 'Cuenta de Nómina');
INSERT INTO tipo_de_cuentas (id, tipo) VALUES (seq_tipo_de_cuentas.NEXTVAL, 'Cuenta de Inversión');
INSERT INTO tipo_de_cuentas (id, tipo) VALUES (seq_tipo_de_cuentas.NEXTVAL, 'Cuenta Digital');

-- Inserts para ESTADOS_DE_TARJETAS
INSERT INTO estados_de_tarjetas (id, estado) VALUES (seq_estados_de_tarjetas.NEXTVAL, 'Activa');
INSERT INTO estados_de_tarjetas (id, estado) VALUES (seq_estados_de_tarjetas.NEXTVAL, 'Bloqueada');
INSERT INTO estados_de_tarjetas (id, estado) VALUES (seq_estados_de_tarjetas.NEXTVAL, 'Vencida');
INSERT INTO estados_de_tarjetas (id, estado) VALUES (seq_estados_de_tarjetas.NEXTVAL, 'En Mora');
INSERT INTO estados_de_tarjetas (id, estado) VALUES (seq_estados_de_tarjetas.NEXTVAL, 'Cancelada');
INSERT INTO estados_de_tarjetas (id, estado) VALUES (seq_estados_de_tarjetas.NEXTVAL, 'Robada/Perdida');
INSERT INTO estados_de_tarjetas (id, estado) VALUES (seq_estados_de_tarjetas.NEXTVAL, 'En Renovación');
INSERT INTO estados_de_tarjetas (id, estado) VALUES (seq_estados_de_tarjetas.NEXTVAL, 'Suspendida');
INSERT INTO estados_de_tarjetas (id, estado) VALUES (seq_estados_de_tarjetas.NEXTVAL, 'Por Activar');
INSERT INTO estados_de_tarjetas (id, estado) VALUES (seq_estados_de_tarjetas.NEXTVAL, 'En Disputa');

-- Inserts para ESTADOS_DE_PRESTAMOS
INSERT INTO estados_de_prestamos (id, estado) VALUES (seq_estados_de_prestamos.NEXTVAL, 'Aprobado');
INSERT INTO estados_de_prestamos (id, estado) VALUES (seq_estados_de_prestamos.NEXTVAL, 'En Espera');
INSERT INTO estados_de_prestamos (id, estado) VALUES (seq_estados_de_prestamos.NEXTVAL, 'Rechazado');
INSERT INTO estados_de_prestamos (id, estado) VALUES (seq_estados_de_prestamos.NEXTVAL, 'En Mora');
INSERT INTO estados_de_prestamos (id, estado) VALUES (seq_estados_de_prestamos.NEXTVAL, 'Cancelado');
INSERT INTO estados_de_prestamos (id, estado) VALUES (seq_estados_de_prestamos.NEXTVAL, 'Liquidado');
INSERT INTO estados_de_prestamos (id, estado) VALUES (seq_estados_de_prestamos.NEXTVAL, 'En Proceso');
INSERT INTO estados_de_prestamos (id, estado) VALUES (seq_estados_de_prestamos.NEXTVAL, 'Reprogramado');
INSERT INTO estados_de_prestamos (id, estado) VALUES (seq_estados_de_prestamos.NEXTVAL, 'En Suspenso');
INSERT INTO estados_de_prestamos (id, estado) VALUES (seq_estados_de_prestamos.NEXTVAL, 'En Disputa');

INSERT INTO TIPOS_DE_SUELDO (id,TIPO) VALUES (seq_tipos_de_sueldo.NEXTVAL,'Mensual');
INSERT INTO TIPOS_DE_SUELDO (id,TIPO) VALUES (seq_tipos_de_sueldo.NEXTVAL,'Quincenal');
INSERT INTO TIPOS_DE_SUELDO (id,TIPO) VALUES (seq_tipos_de_sueldo.NEXTVAL,'Semanal');
INSERT INTO TIPOS_DE_SUELDO (id,TIPO) VALUES (seq_tipos_de_sueldo.NEXTVAL,'Por Hora');
INSERT INTO TIPOS_DE_SUELDO (id,TIPO) VALUES (seq_tipos_de_sueldo.NEXTVAL,'Por Comisión');
INSERT INTO TIPOS_DE_SUELDO (id,TIPO) VALUES (seq_tipos_de_sueldo.NEXTVAL,'Base + Comisión');
INSERT INTO TIPOS_DE_SUELDO (id,TIPO) VALUES (seq_tipos_de_sueldo.NEXTVAL,'Por Proyecto');
INSERT INTO TIPOS_DE_SUELDO (id,TIPO) VALUES (seq_tipos_de_sueldo.NEXTVAL,'Anual');
INSERT INTO TIPOS_DE_SUELDO (id,TIPO) VALUES (seq_tipos_de_sueldo.NEXTVAL,'Bimensual');
INSERT INTO TIPOS_DE_SUELDO (id,TIPO) VALUES (seq_tipos_de_sueldo.NEXTVAL,'Variable');


-- Inserts para SUELDOS
INSERT INTO sueldos (id, sueldo, fecha_inicio, ID_TIPO_SUELDO) VALUES (seq_sueldos.NEXTVAL, 2500, DATE '2021-01-01',1);
INSERT INTO sueldos (id, sueldo, fecha_inicio, ID_TIPO_SUELDO) VALUES (seq_sueldos.NEXTVAL, 2000, DATE '2021-01-01',2);
INSERT INTO sueldos (id, sueldo, fecha_inicio, ID_TIPO_SUELDO) VALUES (seq_sueldos.NEXTVAL, 1500, DATE '2021-01-01',3);
INSERT INTO sueldos (id, sueldo, fecha_inicio, ID_TIPO_SUELDO) VALUES (seq_sueldos.NEXTVAL, 3000, DATE '2021-01-01',4);
INSERT INTO sueldos (id, sueldo, fecha_inicio, ID_TIPO_SUELDO) VALUES (seq_sueldos.NEXTVAL, 2800, DATE '2021-01-01',5);
INSERT INTO sueldos (id, sueldo, fecha_inicio, ID_TIPO_SUELDO) VALUES (seq_sueldos.NEXTVAL, 3200, DATE '2021-01-01',6);
INSERT INTO sueldos (id, sueldo, fecha_inicio, ID_TIPO_SUELDO) VALUES (seq_sueldos.NEXTVAL, 1800, DATE '2021-01-01',7);
INSERT INTO sueldos (id, sueldo, fecha_inicio, ID_TIPO_SUELDO) VALUES (seq_sueldos.NEXTVAL, 2600, DATE '2021-01-01',8);
INSERT INTO sueldos (id, sueldo, fecha_inicio, ID_TIPO_SUELDO) VALUES (seq_sueldos.NEXTVAL, 2300, DATE '2021-01-01',9);
INSERT INTO sueldos (id, sueldo, fecha_inicio, ID_TIPO_SUELDO) VALUES (seq_sueldos.NEXTVAL, 1900, DATE '2021-01-01',10);

-- Inserts para TRANSACCIONES
--INSERT INTO transacciones (id, monto) VALUES (seq_transacciones.NEXTVAL, 500);
--INSERT INTO transacciones (id, monto) VALUES (seq_transacciones.NEXTVAL, 1000);
--INSERT INTO transacciones (id, monto) VALUES (seq_transacciones.NEXTVAL, 1500);
--INSERT INTO transacciones (id, monto) VALUES (seq_transacciones.NEXTVAL, 200);
--INSERT INTO transacciones (id, monto) VALUES (seq_transacciones.NEXTVAL, 300);
--INSERT INTO transacciones (id, monto) VALUES (seq_transacciones.NEXTVAL, 600);
--INSERT INTO transacciones (id, monto) VALUES (seq_transacciones.NEXTVAL, 250);
--INSERT INTO transacciones (id, monto) VALUES (seq_transacciones.NEXTVAL, 750);
--INSERT INTO transacciones (id, monto) VALUES (seq_transacciones.NEXTVAL, 900);
--INSERT INTO transacciones (id, monto) VALUES (seq_transacciones.NEXTVAL, 450);

-- Inserts para TIPOS_DE_ESTADOS_FINANCIEROS
INSERT INTO TIPOS_DE_ESTADOS_FINANCIEROS (id,TIPO, DESCRIPCION) VALUES (seq_tipos_de_estados_financieros.NEXTVAL,'Solvente', 'Estado financiero óptimo');
INSERT INTO TIPOS_DE_ESTADOS_FINANCIEROS (id,TIPO, DESCRIPCION) VALUES (seq_tipos_de_estados_financieros.NEXTVAL,'Equilibrio', 'Estado financiero estable');
INSERT INTO TIPOS_DE_ESTADOS_FINANCIEROS (id,TIPO, DESCRIPCION) VALUES (seq_tipos_de_estados_financieros.NEXTVAL,'Quiebra', 'Estado financiero crítico');

-- Inserts para ESTADOS_FINANCIEROS
--INSERT INTO estados_financieros (id, monto_activo, MONTO_PASIVO,saldo_total,fecha,id_tipo_estado) VALUES (seq_estados_financieros.NEXTVAL, 100000.00, 50000.00, 50000.00, SYSDATE, 1);
--INSERT INTO estados_financieros (id, monto_activo, MONTO_PASIVO,saldo_total,fecha,id_tipo_estado) VALUES (seq_estados_financieros.NEXTVAL, 200000.00, 100000.00, 100000.00, SYSDATE, 2);
--INSERT INTO estados_financieros (id, monto_activo, MONTO_PASIVO,saldo_total,fecha,id_tipo_estado) VALUES (seq_estados_financieros.NEXTVAL, 300000.00, 150000.00, 150000.00, SYSDATE, 3);
--INSERT INTO estados_financieros (id, monto_activo, MONTO_PASIVO,saldo_total,fecha,id_tipo_estado) VALUES (seq_estados_financieros.NEXTVAL, 400000.00, 200000.00, 200000.00, SYSDATE, 1);
--INSERT INTO estados_financieros (id, monto_activo, MONTO_PASIVO,saldo_total,fecha,id_tipo_estado) VALUES (seq_estados_financieros.NEXTVAL, 500000.00, 250000.00, 250000.00, SYSDATE, 2);
--INSERT INTO estados_financieros (id, monto_activo, MONTO_PASIVO,saldo_total,fecha,id_tipo_estado) VALUES (seq_estados_financieros.NEXTVAL, 600000.00, 300000.00, 300000.00, SYSDATE, 3);
--INSERT INTO estados_financieros (id, monto_activo, MONTO_PASIVO,saldo_total,fecha,id_tipo_estado) VALUES (seq_estados_financieros.NEXTVAL, 700000.00, 350000.00, 350000.00, SYSDATE, 1);
--INSERT INTO estados_financieros (id, monto_activo, MONTO_PASIVO,saldo_total,fecha,id_tipo_estado) VALUES (seq_estados_financieros.NEXTVAL, 800000.00, 400000.00, 400000.00, SYSDATE, 2);
--INSERT INTO estados_financieros (id, monto_activo, MONTO_PASIVO,saldo_total,fecha,id_tipo_estado) VALUES (seq_estados_financieros.NEXTVAL, 900000.00, 450000.00, 450000.00, SYSDATE, 3);
--INSERT INTO estados_financieros (id, monto_activo, MONTO_PASIVO,saldo_total,fecha,id_tipo_estado) VALUES (seq_estados_financieros.NEXTVAL, 100000.00, 500000.00, 500000.00, SYSDATE, 1);

-- Inserts para TIPOS_DE_TRANSACCIONES
INSERT INTO TIPOS_DE_TRANSACCIONES (id,TIPO) VALUES (seq_tipos_de_transacciones.NEXTVAL,'Depósito');
INSERT INTO TIPOS_DE_TRANSACCIONES (id,TIPO) VALUES (seq_tipos_de_transacciones.NEXTVAL,'Retiro');
INSERT INTO TIPOS_DE_TRANSACCIONES (id,TIPO) VALUES (seq_tipos_de_transacciones.NEXTVAL,'Transferencia');
INSERT INTO TIPOS_DE_TRANSACCIONES (id,TIPO) VALUES (seq_tipos_de_transacciones.NEXTVAL,'Pago de Servicios');
INSERT INTO TIPOS_DE_TRANSACCIONES (id,TIPO) VALUES (seq_tipos_de_transacciones.NEXTVAL,'Pago de Préstamo');
INSERT INTO TIPOS_DE_TRANSACCIONES (id,TIPO) VALUES (seq_tipos_de_transacciones.NEXTVAL,'Pago de Tarjeta');
INSERT INTO TIPOS_DE_TRANSACCIONES (id,TIPO) VALUES (seq_tipos_de_transacciones.NEXTVAL,'Cambio de Divisas');
INSERT INTO TIPOS_DE_TRANSACCIONES (id,TIPO) VALUES (seq_tipos_de_transacciones.NEXTVAL,'Compra con Tarjeta');
INSERT INTO TIPOS_DE_TRANSACCIONES (id,TIPO) VALUES (seq_tipos_de_transacciones.NEXTVAL,'Retiro ATM');
INSERT INTO TIPOS_DE_TRANSACCIONES (id,TIPO) VALUES (seq_tipos_de_transacciones.NEXTVAL,'Transferencia ACH');

-- Inserts para UBICACIONES
INSERT INTO UBICACIONES (id,ID_DEPARTAMENTO, ID_MUNICIPIO, ID_CODIGO_POSTAL) VALUES (seq_ubicaciones.NEXTVAL,1, 1, 1);
INSERT INTO UBICACIONES (id,ID_DEPARTAMENTO, ID_MUNICIPIO, ID_CODIGO_POSTAL) VALUES (seq_ubicaciones.NEXTVAL,1, 2, 2);
INSERT INTO UBICACIONES (id,ID_DEPARTAMENTO, ID_MUNICIPIO, ID_CODIGO_POSTAL) VALUES (seq_ubicaciones.NEXTVAL,1, 3, 3);
INSERT INTO UBICACIONES (id,ID_DEPARTAMENTO, ID_MUNICIPIO, ID_CODIGO_POSTAL) VALUES (seq_ubicaciones.NEXTVAL,3, 4, 4);
INSERT INTO UBICACIONES (id,ID_DEPARTAMENTO, ID_MUNICIPIO, ID_CODIGO_POSTAL) VALUES (seq_ubicaciones.NEXTVAL,9, 6, 5);
INSERT INTO UBICACIONES (id,ID_DEPARTAMENTO, ID_MUNICIPIO, ID_CODIGO_POSTAL) VALUES (seq_ubicaciones.NEXTVAL,5, 5, 6);
INSERT INTO UBICACIONES (id,ID_DEPARTAMENTO, ID_MUNICIPIO, ID_CODIGO_POSTAL) VALUES (seq_ubicaciones.NEXTVAL,1, 3, 7);
INSERT INTO UBICACIONES (id,ID_DEPARTAMENTO, ID_MUNICIPIO, ID_CODIGO_POSTAL) VALUES (seq_ubicaciones.NEXTVAL,4, 7, 8);
INSERT INTO UBICACIONES (id,ID_DEPARTAMENTO, ID_MUNICIPIO, ID_CODIGO_POSTAL) VALUES (seq_ubicaciones.NEXTVAL,10, 8, 9);
INSERT INTO UBICACIONES (id,ID_DEPARTAMENTO, ID_MUNICIPIO, ID_CODIGO_POSTAL) VALUES (seq_ubicaciones.NEXTVAL,2, 9, 10);


-- Inserts para SUCURSALES_AGENCIAS
INSERT INTO SUCURSALES_AGENCIAS (id,NOMBRE, ID_TIPO, TELEFONO, ID_UBICACION) VALUES (seq_sucursales_agencias.NEXTVAL,'Sucursal Central', 1, '5551111111',1);
INSERT INTO SUCURSALES_AGENCIAS (id,NOMBRE, ID_TIPO, TELEFONO, ID_UBICACION) VALUES (seq_sucursales_agencias.NEXTVAL,'Agencia Zona 10', 2, '5552222222',2);
INSERT INTO SUCURSALES_AGENCIAS (id,NOMBRE, ID_TIPO, TELEFONO, ID_UBICACION) VALUES (seq_sucursales_agencias.NEXTVAL,'Express Mixco', 3, '5553333333',3);
INSERT INTO SUCURSALES_AGENCIAS (id,NOMBRE, ID_TIPO, TELEFONO, ID_UBICACION) VALUES (seq_sucursales_agencias.NEXTVAL,'Centro Antigua', 4, '5554444444',4);
INSERT INTO SUCURSALES_AGENCIAS (id,NOMBRE, ID_TIPO, TELEFONO, ID_UBICACION) VALUES (seq_sucursales_agencias.NEXTVAL,'Centro Antigua 2', 1, '5554444444',4);

SELECT * FROM SUCURSALES_AGENCIAS;

-- Inserts para EMPLEADOS
INSERT INTO EMPLEADOS (id,NOMBRE, APELLIDO, ID_ROL, ID_DEPARTAMENTO, ID_SUCURSAL,TELEFONO) VALUES (seq_empleados.NEXTVAL,'Juan', 'Pérez', 1, 1, 2,  '5551234567');
INSERT INTO EMPLEADOS (id,NOMBRE, APELLIDO, ID_ROL, ID_DEPARTAMENTO, ID_SUCURSAL,TELEFONO) VALUES (seq_empleados.NEXTVAL,'María', 'López', 2, 1, 2, '5552345678');
INSERT INTO EMPLEADOS (id,NOMBRE, APELLIDO, ID_ROL, ID_DEPARTAMENTO, ID_SUCURSAL,TELEFONO) VALUES (seq_empleados.NEXTVAL,'Carlos', 'García', 3, 2, 3, '5553456789');
INSERT INTO EMPLEADOS (id,NOMBRE, APELLIDO, ID_ROL, ID_DEPARTAMENTO, ID_SUCURSAL,TELEFONO) VALUES (seq_empleados.NEXTVAL,'Ana', 'Martínez', 4, 3, 4,'5554567890');
INSERT INTO EMPLEADOS (id,NOMBRE, APELLIDO, ID_ROL, ID_DEPARTAMENTO, ID_SUCURSAL,TELEFONO) VALUES (seq_empleados.NEXTVAL,'Pedro', 'Ramírez', 5, 4, 2, '5555678901');
INSERT INTO EMPLEADOS (id,NOMBRE, APELLIDO, ID_ROL, ID_DEPARTAMENTO, ID_SUCURSAL,TELEFONO) VALUES (seq_empleados.NEXTVAL,'Lucía', 'Hernández', 6, 5, 2, '5556789012');
INSERT INTO EMPLEADOS (id,NOMBRE, APELLIDO, ID_ROL, ID_DEPARTAMENTO, ID_SUCURSAL,TELEFONO) VALUES (seq_empleados.NEXTVAL,'Roberto', 'Torres', 7, 1, 2,  '5557890123');
INSERT INTO EMPLEADOS (id,NOMBRE, APELLIDO, ID_ROL, ID_DEPARTAMENTO, ID_SUCURSAL,TELEFONO) VALUES (seq_empleados.NEXTVAL,'Sofia', 'Luna', 8, 2, 3,  '5558901234');
INSERT INTO EMPLEADOS (id,NOMBRE, APELLIDO, ID_ROL, ID_DEPARTAMENTO, ID_SUCURSAL,TELEFONO) VALUES (seq_empleados.NEXTVAL,'Diego', 'Mendoza', 9, 3, 4,  '5559012345');
INSERT INTO EMPLEADOS (id,NOMBRE, APELLIDO, ID_ROL, ID_DEPARTAMENTO, ID_SUCURSAL,TELEFONO) VALUES (seq_empleados.NEXTVAL,'Carmen', 'Sánchez', 10, 4, 4,  '5550123456');
--   new


-- Inserts para CLIENTES
INSERT INTO CLIENTES (id,NOMBRE, APELLIDO, TELEFONO) VALUES (seq_clientes.NEXTVAL,'Luis', 'González', '5551234567' );
INSERT INTO CLIENTES (id,NOMBRE, APELLIDO, TELEFONO) VALUES (seq_clientes.NEXTVAL,'Ana', 'Rodríguez', '5552345678');
INSERT INTO CLIENTES (id,NOMBRE, APELLIDO, TELEFONO) VALUES (seq_clientes.NEXTVAL,'Carlos', 'Pérez', '5553456789');
INSERT INTO CLIENTES (id,NOMBRE, APELLIDO, TELEFONO) VALUES (seq_clientes.NEXTVAL,'María', 'López', '5554567890');
INSERT INTO CLIENTES (id,NOMBRE, APELLIDO, TELEFONO) VALUES (seq_clientes.NEXTVAL,'José', 'Martínez', '5555678901');
INSERT INTO CLIENTES (id,NOMBRE, APELLIDO, TELEFONO) VALUES (seq_clientes.NEXTVAL,'Sandra', 'García', '5556789012');
INSERT INTO CLIENTES (id,NOMBRE, APELLIDO, TELEFONO) VALUES (seq_clientes.NEXTVAL,'Pedro', 'Hernández', '5557890123');
INSERT INTO CLIENTES (id,NOMBRE, APELLIDO, TELEFONO) VALUES (seq_clientes.NEXTVAL,'Laura', 'Sánchez', '5558901234');
INSERT INTO CLIENTES (id,NOMBRE, APELLIDO, TELEFONO) VALUES (seq_clientes.NEXTVAL,'Miguel', 'Torres', '5559012345');
INSERT INTO CLIENTES (id,NOMBRE, APELLIDO, TELEFONO) VALUES (seq_clientes.NEXTVAL,'Carmen', 'Ramírez', '5550123456');

SELECT * FROM CLIENTES;
-- Inserts para CUENTAS
INSERT INTO CUENTAS (id,NUMERO_DE_CUENTA, ID_TIPO_DE_CUENTA, SALDO, ID_CLIENTE) VALUES (seq_cuentas.NEXTVAL,'1001-001-01', 1, 15000.00,1);
INSERT INTO CUENTAS (id,NUMERO_DE_CUENTA, ID_TIPO_DE_CUENTA, SALDO, ID_CLIENTE) VALUES (seq_cuentas.NEXTVAL,'1001-001-02', 2, 25000.00,3);
INSERT INTO CUENTAS (id,NUMERO_DE_CUENTA, ID_TIPO_DE_CUENTA, SALDO, ID_CLIENTE) VALUES (seq_cuentas.NEXTVAL,'1001-001-03', 3, 35000.00,4);
INSERT INTO CUENTAS (id,NUMERO_DE_CUENTA, ID_TIPO_DE_CUENTA, SALDO, ID_CLIENTE) VALUES (seq_cuentas.NEXTVAL,'1001-001-04', 4, 45000.00,5);
INSERT INTO CUENTAS (id,NUMERO_DE_CUENTA, ID_TIPO_DE_CUENTA, SALDO, ID_CLIENTE) VALUES (seq_cuentas.NEXTVAL,'1001-001-05', 5, 55000.00,6);
INSERT INTO CUENTAS (id,NUMERO_DE_CUENTA, ID_TIPO_DE_CUENTA, SALDO, ID_CLIENTE) VALUES (seq_cuentas.NEXTVAL,'1001-001-06', 6, 65000.00,7);
INSERT INTO CUENTAS (id,NUMERO_DE_CUENTA, ID_TIPO_DE_CUENTA, SALDO, ID_CLIENTE) VALUES (seq_cuentas.NEXTVAL,'1001-001-07', 7, 75000.00,8);
INSERT INTO CUENTAS (id,NUMERO_DE_CUENTA, ID_TIPO_DE_CUENTA, SALDO, ID_CLIENTE) VALUES (seq_cuentas.NEXTVAL,'1001-001-08', 8, 85000.00,9);
INSERT INTO CUENTAS (id,NUMERO_DE_CUENTA, ID_TIPO_DE_CUENTA, SALDO, ID_CLIENTE) VALUES (seq_cuentas.NEXTVAL,'1001-001-09', 9, 95000.00,10);
--INSERT INTO CUENTAS (id,NUMERO_DE_CUENTA, ID_TIPO_DE_CUENTA, SALDO, ID_CLIENTE) VALUES (seq_cuentas.NEXTVAL,'1001-001-10', 10, 105000,11);

select * from SUCURSALES_AGENCIAS;

-- Inserts para BOVEDAS
INSERT INTO BOVEDAS (id_boveda,ID_AGENCIA_SUCURSAL, FONDOS_DISPONIBLES) VALUES (seq_bovedas.NEXTVAL,1, 1000000.00);
INSERT INTO BOVEDAS (id_boveda,ID_AGENCIA_SUCURSAL, FONDOS_DISPONIBLES) VALUES (seq_bovedas.NEXTVAL,2, 750000.00);
INSERT INTO BOVEDAS (id_boveda,ID_AGENCIA_SUCURSAL, FONDOS_DISPONIBLES) VALUES (seq_bovedas.NEXTVAL,3, 500000.00);
INSERT INTO BOVEDAS (id_boveda,ID_AGENCIA_SUCURSAL, FONDOS_DISPONIBLES) VALUES (seq_bovedas.NEXTVAL,4, 850000.00);
INSERT INTO BOVEDAS (id_boveda,ID_AGENCIA_SUCURSAL, FONDOS_DISPONIBLES) VALUES (seq_bovedas.NEXTVAL,5, 650000.00);
--INSERT INTO BOVEDAS (id_boveda,ID_AGENCIA_SUCURSAL, FONDOS_DISPONIBLES) VALUES (seq_bovedas.NEXTVAL,4, 950000.00);
--INSERT INTO BOVEDAS (id_boveda,ID_AGENCIA_SUCURSAL, FONDOS_DISPONIBLES) VALUES (seq_bovedas.NEXTVAL,2, 550000.00);
--INSERT INTO BOVEDAS (id_boveda,ID_AGENCIA_SUCURSAL, FONDOS_DISPONIBLES) VALUES (seq_bovedas.NEXTVAL,3, 450000.00);
--INSERT INTO BOVEDAS (id_boveda,ID_AGENCIA_SUCURSAL, FONDOS_DISPONIBLES) VALUES (seq_bovedas.NEXTVAL,4, 800000.00);
--INSERT INTO BOVEDAS (id_boveda,ID_AGENCIA_SUCURSAL, FONDOS_DISPONIBLES) VALUES (seq_bovedas.NEXTVAL,5, 700000.00);

-- Inserts para TARJETAS_DE_CREDITO
INSERT INTO TARJETAS_DE_CREDITO (id_tarjeta,ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO) VALUES (seq_tarjetas_de_credito.NEXTVAL,1, '4532-7894-1234-5678', 25000.00, 5000.00, DATE '2023-01-01', DATE '2026-01-01', 1, DATE '2024-02-15', 15);
INSERT INTO TARJETAS_DE_CREDITO (id_tarjeta,ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO) VALUES (seq_tarjetas_de_credito.NEXTVAL,2, '4532-7894-1234-5679', 35000.00, 15000.00, DATE '2023-02-01', DATE '2026-02-01', 1, DATE '2024-02-20', 20);
INSERT INTO TARJETAS_DE_CREDITO (id_tarjeta,ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO) VALUES (seq_tarjetas_de_credito.NEXTVAL,3, '4532-7894-1234-5680', 45000.00, 20000.00, DATE '2023-03-01', DATE '2026-03-01', 2, DATE '2024-02-25', 25);
INSERT INTO TARJETAS_DE_CREDITO (id_tarjeta,ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO) VALUES (seq_tarjetas_de_credito.NEXTVAL,4, '4532-7894-1234-5681', 55000.00, 25000.00, DATE '2023-04-01', DATE '2026-04-01', 1, DATE '2024-02-10', 10);
INSERT INTO TARJETAS_DE_CREDITO (id_tarjeta,ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO) VALUES (seq_tarjetas_de_credito.NEXTVAL,5, '4532-7894-1234-5682', 65000.00, 30000.00, DATE '2023-05-01', DATE '2026-05-01', 1, DATE '2024-02-05', 5);
INSERT INTO TARJETAS_DE_CREDITO (id_tarjeta,ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO) VALUES (seq_tarjetas_de_credito.NEXTVAL,6, '4532-7894-1234-5683', 75000.00, 35000.00, DATE '2023-06-01', DATE '2026-06-01', 1, DATE '2024-02-15', 15);
INSERT INTO TARJETAS_DE_CREDITO (id_tarjeta,ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO) VALUES (seq_tarjetas_de_credito.NEXTVAL,7, '4532-7894-1234-5684', 85000.00, 40000.00, DATE '2023-07-01', DATE '2026-07-01', 3, DATE '2024-02-20', 20);
INSERT INTO TARJETAS_DE_CREDITO (id_tarjeta,ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO) VALUES (seq_tarjetas_de_credito.NEXTVAL,8, '4532-7894-1234-5685', 95000.00, 45000.00, DATE '2023-08-01', DATE '2026-08-01', 1, DATE '2024-02-25', 25);
INSERT INTO TARJETAS_DE_CREDITO (id_tarjeta,ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO) VALUES (seq_tarjetas_de_credito.NEXTVAL,9, '4532-7894-1234-5686', 100000.00, 50000.00, DATE '2023-09-01', DATE '2026-09-01', 1, DATE '2024-02-10', 10);
INSERT INTO TARJETAS_DE_CREDITO (id_tarjeta,ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO) VALUES (seq_tarjetas_de_credito.NEXTVAL,10, '4532-7894-1234-5687', 150000.00, 75000.00, DATE '2023-10-01', DATE '2026-10-01', 1, DATE '2024-02-05', 5);

-- Inserts para PRESTAMOS
INSERT INTO PRESTAMOS (id_prestamo,ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO) VALUES (seq_prestamos.NEXTVAL,1, 50000.00, 12.5, DATE '2023-01-15', DATE '2025-01-15', 45000.00, 1);
INSERT INTO PRESTAMOS (id_prestamo,ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO) VALUES (seq_prestamos.NEXTVAL,2, 75000.00, 11.5, DATE '2023-02-15', DATE '2025-02-15', 70000.00, 1);
INSERT INTO PRESTAMOS (id_prestamo,ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO) VALUES (seq_prestamos.NEXTVAL,3, 100000.00, 10.5, DATE '2023-03-15', DATE '2025-03-15', 95000.00, 2);
INSERT INTO PRESTAMOS (id_prestamo,ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO) VALUES (seq_prestamos.NEXTVAL,4, 150000.00, 9.5, DATE '2023-04-15', DATE '2025-04-15', 140000.00, 1);
INSERT INTO PRESTAMOS (id_prestamo,ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO) VALUES (seq_prestamos.NEXTVAL,5, 200000.00, 8.5, DATE '2023-05-15', DATE '2025-05-15', 190000.00, 1);
INSERT INTO PRESTAMOS (id_prestamo,ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO) VALUES (seq_prestamos.NEXTVAL,6, 250000.00, 7.5, DATE '2023-06-15', DATE '2025-06-15', 240000.00, 1);
INSERT INTO PRESTAMOS (id_prestamo,ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO) VALUES (seq_prestamos.NEXTVAL,7, 300000.00, 6.5, DATE '2023-07-15', DATE '2025-07-15', 290000.00, 3);
INSERT INTO PRESTAMOS (id_prestamo,ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO) VALUES (seq_prestamos.NEXTVAL,8, 350000.00, 5.5, DATE '2023-08-15', DATE '2025-08-15', 340000.00, 1);
INSERT INTO PRESTAMOS (id_prestamo,ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO) VALUES (seq_prestamos.NEXTVAL,9, 400000.00, 4.5, DATE '2023-09-15', DATE '2025-09-15', 390000.00, 1);
INSERT INTO PRESTAMOS (id_prestamo,ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO) VALUES (seq_prestamos.NEXTVAL,10, 450000.00, 3.5, DATE '2023-10-15', DATE '2025-10-15', 440000.00, 1);
