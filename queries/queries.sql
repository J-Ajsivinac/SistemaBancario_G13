-- Inserción de Clientes

INSERT INTO CLIENTES (NOMBRE, APELLIDO, TELEFONO, ID_CUENTA)
VALUES (:nombre, :apellido, :telefono, :id_cuenta);


UPDATE CLIENTES
SET NOMBRE = :nuevo_nombre, APELLIDO = :nuevo_apellido, TELEFONO = :nuevo_telefono
WHERE ID = :id_cliente;


SELECT SALDO 
FROM CUENTAS 
WHERE ID = (SELECT ID_CUENTA FROM CLIENTES WHERE ID = :id_cliente);


SELECT 
    c.NOMBRE, 
    c.APELLIDO, 
    c.TELEFONO, 
    tc.TIPO AS "Tipo Cuenta"
FROM 
    CLIENTES c
JOIN 
    CUENTAS cu ON c.ID_CUENTA = cu.ID
JOIN 
    TIPO_DE_CUENTAS tc ON cu.ID_TIPO_DE_CUENTA = tc.ID
WHERE 
    c.ID = :id_cliente;


INSERT INTO TRANSACCIONES (ID_CLIENTE, NUMERO_DE_CUENTA_ORIGEN, ID_TIPO_TRANSACCION, MONTO, FECHA, HORA, DESCRIPCION, SUCURSAL, AGENCIA, ID_SUCURSAL_AGENCIA)
VALUES (:id_cliente, :numero_cuenta, :id_tipo_transaccion, :monto, SYSDATE, SYSTIMESTAMP, :descripcion, :sucursal, :agencia, :id_sucursal_agencia);

INSERT INTO TRANSACCIONES (ID_CLIENTE, NUMERO_DE_CUENTA_ORIGEN, ID_TIPO_TRANSACCION, MONTO, FECHA, HORA, DESCRIPCION, SUCURSAL, AGENCIA, ID_SUCURSAL_AGENCIA)
VALUES (:id_cliente, :numero_cuenta, :id_tipo_transaccion, :monto, SYSDATE, SYSTIMESTAMP, :descripcion, :sucursal, :agencia, :id_sucursal_agencia);

INSERT INTO TRANSACCIONES (ID_CLIENTE, NUMERO_DE_CUENTA_ORIGEN, NUMERO_DE_CUENTA_DESTINO, ID_TIPO_TRANSACCION, MONTO, FECHA, HORA, DESCRIPCION, SUCURSAL, AGENCIA, ID_SUCURSAL_AGENCIA)
VALUES (:id_cliente, :cuenta_origen, :cuenta_destino, :id_tipo_transaccion, :monto, SYSDATE, SYSTIMESTAMP, :descripcion, :sucursal, :agencia, :id_sucursal_agencia);

SELECT * 
FROM TRANSACCIONES 
WHERE ID_CLIENTE = :id_cliente 
ORDER BY FECHA DESC;

INSERT INTO PRESTAMOS (ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO)
VALUES (:id_cliente, :monto_del_prestamo, :tasa_de_interes, SYSDATE, :fecha_de_vencimiento, :saldo_pendiente, :id_estado);

UPDATE PRESTAMOS
SET ID_ESTADO = :nuevo_estado
WHERE ID_PRESTAMO = :id_prestamo;

INSERT INTO TRANSACCIONES (ID_CLIENTE, NUMERO_DE_CUENTA_ORIGEN, ID_TIPO_TRANSACCION, MONTO, FECHA, HORA, DESCRIPCION, SUCURSAL, AGENCIA, ID_SUCURSAL_AGENCIA)
VALUES (:id_cliente, :numero_cuenta, :id_tipo_transaccion, :monto_pago, SYSDATE, SYSTIMESTAMP, :descripcion_pago, :sucursal, :agencia, :id_sucursal_agencia);

SELECT * FROM PRESTAMOS;

SELECT * 
FROM PRESTAMOS 
WHERE ID_CLIENTE = :id_cliente AND ID_ESTADO = (SELECT ID FROM ESTADOS_DE_PRESTAMOS WHERE ESTADO = 'Aprobado');

INSERT INTO TARJETAS_DE_CREDITO (ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO)
VALUES (:id_cliente, :numero_tarjeta, :limite_de_credito, :saldo_actual, SYSDATE, :fecha_de_expiracion, :id_estado, :fecha_de_corte, :dia_del_ciclo);

INSERT INTO TRANSACCIONES (ID_CLIENTE, NUMERO_DE_CUENTA_ORIGEN, ID_TIPO_TRANSACCION, MONTO, FECHA, HORA, DESCRIPCION, SUCURSAL, AGENCIA, ID_SUCURSAL_AGENCIA)
VALUES (:id_cliente, :numero_cuenta, :id_tipo_transaccion, :monto_pago, SYSDATE, SYSTIMESTAMP, :descripcion_pago, :sucursal, :agencia, :id_sucursal_agencia);

INSERT INTO TRANSACCIONES (ID_CLIENTE, NUMERO_DE_CUENTA_ORIGEN, ID_TIPO_TRANSACCION, MONTO, FECHA, HORA, DESCRIPCION, SUCURSAL, AGENCIA, ID_SUCURSAL_AGENCIA)
VALUES (:id_cliente, :numero_tarjeta, :id_tipo_transaccion, :monto_compra, SYSDATE, SYSTIMESTAMP, :descripcion_compra, :sucursal, :agencia, :id_sucursal_agencia);

SELECT SALDO_ACTUAL, LIMITE_DE_CREDITO, FECHA_DE_CORTE 
FROM TARJETAS_DE_CREDITO 
WHERE ID_CLIENTE = :id_cliente;

INSERT INTO EMPLEADOS (NOMBRE, APELLIDO, ID_ROL, ID_DEPARTAMENTO, SUCURSAL, AGENCIA, TELEFONO)
VALUES (:nombre, :apellido, :id_rol, :id_departamento, :sucursal, :agencia, :telefono);

UPDATE EMPLEADOS
SET NOMBRE = :nuevo_nombre, APELLIDO = :nuevo_apellido, TELEFONO = :nuevo_telefono
WHERE ID = :id_empleado;

SELECT * 
FROM EMPLEADOS ;

SELECT * 
FROM EMPLEADOS 
WHERE SUCURSAL = :sucursal;

INSERT INTO SUCURSALES_AGENCIAS (NOMBRE, ID_TIPO, TELEFONO, ID_UBICACION, NUM_EMPLEADO, CAPACIDAD_ALAMCENAMIENTO)
VALUES (:nombre, :id_tipo, :telefono, :id_ubicacion, :num_empleado, :capacidad_almacenamiento);

SELECT * 
FROM SUCURSALES_AGENCIAS 
WHERE ID_UBICACION IN (SELECT ID FROM UBICACIONES WHERE ID_DEPARTAMENTO = :id_departamento);

SELECT * 
FROM TRANSACCIONES 
WHERE FECHA BETWEEN :fecha_inicio AND :fecha_fin;

SELECT * 
FROM PRESTAMOS 
WHERE ID_ESTADO = (SELECT ID FROM ESTADOS_DE_PRESTAMOS WHERE ESTADO = 'Aprobado');
