import csv
import random
import os
from datetime import datetime, timedelta

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Número de préstamos a generar
num_prestamos = 100000

# Función para generar una fecha aleatoria
def random_date(start, end):
    return start + timedelta(days=random.randint(0, (end - start).days))

# Generar datos para los préstamos
prestamos_data = []

for i in range(1, num_prestamos + 1):
    monto_del_prestamo = round(random.uniform(5000.00, 1000000.00), 2)
    tasa_de_interes = round(random.uniform(3.00, 15.00), 2)
    fecha_desembolso = random_date(datetime(2020, 1, 1), datetime(2024, 12, 31))
    fecha_vencimiento = fecha_desembolso + timedelta(days=730)  # 2 años de vencimiento
    saldo_pendiente = monto_del_prestamo  # Saldo inicial es el mismo monto del préstamo
    
    prestamos_data.append({
        "id_prestamo": i,
        "id_cliente": random.randint(1, 500000),  # Cliente aleatorio
        "monto_del_prestamo": monto_del_prestamo,
        "tasa_de_interes": tasa_de_interes,
        "fecha_de_desembolso": fecha_desembolso.strftime('%Y-%m-%d'),
        "fecha_de_vencimiento": fecha_vencimiento.strftime('%Y-%m-%d'),
        "saldo_pendiente": saldo_pendiente,
        "id_estado": random.randint(1, 3)
    })

# Crear y escribir el archivo CSV
with open('inputs/prestamos.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['id_prestamo', 'id_cliente', 'monto_del_prestamo', 
                    'tasa_de_interes', 'fecha_de_desembolso', 'fecha_de_vencimiento', 
                    'saldo_pendiente', 'id_estado'])
    for prestamo in prestamos_data:
        writer.writerow([
            prestamo["id_prestamo"],
            prestamo["id_cliente"],
            prestamo["monto_del_prestamo"],
            prestamo["tasa_de_interes"],
            prestamo["fecha_de_desembolso"],
            prestamo["fecha_de_vencimiento"],
            prestamo["saldo_pendiente"],
            prestamo["id_estado"]
        ])

print("Archivo CSV 'prestamos.csv' generado en la carpeta 'inputs'.")
