import cx_Oracle
import random
from datetime import datetime, timedelta

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

tipos_de_estados_financieros = [
    ["Solvente", "La empresa tiene suficiente capacidad para cubrir sus deudas y generar ganancias."],
    ["Equilibrio", "La empresa mantiene un balance entre sus activos y pasivos."],
    ["Quiebra", "La empresa no puede cubrir sus deudas y se encuentra en un estado financiero crítico."]
]

num_records = 340
ubicaciones_data = [
    {
        "id": i + 1,
        "id_departamento": random.randint(1, 22),
        "id_municipio": random.randint(1, 326),
        "id_codigo_postal": random.choice([c[0] for c in codigos_postales])
    }
    for i in range(num_records)
]

num_sucursales = 550
num_agencias = 1500

sucursales_agencias_data = []

for i in range(1, num_sucursales + 1):
    sucursales_agencias_data.append({
        "id": i,
        "nombre": f"Sucursal{i}",
        "id_tipo": 1,
        "telefono": f"{random.randint(100, 999)}-{random.randint(1000, 9999)}",
        "id_ubicacion": random.randint(1, 340)
    })

for j in range(1, num_agencias + 1):
    sucursales_agencias_data.append({
        "id": num_sucursales + j,
        "nombre": f"Agencia{j}",
        "id_tipo": 2,
        "telefono": f"{random.randint(100, 999)}-{random.randint(1000, 9999)}",
        "id_ubicacion": random.randint(1, 340)
    })

num_clientes = 500000
def generar_telefono():
    return f"(502) {random.randint(1000, 9999)}-{random.randint(1000, 9999)}"

clientes_data = []
for i in range(1, num_clientes + 1):
    clientes_data.append({
        "id": i,
        "nombre": f"Cliente{i}",
        "apellido": f"Apellido{i}",
        "telefono": generar_telefono(),
    })

num_cuentas = 500000
def generar_numero_cuenta():
    return f"{random.randint(100000, 999999)}-{random.randint(100000, 999999)}"

cuentas_data = []
numeros_de_cuenta = set()

for i in range(1, num_cuentas + 1):
    numero_de_cuenta = generar_numero_cuenta()
    while numero_de_cuenta in numeros_de_cuenta:
        numero_de_cuenta = generar_numero_cuenta()
    numeros_de_cuenta.add(numero_de_cuenta)

    cuentas_data.append({
        "id": i,
        "numero_de_cuenta": numero_de_cuenta,
        "id_tipo_de_cuenta": random.randint(1, 2),
        "saldo": round(random.uniform(100, 10000), 2),
        "id_cliente": i
    })

num_bovedas = 2050
bovedas_data = []

for i in range(1, num_bovedas + 1):
    bovedas_data.append({
        "id_agencia_sucursal": i,
        "fondos_disponibles": round(random.uniform(1000000.00, 10000000.00), 2)
    })
    
num_tarjetas = 500000
def random_date(start, end):
    return start + timedelta(days=random.randint(0, (end - start).days))

tarjetas_data = []

for i in range(1, num_tarjetas + 1):
    fecha_emision = random_date(datetime(2020, 1, 1), datetime(2024, 12, 31))
    fecha_expiracion = fecha_emision + timedelta(days=730) 
    fecha_de_corte = random_date(fecha_emision, fecha_emision + timedelta(days=30)) 
    limite_de_credito = round(random.uniform(1000.00, 50000.00), 2)
    saldo_actual = round(random.uniform(0.00, limite_de_credito), 2)
    
    tarjetas_data.append({
        "id_tarjeta": i,
        "id_cliente": i, 
        "numero_de_tarjeta": f"{random.randint(4000000000000000, 4999999999999999)}", 
        "limite_de_credito": limite_de_credito,
        "saldo_actual": saldo_actual,
        "fecha_de_emision": fecha_emision.strftime('%Y-%m-%d'),
        "fecha_de_expiracion": fecha_expiracion.strftime('%Y-%m-%d'),
        "id_estado": random.randint(1, 3),
        "fecha_de_corte": fecha_de_corte.strftime('%Y-%m-%d'),
        "dia_del_ciclo": random.randint(1, 30)
    })

num_prestamos = 100000

def random_date(start, end):
    return start + timedelta(days=random.randint(0, (end - start).days))

prestamos_data = []

for i in range(1, num_prestamos + 1):
    monto_del_prestamo = round(random.uniform(5000.00, 1000000.00), 2)
    tasa_de_interes = round(random.uniform(3.00, 15.00), 2)
    fecha_desembolso = random_date(datetime(2020, 1, 1), datetime(2024, 12, 31))
    fecha_vencimiento = fecha_desembolso + timedelta(days=730) 
    saldo_pendiente = monto_del_prestamo 
    
    prestamos_data.append({
        "id_prestamo": i,
        "id_cliente": random.randint(1, 500000),
        "monto_del_prestamo": monto_del_prestamo,
        "tasa_de_interes": tasa_de_interes,
        "fecha_de_desembolso": fecha_desembolso.strftime('%Y-%m-%d'),
        "fecha_de_vencimiento": fecha_vencimiento.strftime('%Y-%m-%d'),
        "saldo_pendiente": saldo_pendiente,
        "id_estado": random.randint(1, 3)
    })

num_transacciones = 250000
transacciones_data = []

for i in range(1, num_transacciones + 1):
    id_cliente = random.randint(1, 500000)
    cuenta_origen = random.randint(1, 500000)
    cuenta_destino = cuenta_origen

    while cuenta_destino == cuenta_origen:
        cuenta_destino = random.randint(1, 500000)

    id_tipo_transaccion = random.randint(1, 5)
    monto = round(random.uniform(10.00, 5000.00), 2)
    fecha = datetime.now() - timedelta(days=random.randint(0, 365))
    descripcion = f"Transacción #{i}" 
    id_sucursal_agencia = random.randint(1, 2050) 

    transacciones_data.append({
        "id": i,
        "id_cliente": id_cliente,
        "numero_de_cuenta_origen": cuenta_origen,
        "numero_de_cuenta_destino": cuenta_destino,
        "id_tipo_transaccion": id_tipo_transaccion,
        "monto": monto,
        "fecha": fecha.strftime('%Y-%m-%d %H:%M:%S'),
        "descripcion": descripcion,
        "id_sucursal_agencia": id_sucursal_agencia
    })

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

    for tipos_estado in tipos_de_estados_financieros:
        cursor.execute("INSERT INTO tipos_de_estados_financieros (ID, TIPO, DESCRIPCION) VALUES (seq_tipos_de_estados_financieros.NEXTVAL, :1, :2)", (tipos_estado[0], tipos_estado[1]))

    for ubicacion in ubicaciones_data:
        cursor.execute("INSERT INTO ubicaciones (ID, ID_DEPARTAMENTO, ID_MUNICIPIO, ID_CODIGO_POSTAL) VALUES (seq_ubicaciones.NEXTVAL, :1, :2, :3)", (ubicacion["id_departamento"], ubicacion["id_municipio"], ubicacion["id_codigo_postal"]))

    for suc_agencia in sucursales_agencias_data:
        cursor.execute("INSERT INTO sucursales_agencias (ID, NOMBRE, ID_TIPO, TELEFONO, ID_UBICACION) VALUES (seq_sucursales_agencias.NEXTVAL, :1, :2, :3, :4)", (suc_agencia["nombre"], suc_agencia["id_tipo"], suc_agencia["telefono"], suc_agencia["id_ubicacion"]))

    for cliente in clientes_data:
        cursor.execute("INSERT INTO clientes (ID, NOMBRE, APELLIDO, TELEFONO) VALUES (seq_clientes.NEXTVAL, :1, :2, :3)", (cliente["nombre"], cliente["apellido"], cliente["telefono"]))

    for cuenta in cuentas_data:
        cursor.execute("INSERT INTO cuentas (ID, NUMERO_DE_CUENTA, ID_TIPO_DE_CUENTA, SALDO, ID_CLIENTE) VALUES (seq_cuentas.NEXTVAL, :1, :2, :3, :4)", (cuenta["numero_de_cuenta"], cuenta["id_tipo_de_cuenta"], cuenta["saldo"], cuenta["id_cliente"]))

    for boveda in bovedas_data:
        cursor.execute("INSERT INTO bovedas (ID_BOVEDA, ID_AGENCIA_SUCURSAL, FONDOS_DISPONIBLES) VALUES (seq_bovedas.NEXTVAL, :1, :2)", (boveda["id_agencia_sucursal"], boveda["fondos_disponibles"]))

    for tarjeta in tarjetas_data:
        cursor.execute("INSERT INTO tarjetas_de_credito (ID_TARJETA, ID_CLIENTE, NUMERO_DE_TARJETA, LIMITE_DE_CREDITO, SALDO_ACTUAL, FECHA_DE_EMISION, FECHA_DE_EXPIRACION, ID_ESTADO, FECHA_DE_CORTE, DIA_DEL_CICLO) VALUES (seq_tarjetas_de_credito.NEXTVAL, :1, :2, :3, :4, TO_DATE(:5, 'YYYY-MM-DD'), TO_DATE(:6, 'YYYY-MM-DD'), :7, TO_DATE(:8, 'YYYY-MM-DD'), :9)", (tarjeta["id_cliente"], tarjeta["numero_de_tarjeta"], tarjeta["limite_de_credito"], tarjeta["saldo_actual"], tarjeta["fecha_de_emision"], tarjeta["fecha_de_expiracion"], tarjeta["id_estado"], tarjeta["fecha_de_corte"], tarjeta["dia_del_ciclo"]))

    for prestamo in prestamos_data:
        cursor.execute("INSERT INTO prestamos (ID_PRESTAMO, ID_CLIENTE, MONTO_DEL_PRESTAMO, TASA_DE_INTERES, FECHA_DE_DESEMBOLSO, FECHA_DE_VENCIMIENTO, SALDO_PENDIENTE, ID_ESTADO) VALUES (seq_prestamos.NEXTVAL, :1, :2, :3, TO_DATE(:4, 'YYYY-MM-DD'), TO_DATE(:5, 'YYYY-MM-DD'), :6, :7)", (prestamo["id_cliente"], prestamo["monto_del_prestamo"], prestamo["tasa_de_interes"], prestamo["fecha_de_desembolso"], prestamo["fecha_de_vencimiento"], prestamo["saldo_pendiente"], prestamo["id_estado"]))

    for transaccion in transacciones_data:
        cursor.execute("INSERT INTO transacciones (ID, ID_CLIENTE, NUMERO_DE_CUENTA_ORIGEN, NUMERO_DE_CUENTA _DESTINO, ID_TIPO_TRANSACCION, MONTO, FECHA, DESCRIPCION, ID_SUCURSAL_AGENCIA) VALUES (seq_transacciones.NEXTVAL, :1, :2, :3, :4, :5, TO_DATE(:6, 'YYYY-MM-DD HH24:MIS'), :7, :8)", (transaccion["id_cliente"], transaccion["numero_de_cuenta_origen"], transaccion["numero_de_cuenta_destino"], transaccion["id_tipo_transaccion"], transaccion["monto"], transaccion["fecha"], transaccion["descripcion"], transaccion["id_sucursal_agencia"]))

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
