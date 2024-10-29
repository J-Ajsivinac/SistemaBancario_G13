import csv
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Lista de tipos de estados financieros con ID, tipo y descripción
tipos_de_estados_financieros = [
    ["Solvente", "La empresa tiene suficiente capacidad para cubrir sus deudas y generar ganancias."],
    ["Equilibrio", "La empresa mantiene un balance entre sus activos y pasivos."],
    ["Quiebra", "La empresa no puede cubrir sus deudas y se encuentra en un estado financiero crítico."]
]

# Crear y escribir el archivo CSV para Tipos_de_Estados_Financieros
with open('inputs/TiposFinancieros.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID', 'Tipo', 'Descripcion'])
    for i, estado in enumerate(tipos_de_estados_financieros, 1):
        writer.writerow([i, estado[0], estado[1]])

print("Archivo CSV 'tipos_de_estados_financieros.csv' generado en la carpeta 'inputs'.")
