import csv
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Lista de roles
estadosTarjetas = [
    "Activo",
    "Bloqueado",
    "Cancelado"
]

# Crear y escribir el archivo CSV
with open('inputs/EstadosTarjetas.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID','Estados de Tarjetas'])

    for i, estado in enumerate(estadosTarjetas, 1):
        writer.writerow([i, estado])

print("Archivo CSV 'roles.csv' generado en la carpeta 'inputs'.")
