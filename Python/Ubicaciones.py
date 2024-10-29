import csv
import random
import os

if not os.path.exists('inputs'):
    os.makedirs('inputs')

num_records = 340

# Generar datos aleatorios para la tabla ubicaciones
ubicaciones_data = [
    {
        "id": i + 1,
        "id_departamento": random.randint(1, 22),
        "id_municipio": random.randint(1, 326),
        "id_codigo_postal": random.randint(1, 74)
    }
    for i in range(num_records)
]

# Crear y escribir el archivo CSV para ubicaciones
with open('inputs/ubicaciones.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID', 'ID_Departamento', 'ID_Municipio', 'ID_Codigo_Postal'])
    for record in ubicaciones_data:
        writer.writerow([record["id"], record["id_departamento"], record["id_municipio"], record["id_codigo_postal"]])

print("Archivo CSV 'ubicaciones.csv' generado en la carpeta 'inputs'.")
