import cx_Oracle

dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='xe')
connection = cx_Oracle.connect(user='C##Jeff', password='root', dsn=dsn_tns)

departamentos = [
    "Alta Verapaz", "Baja Verapaz", "Chimaltenango", "Chiquimula", 
    "El Progreso", "Escuintla", "Guatemala", "Huehuetenango", 
    "Izabal", "Jalapa", "Jutiapa", "Petén", "Quetzaltenango", 
    "Quiché", "Retalhuleu", "Sacatepéquez", "San Marcos", 
    "Santa Rosa", "Sololá", "Suchitepéquez", "Totonicapán", "Zacapa"
]

deptos_municipios = [
    (1, "Alta Verapaz", ["Chahal", "Chisec", "Cobán", "Fray Bartolomé de las Casas", "Lanquín", "Panzós", "Raxruhá", "San Cristóbal Verapaz", "San Juan Chamelco", "San Pedro Carchá", "Santa Catalina La Tinta", "Santa Cruz Verapaz", "Senahú", "Tactic", "Tamahú", "Tucurú"]),
    (2, "Baja Verapaz", ["Cubulco", "Granados", "Purulhá", "Rabinal", "Salamá", "San Jerónimo", "San Miguel Chicaj", "Santa Cruz El Chol"]),
    (3, "Chimaltenango", ["Acatenango", "Chimaltenango", "El Tejar", "Parramos", "Patzicía", "Patzún", "Pochuta", "San Andrés Itzapa", "San José Poaquil", "San Juan Comalapa", "San Martín Jilotepeque", "Santa Apolonia", "Tecpán Guatemala", "Yepocapa", "Zaragoza"]),
    (4, "Chiquimula", ["Camotán", "Chiquimula", "Concepción Las Minas", "Esquipulas", "Ipala", "Jocotán", "Olopa", "Quezaltepeque", "San Jacinto", "San José La Arada"]),
    (5, "El Progreso", ["El Jícaro", "Guastatoya", "Morazán", "San Agustín Acasaguastlán", "San Antonio La Paz", "San Cristóbal Acasaguastlán", "Sanarate"]),
    (6, "Escuintla", ["Escuintla", "Guanagazapa", "Iztapa", "La Democracia", "La Gomera", "Masagua", "Nueva Concepción", "Palín", "San José", "Santa Lucía Cotzumalguapa", "Siquinalá", "Tiquisate"]),
    (7, "Guatemala", ["Amatitlán", "Chinautla", "Chuarrancho", "Fraijanes", "Guatemala", "Mixco", "Palencia", "San José del Golfo", "San José Pinula", "San Juan Sacatepéquez", "San Miguel Petapa", "San Pedro Ayampuc", "San Pedro Sacatepéquez", "San Raymundo", "Santa Catarina Pinula", "Villa Canales", "Villa Nueva"]),
    (8, "Huehuetenango", ["Aguacatán", "Chiantla", "Colotenango", "Concepción Huista", "Cuilco", "Huehuetenango", "Jacaltenango", "La Democracia", "La Libertad", "Malacatancito", "Nentón", "San Antonio Huista", "San Gaspar Ixchil", "San Ildefonso Ixtahuacán", "San Juan Atitán", "San Juan Ixcoy", "San Mateo Ixtatán", "San Miguel Acatán", "San Pedro Necta", "San Rafael La Independencia", "San Rafael Petzal", "San Sebastián Coatán", "San Sebastián Huehuetenango", "Santa Ana Huista", "Santa Bárbara", "Santa Cruz Barillas", "Santa Eulalia", "Santiago Chimaltenango", "Soloma", "Tectitán", "Todos Santos Cuchumatán", "Unión Cantinil"]),
    (9, "Izabal", ["El Estor", "Livingston", "Los Amates", "Morales", "Puerto Barrios"]),
    (10, "Jalapa", ["Jalapa", "Mataquescuintla", "Monjas", "San Carlos Alzatate", "San Luis Jilotepeque", "San Manuel Chaparrón"]),
    (11, "Jutiapa", ["Agua Blanca", "Asunción Mita", "Atescatempa", "Comapa", "Conguaco", "El Adelanto", "El Progreso", "Jalpatagua", "Jerez", "Jutiapa", "Moyuta", "Pasaco", "Quesada", "San José Acatempa", "Santa Catarina Mita", "Yupiltepeque", "Zapotitlán"]),
    (12, "Petén", ["Dolores", "Flores", "La Libertad", "Melchor de Mencos", "Poptún", "San Andrés", "San Benito", "San Francisco", "San José", "San Luis", "Santa Ana", "Sayaxché"]),
    (13, "Quetzaltenango", ["Almolonga", "Cabricán", "Cajolá", "Cantel", "Coatepeque", "Colomba", "Concepción Chiquirichapa", "El Palmar", "Flores Costa Cuca", "Génova", "Huitán", "La Esperanza", "Olintepeque", "Quetzaltenango", "Salcajá", "San Carlos Sija", "San Francisco La Unión", "San Juan Ostuncalco", "San Martín Sacatepéquez", "San Mateo", "San Miguel Sigüilá", "Sibilia", "Zunil"]),
    (14, "Quiché", ["Canillá", "Chajul", "Chicamán", "Chiché", "Chichicastenango", "Chinique", "Cunén", "Ixcán", "Joyabaj", "Nebaj", "Pachalum", "Patzité", "Sacapulas", "San Andrés Sajcabajá", "San Antonio Ilotenango", "San Bartolomé Jocotenango", "San Juan Cotzal", "San Pedro Jocopilas", "Santa Cruz del Quiché", "Uspantán", "Zacualpa"]),
    (15, "Retalhuleu", ["Champerico", "El Asintal", "Nuevo San Carlos", "Retalhuleu", "San Andrés Villa Seca", "San Felipe", "San Martín Zapotitlán", "San Sebastián"]),
    (16, "Sacatepéquez", ["Alotenango", "Antigua Guatemala", "Ciudad Vieja", "Jocotenango", "Magdalena Milpas Altas", "Pastores", "San Antonio Aguas Calientes", "San Bartolomé Milpas Altas", "San Lucas Sacatepéquez", "San Miguel Dueñas", "Santa Catarina Barahona", "Santa Lucía Milpas Altas", "Santa María de Jesús", "Santiago Sacatepéquez", "Santo Domingo Xenacoj", "Sumpango"]),
    (17, "San Marcos", ["Ayutla", "Catarina", "Comitancillo", "Concepción Tutuapa", "El Quetzal", "El Rodeo", "El Tumbador", "Esquipulas Palo Gordo", "Ixchiguán", "La Blanca", "La Reforma", "Malacatán", "Nuevo Progreso", "Ocos", "Pajapita", "Río Blanco", "San Antonio Sacatepéquez", "San Cristóbal Cucho", "San José El Rodeo", "San Lorenzo", "San Marcos", "San Miguel Ixtahuacán", "San Pablo", "San Pedro Sacatepéquez", "San Rafael Pie de La Cuesta", "Sibinal", "Sipacapa", "Tacaná", "Tajumulco", "Tejutla"]),
    (18, "Santa Rosa", ["Barberena", "Casillas", "Chiquimulilla", "Cuilapa", "Guazacapán", "Nueva Santa Rosa", "Oratorio", "Pueblo Nuevo Viñas", "San Juan Tecuaco", "San Rafael Las Flores", "Santa Cruz Naranjo", "Santa María Ixhuatán", "Santa Rosa de Lima", "Taxisco"]),
    (19, "Sololá", ["Concepción", "Nahualá", "Panajachel", "San Andrés Semetabaj", "San Antonio Palopó", "San José Chacayá", "San Juan La Laguna", "San Lucas Tolimán", "San Marcos La Laguna", "San Pablo La Laguna", "San Pedro La Laguna", "Santa Catarina Ixtahuacán", "Santa Catarina Palopó", "Santa Clara La Laguna", "Santa Cruz La Laguna", "Santa Lucía Utatlán", "Santa María Visitación", "Santiago Atitlán", "Sololá"]),
    (20, "Suchitepéquez", ["Chicacao", "Cuyotenango", "Mazatenango", "Patulul", "Pueblo Nuevo", "Río Bravo", "Samayac", "San Antonio Suchitepéquez", "San Bernardino", "San Francisco Zapotitlán", "San Gabriel", "San José El Idolo", "San Juan Bautista", "San Lorenzo", "San Miguel Panán", "San Pablo Jocopilas", "Santa Bárbara", "Santo Domingo Suchitepéquez", "Santo Tomás La Unión", "Zunilito"]),
    (21, "Totonicapán", ["Momostenango", "San Andrés Xecul", "San Bartolo", "San Cristóbal Totonicapán", "San Francisco El Alto", "Santa Lucía La Reforma", "Santa María Chiquimula", "Totonicapán"]),
    (22, "Zacapa", ["Cabañas", "Estanzuela", "Gualán", "Huité", "La Unión", "Río Hondo", "San Diego", "San Jorge", "Teculután", "Usumatlán", "Zacapa"])
]

codigos_postales = [
    [1001, "Ciudad de Guatemala, Zona 1"],
    [1002, "Ciudad de Guatemala, Zona 2"],
    [1003, "Ciudad de Guatemala, Zona 3"],
    [1004, "Ciudad de Guatemala, Zona 4"],
    [1005, "Ciudad de Guatemala, Zona 5"],
    [1006, "Ciudad de Guatemala, Zona 6"],
    [1007, "Ciudad de Guatemala, Zona 7"],
    [1008, "Ciudad de Guatemala, Zona 8"],
    [1009, "Ciudad de Guatemala, Zona 9"],
    [1010, "Ciudad de Guatemala, Zona 10"],
    [1011, "Ciudad de Guatemala, Zona 11"],
    [1012, "Ciudad de Guatemala, Zona 12"],
    [1013, "Ciudad de Guatemala, Zona 13"],
    [1014, "Ciudad de Guatemala, Zona 14"],
    [1015, "Ciudad de Guatemala, Zona 15"],
    [1016, "Ciudad de Guatemala, Zona 16"],
    [1017, "Ciudad de Guatemala, Zona 17"],
    [1018, "Ciudad de Guatemala, Zona 18"],
    [1019, "Ciudad de Guatemala, Zona 19"],
    [1020, "Ciudad de Guatemala, Zona 20"],
    [1021, "Ciudad de Guatemala, Zona 21"],
    [1022, "Ciudad de Guatemala, Zona 22"],
    [2001, "Mixco, Guatemala"],
    [2002, "Villa Nueva, Guatemala"],
    [2003, "San Miguel Petapa, Guatemala"],
    [2004, "Santa Catarina Pinula, Guatemala"],
    [2005, "San José Pinula, Guatemala"],
    [2006, "San Pedro Ayampuc, Guatemala"],
    [2007, "Chinautla, Guatemala"],
    [2008, "Amatitlán, Guatemala"],
    [3001, "Quetzaltenango, Quetzaltenango"],
    [3002, "Coatepeque, Quetzaltenango"],
    [3003, "Olintepeque, Quetzaltenango"],
    [3004, "Almolonga, Quetzaltenango"],
    [4001, "Escuintla, Escuintla"],
    [4002, "Santa Lucía Cotzumalguapa, Escuintla"],
    [4003, "La Democracia, Escuintla"],
    [5001, "Chimaltenango, Chimaltenango"],
    [5002, "Comalapa, Chimaltenango"],
    [5003, "Patzicía, Chimaltenango"],
    [6001, "Sololá, Sololá"],
    [6002, "Panajachel, Sololá"],
    [7001, "Totonicapán, Totonicapán"],
    [8001, "San Marcos, San Marcos"],
    [8002, "San Pedro Sacatepéquez, San Marcos"],
    [9001, "Huehuetenango, Huehuetenango"],
    [9002, "Aguacatán, Huehuetenango"],
    [10001, "Mazatenango, Suchitepéquez"],
    [11001, "Retalhuleu, Retalhuleu"],
    [12001, "Chiquimula, Chiquimula"],
    [13001, "Jutiapa, Jutiapa"],
    [14001, "Zacapa, Zacapa"],
    [15001, "Jalapa, Jalapa"],
    [16001, "Coban, Alta Verapaz"],
    [17001, "Salamá, Baja Verapaz"],
    [18001, "Flores, Petén"],
    [19001, "Puerto Barrios, Izabal"],
    [20001, "Cuilapa, Santa Rosa"],
    [21001, "Chiquimula, Chiquimula"],
    [22001, "San Juan Sacatepéquez, Guatemala"],
    [23001, "San Vicente Pacaya, Escuintla"],
    [24001, "San José, Escuintla"],
    [25001, "San Marcos La Laguna, Sololá"],
    [26001, "Guastatoya, El Progreso"],
    [27001, "Esquipulas, Chiquimula"],
    [28001, "Sumpango, Sacatepéquez"],
    [29001, "Mixco Viejo, Chimaltenango"],
    [30001, "Fraijanes, Guatemala"],
    [31001, "Antigua Guatemala, Sacatepéquez"],
    [32001, "Santa Cruz del Quiché, Quiché"],
    [32002, "Chichicastenango, Quiché"],
    [33001, "Santa Catarina Ixtahuacán, Sololá"],
    [34001, "Zacualpa, Quiché"],
    [35001, "San José Pinula, Guatemala"],
    [36001, "Jocotenango, Sacatepéquez"],
    [37001, "Patzún, Chimaltenango"],
    [38001, "Poptún, Petén"],
    [39001, "San Martín Jilotepeque, Chimaltenango"]
]

roles = [
    "Gerente",
    "Cajero",
    "Asesor Financiero"
]

tipos_sucursales_agencias = [
    "Sucursal",
    "Agencia"
]

tipo_cuentas = [
    "Ahorro",
    "Monetario"
]

estados_tarjetas = [
    "Activo",
    "Bloqueado",
    "Cancelado"
]

estados_prestamos = [
    "Activo",
    "Vencido",
    "Cancelado"
]

Tipos_Sueldo = [
    "Mensual",
    "Quincenal",
    "Semanal"
]

Tipos_Transacciones = [
    "Depósito",
    "Retiro",
    "Transferencia",
    "Pago"
]


try:
    cursor = connection.cursor()

    for departamento in departamentos:
        cursor.execute("INSERT INTO departamentos (ID, DEPARTAMENTO) VALUES (seq_departamentos.NEXTVAL, :1)", (departamento,))

    for id_departamento, _, municipios in deptos_municipios:
        for municipio in municipios:
            cursor.execute("INSERT INTO municipios (ID, ID_DEPARTAMENTO, MUNICIPIO) VALUES (seq_municipios.NEXTVAL, :1, :2)", (id_departamento, municipio))

    for direccion in codigos_postales:
        cursor.execute("INSERT INTO codigos_postales (CODIGO, DIRECCION) VALUES (:1, :2)", (direccion[0], direccion[1]))

    for rol in roles:
        cursor.execute("INSERT INTO roles (ID, ROL) VALUES (seq_roles.NEXTVAL, :1)", (rol,))

    for agencia in tipos_sucursales_agencias:
        cursor.execute("INSERT INTO tipo_de_sucursales_agencias (ID, NOMBRE_TIPO) VALUES (seq_tipo_de_sucursales.NEXTVAL, :1)", (agencia,))

    for tipo_cuenta in tipo_cuentas:
        cursor.execute("INSERT INTO tipo_de_cuentas (ID, TIPO) VALUES (seq_tipo_de_cuentas.NEXTVAL, :1)", (tipo_cuenta,))

    for estado_tarjeta in estados_tarjetas:
        cursor.execute("INSERT INTO estados_de_tarjetas (ID, ESTADO) VALUES (seq_estados_de_tarjetas.NEXTVAL, :1)", (estado_tarjeta,))

    for estado_prestamo in estados_prestamos:
        cursor.execute("INSERT INTO estados_de_prestamos (ID, ESTADO) VALUES (seq_estados_de_prestamos.NEXTVAL, :1)", (estado_prestamo,))

    for tipo_sueldo in Tipos_Sueldo:
        cursor.execute("INSERT INTO tipos_de_sueldo (ID, TIPO) VALUES (seq_tipos_de_sueldo.NEXTVAL, :1)", (tipo_sueldo,))

    for tipo_transaccion in Tipos_Transacciones:
        cursor.execute("INSERT INTO tipos_de_transacciones (ID, TIPO) VALUES (seq_tipos_de_transacciones.NEXTVAL, :1)", (tipo_transaccion,))

    connection.commit()
    print("Datos insertados exitosamente en la base de datos.")

except cx_Oracle.DatabaseError as e:
    error, = e.args
    print("Error en la base de datos:", error.message)

finally:
    if cursor:
        cursor.close()
    if connection:
        connection.close()
