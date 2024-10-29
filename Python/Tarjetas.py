import csv
import random
import os
from datetime import datetime, timedelta

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Número de tarjetas a generar
num_tarjetas = 500000

# Función para generar una fecha aleatoria
def random_date(start, end):
    return start + timedelta(days=random.randint(0, (end - start).days))

# Generar datos para las tarjetas de crédito
tarjetas_data = []

for i in range(1, num_tarjetas + 1):
    fecha_emision = random_date(datetime(2020, 1, 1), datetime(2024, 12, 31))
    fecha_expiracion = fecha_emision + timedelta(days=730)  # 2 años de validez
    fecha_de_corte = random_date(fecha_emision, fecha_emision + timedelta(days=30))  # Dentro del mes
    limite_de_credito = round(random.uniform(1000.00, 50000.00), 2)
    saldo_actual = round(random.uniform(0.00, limite_de_credito), 2)
    
    tarjetas_data.append({
        "id_tarjeta": i,
        "id_cliente": i,  # Mapeo directo de 1 a 500000
        "numero_de_tarjeta": f"{random.randint(4000000000000000, 4999999999999999)}",  # Generar un número de tarjeta
        "limite_de_credito": limite_de_credito,
        "saldo_actual": saldo_actual,
        "fecha_de_emision": fecha_emision.strftime('%Y-%m-%d'),
        "fecha_de_expiracion": fecha_expiracion.strftime('%Y-%m-%d'),
        "id_estado": random.randint(1, 3),
        "fecha_de_corte": fecha_de_corte.strftime('%Y-%m-%d'),
        "dia_del_ciclo": random.randint(1, 30)
    })

# Crear y escribir el archivo CSV
with open('inputs/tarjetas_de_credito.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['id_tarjeta', 'id_cliente', 'numero_de_tarjeta', 'limite_de_credito', 
                    'saldo_actual', 'fecha_de_emision', 'fecha_de_expiracion', 
                    'id_estado', 'fecha_de_corte', 'dia_del_ciclo'])
    for tarjeta in tarjetas_data:
        writer.writerow([
            tarjeta["id_tarjeta"],
            tarjeta["id_cliente"],
            tarjeta["numero_de_tarjeta"],
            tarjeta["limite_de_credito"],
            tarjeta["saldo_actual"],
            tarjeta["fecha_de_emision"],
            tarjeta["fecha_de_expiracion"],
            tarjeta["id_estado"],
            tarjeta["fecha_de_corte"],
            tarjeta["dia_del_ciclo"]
        ])

print("Archivo CSV 'tarjetas_de_credito.csv' generado en la carpeta 'inputs'.")
