import csv
import random
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Cantidad de clientes a generar
num_clientes = 500000

# Función para generar un número de teléfono aleatorio
def generar_telefono():
    return f"(502) {random.randint(1000, 9999)}-{random.randint(1000, 9999)}"

# Generar datos para los clientes
clientes_data = []

for i in range(1, num_clientes + 1):
    clientes_data.append({
        "id": i,
        "nombre": f"Cliente{i}",
        "apellido": f"Apellido{i}",
        "telefono": generar_telefono(),
        "id_cuenta": i  # ID de cuenta igual al ID de cliente para asegurar unicidad
    })

# Crear y escribir el archivo CSV
with open('inputs/Clientes.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID', 'Nombre', 'Apellido', 'Telefono', 'ID_Cuenta'])  # Encabezado
    for cliente in clientes_data:
        writer.writerow([
            cliente["id"],
            cliente["nombre"],
            cliente["apellido"],
            cliente["telefono"],
            cliente["id_cuenta"]
        ])

print("Archivo CSV 'clientes.csv' generado en la carpeta 'inputs'.")
