import csv
import random
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Número de bovedas a generar (una por cada sucursal o agencia)
num_bovedas = 2050

# Generar datos para las bóvedas
bovedas_data = []

for i in range(1, num_bovedas + 1):
    bovedas_data.append({
        "id_boveda": i,
        "id_agencia_sucursal": i,  # Mapeo directo de 1 a 2050
        "fondos_disponibles": round(random.uniform(1000000.00, 10000000.00), 2)  # Fondos aleatorios
    })

# Crear y escribir el archivo CSV
with open('inputs/Bovedas.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['id_boveda', 'id_agencia_sucursal', 'fondos_disponibles'])  # Encabezado
    for boveda in bovedas_data:
        writer.writerow([
            boveda["id_boveda"],
            boveda["id_agencia_sucursal"],
            boveda["fondos_disponibles"]
        ])

print("Archivo CSV 'bovedas.csv' generado en la carpeta 'inputs'.")
