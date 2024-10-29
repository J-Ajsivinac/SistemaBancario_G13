import csv
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Lista de roles
TiposDeTransacciones = [
    "Depósito",
    "Retiro",
    "Transferencia",
    "Pago"
]

# Crear y escribir el archivo CSV
with open('inputs/TiposTransacciones.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID','Tipos de Transacciones'])

    for i, transaccion in enumerate(TiposDeTransacciones, 1):
        writer.writerow([i, transaccion])

print("Archivo CSV 'roles.csv' generado en la carpeta 'inputs'.")
