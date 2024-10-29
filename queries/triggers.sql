CREATE OR REPLACE PROCEDURE registrar_pago_prestamo(
    p_id_prestamo IN NUMBER,
    p_monto_pago IN NUMBER,
    p_id_sucursal_agencia IN NUMBER
) AS
BEGIN
    -- Actualiza el saldo pendiente del préstamo
    UPDATE PRESTAMOS
    SET SALDO_PENDIENTE = SALDO_PENDIENTE - p_monto_pago
    WHERE ID_PRESTAMO = p_id_prestamo;

    -- Registra la transacción de pago
    INSERT INTO TRANSACCIONES (id,ID_CLIENTE, NUMERO_DE_CUENTA_ORIGEN, ID_TIPO_TRANSACCION, MONTO, FECHA, DESCRIPCION, ID_SUCURSAL_AGENCIA)
    VALUES (seq_transacciones.NEXTVAL,(SELECT ID_CLIENTE FROM PRESTAMOS WHERE ID_PRESTAMO = p_id_prestamo), '-',3, p_monto_pago, SYSTIMESTAMP, 'Pago de préstamo', p_id_sucursal_agencia);
END;

CREATE OR REPLACE PROCEDURE registrar_pago(
    p_id_cliente IN NUMBER,
    p_numero_cuenta IN VARCHAR2,
    p_monto_pago IN NUMBER,
    p_id_sucursal_agencia IN NUMBER
) AS
BEGIN
    -- Actualiza el saldo de la cuenta
    UPDATE CUENTAS
    SET SALDO = SALDO - p_monto_pago
    WHERE NUMERO_DE_CUENTA = p_numero_cuenta;

    -- Registra la transacción de pago
    INSERT INTO TRANSACCIONES (ID_CLIENTE, NUMERO_DE_CUENTA_ORIGEN, ID_TIPO_TRANSACCION, MONTO, FECHA, DESCRIPCION, ID_SUCURSAL_AGENCIA)
    VALUES (p_id_cliente, p_numero_cuenta, 4, p_monto_pago, SYSTIMESTAMP, 'Pago de tarjeta de crédito', p_id_sucursal_agencia);
END;

CREATE OR REPLACE TRIGGER verificar_boveda_20_porciento
BEFORE UPDATE ON BOVEDAS
FOR EACH ROW
BEGIN
    IF :NEW.FONDOS_DISPONIBLES < (:OLD.FONDOS_DISPONIBLES * 0.2) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Fondos disponibles en la bóveda por debajo del 20%');
    END IF;
END;

CREATE OR REPLACE PROCEDURE pagar_tarjeta_credito(
    p_id_cliente IN NUMBER,
    p_numero_tarjeta IN VARCHAR2,
    p_monto_pago IN NUMBER,
    p_tipo_transaccion IN NUMBER,
    p_id_sucursal_agencia IN NUMBER
) AS
BEGIN
    -- Actualiza el saldo de la tarjeta de crédito
    UPDATE TARJETAS_DE_CREDITO
    SET SALDO_ACTUAL = SALDO_ACTUAL - p_monto_pago
    WHERE NUMERO_DE_TARJETA = p_numero_tarjeta;

    -- Registra la transacción de pago
    INSERT INTO TRANSACCIONES (id,ID_CLIENTE, NUMERO_DE_CUENTA_ORIGEN, ID_TIPO_TRANSACCION, MONTO, FECHA, DESCRIPCION, ID_SUCURSAL_AGENCIA)
    VALUES (seq_transacciones.NEXTVAL,p_id_cliente, p_numero_tarjeta, p_tipo_transaccion, p_monto_pago, SYSTIMESTAMP, 'Pago de tarjeta de crédito', p_id_sucursal_agencia);
END;

CREATE OR REPLACE PROCEDURE manejar_deposito (
    p_numero_cuenta IN VARCHAR2,
    p_monto IN NUMBER,
    p_id_sucursal_agencia IN NUMBER
) AS
BEGIN
    UPDATE bovedas
    SET fondos_disponibles = fondos_disponibles + p_monto
    WHERE id_agencia_sucursal= p_id_sucursal_agencia;

    UPDATE CUENTAS
    SET SALDO = SALDO + p_monto
    WHERE NUMERO_DE_CUENTA = p_numero_cuenta;

    INSERT INTO transacciones (id,id_cliente, numero_de_cuenta_origen, id_tipo_transaccion, monto, fecha, descripcion, id_sucursal_agencia)
    VALUES (seq_transacciones.NEXTVAL,(SELECT id_cliente FROM cuentas WHERE numero_de_cuenta = p_numero_cuenta), p_numero_cuenta, 1, p_monto, SYSTIMESTAMP, 'Depósito', p_id_sucursal_agencia);
    COMMIT;
END manejar_deposito;
/

CREATE OR REPLACE PROCEDURE registrar_retiro (
    p_numero_cuenta IN VARCHAR2,
    p_monto IN NUMBER,
    p_id_sucursal_agencia IN NUMBER
) AS
BEGIN
   UPDATE bovedas
    SET fondos_disponibles = fondos_disponibles - p_monto
    WHERE id_agencia_sucursal= p_id_sucursal_agencia;

    -- Actualiza el saldo de la cuenta
    UPDATE CUENTAS
    SET SALDO = SALDO - p_monto
    WHERE NUMERO_DE_CUENTA = p_numero_cuenta;

    INSERT INTO transacciones (id,id_cliente, numero_de_cuenta_origen, id_tipo_transaccion, monto, fecha, descripcion, id_sucursal_agencia)
    VALUES (seq_transacciones.NEXTVAL,(SELECT id_cliente FROM cuentas WHERE numero_de_cuenta = p_numero_cuenta), p_numero_cuenta, 2, p_monto, SYSTIMESTAMP, 'Retiro', p_id_sucursal_agencia);

    COMMIT;
END registrar_retiro;
/


CREATE OR REPLACE PROCEDURE manejar_transferencia_inter (
    p_id_sucursal_origen IN NUMBER,
    p_id_sucursal_destino IN NUMBER,
    p_numero_cuenta_origen IN VARCHAR2,
    p_numero_cuenta_destino IN VARCHAR2,
    p_monto IN NUMBER
) AS
BEGIN
    -- Verifica que haya suficiente saldo en la sucursal origen
    DECLARE
        v_fondos_disponibles NUMBER;
    BEGIN
        SELECT FONDOS_DISPONIBLES INTO v_fondos_disponibles FROM BOVEDAS WHERE ID_AGENCIA_SUCURSAL = p_id_sucursal_origen;

        IF v_fondos_disponibles >= p_monto THEN
            -- Actualiza el saldo de la sucursal origen
            UPDATE BOVEDAS
            SET FONDOS_DISPONIBLES = FONDOS_DISPONIBLES - p_monto
            WHERE ID_AGENCIA_SUCURSAL = p_id_sucursal_origen;

            UPDATE CUENTAS
            SET SALDO = SALDO - p_monto
            WHERE NUMERO_DE_CUENTA = p_numero_cuenta_origen;

            -- Actualiza el saldo de la sucursal destino
            UPDATE BOVEDAS
            SET FONDOS_DISPONIBLES = FONDOS_DISPONIBLES + p_monto
            WHERE ID_AGENCIA_SUCURSAL = p_id_sucursal_destino;

            UPDATE CUENTAS
            SET SALDO = SALDO + p_monto
            WHERE NUMERO_DE_CUENTA = p_numero_cuenta_destino;

            -- Registra la transacción interbancaria
            INSERT INTO TRANSACCIONES_INTERBANCARIAS (id, ID_SUCURSAL_AGENCIA_ORIGEN, ID_SUCURSAL_AGENCIA_DESTINO, MONTO, FECHA, DESCRIPCION)
            VALUES (seq_transacciones.NEXTVAL,p_id_sucursal_origen, p_id_sucursal_destino, p_monto, SYSTIMESTAMP, 'Transferencia entre sucursales');
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'Fondos insuficientes en la sucursal origen para la transferencia.');
        END IF;
    END;

    COMMIT; -- Asegura que los cambios se persistan
END manejar_transferencia_inter;
/

CREATE OR REPLACE PROCEDURE registrar_cliente_y_cuenta (
    p_nombre          VARCHAR2,
    p_apellido        VARCHAR2,
    p_telefono        VARCHAR2,
    p_numero_de_cuenta VARCHAR2,
    p_id_tipo_de_cuenta NUMBER,
    p_saldo           NUMBER
) AS
    v_cliente_id NUMBER;
BEGIN
    -- Insertar el nuevo cliente en la tabla clientes
    INSERT INTO clientes (id, nombre, apellido, telefono)
    VALUES (seq_clientes.NEXTVAL, p_nombre, p_apellido, p_telefono)
    RETURNING id INTO v_cliente_id;

    -- Insertar la nueva cuenta en la tabla cuentas
    INSERT INTO cuentas (id, numero_de_cuenta, id_tipo_de_cuenta, saldo, id_cliente)
    VALUES (seq_cuentas.NEXTVAL, p_numero_de_cuenta, p_id_tipo_de_cuenta, p_saldo, v_cliente_id);

    COMMIT; -- Confirmar los cambios en la base de datos
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; -- Deshacer cambios en caso de error
        RAISE; -- Re-lanzar la excepción
END;
/

CREATE OR REPLACE PROCEDURE manejar_transferencia (
    p_numero_cuenta_origen IN VARCHAR2,
    p_numero_cuenta_destino IN VARCHAR2,
    p_monto IN NUMBER,
    p_id_sucursal_agencia IN NUMBER
) AS
BEGIN
    -- Verifica que haya suficiente saldo en la cuenta origen
    DECLARE
        v_saldo NUMBER;
    BEGIN
        SELECT SALDO INTO v_saldo FROM CUENTAS WHERE NUMERO_DE_CUENTA = p_numero_cuenta_origen;

        IF v_saldo >= p_monto THEN
            -- Actualiza el saldo de la cuenta origen
            UPDATE CUENTAS
            SET SALDO = SALDO - p_monto
            WHERE NUMERO_DE_CUENTA = p_numero_cuenta_origen;

            -- Actualiza el saldo de la cuenta destino
            UPDATE CUENTAS
            SET SALDO = SALDO + p_monto
            WHERE NUMERO_DE_CUENTA = p_numero_cuenta_destino;

            -- Registra la transacción de transferencia
            INSERT INTO transacciones (id,id_cliente, numero_de_cuenta_origen,NUMERO_DE_CUENTA_DESTINO, id_tipo_transaccion, monto, fecha, descripcion, id_sucursal_agencia)
            VALUES (seq_transacciones.NEXTVAL,(SELECT id FROM cuentas WHERE numero_de_cuenta = p_numero_cuenta_origen), p_numero_cuenta_origen,p_numero_cuenta_destino ,3, p_monto, SYSTIMESTAMP, 'Transaccion Entre sucursales', p_id_sucursal_agencia);

            COMMIT; -- Asegura que los cambios se persistan
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'Fondos insuficientes en la cuenta origen para la transferencia.');
        END IF;
    Exception
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20003, 'Cuenta origen no encontrada');
    END;
END manejar_transferencia;
