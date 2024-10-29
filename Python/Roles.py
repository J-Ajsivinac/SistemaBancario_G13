import csv
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Lista de roles
roles = [
    "Gerente",
    "Cajero",
    "Asesor Financiero"
]

# Crear y escribir el archivo CSV
with open('inputs/roles.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID','Rol'])

    for i, rol in enumerate(roles, 1):
        writer.writerow([i, rol])

print("Archivo CSV 'roles.csv' generado en la carpeta 'inputs'.")
