import csv
import random
import os
from datetime import datetime, timedelta

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Número de transacciones a generar
num_transacciones = 250000

# Generar datos para las transacciones
transacciones_data = []

for i in range(1, num_transacciones + 1):
    id_cliente = random.randint(1, 500000)  # Cliente aleatorio
    cuenta_origen = random.randint(1, 500000)  # Cuenta origen aleatoria
    cuenta_destino = cuenta_origen  # Inicializar cuenta destino igual a cuenta origen
    
    # Asegurar que la cuenta destino sea diferente de la cuenta origen
    while cuenta_destino == cuenta_origen:
        cuenta_destino = random.randint(1, 500000)

    id_tipo_transaccion = random.randint(1, 5)  # Suponiendo 5 tipos de transacción
    monto = round(random.uniform(10.00, 5000.00), 2)  # Monto entre 10 y 5000
    fecha = datetime.now() - timedelta(days=random.randint(0, 365))  # Fecha aleatoria en el último año
    descripcion = f"Transacción #{i}"  # Descripción genérica
    id_sucursal_agencia = random.randint(1, 2050)  # Sucursal o agencia aleatoria

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

# Crear y escribir el archivo CSV
with open('inputs/transacciones.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['id', 'id_cliente', 'numero_de_cuenta_origen', 
                    'numero_de_cuenta_destino', 'id_tipo_transaccion', 
                    'monto', 'fecha', 'descripcion', 'id_sucursal_agencia'])  # Encabezado
    for transaccion in transacciones_data:
        writer.writerow([
            transaccion["id"],
            transaccion["id_cliente"],
            transaccion["numero_de_cuenta_origen"],
            transaccion["numero_de_cuenta_destino"],
            transaccion["id_tipo_transaccion"],
            transaccion["monto"],
            transaccion["fecha"],
            transaccion["descripcion"],
            transaccion["id_sucursal_agencia"]
        ])

print("Archivo CSV 'transacciones.csv' generado en la carpeta 'inputs'.")
