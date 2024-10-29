import cx_Oracle

# Configuración de la conexión a la base de datos
# Reemplaza con tus credenciales y detalles de la base de datos
dsn_tns = cx_Oracle.makedsn('localhost', '1521', service_name='xe')
connection = cx_Oracle.connect(user='C##Jeff', password='root', dsn=dsn_tns)

# Lista de los 22 departamentos de Guatemala
departamentos = [
    "Alta Verapaz", "Baja Verapaz", "Chimaltenango", "Chiquimula", 
    "El Progreso", "Escuintla", "Guatemala", "Huehuetenango", 
    "Izabal", "Jalapa", "Jutiapa", "Petén", "Quetzaltenango", 
    "Quiché", "Retalhuleu", "Sacatepéquez", "San Marcos", 
    "Santa Rosa", "Sololá", "Suchitepéquez", "Totonicapán", "Zacapa"
]

try:
    # Crear un cursor
    cursor = connection.cursor()

    # Insertar departamentos en la base de datos
    for i, departamento in enumerate(departamentos, 1):
        cursor.execute("INSERT INTO departamentos (ID, DEPARTAMENTO) VALUES (:1, :2)", (i, departamento))

    # Confirmar los cambios
    connection.commit()
    print("Datos insertados exitosamente en la base de datos.")

except cx_Oracle.DatabaseError as e:
    error, = e.args
    print("Error en la base de datos:", error.message)

finally:
    # Cerrar el cursor y la conexión
    if cursor:
        cursor.close()
    if connection:
        connection.close()
