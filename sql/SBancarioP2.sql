-- Crear tabla Departamentos
CREATE TABLE DEPARTAMENTOS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    DEPARTAMENTO VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_DEPARTAMENTOS PRIMARY KEY (ID)
);

-- Crear tabla Municipios
CREATE TABLE MUNICIPIOS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    MUNICIPIO VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_MUNICIPIOS PRIMARY KEY (ID)
);

-- Crear tabla Codigos_Postales
CREATE TABLE CODIGOS_POSTALES (
    CODIGO NUMBER GENERATED BY DEFAULT AS IDENTITY,
    DIRECCION VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_CODIGOS_POSTALES PRIMARY KEY (CODIGO)
);

-- Crear tabla Roles
CREATE TABLE ROLES (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    ROL VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_ROLES PRIMARY KEY (ID)
);

-- Crear tabla Tipo_de_Sucursales
CREATE TABLE TIPO_DE_SUCURSALES_AGENCIAS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NOMBRE_TIPO VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_TIPO_DE_SUCURSALES PRIMARY KEY (ID)
);

-- Crear tabla TIPO_DE_CUENTAS
CREATE TABLE TIPO_DE_CUENTAS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    TIPO VARCHAR2(50) NOT NULL, -- El campo tipo es necesario
    CONSTRAINT PK_TIPO_DE_CUENTAS PRIMARY KEY (ID)
);

-- Crear tabla Estados_de_Tarjetas
CREATE TABLE ESTADOS_DE_TARJETAS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    ESTADO VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_ESTADOS_DE_TARJETAS PRIMARY KEY (ID)
);

-- Crear tabla Estados_de_Prestamos
CREATE TABLE ESTADOS_DE_PRESTAMOS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    ESTADO VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_ESTADOS_DE_PRESTAMOS PRIMARY KEY (ID)
);

-- Crear tabla Tipos_de_Sueldo
CREATE TABLE TIPOS_DE_SUELDO (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    TIPO VARCHAR2(20) NOT NULL -- Mensual, Quincenal, Semanal, etc.
);

-- Crear tabla Tipos_de_Transacciones
CREATE TABLE TIPOS_DE_TRANSACCIONES (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    TIPO VARCHAR2(50) NOT NULL,
    CONSTRAINT PK_TIPOS_DE_TRANSACCIONES PRIMARY KEY (ID)
);

-- Crear tabla TIPOS_DE_ESTADOS_FINANCIEROS
CREATE TABLE TIPOS_DE_ESTADOS_FINANCIEROS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    TIPO VARCHAR2(50) NOT NULL,
    DESCRIPCION VARCHAR2(255),
    CONSTRAINT CK_TIPO_ESTADO CHECK (TIPO IN ('Solvente', 'Equilibrio', 'Quiebra'))
);

-- Crear tabla Ubicaciones
CREATE TABLE UBICACIONES (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    ID_DEPARTAMENTO NUMBER NOT NULL,
    ID_MUNICIPIO NUMBER NOT NULL,
    ID_CODIGO_POSTAL NUMBER NOT NULL,
    CONSTRAINT PK_UBICACIONES PRIMARY KEY (ID),
    CONSTRAINT FK_UBICACION_DEPARTAMENTO FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES DEPARTAMENTOS(ID),
    CONSTRAINT FK_UBICACION_MUNICIPIO FOREIGN KEY (ID_MUNICIPIO) REFERENCES MUNICIPIOS(ID),
    CONSTRAINT FK_UBICACION_CODIGOPOSTAL FOREIGN KEY (ID_CODIGO_POSTAL) REFERENCES CODIGOS_POSTALES(CODIGO)
);

-- Crear tabla Empleados
CREATE TABLE EMPLEADOS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NOMBRE VARCHAR2(50) NOT NULL,
    APELLIDO VARCHAR2(50) NOT NULL,
    ID_ROL NUMBER NOT NULL,
    ID_DEPARTAMENTO NUMBER NOT NULL,
    SUCURSAL VARCHAR2(100) NOT NULL,
    AGENCIA VARCHAR2(100) NOT NULL,
    TELEFONO VARCHAR2(15) NOT NULL,
    CONSTRAINT PK_EMPLEADOS PRIMARY KEY (ID),
    CONSTRAINT FK_EMPLEADOS_ROLES FOREIGN KEY (ID_ROL) REFERENCES ROLES(ID),
    CONSTRAINT FK_EMPLEADOS_DEPARTAMENTOS FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES DEPARTAMENTOS(ID)
);

-- Crear tabla Sucursales_Agencias
CREATE TABLE SUCURSALES_AGENCIAS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NOMBRE VARCHAR2(100) NOT NULL,
    ID_TIPO NUMBER NOT NULL,
    TELEFONO VARCHAR2(15) NOT NULL,
    ID_UBICACION NUMBER NOT NULL,
    NUM_EMPLEADO NUMBER NOT NULL,
    CAPACIDAD_ALAMCENAMIENTO NUMBER NOT NULL,
    CONSTRAINT PK_SUCURSALES_AGENCIAS PRIMARY KEY (ID),
    CONSTRAINT FK_AGENCIAS_TIPO FOREIGN KEY (ID_TIPO) REFERENCES TIPO_DE_SUCURSALES_AGENCIAS(ID),
    CONSTRAINT FK_AGENCIAS_UBICACION FOREIGN KEY (ID_UBICACION) REFERENCES UBICACIONES(ID)
);

-- Crear tabla CUENTAS
CREATE TABLE CUENTAS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NUMERO_DE_CUENTA VARCHAR2(20) NOT NULL,
    ID_TIPO_DE_CUENTA NUMBER NOT NULL,
    SALDO NUMBER(10, 2) NOT NULL,
    CONSTRAINT PK_CUENTAS PRIMARY KEY (ID),
    CONSTRAINT FK_CUENTAS_TIPO_DE_CUENTAS FOREIGN KEY (ID_TIPO_DE_CUENTA) REFERENCES TIPO_DE_CUENTAS(ID)
);

-- Crear tabla CLIENTES
CREATE TABLE CLIENTES (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    NOMBRE VARCHAR2(50) NOT NULL, -- El nombre es necesario
    APELLIDO VARCHAR2(50) NOT NULL, -- El apellido es necesario
    TELEFONO VARCHAR2(15) NOT NULL, -- El teléfono es necesario
    ID_CUENTA NUMBER NOT NULL,
    CONSTRAINT PK_CLIENTES PRIMARY KEY (ID),
    CONSTRAINT FK_CLIENTES_CUENTAS FOREIGN KEY (ID_CUENTA) REFERENCES CUENTAS(ID)
);

-- Crear tabla Bovedas
CREATE TABLE BOVEDAS (
    ID_BOVEDA NUMBER GENERATED BY DEFAULT AS IDENTITY,
    ID_AGENCIA_SUCURSAL NUMBER NOT NULL,
    FONDOS_DISPONIBLES NUMBER(15, 2) NOT NULL,
    CONSTRAINT PK_BOVEDAS PRIMARY KEY (ID_BOVEDA),
    CONSTRAINT FK_BOVEDAS_SUCURSALES FOREIGN KEY (ID_AGENCIA_SUCURSAL) REFERENCES SUCURSALES_AGENCIAS(ID)
);

-- Crear tabla Tarjetas_de_Credito
CREATE TABLE TARJETAS_DE_CREDITO (
    ID_TARJETA NUMBER GENERATED BY DEFAULT AS IDENTITY,
    ID_CLIENTE NUMBER NOT NULL,
    NUMERO_DE_TARJETA VARCHAR2(20) NOT NULL,
    LIMITE_DE_CREDITO NUMBER(10, 2) NOT NULL,
    SALDO_ACTUAL NUMBER(10, 2) NOT NULL,
    FECHA_DE_EMISION DATE NOT NULL,
    FECHA_DE_EXPIRACION DATE NOT NULL,
    ID_ESTADO NUMBER NOT NULL,
    FECHA_DE_CORTE DATE NOT NULL,
    DÍA_DEL_CICLO NUMBER NOT NULL,
    CONSTRAINT PK_TARJETAS_DE_CREDITO PRIMARY KEY (ID_TARJETA),
    CONSTRAINT FK_TARJETA_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES ESTADOS_DE_TARJETAS(ID),
    CONSTRAINT FK_TARJETA_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID)
);

-- Crear tabla Prestamos
CREATE TABLE PRESTAMOS (
    ID_PRESTAMO NUMBER GENERATED BY DEFAULT AS IDENTITY,
    ID_CLIENTE NUMBER NOT NULL,
    MONTO_DEL_PRESTAMO NUMBER(10, 2) NOT NULL,
    TASA_DE_INTERES NUMBER(5, 2) NOT NULL,
    FECHA_DE_DESEMBOLSO DATE NOT NULL,
    FECHA_DE_VENCIMIENTO DATE NOT NULL,
    SALDO_PENDIENTE NUMBER(10, 2) NOT NULL,
    ID_ESTADO NUMBER NOT NULL,
    CONSTRAINT PK_PRESTAMOS PRIMARY KEY (ID_PRESTAMO),
    CONSTRAINT FK_PRESTAMO_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES ESTADOS_DE_PRESTAMOS(ID),
    CONSTRAINT FK_PRESTAMO_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID)
);

-- Crear tabla Transacciones
CREATE TABLE TRANSACCIONES (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    ID_CLIENTE NUMBER NOT NULL,
    NUMERO_DE_CUENTA_ORIGEN VARCHAR2(20) NOT NULL,
    NUMERO_DE_CUENTA_DESTINO VARCHAR2(20),
    ID_TIPO_TRANSACCION NUMBER NOT NULL,
    MONTO NUMBER(10, 2) NOT NULL,
    FECHA DATE NOT NULL,
    HORA TIMESTAMP NOT NULL,
    DESCRIPCION VARCHAR2(255),
    SUCURSAL VARCHAR2(255),
    AGENCIA VARCHAR2(255),
    ID_SUCURSAL_AGENCIA NUMBER NOT NULL,
    CONSTRAINT PK_TRANSACCIONES PRIMARY KEY (ID),
    CONSTRAINT FK_TRANSACCIONES_TIPO FOREIGN KEY (ID_TIPO_TRANSACCION) REFERENCES TIPOS_DE_TRANSACCIONES(ID),
    CONSTRAINT FK_TRANSACCIONES_CLIENTES FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID),
    CONSTRAINT FK_TRANSACCIONES_SUCURSALAGENCIA FOREIGN KEY (ID_SUCURSAL_AGENCIA) REFERENCES SUCURSALES_AGENCIAS(ID)
); 

-- Crear tabla Transacciones_Interbancarias
CREATE TABLE TRANSACCIONES_INTERBANCARIAS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    ID_SUCURSAL_AGENCIA_ORIGEN NUMBER NOT NULL,
    ID_SUCURSAL_AGENCIA_DESTINO NUMBER NOT NULL,
    MONTO NUMBER(15, 2) NOT NULL,
    FECHA_HORA TIMESTAMP NOT NULL,  
    DESCRIPCION VARCHAR2(255),
    
    -- Claves foráneas
    CONSTRAINT FK_TRANSACCIONES_INTERBANCARIAS_ORIGEN FOREIGN KEY (ID_SUCURSAL_AGENCIA_ORIGEN) 
        REFERENCES SUCURSALES_AGENCIAS(ID),
    CONSTRAINT FK_TRANSACCIONES_INTERBANCARIAS_DESTINO FOREIGN KEY (ID_SUCURSAL_AGENCIA_DESTINO)  
        REFERENCES SUCURSALES_AGENCIAS(ID),

    -- Restricciones adicionales
    CONSTRAINT CK_MONTO_POSITIVO CHECK (MONTO > 0),  -- Asegura que el monto sea positivo
    CONSTRAINT CK_ORIGEN_DESTINO_DIFERENTE CHECK (ID_SUCURSAL_AGENCIA_ORIGEN <> ID_SUCURSAL_AGENCIA_DESTINO)  -- Evita que origen y destino sean iguales
);

-- Crear tabla ESTADOS_FINANCIEROS
CREATE TABLE ESTADOS_FINANCIEROS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    FECHA DATE NOT NULL,
    INGRESO NUMBER(15, 2) NOT NULL,
    GASTOS NUMBER(15, 2) NOT NULL,
    ID_TIPO_ESTADO NUMBER NOT NULL,
    ID_SUCURSAL_AGENCIA NUMBER NOT NULL,

    -- Claves foráneas
    CONSTRAINT FK_ESTADO_FINANCIERO_TIPO_ESTADO FOREIGN KEY (ID_TIPO_ESTADO) REFERENCES TIPOS_DE_ESTADOS_FINANCIEROS(ID),
    CONSTRAINT FK_ESTADO_FINANCIERO_SUCURSALAGENCIA FOREIGN KEY (ID_SUCURSAL_AGENCIA) REFERENCES SUCURSALES_AGENCIAS(ID),
    
    -- Restricciones adicionales
    CONSTRAINT CK_INGRESOS_POSITIVOS CHECK (INGRESO >= 0),  -- Asegura que los INGRESO sean positivos o cero
    CONSTRAINT CK_GASTOS_POSITIVOS CHECK (GASTOS >= 0)  -- Asegura que los gastos sean positivos o cero
);

-- Crear tabla Sueldos
CREATE TABLE SUELDOS (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    ID_EMPLEADO NUMBER NOT NULL,
    SUELDO NUMBER(10, 2) NOT NULL,
    FECHA_INICIO DATE NOT NULL,
    FECHA_FIN DATE,
    ID_TIPO_SUELDO NUMBER NOT NULL,
    BONOS NUMBER(10, 2),
    DEDUCCIONES NUMBER(10, 2),
    NOTAS VARCHAR2(255),
    CONSTRAINT FK_SUELDOS_EMPLEADOS FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADOS(ID),
    CONSTRAINT FK_SUELDOS_TIPO_SUELDO FOREIGN KEY (ID_TIPO_SUELDO) REFERENCES TIPOS_DE_SUELDO(ID)
);