import csv
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Lista de roles
estadosPrestamos = [
    "Activo",
    "Vencido",
    "Cancelado"
]

# Crear y escribir el archivo CSV
with open('inputs/EstadosPrestamos.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID','Estados de Préstamos'])

    for i, estado in enumerate(estadosPrestamos, 1):
        writer.writerow([i, estado])

print("Archivo CSV 'roles.csv' generado en la carpeta 'inputs'.")
