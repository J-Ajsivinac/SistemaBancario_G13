import csv
import os

# Crear carpeta 'inputs' si no existe
if not os.path.exists('inputs'):
    os.makedirs('inputs')

# Lista ampliada de direcciones con códigos postales
codigos_postales = [
    [1001, "Ciudad de Guatemala, Zona 1"],
    [1002, "Ciudad de Guatemala, Zona 2"],
    [1003, "Ciudad de Guatemala, Zona 3"],
    [1004, "Ciudad de Guatemala, Zona 4"],
    [1005, "Ciudad de Guatemala, Zona 5"],
    [1006, "Ciudad de Guatemala, Zona 6"],
    [1007, "Ciudad de Guatemala, Zona 7"],
    [1008, "Ciudad de Guatemala, Zona 8"],
    [1009, "Ciudad de Guatemala, Zona 9"],
    [1010, "Ciudad de Guatemala, Zona 10"],
    [1011, "Ciudad de Guatemala, Zona 11"],
    [1012, "Ciudad de Guatemala, Zona 12"],
    [1013, "Ciudad de Guatemala, Zona 13"],
    [1014, "Ciudad de Guatemala, Zona 14"],
    [1015, "Ciudad de Guatemala, Zona 15"],
    [1016, "Ciudad de Guatemala, Zona 16"],
    [1017, "Ciudad de Guatemala, Zona 17"],
    [1018, "Ciudad de Guatemala, Zona 18"],
    [1019, "Ciudad de Guatemala, Zona 19"],
    [1020, "Ciudad de Guatemala, Zona 20"],
    [1021, "Ciudad de Guatemala, Zona 21"],
    [1022, "Ciudad de Guatemala, Zona 22"],
    [2001, "Mixco, Guatemala"],
    [2002, "Villa Nueva, Guatemala"],
    [2003, "San Miguel Petapa, Guatemala"],
    [2004, "Santa Catarina Pinula, Guatemala"],
    [2005, "San José Pinula, Guatemala"],
    [2006, "San Pedro Ayampuc, Guatemala"],
    [2007, "Chinautla, Guatemala"],
    [2008, "Amatitlán, Guatemala"],
    [3001, "Quetzaltenango, Quetzaltenango"],
    [3002, "Coatepeque, Quetzaltenango"],
    [3003, "Olintepeque, Quetzaltenango"],
    [3004, "Almolonga, Quetzaltenango"],
    [4001, "Escuintla, Escuintla"],
    [4002, "Santa Lucía Cotzumalguapa, Escuintla"],
    [4003, "La Democracia, Escuintla"],
    [5001, "Chimaltenango, Chimaltenango"],
    [5002, "Comalapa, Chimaltenango"],
    [5003, "Patzicía, Chimaltenango"],
    [6001, "Sololá, Sololá"],
    [6002, "Panajachel, Sololá"],
    [7001, "Totonicapán, Totonicapán"],
    [8001, "San Marcos, San Marcos"],
    [8002, "San Pedro Sacatepéquez, San Marcos"],
    [9001, "Huehuetenango, Huehuetenango"],
    [9002, "Aguacatán, Huehuetenango"],
    [10001, "Mazatenango, Suchitepéquez"],
    [11001, "Retalhuleu, Retalhuleu"],
    [12001, "Chiquimula, Chiquimula"],
    [13001, "Jutiapa, Jutiapa"],
    [14001, "Zacapa, Zacapa"],
    [15001, "Jalapa, Jalapa"],
    [16001, "Coban, Alta Verapaz"],
    [17001, "Salamá, Baja Verapaz"],
    [18001, "Flores, Petén"],
    [19001, "Puerto Barrios, Izabal"],
    [20001, "Cuilapa, Santa Rosa"],
    [21001, "Chiquimula, Chiquimula"],
    [22001, "San Juan Sacatepéquez, Guatemala"],
    [23001, "San Vicente Pacaya, Escuintla"],
    [24001, "San José, Escuintla"],
    [25001, "San Marcos La Laguna, Sololá"],
    [26001, "Guastatoya, El Progreso"],
    [27001, "Esquipulas, Chiquimula"],
    [28001, "Sumpango, Sacatepéquez"],
    [29001, "Mixco Viejo, Chimaltenango"],
    [30001, "Fraijanes, Guatemala"],
    [31001, "Antigua Guatemala, Sacatepéquez"],
    [32001, "Santa Cruz del Quiché, Quiché"],
    [32002, "Chichicastenango, Quiché"],
    [33001, "Santa Catarina Ixtahuacán, Sololá"],
    [34001, "Zacualpa, Quiché"],
    [35001, "San José Pinula, Guatemala"],
    [36001, "Jocotenango, Sacatepéquez"],
    [37001, "Patzún, Chimaltenango"],
    [38001, "Poptún, Petén"],
    [39001, "San Martín Jilotepeque, Chimaltenango"]
]

# Crear y escribir el archivo CSV
with open('inputs/CodigosPostales.csv', mode='w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['ID','Codigo_Postal', 'Direccion'])  # Escribir encabezado
    for i, direccion in enumerate(codigos_postales, 1):
        writer.writerow([i, direccion[0], direccion[1]])

print("Archivo CSV 'CodigosPostales.csv' generado en la carpeta 'inputs'.")
