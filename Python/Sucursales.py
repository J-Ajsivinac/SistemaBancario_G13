import csv
import random
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Cantidad de registros para sucursales y agencias
num_sucursales = 550
num_agencias = 1500

# Generar datos para sucursales y agencias
sucursales_agencias_data = []

# Generar registros para sucursales
for i in range(1, num_sucursales + 1):
    sucursales_agencias_data.append({
        "id": i,
        "nombre": f"Sucursal{i}",
        "id_tipo": 1,  # Sucursal
        "telefono": f"{random.randint(100, 999)}-{random.randint(1000, 9999)}",
        "id_ubicacion": random.randint(1, 340)
    })

# Generar registros para agencias
for j in range(1, num_agencias + 1):
    sucursales_agencias_data.append({
        "id": num_sucursales + j,
        "nombre": f"Agencia{j}",
        "id_tipo": 2,  # Agencia
        "telefono": f"{random.randint(100, 999)}-{random.randint(1000, 9999)}",
        "id_ubicacion": random.randint(1, 340)
    })

# Crear y escribir el archivo CSV para sucursales y agencias
with open('inputs/SucursalesAgencias.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID', 'Nombre', 'ID_Tipo', 'Telefono', 'ID_Ubicacion'])  # Encabezado
    for suc_agencia in sucursales_agencias_data:
        writer.writerow([
            suc_agencia["id"],
            suc_agencia["nombre"],
            suc_agencia["id_tipo"],
            suc_agencia["telefono"],
            suc_agencia["id_ubicacion"]
        ])

print("Archivo CSV 'sucursales_agencias.csv' generado en la carpeta 'inputs'.")
