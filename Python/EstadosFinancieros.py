import csv
import random
import os
from datetime import datetime, timedelta

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Número de registros a generar
num_registros = 2050

# Función para asignar id_tipo_estado con baja probabilidad para el valor 3
def elegir_tipo_estado():
    return random.choices([1, 2, 3], weights=[45, 45, 10], k=1)[0]

# Generar datos para los estados financieros
estados_financieros_data = []

for i in range(1, num_registros + 1):
    id_sucursal_agencia = i
    monto_activo = round(random.uniform(50000.00, 5000000.00), 2)  # Rango de activo, redondeado a 2 decimales
    monto_pasivo = round(random.uniform(10000.00, 2000000.00), 2)  # Rango de pasivo, redondeado a 2 decimales
    saldo_total = round(monto_activo - monto_pasivo, 2)  # Diferencia redondeada a 2 decimales
    fecha = datetime.now() - timedelta(days=random.randint(0, 365))  # Fecha aleatoria en el último año
    id_tipo_estado = elegir_tipo_estado()

    estados_financieros_data.append({
        "id": i,
        "id_sucursal_agencia": id_sucursal_agencia,
        "monto_activo": monto_activo,
        "monto_pasivo": monto_pasivo,
        "saldo_total": saldo_total,
        "fecha": fecha.strftime('%Y-%m-%d'),
        "id_tipo_estado": id_tipo_estado
    })

# Crear y escribir el archivo CSV
with open('inputs/estados_financieros.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['id', 'id_sucursal_agencia', 'monto_activo', 'monto_pasivo', 'saldo_total', 'fecha', 'id_tipo_estado'])  # Encabezado
    for estado in estados_financieros_data:
        writer.writerow([
            estado["id"],
            estado["id_sucursal_agencia"],
            f"{estado['monto_activo']:.2f}",
            f"{estado['monto_pasivo']:.2f}",
            f"{estado['saldo_total']:.2f}",
            estado["fecha"],
            estado["id_tipo_estado"]
        ])

print("Archivo CSV 'estados_financieros.csv' generado en la carpeta 'inputs'.")
