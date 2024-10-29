import csv
import random
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Definir cantidad de empleados
num_empleados = 5500

# Generar datos para empleados
empleados_data = [
    {
        "id": i + 1,
        "nombre": f"Empleado{i + 1}",
        "apellido": f"Apellido{i + 1}",
        "id_rol": random.randint(1, 3),
        "id_departamento": random.randint(1, 22),
        "id_sucursal": random.randint(1, 2050)
    }
    for i in range(num_empleados)
]

# Crear y escribir el archivo CSV para empleados
with open('inputs/Empleados.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID', 'Nombre', 'Apellido', 'ID_Rol', 'ID_Departamento', 'ID_Sucursal'])  # Encabezado
    for empleado in empleados_data:
        writer.writerow([
            empleado["id"],
            empleado["nombre"],
            empleado["apellido"],
            empleado["id_rol"],
            empleado["id_departamento"],
            empleado["id_sucursal"]
        ])

print("Archivo CSV 'empleados.csv' generado en la carpeta 'inputs'.")
