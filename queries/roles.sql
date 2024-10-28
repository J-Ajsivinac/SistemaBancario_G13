CREATE ROLE ingeniero_datos;
CREATE ROLE dba;
CREATE ROLE analista_datos;

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
CREATE USER usuario_ingeniero IDENTIFIED BY ingeniero_pass;
GRANT ingeniero_datos TO usuario_ingeniero;

CREATE USER usuario_dba IDENTIFIED BY dba_pass;
GRANT dba TO usuario_dba;

CREATE USER usuario_analista IDENTIFIED BY analista_pass;
GRANT analista_datos TO usuario_analista;