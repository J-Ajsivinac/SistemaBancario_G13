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