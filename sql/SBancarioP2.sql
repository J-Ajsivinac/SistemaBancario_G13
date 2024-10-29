--
-- Crear secuencias para las tablas
--

-- Secuencia para Departamentos
CREATE SEQUENCE seq_departamentos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_municipios START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_codigos_postales START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_roles START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tipo_de_sucursales START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tipo_de_cuentas START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_estados_de_tarjetas START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_estados_de_prestamos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tipos_de_sueldo START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tipos_de_transacciones START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tipos_de_estados_financieros START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_ubicaciones START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_empleados START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_sucursales_agencias START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_cuentas START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_clientes START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_bovedas START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tarjetas_de_credito START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_prestamos START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_transacciones START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_transacciones_interbancarias START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_estados_financieros START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_sueldos START WITH 1 INCREMENT BY 1;

-- Crear tabla Departamentos
CREATE TABLE departamentos (
    id NUMBER NOT NULL PRIMARY KEY,
    departamento VARCHAR2(50) NOT NULL
);

-- Crear tabla Municipios
CREATE TABLE municipios (
    id NUMBER NOT NULL PRIMARY KEY,
    municipio VARCHAR2(50) NOT NULL,
    id_departamento NUMBER NOT NULL,
    CONSTRAINT fk_municipio_departamento FOREIGN KEY (id_departamento) REFERENCES departamentos(id)
);

-- Crear tabla Codigos_Postales
CREATE TABLE codigos_postales (
    codigo NUMBER NOT NULL PRIMARY KEY,
    direccion VARCHAR2(50) NOT NULL
);

-- Crear tabla Roles
CREATE TABLE roles (
    id NUMBER NOT NULL PRIMARY KEY,
    rol VARCHAR2(50) NOT NULL
);

-- Crear tabla Tipo_de_Sucursales
CREATE TABLE tipo_de_sucursales_agencias (
    id NUMBER NOT NULL PRIMARY KEY,
    nombre_tipo VARCHAR2(50) NOT NULL
);

-- Crear tabla Tipo_de_Cuentas
CREATE TABLE tipo_de_cuentas (
    id NUMBER NOT NULL PRIMARY KEY,
    tipo VARCHAR2(50) NOT NULL
);

-- Crear tabla Estados_de_Tarjetas
CREATE TABLE estados_de_tarjetas (
    id NUMBER NOT NULL PRIMARY KEY,
    estado VARCHAR2(50) NOT NULL
);

-- Crear tabla Estados_de_Prestamos
CREATE TABLE estados_de_prestamos (
    id NUMBER NOT NULL PRIMARY KEY,
    estado VARCHAR2(50) NOT NULL
);

-- Crear tabla Tipos_de_Sueldo
CREATE TABLE tipos_de_sueldo (
    id NUMBER NOT NULL PRIMARY KEY,
    tipo VARCHAR2(20) NOT NULL
);

-- Crear tabla Tipos_de_Transacciones
CREATE TABLE tipos_de_transacciones (
    id NUMBER NOT NULL PRIMARY KEY,
    tipo VARCHAR2(50) NOT NULL
);

-- Crear tabla Tipos_de_Estados_Financieros
CREATE TABLE tipos_de_estados_financieros (
    id NUMBER NOT NULL PRIMARY KEY,
    tipo VARCHAR2(50) NOT NULL,
    descripcion VARCHAR2(255),
    CONSTRAINT ck_tipo_estado CHECK (tipo IN ('Solvente', 'Equilibrio', 'Quiebra'))
);

-- Crear tabla Ubicaciones
CREATE TABLE ubicaciones (
    id NUMBER NOT NULL PRIMARY KEY,
    id_departamento NUMBER NOT NULL,
    id_municipio NUMBER NOT NULL,
    id_codigo_postal NUMBER NOT NULL,
    CONSTRAINT fk_ubicacion_departamento FOREIGN KEY (id_departamento) REFERENCES departamentos(id),
    CONSTRAINT fk_ubicacion_municipio FOREIGN KEY (id_municipio) REFERENCES municipios(id),
    CONSTRAINT fk_ubicacion_codigopostal FOREIGN KEY (id_codigo_postal) REFERENCES codigos_postales(codigo)
);


-- Crear tabla Sucursales_Agencias
CREATE TABLE sucursales_agencias (
    id NUMBER NOT NULL PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    id_tipo NUMBER NOT NULL,
    telefono VARCHAR2(15) NOT NULL,
    id_ubicacion NUMBER NOT NULL,
    CONSTRAINT fk_agencias_tipo FOREIGN KEY (id_tipo) REFERENCES tipo_de_sucursales_agencias(id),
    CONSTRAINT fk_agencias_ubicacion FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones(id)
);

-- Crear tabla Clientes
CREATE TABLE clientes (
    id NUMBER NOT NULL PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    apellido VARCHAR2(50) NOT NULL,
    telefono VARCHAR2(15) NOT NULL
);

-- Crear tabla Cuentas
CREATE TABLE cuentas (
    id NUMBER NOT NULL PRIMARY KEY,
    numero_de_cuenta VARCHAR2(20) NOT NULL UNIQUE,
    id_tipo_de_cuenta NUMBER NOT NULL,
    saldo NUMBER(10, 2) NOT NULL,
    id_cliente NUMBER NOT NULL,
    CONSTRAINT fk_cuentas_tipo_de_cuentas FOREIGN KEY (id_tipo_de_cuenta) REFERENCES tipo_de_cuentas(id),
    CONSTRAINT fk_cuentas_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Crear tabla Empleados
CREATE TABLE empleados (
    id NUMBER NOT NULL PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    apellido VARCHAR2(50) NOT NULL,
    id_rol NUMBER NOT NULL,
    id_departamento NUMBER NOT NULL,
    id_sucursal NUMBER NOT NULL,
    telefono VARCHAR2(15) NOT NULL,
    CONSTRAINT fk_empleados_roles FOREIGN KEY (id_rol) REFERENCES roles(id),
    CONSTRAINT fk_empleados_departamentos FOREIGN KEY (id_departamento) REFERENCES departamentos(id),
    CONSTRAINT fk_empleados_sucursales FOREIGN KEY (id_sucursal) REFERENCES sucursales_agencias(id)
);

-- Crear tabla Bóvedas
CREATE TABLE bovedas (
    id_boveda NUMBER NOT NULL PRIMARY KEY,
    id_agencia_sucursal NUMBER NOT NULL,
    fondos_disponibles NUMBER(15, 2) NOT NULL,
    CONSTRAINT fk_bovedas_sucursales FOREIGN KEY (id_agencia_sucursal) REFERENCES sucursales_agencias(id)
);

-- Crear tabla Tarjetas_de_Crédito
CREATE TABLE tarjetas_de_credito (
    id_tarjeta NUMBER NOT NULL PRIMARY KEY,
    id_cliente NUMBER NOT NULL,
    numero_de_tarjeta VARCHAR2(20) NOT NULL,
    limite_de_credito NUMBER(10, 2) NOT NULL,
    saldo_actual NUMBER(10, 2) NOT NULL,
    fecha_de_emision DATE NOT NULL,
    fecha_de_expiracion DATE NOT NULL,
    id_estado NUMBER NOT NULL,
    fecha_de_corte DATE NOT NULL,
    dia_del_ciclo NUMBER NOT NULL,
    CONSTRAINT fk_tarjeta_estado FOREIGN KEY (id_estado) REFERENCES estados_de_tarjetas(id),
    CONSTRAINT fk_tarjeta_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Crear tabla Préstamos
CREATE TABLE prestamos (
    id_prestamo NUMBER NOT NULL PRIMARY KEY,
    id_cliente NUMBER NOT NULL,
    monto_del_prestamo NUMBER(10, 2) NOT NULL,
    tasa_de_interes NUMBER(5, 2) NOT NULL,
    fecha_de_desembolso DATE NOT NULL,
    fecha_de_vencimiento DATE NOT NULL,
    saldo_pendiente NUMBER(10, 2) NOT NULL,
    id_estado NUMBER NOT NULL,
    CONSTRAINT fk_prestamo_estado FOREIGN KEY (id_estado) REFERENCES estados_de_prestamos(id),
    CONSTRAINT fk_prestamo_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

-- Crear tabla Transacciones
CREATE TABLE transacciones (
    id NUMBER NOT NULL PRIMARY KEY,
    id_cliente NUMBER NOT NULL,
    numero_de_cuenta_origen VARCHAR2(20) NOT NULL,
    numero_de_cuenta_destino VARCHAR2(20),
    id_tipo_transaccion NUMBER NOT NULL,
    monto NUMBER(10, 2) NOT NULL,
    fecha TIMESTAMP NOT NULL,
    descripcion VARCHAR2(255),
    id_sucursal_agencia NUMBER NOT NULL,
    CONSTRAINT fk_transacciones_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    CONSTRAINT fk_transacciones_tipos FOREIGN KEY (id_tipo_transaccion) REFERENCES tipos_de_transacciones(id),
    CONSTRAINT fk_transacciones_sucursalagencia FOREIGN KEY (id_sucursal_agencia) REFERENCES sucursales_agencias(id)
);

-- Crear tabla Transacciones_Interbancarias
CREATE TABLE transacciones_interbancarias (
    id NUMBER NOT NULL PRIMARY KEY,
    id_sucursal_agencia_origen NUMBER NOT NULL,
    id_sucursal_agencia_destino NUMBER NOT NULL,
    monto NUMBER(15, 2) NOT NULL,
    fecha TIMESTAMP NOT NULL,
    descripcion VARCHAR2(255),

    -- Claves foráneas
    CONSTRAINT fk_transacciones_interbancarias_origen FOREIGN KEY (id_sucursal_agencia_origen)
        REFERENCES sucursales_agencias(id),
    CONSTRAINT fk_transacciones_interbancarias_destino FOREIGN KEY (id_sucursal_agencia_destino)
        REFERENCES sucursales_agencias(id),

    -- Restricciones adicionales
    CONSTRAINT ck_monto_positivo CHECK (monto > 0),  -- Asegura que el monto sea positivo
    CONSTRAINT ck_origen_destino_diferente CHECK (id_sucursal_agencia_origen <> id_sucursal_agencia_destino)  -- Evita que origen y destino sean iguales
);

-- Crear tabla Estados_Financieros
CREATE TABLE estados_financieros (
    id NUMBER NOT NULL PRIMARY KEY,
    id_sucursal_agencia NUMBER NOT NULL,
    monto_activo NUMBER(15, 2) NOT NULL,
    monto_pasivo NUMBER(15, 2) NOT NULL,
    saldo_total NUMBER(15, 2) NOT NULL,
    fecha DATE NOT NULL,
    id_tipo_estado NUMBER NOT NULL,
    CONSTRAINT fk_estado_tipo FOREIGN KEY (id_tipo_estado) REFERENCES tipos_de_estados_financieros(id),
    CONSTRAINT fk_estado_sucursal FOREIGN KEY (id_sucursal_agencia) REFERENCES sucursales_agencias(id)
);

-- Crear tabla Sueldos
CREATE TABLE sueldos (
    id NUMBER NOT NULL PRIMARY KEY,
    id_empleado NUMBER,
    sueldo NUMBER(10, 2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    id_tipo_sueldo NUMBER NOT NULL,
    bonos NUMBER(10, 2),
    deducciones NUMBER(10, 2),
    notas VARCHAR2(255),
    CONSTRAINT fk_sueldos_empleados FOREIGN KEY (id_empleado) REFERENCES empleados(id),
    CONSTRAINT fk_sueldos_tipo_sueldo FOREIGN KEY (id_tipo_sueldo) REFERENCES tipos_de_sueldo(id)
);
