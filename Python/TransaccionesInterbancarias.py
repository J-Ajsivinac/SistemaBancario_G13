import csv
import random
import os
from datetime import datetime, timedelta

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

num_transacciones_interbancarias = 100000

# Generar datos para las transacciones interbancarias
transacciones_interbancarias_data = []

for i in range(1, num_transacciones_interbancarias + 1):
    id_sucursal_agencia_origen = random.randint(1, 2050)
    id_sucursal_agencia_destino = id_sucursal_agencia_origen

    # Asegurar que la sucursal/agencia de destino sea diferente a la de origen
    while id_sucursal_agencia_destino == id_sucursal_agencia_origen:
        id_sucursal_agencia_destino = random.randint(1, 2050)

    monto = round(random.uniform(1000.00, 1000000.00), 2)
    fecha = datetime.now() - timedelta(days=random.randint(0, 365))
    descripcion = f"Transacción Interbancaria #{i}"

    transacciones_interbancarias_data.append({
        "id": i,
        "id_sucursal_agencia_origen": id_sucursal_agencia_origen,
        "id_sucursal_agencia_destino": id_sucursal_agencia_destino,
        "monto": monto,
        "fecha": fecha.strftime('%Y-%m-%d %H:%M:%S'),
        "descripcion": descripcion
    })

# Crear y escribir el archivo CSV
with open('inputs/transacciones_interbancarias.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['id', 'id_sucursal_agencia_origen', 'id_sucursal_agencia_destino', 'monto', 'fecha', 'descripcion'])  # Encabezado
    for transaccion in transacciones_interbancarias_data:
        writer.writerow([
            transaccion["id"],
            transaccion["id_sucursal_agencia_origen"],
            transaccion["id_sucursal_agencia_destino"],
            transaccion["monto"],
            transaccion["fecha"],
            transaccion["descripcion"]
        ])

print("Archivo CSV 'transacciones_interbancarias.csv' generado en la carpeta 'inputs'.")
