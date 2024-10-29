import csv
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Lista de roles
tipos_sucursales_agencias = [
    "Sucursal",
    "Agencia"
]

# Crear y escribir el archivo CSV
with open('inputs/TiposSucursales.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID','Agencia-Sucursal'])

    for i, agencia in enumerate(tipos_sucursales_agencias, 1):
        writer.writerow([i, agencia])

print("Archivo CSV 'roles.csv' generado en la carpeta 'inputs'.")
