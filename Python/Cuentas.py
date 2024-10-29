import csv
import random
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Cantidad de cuentas a generar
num_cuentas = 500000

# Función para generar números de cuenta únicos
def generar_numero_cuenta():
    return f"{random.randint(100000, 999999)}-{random.randint(100000, 999999)}"

# Generar datos para las cuentas
cuentas_data = []
numeros_de_cuenta = set()  # Para asegurarnos de que los números de cuenta sean únicos

for i in range(1, num_cuentas + 1):
    # Generar número de cuenta único
    numero_de_cuenta = generar_numero_cuenta()
    while numero_de_cuenta in numeros_de_cuenta:
        numero_de_cuenta = generar_numero_cuenta()  # Asegura unicidad
    numeros_de_cuenta.add(numero_de_cuenta)
    
    cuentas_data.append({
        "id": i,
        "numero_de_cuenta": numero_de_cuenta,
        "id_tipo_de_cuenta": random.randint(1, 2),
        "saldo": round(random.uniform(100, 10000), 2)  # Saldo entre 100 y 10,000 con 2 decimales
    })

# Crear y escribir el archivo CSV
with open('inputs/cuentas.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID', 'Numero_De_Cuenta', 'ID_Tipo_De_Cuenta', 'Saldo'])  # Encabezado
    for cuenta in cuentas_data:
        writer.writerow([
            cuenta["id"],
            cuenta["numero_de_cuenta"],
            cuenta["id_tipo_de_cuenta"],
            cuenta["saldo"]
        ])

print("Archivo CSV 'cuentas.csv' generado en la carpeta 'inputs'.")
