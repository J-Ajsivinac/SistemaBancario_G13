CREATE OR REPLACE TRIGGER actualizar_saldo_pendiente_prestamo
AFTER INSERT OR UPDATE ON PRESTAMOS
FOR EACH ROW
BEGIN
    -- Actualizar el saldo pendiente (se puede ajustar según la lógica del negocio)
    UPDATE PRESTAMOS
    SET SALDO_PENDIENTE = SALDO_PENDIENTE - :NEW.MONTO_DEL_PRESTAMO
    WHERE ID_PRESTAMO = :NEW.ID_PRESTAMO;
END;
/

CREATE OR REPLACE TRIGGER actualizar_saldo_pago_tarjeta_credito
AFTER INSERT ON TRANSACCIONES
FOR EACH ROW
BEGIN
    -- Verifica si es un pago de tarjeta de crédito
    IF :NEW.ID_TIPO_TRANSACCION = (SELECT ID FROM TIPOS_DE_TRANSACCIONES WHERE TIPO = 'Pago Tarjeta de Crédito') THEN
        UPDATE TARJETAS_DE_CREDITO
        SET SALDO_ACTUAL = SALDO_ACTUAL - :NEW.MONTO
        WHERE NUMERO_DE_TARJETA = (SELECT NUMERO_DE_TARJETA FROM TARJETAS_DE_CREDITO WHERE ID_CLIENTE = :NEW.ID_CLIENTE);
    END IF;
END;
/

CREATE OR REPLACE TRIGGER actualizar_saldo_tarjeta_credito
AFTER UPDATE ON TARJETAS_DE_CREDITO
FOR EACH ROW
BEGIN
    -- Actualizar el saldo de la tarjeta de crédito
    UPDATE TARJETAS_DE_CREDITO
    SET SALDO_ACTUAL = SALDO_ACTUAL + :NEW.LIMITE_DE_CREDITO
    WHERE ID_TARJETA = :NEW.ID_TARJETA;
END;
/

CREATE OR REPLACE TRIGGER actualizar_saldo_tarjeta_credito_uso
AFTER INSERT ON TRANSACCIONES
FOR EACH ROW
BEGIN
    -- Verifica si es un uso de tarjeta de crédito
    IF :NEW.ID_TIPO_TRANSACCION = (SELECT ID FROM TIPOS_DE_TRANSACCIONES WHERE TIPO = 'Uso Tarjeta de Crédito') THEN
        UPDATE TARJETAS_DE_CREDITO
        SET SALDO_ACTUAL = SALDO_ACTUAL + :NEW.MONTO
        WHERE NUMERO_DE_TARJETA = (SELECT NUMERO_DE_TARJETA FROM TARJETAS_DE_CREDITO WHERE ID_CLIENTE = :NEW.ID_CLIENTE);
    END IF;
END;
/

CREATE OR REPLACE PROCEDURE manejar_deposito (
    p_numero_de_cuenta IN VARCHAR2,
    p_monto IN NUMBER
) AS
BEGIN
    -- Actualiza el saldo de la cuenta
    UPDATE CUENTAS
    SET SALDO = SALDO + p_monto
    WHERE NUMERO_DE_CUENTA = p_numero_de_cuenta;

    -- Registra la transacción
    INSERT INTO TRANSACCIONES (NUMERO_DE_CUENTA_ORIGEN, MONTO, FECHA, HORA, DESCRIPCION)
    VALUES (p_numero_de_cuenta, p_monto, SYSDATE, SYSTIMESTAMP, 'Depósito');
    
    COMMIT; -- Asegura que los cambios se persistan
END manejar_deposito;
/


CREATE OR REPLACE PROCEDURE manejar_transferencia (
    p_id_sucursal_origen IN NUMBER,
    p_id_sucursal_destino IN NUMBER,
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

            -- Actualiza el saldo de la sucursal destino
            UPDATE BOVEDAS
            SET FONDOS_DISPONIBLES = FONDOS_DISPONIBLES + p_monto
            WHERE ID_AGENCIA_SUCURSAL = p_id_sucursal_destino;

            -- Registra la transacción interbancaria
            INSERT INTO TRANSACCIONES_INTERBANCARIAS (ID_SUCURSAL_AGENCIA_ORIGEN, ID_SUCURSAL_AGENCIA_DESTINO, MONTO, FECHA_HORA, DESCRIPCION)
            VALUES (p_id_sucursal_origen, p_id_sucursal_destino, p_monto, SYSTIMESTAMP, 'Transferencia entre sucursales');
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'Fondos insuficientes en la sucursal origen para la transferencia.');
        END IF;
    END;

    COMMIT; -- Asegura que los cambios se persistan
END manejar_transferencia;
/
