CREATE ROLE ingeniero_datos;
CREATE ROLE dba_pr;
CREATE ROLE analista_datos;

SELECT ROLE FROM DBA_ROLES;

-- Asignar permisos a cada rol
GRANT SELECT, INSERT, UPDATE, DELETE ON clientes TO ingeniero_datos;
GRANT SELECT, INSERT, UPDATE, DELETE ON transacciones TO ingeniero_datos;
GRANT SELECT, INSERT ON prestamos TO ingeniero_datos;
-- Permisos adicionales para un DBA, como el control total

GRANT ALL PRIVILEGES TO dba;
-- Permisos de lectura y reportes para analista de datos
GRANT SELECT ON clientes TO analista_datos;
GRANT SELECT ON transacciones TO analista_datos;
GRANT SELECT ON prestamos TO analista_datos;

-- Crear usuarios y asignar roles específicos
CREATE USER Brayan IDENTIFIED BY 1234;
GRANT ingeniero_datos TO usuario_ingeniero;

CREATE USER Brandon IDENTIFIED BY 1234;
GRANT dba_pr TO usuario_dba;

CREATE USER Joab IDENTIFIED BY 1234;
GRANT analista_datos TO usuario_analista;