import csv
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Lista de roles
TiposDeSueldo = [
    "Mensual",
    "Quincenal",
    "Semanal"
]

# Crear y escribir el archivo CSV
with open('inputs/TiposSueldos.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID','Tipos de Sueldo'])

    for i, tipo in enumerate(TiposDeSueldo, 1):
        writer.writerow([i, tipo])

print("Archivo CSV 'roles.csv' generado en la carpeta 'inputs'.")
