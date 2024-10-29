WITH Activos AS (
    SELECT
        (SELECT SUM(SALDO) FROM CUENTAS) AS TotalCuentas,
        (SELECT SUM(MONTO_DEL_PRESTAMO) FROM PRESTAMOS) AS TotalPrestamos,
        (SELECT SUM(monto_activo) FROM ESTADOS_FINANCIEROS) AS TotalIngresos
    FROM DUAL
), Pasivos AS (
    SELECT
        (SELECT SUM(MONTO_PASIVO) FROM ESTADOS_FINANCIEROS) AS TotalGastos,
        (SELECT SUM(SUELDO + NVL(BONOS, 0) - NVL( DEDUCCIONES, 0)) FROM SUELDOS) AS TotalSueldos,
        (SELECT SUM(MONTO_DEL_PRESTAMO) FROM PRESTAMOS WHERE ID_ESTADO = (SELECT ID FROM ESTADOS_DE_PRESTAMOS WHERE ESTADO = 'Rechazado')) AS TotalDeudas
    FROM DUAL
)
SELECT CASE
        WHEN (A.TotalCuentas + A.TotalPrestamos + A.TotalIngresos) >= (P.TotalGastos + P.TotalSueldos + P.TotalDeudas) THEN 'Equilibrio'
        WHEN (A.TotalCuentas + A.TotalPrestamos + A.TotalIngresos) < (P.TotalGastos + P.TotalSueldos + P.TotalDeudas) THEN 'Quiebra'
    END AS EstadoFinanciero
FROM Activos A, Pasivos P;

WITH TransaccionesDiarias AS (
    SELECT ID_SUCURSAL_AGENCIA, SUM(MONTO) AS TotalTransacciones
    FROM TRANSACCIONES
    GROUP BY ID_SUCURSAL_AGENCIA
), DemandaLocal AS (
    SELECT ID_SUCURSAL_AGENCIA, COUNT(*) AS NumeroTransacciones
    FROM TRANSACCIONES
    GROUP BY ID_SUCURSAL_AGENCIA
)
SELECT T.ID_SUCURSAL_AGENCIA, SA.NOMBRE,
       (T.TotalTransacciones + D.NumeroTransacciones * 100) AS EfectivoAEnviar
FROM TransaccionesDiarias T
JOIN DemandaLocal D ON T.ID_SUCURSAL_AGENCIA = D.ID_SUCURSAL_AGENCIA
JOIN SUCURSALES_AGENCIAS SA ON T.ID_SUCURSAL_AGENCIA = SA.ID;


WITH TotalDepositos AS (
    SELECT SUM(SALDO) AS TotalDepositos
    FROM CUENTAS
), RegulacionesSIB AS (
    SELECT 0.1 AS PorcentajeMinimo -- Ejemplo: 10% de liquidez mínima requerida
    FROM DUAL
)
SELECT TotalDepositos * PorcentajeMinimo AS DineroEnBovedaCentral
FROM TotalDepositos, RegulacionesSIB;