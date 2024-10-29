--
-- Clientes
--

-- Registrar un cliente
BEGIN
    registrar_cliente_y_cuenta(
        p_nombre => :nombre,
        p_apellido => :apellido,
        p_telefono => :telefono,
        p_numero_de_cuenta => :numero_cuenta,
        p_id_tipo_de_cuenta => :id_tipo_cuenta,
        p_saldo => :saldo
    );
END;
/

SELECT * FROM estados_de_tarjetas;
SELECT * FROM clientes;
SELECT * FROM cuentas;

-- Actualizar Información del cliente
UPDATE clientes
SET nombre = :nuevo_nombre, apellido = :nuevo_apellido, telefono = :nuevo_telefono
WHERE id = :id_cliente;

--  Consultar Saldo
SELECT SALDO FROM cuentas WHERE id = :id_cuenta;

-- Obtener Información del Cliente
-- nombre, apellido, telefono, tipo de cuenta
SELECT
    c.nombre,
    c.apellido,
    c.telefono,
    t.tipo AS nombre_tipo_cuenta
FROM
    clientes c
JOIN
    cuentas cu ON c.id = cu.id_cliente
JOIN
    tipo_de_cuentas t ON cu.id_tipo_de_cuenta = t.id
WHERE
    c.id = :cliente_id;  -- Aquí se usa el parámetro



--
-- Transacciones
--

-- Registrar Depósito

SELECT * FROM bovedas;

BEGIN
    manejar_deposito(
        p_numero_cuenta => :numero_cuenta,
        p_monto => :monto,
        p_id_sucursal_agencia => :id_sucursal_agencia
    );
END;
/

SELECT * FROM CUENTAS;

-- Registrar Retiro
BEGIN
    registrar_retiro(
        p_numero_cuenta => :numero_cuenta,
        p_monto => :monto,
        p_id_sucursal_agencia => :id_sucursal_agencia
    );
END;

-- Registrar Transferencias entre cuentas
BEGIN
    manejar_transferencia(
        p_numero_cuenta_origen => :numero_cuenta_origen,
        p_numero_cuenta_destino => :numero_cuenta_destino,
        p_monto => :monto,
        p_id_sucursal_agencia => :id_sucursal_agencia
    );
END;

-- Registrar Transferencias Interbancarias
BEGIN
    manejar_transferencia_inter(
        p_id_sucursal_origen => :id_sucursal_origen,
        p_id_sucursal_destino => :id_sucursal_destino,
        p_numero_cuenta_origen => :numero_cuenta_origen,
        p_numero_cuenta_destino => :numero_cuenta_destino,
        p_monto => :monto
    );
END;

SELECT * FROM SUCURSALES_AGENCIAS;
SELECT * FROM BOVEDAS;

-- Consultar Historial
SELECT
    t.id,
    t.id_cliente,
    t.numero_de_cuenta_origen,
    t.numero_de_cuenta_destino,
    tt.tipo AS tipo_transaccion,
    t.monto,
    t.fecha,
    t.descripcion
FROM
    transacciones t
JOIN
    tipos_de_transacciones tt ON t.id_tipo_transaccion = tt.id
JOIN
    cuentas cu ON cu.NUMERO_DE_CUENTA = :numero_cuenta
WHERE
    t.id_cliente = :id_cliente;

SELECT * FROM TRANSACCIONES;
select * from CUENTAS;

--
-- Prestamos
--

SELECT * FROM prestamos;

-- Solicitar Prestamo
INSERT INTO prestamos (id_prestamo,id_cliente, monto_del_prestamo, tasa_de_interes, fecha_de_desembolso, fecha_de_vencimiento, saldo_pendiente, id_estado)
VALUES (seq_prestamos.NEXTVAL,:id_cliente, :monto_del_prestamo, :tasa_de_interes, SYSDATE, :fecha_de_vencimiento, :saldo_pendiente, 5);

UPDATE prestamos
SET id_estado = :nuevo_estado
WHERE id_prestamo = :id_prestamo;

BEGIN
    registrar_pago_prestamo(
        p_id_prestamo => :id_prestamo,
        p_monto_pago => :monto_pago,
        p_id_sucursal_agencia => :id_sucursal_agencia
    );
END;
/

SELECT * FROM ESTADOS_DE_PRESTAMOS;

-- Consultar Prestamos Activos de un Cliente
SELECT *
FROM prestamos
WHERE id_cliente = :id_cliente AND id_estado = (SELECT id FROM estados_de_prestamos WHERE estado = 'Aprobado');

--
-- Tarjetas
--

-- Emitir Tarjeta
INSERT INTO tarjetas_de_credito (id_cliente, numero_de_tarjeta, limite_de_credito, saldo_actual, fecha_de_emision, fecha_de_expiracion, id_estado, fecha_de_corte, dia_del_ciclo)
VALUES (:id_cliente, :numero_tarjeta, :limite_de_credito, :saldo_actual, SYSDATE, :fecha_de_expiracion, :id_estado, :fecha_de_corte, :dia_del_ciclo);

-- Registrar Pago y compras
BEGIN
    pagar_tarjeta_credito(
        p_id_cliente => :id_cliente,
        p_numero_tarjeta => :numero_tarjeta,
        p_monto_pago => :monto_pago,
        p_tipo_transaccion => :tipo_transaccion,
        p_id_sucursal_agencia => :id_sucursal_agencia
    );
END;

-- Consutlar Estado de Cuenta

SELECT * FROM TARJETAS_DE_CREDITO;

SELECT numero_de_tarjeta,saldo_actual, limite_de_credito, fecha_de_corte
FROM tarjetas_de_credito
WHERE id_cliente = :id_cliente;

--
-- Empleados
--

SELECT * FROM empleados;

-- registrar empleado
INSERT INTO empleados (id,nombre, apellido, id_rol, id_departamento,ID_SUCURSAL,telefono)
VALUES (seq_empleados.nextval,:nombre, :apellido, :id_rol, :id_departamento, :sucursal,  :telefono);

-- Actualizar Información del empleado
UPDATE empleados
SET nombre = :nuevo_nombre, apellido = :nuevo_apellido, telefono = :nuevo_telefono
WHERE id = :id_empleado;

-- Consultar Empleados por Sucursal
SELECT * FROM empleados WHERE id_sucursal = (SELECT id FROM sucursales_agencias WHERE nombre = :nombre_sucursal);

--
-- sucursales_agencias
--
SELECT *
FROM sucursales_agencias;
-- Registrar Sucursal
INSERT INTO SUCURSALES_AGENCIAS (id,nombre, id_tipo, telefono, id_ubicacion)
VALUES (seq_sucursales_agencias.nextval,:nombre, :id_tipo, :telefono, :id_ubicacion);

-- Consultar Sucursales por Departamento
SELECT id,nombre,telefono FROM sucursales_agencias WHERE id_ubicacion IN (SELECT id FROM ubicaciones WHERE id_departamento = :id_departamento);


SELECT *
FROM transacciones
WHERE fecha BETWEEN :fecha_inicio AND :fecha_fin;

SELECT *
FROM prestamos
WHERE id_estado = (SELECT id FROM estados_de_prestamos WHERE estado = 'Aprobado');
