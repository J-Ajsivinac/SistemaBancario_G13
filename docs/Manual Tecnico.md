<h1 align="center">Proyecto 1</h1>

<div align="center">
🙍‍♂️ Joab Israel Ajsivinac Ajsivinac 🆔 202200135
</div>
<div align="center">
📕 SISTEMAS DE BASES DE DATOS 1
</div>
<div align="center"> 🏛 Universidad San Carlos de Guatemala</div>
<div align="center"> 📆 Segundo Semestre 2024</div>

# ⚽ Objetivos

### Objetivo General
El propósito principal del proyecto es que los estudiantes adquieran experiencia en el diseño y manejo de bases de datos SQL dentro de un entorno bancario, desarrollando competencias clave como la normalización, la gestión de transacciones, la creación de consultas avanzadas y la optimización para el manejo eficiente de grandes volúmenes de datos en un entorno de producción.

### Objetivos Específicos
1. **Diseño de Base de Datos:** El estudiante debe crear una base de datos completamente normalizada que refleje las operaciones de un banco real.
2. **Gestión de Transacciones:** Desarrollar la habilidad para gestionar transacciones bancarias de manera segura y eficiente, garantizando la integridad de los datos.
3. **Consultas SQL Avanzadas:** Capacitar a los estudiantes para escribir consultas complejas que involucren múltiples tablas, manejo de fechas, agregaciones y optimización de rendimiento.
4. **Soporte de Cargas Simultáneas:** Diseñar y validar el sistema para que soporte múltiples operaciones simultáneas, asegurando la integridad de los datos y un rendimiento óptimo.
5. **Seguridad de Datos:** Implementar mecanismos robustos de seguridad, incluyendo controles de acceso a la base de datos y gestión segura de transacciones.
6. **Modelado de Base de Datos:** Aplicar las mejores prácticas de modelado de datos en la creación de bases de datos transaccionales, asegurando la integridad referencial y la optimización de consultas.


## ⚙ Tecnologías Utilizadas

<p align="center">
  <a href="https://go-skill-icons.vercel.app/">
    <img src="https://go-skill-icons.vercel.app/api/icons?i=vscode,oracle,docker,datagrip,github" />
  </a>
</p>
<ul>
  <li>Oracle SQL Developer Data Modeler</li>
  <li>DataGrip</li>
  <li>Docker</li>
  <li>GitHub</li>
  </ul>
</ul>

##  Modelo Conceptual

![alt text](imgs/Conceptual.png)


## 🧮 Identificación de Entidades y Atributos


### 1. **Agencia**

| Atributo     | Descripción                        |
| ------------ | ---------------------------------- |
| `id_agencia` | Identificador único de la agencia. |
| `nombre`     | Nombre de la agencia.              |
| `telefono`   | Número de teléfono de la agencia.  |
| `dirección`  | Dirección física de la agencia.    |

🔹 **Por qué existe esta entidad:**
Las agencias son puntos de atención al cliente donde se gestionan servicios bancarios. Es fundamental para organizar y clasificar las sucursales según su tipo y ubicación.

---

### 2. **Auditoría de Transacción**

| Atributo       | Descripción                                            |
| -------------- | ------------------------------------------------------ |
| `id_auditoria` | Identificador único de la auditoría.                   |
| `comentario`   | Comentarios adicionales sobre la transacción auditada. |


🔹 **Por qué existe esta entidad:**
La auditoría de transacciones es esencial para la transparencia y la prevención de fraudes, permitiendo un control y seguimiento de las operaciones realizadas.

---

### 3. **Cliente**

| Atributo         | Descripción                                        |
| ---------------- | -------------------------------------------------- |
| `id_cliente`     | Identificador único del cliente.                   |
| `nombre`         | Nombre del cliente.                                |
| `apellido`       | Apellido del cliente.                              |
| `telefono`       | Número de teléfono del cliente.                    |
| `fecha_registro` | Fecha en que se registró el cliente en el sistema. |

🔹 **Por qué existe esta entidad:**
Los clientes son el centro del negocio bancario. Esta entidad permite gestionar la información relevante para ofrecer servicios personalizados y efectivos.

---

### 4. **Compra con Tarjeta de Crédito**

| Atributo      | Descripción                       |
| ------------- | --------------------------------- |
| `id_compra`   | Identificador único de la compra. |
| `monto`       | Monto de la compra realizada.     |
| `fecha`       | Fecha y hora de la compra.        |
| `descripcion` | Detalle de la compra.             |


🔹 **Por qué existe esta entidad:**
Las compras con tarjeta de crédito son transacciones comunes que deben ser registradas para un mejor seguimiento del gasto de los clientes y el control de las cuentas.

---

### 5. **Cuenta**

| Atributo         | Descripción                          |
| ---------------- | ------------------------------------ |
| `id_cuenta`      | Identificador único de la cuenta.    |
| `saldo`          | Monto total disponible en la cuenta. |
| `fecha_apertura` | Fecha en que se abrió la cuenta.     |


🔹 **Por qué existe esta entidad:**
Las cuentas son esenciales para el funcionamiento de cualquier banco, ya que permiten gestionar los fondos de los clientes y las transacciones que realicen.

---

### 6. **Departamento**

| Atributo          | Descripción                           |
| ----------------- | ------------------------------------- |
| `id_departamento` | Identificador único del departamento. |
| `nombre`          | Nombre del departamento.              |

🔹 **Por qué existe esta entidad:**
Los departamentos permiten organizar el banco en diferentes áreas funcionales, facilitando la gestión y la especialización del personal.

---

### 7. **Empleado**

| Atributo      | Descripción                       |
| ------------- | --------------------------------- |
| `id_empleado` | Identificador único del empleado. |
| `nombre`      | Nombre del empleado.              |
| `apellido`    | Apellido del empleado.            |
| `telefono`    | Número de teléfono del empleado.  |

🔹 **Por qué existe esta entidad:**
Los empleados son los encargados de atender y gestionar las necesidades de los clientes, siendo un elemento clave para el éxito del banco.

---

### 8. **Estado de Préstamo**

| Atributo             | Descripción                                                 |
| -------------------- | ----------------------------------------------------------- |
| `id_estado_prestamo` | Identificador único del estado del préstamo.                |
| `estado`             | Descripción del estado del préstamo (activo, pagado, etc.). |

🔹 **Por qué existe esta entidad:**
Los estados de préstamo permiten clasificar los diferentes tipos de préstamos según su situación, facilitando la gestión y seguimiento de cada uno.

---

### 9. **Estado de Tarjeta**

| Atributo    | Descripción                                                     |
| ----------- | --------------------------------------------------------------- |
| `id_estado` | Identificador único del estado de la tarjeta.                   |
| `estado`    | Descripción del estado de la tarjeta (activa, bloqueada, etc.). |

🔹 **Por qué existe esta entidad:**
El estado de las tarjetas es fundamental para el control y la seguridad, permitiendo identificar tarjetas que no se deben utilizar.

---

### 10. **Municipio**

| Atributo        | Descripción                        |
| --------------- | ---------------------------------- |
| `id_municipio`  | Identificador único del municipio. |
| `nombre`        | Nombre del municipio.              |
| `codigo_postal` | Código postal del municipio.       |

🔹 **Por qué existe esta entidad:**
Los municipios permiten gestionar la ubicación geográfica de los clientes y agencias, lo cual es clave para brindar servicios locales adecuados.

---

### 11. **Pago de Préstamo**

| Atributo           | Descripción                      |
| ------------------ | -------------------------------- |
| `id_pago_prestamo` | Identificador único del pago.    |
| `monto`            | Monto pagado en la transacción.  |
| `fecha`            | Fecha y hora del pago realizado. |

🔹 **Por qué existe esta entidad:**
Los pagos de préstamos son cruciales para rastrear los ingresos del banco y el cumplimiento de los clientes con sus obligaciones financieras.

---

### 12. **Pago con Tarjeta de Crédito**

| Atributo     | Descripción                             |
| ------------ | --------------------------------------- |
| `id_pago`    | Identificador único del pago.           |
| `monto_pago` | Monto del pago realizado con tarjeta.   |
| `fecha_pago` | Fecha y hora en que se realizó el pago. |

🔹 **Por qué existe esta entidad:**
Los pagos con tarjeta de crédito son esenciales para controlar los saldos de las tarjetas y asegurar el pago puntual de las deudas de los clientes.

---

### 13. **Préstamo**

| Atributo            | Descripción                                 |
| ------------------- | ------------------------------------------- |
| `id_prestamo`       | Identificador único del préstamo.           |
| `monto`             | Monto total del préstamo.                   |
| `tasa_interes`      | Tasa de interés aplicada al préstamo.       |
| `fecha_desembolso`  | Fecha en que se desembolsó el préstamo.     |
| `fecha_vencimiento` | Fecha límite para el pago del préstamo.     |
| `saldo_pendiente`   | Monto que aún debe ser pagado del préstamo. |

🔹 **Por qué existe esta entidad:**
Los préstamos son productos financieros clave que permiten a los clientes acceder a fondos, generando ingresos para el banco a través de intereses.

---

### 14. **Rol**

| Atributo | Descripción                  |
| -------- | ---------------------------- |
| `id_rol` | Identificador único del rol. |
| `rol`    | Descripción del rol          |

🔹 **Por qué existe esta entidad:**
Los roles permiten definir las funciones y responsabilidades de cada empleado dentro del banco, facilitando la organización y la gestión del personal.

---

### 15. **Tarjeta de Crédito**

| Atributo           | Descripción                                           |
| ------------------ | ----------------------------------------------------- |
| `id_tarjeta`       | Identificador único de la tarjeta.                    |
| `limite_credito`   | Límite máximo de crédito permitido en la tarjeta.     |
| `saldo`            | Monto disponible en la tarjeta.                       |
| `fecha_emision`    |                                                       | Fecha de emisión de la tarjeta. |
| `fecha_expiracion` | Fecha de expiración de la tarjeta.                    |
| `fecha_corte`      | Fecha de corte para el estado de cuenta.              |
| `dia_ciclo`        | Día del mes en que se cierra el ciclo de facturación. |

🔹 **Por qué existe esta entidad:**
Las tarjetas de crédito son herramientas financieras que permiten a los clientes realizar compras a crédito, siendo esenciales para la operativa bancaria.

---

### 16. **Tipo de Agencia Sucursal**

| Atributo                   | Descripción                               |
| -------------------------- | ----------------------------------------- |
| `id_tipo_agencia_sucursal` | Identificador único del tipo de agencia.  |
| `tipo`                     | Descripción del tipo (sucursal, agencia). |

🔹 **Por qué existe esta entidad:**
Clasificar las agencias según su tipo ayuda a entender mejor la estructura del banco y a gestionar adecuadamente los recursos y servicios ofrecidos.

---

### 17. **Tipo de Cuentas**

| Atributo         | Descripción                                           |
| ---------------- | ----------------------------------------------------- |
| `id_tipo_cuenta` | Identificador único del tipo de cuenta.               |
| `nombre`         | Nombre del tipo de cuenta (ahorros, corriente, etc.). |

🔹 **Por qué existe esta entidad:**
Diferenciar entre tipos de cuentas permite ofrecer productos financieros variados que se adapten a las necesidades de diferentes clientes.

---

### 18. **Tipo de Transacción**

| Atributo              | Descripción                                  |
| --------------------- | -------------------------------------------- |
| `id_tipo_transaccion` | Identificador único del tipo de transacción. |
| `tipo`                | Descripción del tipo de transacción          |

🔹 **Por qué existe esta entidad:**
Clasificar las transacciones permite un mejor análisis de las operaciones, facilitando la auditoría y el control financiero.

---

### 19. **Transacción**

| Atributo         | Descripción                                              |
| ---------------- | -------------------------------------------------------- |
| `id_transaccion` | Identificador único de la transacción.                   |
| `cuenta_destino` | Identificador de la cuenta de destino de la transacción. |
| `monto`          | Monto de dinero involucrado en la transacción.           |
| `fecha`          | Fecha en la que se realizó la transacción.               |
| `descripcion`    | Descripción del intercambio entre las cuentas.           |

🔹 **Por qué existe esta entidad:**
Las transacciones son el registro detallado de todas las operaciones financieras, cruciales para la auditoría y el seguimiento de los movimientos de dinero en el sistema bancario.


# Normalización

<aside>
<img src="https://www.notion.so/icons/hexagon-five-sixths_red.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_red.svg" width="25px" /> No cumple con la primer forma normal (1FN)

</aside>

<aside>
<img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> No cumple con la segunda forma normal (2FN)

</aside>

<aside>
<img src="https://www.notion.so/icons/hexagon-five-sixths_blue.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_blue.svg" width="25px" /> No cumple con la tercera forma normal (3FN)

</aside>

<br/>

**Clientes**

| ID  | Nombre   | Apellido   | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> Número de Cuenta | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> Tipo de Cuenta | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> Saldo | Teléfono       |
| --- | -------- | ---------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------- |
| 1   | Nombre_1 | Apellido_1 | 70186741-1                                                                                                                                                              | Ahorro                                                                                                                                                                | 256848.49                                                                                                                                                    | +502 4634-7041 |
| 2   | Nombre_2 | Apellido_2 | 42148275-2                                                                                                                                                              | Ahorro                                                                                                                                                                | 378588.21                                                                                                                                                    | +502 2701-1140 |
| 3   | Nombre_3 | Apellido_3 | 95968205-3                                                                                                                                                              | Depósito Monetario                                                                                                                                                    | 294799.84                                                                                                                                                    | +502 6277-2079 |
| 4   | Nombre_4 | Apellido_4 | 74601803-4                                                                                                                                                              | Ahorro                                                                                                                                                                | 30357.74                                                                                                                                                     | +502 7371-9552 |
| 5   | Nombre_5 | Apellido_5 | 18184518-5                                                                                                                                                              | Ahorro                                                                                                                                                                | 270027.6                                                                                                                                                     | +502 1699-8122 |

<div align="center">
🔽🔽 Resultados tras Normalizar 🔽🔽
</div>

**Clientes**

| ID  | Nombre   | Apellido   | Teléfono       | Id_cuenta |
| --- | -------- | ---------- | -------------- | --------- |
| 1   | Nombre_1 | Apellido_1 | +502 4634-7041 | 1         |
| 2   | Nombre_2 | Apellido_2 | +502 2701-1140 | 2         |
| 3   | Nombre_3 | Apellido_3 | +502 6277-2079 | 3         |
| 4   | Nombre_4 | Apellido_4 | +502 7371-9552 | 4         |
| 5   | Nombre_5 | Apellido_5 | +502 1699-8122 | 5         |

**Cuentas**

| ID  | Número de Cuenta | ID Tipo de Cuenta | Saldo     |
| --- | ---------------- | ----------------- | --------- |
| 1   | 70186741-1       | 1                 | 256848.49 |
| 2   | 42148275-2       | 1                 | 378588.21 |
| 3   | 95968205-3       | 2                 | 294799.84 |
| 4   | 74601803-4       | 1                 | 30357.74  |
| 5   | 18184518-5       | 1                 | 270027.6  |

**Tipo de cuenta**

| ID  | Tipo de Cuenta |
| --- | -------------- |
| 1   | Ahorro         |
| 2   | Monetario      |

---

**Agencias**

| ID  | Nombre                       | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> Tipo | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" />  Departamento | <img src="https://www.notion.so/icons/hexagon-five-sixths_blue.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_blue.svg" width="25px" /> Municipio | Dirección | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> Código Postal | Teléfono       |
| --- | ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| 1   | Sucursal Antigua Guatemala 1 | Sucursal                                                                                                                                                    | Sacatepéquez                                                                                                                                                         | Antigua Guatemala                                                                                                                                            | Zona 7    | 91405                                                                                                                                                                | +502 8036-8423 |
| 2   | Sucursal Escuintla 2         | Sucursal                                                                                                                                                    | Escuintla                                                                                                                                                            | Escuintla                                                                                                                                                    | Zona 1    | 97145                                                                                                                                                                | +502 9525-7114 |
| 3   | Sucursal Quetzaltenango 3    | Sucursal                                                                                                                                                    | Quetzaltenango                                                                                                                                                       | Quetzaltenango                                                                                                                                               | Zona 1    | 53915                                                                                                                                                                | +502 2873-4763 |
| 4   | Sucursal Cobán 4             | Sucursal                                                                                                                                                    | Alta Verapaz                                                                                                                                                         | Cobán                                                                                                                                                        | Zona 8    | 31535                                                                                                                                                                | +502 6809-5562 |
| 5   | Sucursal Flores 5            | Sucursal                                                                                                                                                    | Petén                                                                                                                                                                | Flores                                                                                                                                                       | Zona 10   | 63389                                                                                                                                                                | +502 5942-1959 |

<div align="center">
🔽🔽 Resultados tras Normalizar 🔽🔽
</div>

**Agencias/Sucursales**

| ID  | Nombre                       | ID_tipo_agencia_sucursal | Teléfono       | ID_Departamento | Dirección |
| --- | ---------------------------- | ------------------------ | -------------- | --------------- | --------- |
| 1   | Sucursal Antigua Guatemala 1 | 1                        | +502 8036-8423 | 1               | Zona 7    |
| 2   | Sucursal Escuintla 2         | 1                        | +502 9525-7114 | 2               | Zona 1    |
| 3   | Sucursal Quetzaltenango 3    | 1                        | +502 2873-4763 | 3               | Zona 1    |
| 4   | Sucursal Cobán 4             | 2                        | +502 6809-5562 | 4               | Zona 8    |
| 5   | Sucursal Flores 5            | 1                        | +502 5942-1959 | 5               | Zona 10   |

**Departamentos**

| ID  | Departamento   |
| --- | -------------- |
| 1   | Sacatepéquez   |
| 2   | Escuintla      |
| 3   | Quetzaltenango |
| 4   | Alta Verapaz   |
| 5   | Petén          |

**Municipio**
| id  | nombre            | id_departamento | Código Postal |
| --- | ----------------- | --------------- | ------------- |
| 1   | Antigua Guatemala | 1               | 91405         |
| 2   | Escuintla         | 2               | 97145         |
| 3   | Quetzaltenango    | 3               | 53915         |
| 4   | Cobán             | 4               | 31535         |
| 5   | Flores            | 5               | 63389         |

**Tipo_Agencia_sucursal**

| ID  | Departamento |
| --- | ------------ |
| 1   | Sucursal     |
| 2   | Agencia      |


---

**Tarjetas de crédito**

| ID Tarjeta | ID Cliente | Número de Tarjeta | Límite de Crédito | Saldo Actual | Fecha de Emisión | Fecha de Expiración | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> Estado | Fecha de Corte | Día del Ciclo |
| ---------- | ---------- | ----------------- | ----------------- | ------------ | ---------------- | ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------- |
| 1          | 558120     | 4872410269895827  | 4344.96           | 20358.67     | 2022-02-09       | 2025-05-04          | Bloqueada                                                                                                                                                     | 2022-03-06     | 6             |
| 2          | 443984     | 4,78043E+15       | 48263.8           | 12583.92     | 2021-04-29       | 2025-11-10          | Activa                                                                                                                                                        | 2021-05-26     | 26            |
| 3          | 709855     | 4653562424107275  | 37894.69          | 16274.3      | 2021-12-10       | 2026-08-08          | Bloqueada                                                                                                                                                     | 2022-01-08     | 8             |
| 4          | 495584     | 4935123661880312  | 3610.3            | 31113.15     | 2020-11-21       | 2025-07-26          | Bloqueada                                                                                                                                                     | 2020-12-18     | 18            |
| 5          | 621646     | 4,91859E+15       | 35118.01          | 5054.92      | 2023-10-06       | 2028-02-05          | Cancelada                                                                                                                                                     | 2023-11-05     | 5             |

<div align="center">
🔽🔽 Resultados tras Normalizar 🔽🔽
</div>


**Tarjetas de credito**

| ID Tarjeta | ID Cliente | Número de Tarjeta | Límite de Crédito | Saldo Actual | Fecha de Emisión | Fecha de Expiración | ID Estado | Fecha de Corte | Día del Ciclo |
| ---------- | ---------- | ----------------- | ----------------- | ------------ | ---------------- | ------------------- | --------- | -------------- | ------------- |
| 1          | 558120     | 4872410269895827  | 4344.96           | 20358.67     | 2022-02-09       | 2025-05-04          | 3         | 2022-03-06     | 6             |
| 2          | 443984     | 4,78043E+15       | 48263.8           | 12583.92     | 2021-04-29       | 2025-11-10          | 1         | 2021-05-26     | 26            |
| 3          | 709855     | 4653562424107275  | 37894.69          | 16274.3      | 2021-12-10       | 2026-08-08          | 3         | 2022-01-08     | 8             |
| 4          | 495584     | 4935123661880312  | 3610.3            | 31113.15     | 2020-11-21       | 2025-07-26          | 3         | 2020-12-18     | 18            |
| 5          | 621646     | 4,91859E+15       | 35118.01          | 5054.92      | 2023-10-06       | 2028-02-05          | 2         | 2023-11-05     | 5             |

**Estado de la tarjeta**

| ID Estado | Estado    |
| --------- | --------- |
| 1         | Activa    |
| 2         | Cancelada |
| 3         | Bloqueada |

---

**Prestamos**

| ID Préstamo | ID Cliente | Monto del Préstamo | Tasa de Interés | Fecha de Desembolso | Fecha de Vencimiento | Saldo Pendiente | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> Estado del Préstamo |
| ----------- | ---------- | ------------------ | --------------- | ------------------- | -------------------- | --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1           | 495798     | 964203.64          | 6.63            | 2023-11-19          | 2032-06-06           | 674174.18       | Vencido                                                                                                                                                                    |
| 2           | 42734      | 811935.67          | 13.42           | 2023-05-07          | 2028-08-29           | 756664.53       | Activo                                                                                                                                                                     |
| 3           | 540710     | 961457.89          | 13.68           | 2021-10-28          | 2030-03-10           | 200162.19       | Vencido                                                                                                                                                                    |
| 4           | 983331     | 78869.24           | 11.42           | 2023-05-14          | 2026-12-17           | 67546.61        | Vencido                                                                                                                                                                    |
| 5           | 409214     | 456168.05          | 6.93            | 2020-05-18          | 2026-07-08           | 729762.37       | Activo                                                                                                                                                                     |

<div align="center">
🔽🔽 Resultados tras Normalizar 🔽🔽
</div>

**Prestamos**

| ID Préstamo | ID Cliente | Monto del Préstamo | Tasa de Interés | Fecha de Desembolso | Fecha de Vencimiento | Saldo Pendiente | ID Estado Prestamo |
| ----------- | ---------- | ------------------ | --------------- | ------------------- | -------------------- | --------------- | ------------------ |
| 1           | 495798     | 964203.64          | 6.63            | 2023-11-19          | 2032-06-06           | 674174.18       | 1                  |
| 2           | 42734      | 811935.67          | 13.42           | 2023-05-07          | 2028-08-29           | 756664.53       | 1                  |
| 3           | 540710     | 961457.89          | 13.68           | 2021-10-28          | 2030-03-10           | 200162.19       | 2                  |
| 4           | 983331     | 78869.24           | 11.42           | 2023-05-14          | 2026-12-17           | 67546.61        | 1                  |
| 5           | 409214     | 456168.05          | 6.93            | 2020-05-18          | 2026-07-08           | 729762.37       | 3                  |

**Estado del prestamos**

| ID_Prestamo | Estado del Préstamo |
| ----------- | ------------------- |
| 1           | Activo              |
| 2           | Vencido             |
| 3           | Cancelado           |

---

**Empleado**

| ID  | Nombre   | Apellido   | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> Rol | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> Departamento | Teléfono       |
| --- | -------- | ---------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| 1   | Nombre_1 | Apellido_1 | Auditor Interno                                                                                                                                            | Petén                                                                                                                                                               | +502 7815-2167 |
| 2   | Nombre_2 | Apellido_2 | Administrador                                                                                                                                              | Chiquimula                                                                                                                                                          | +502 3808-9764 |
| 3   | Nombre_3 | Apellido_3 | Atención al Cliente                                                                                                                                        | Jutiapa                                                                                                                                                             | +502 4899-1699 |
| 4   | Nombre_4 | Apellido_4 | Oficial de Crédito                                                                                                                                         | Quetzaltenango                                                                                                                                                      | +502 3452-1726 |
| 5   | Nombre_5 | Apellido_5 | Soporte Técnico                                                                                                                                            | Jutiapa                                                                                                                                                             | +502 8283-6524 |

<div align="center">
🔽🔽 Resultados tras Normalizar 🔽🔽
</div>

| ID  | Nombre   | Apellido   | ID Tipo Rol | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> Departamento | Teléfono       |
| --- | -------- | ---------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------- |
| 1   | Nombre_1 | Apellido_1 | 1           | Petén                                                                                                                                                               | +502 7815-2167 |
| 2   | Nombre_2 | Apellido_2 | 2           | Chiquimula                                                                                                                                                          | +502 3808-9764 |
| 3   | Nombre_3 | Apellido_3 | 3           | Jutiapa                                                                                                                                                             | +502 4899-1699 |
| 4   | Nombre_4 | Apellido_4 | 1           | Quetzaltenango                                                                                                                                                      | +502 3452-1726 |
| 5   | Nombre_5 | Apellido_5 | 1           | Jutiapa                                                                                                                                                             | +502 8283-6524 |

**Tipos Roles**

| ID_tipo_rol | Nombre                   |
| ----------- | ------------------------ |
| 1           | Cajero                   |
| 2           | Asistente Administrativo |
| 3           | Jefe de Operaciones      |


---

**Transacciones**

| ID Transacción | ID Cliente | Número de Cuenta | <img src="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" alt="https://www.notion.so/icons/hexagon-five-sixths_orange.svg" width="25px" /> Tipo de Transacción | Monto   | Fecha      | Hora     | Descripción                       | Sucursal/Agencia     |
| -------------- | ---------- | ---------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | ---------- | -------- | --------------------------------- | -------------------- |
| 1              | 455902     | 58639163-455902  | Transferencia                                                                                                                                                              | 2865.8  | 2023-10-24 | 14:28:01 | Transacción de tipo Transferencia | Sucursal/Agencia 221 |
| 2              | 469824     | 99757988-469824  | Depósito                                                                                                                                                                   | 2438.92 | 2023-12-09 | 14:28:01 | Transacción de tipo Depósito      | Sucursal/Agencia 257 |
| 3              | 626567     | 19969005-626567  | Transferencia                                                                                                                                                              | 9494.98 | 2024-06-01 | 14:28:01 | Transacción de tipo Transferencia | Sucursal/Agencia 874 |
| 4              | 784443     | 95861936-784443  | Pago                                                                                                                                                                       | 8399.08 | 2023-12-26 | 14:28:01 | Transacción de tipo Pago          | Sucursal/Agencia 265 |
| 5              | 421423     | 21672609-421423  | Depósito                                                                                                                                                                   | 7722.1  | 2022-12-27 | 14:28:01 | Transacción de tipo Depósito      | Sucursal/Agencia 986 |

<div align="center">
🔽🔽 Resultados tras Normalizar 🔽🔽
</div>

**Transacciones**


| ID Transacción | ID Cliente | Número de Cuenta Origen | Número de Cuenta Destino | Tipo de Transacción | Monto   | Fecha      | Hora     | Descripción               | Sucursal  | Agencia     |
| -------------- | ---------- | ----------------------- | ------------------------ | ------------------- | ------- | ---------- | -------- | ------------------------- | --------- | ----------- |
| 1              | 455902     | 58639163                | 455902                   | 1                   | 2865.8  | 2023-10-24 | 14:28:01 | Certificación             | Sucursal/ | Agencia 221 |
| 2              | 469824     | 99757988                | 469824                   | 2                   | 2438.92 | 2023-12-09 | 14:28:01 | Deposito para apartamento | Sucursal/ | Agencia 257 |
| 3              | 626567     | 19969005                | 626567                   | 1                   | 9494.98 | 2024-06-01 | 14:28:01 |                           | Sucursal/ | Agencia 874 |
| 4              | 784443     | 95861936                | 784443                   | 3                   | 8399.08 | 2023-12-26 | 14:28:01 |                           | Sucursal/ | Agencia 265 |
| 5              | 421423     | 21672609                | 21672609                 | 2                   | 7722.1  | 2022-12-27 | 14:28:01 |                           | Sucursal/ | Agencia 986 |

**Tipo de Transacción**

| ID  | Tipo de Transacción |
| --- | ------------------- |
| 1   | Transferencia       |
| 2   | Depósito            |
| 3   | Pago                |

---

**compras_tc**

| ID Compra | Monto   | Fecha               | Descripción                 | Número Tarjeta   |
| --------- | ------- | ------------------- | --------------------------- | ---------------- |
| 1         | 150.00  | 2023-01-10 10:00:00 | Compra de libros            | 1234567812345678 |
| 2         | 300.50  | 2023-01-15 12:30:00 | Compra de ropa              | 2345678923456789 |
| 3         | 500.25  | 2023-02-20 14:15:00 | Compra de electrodomésticos | 3456789034567890 |
| 4         | 75.80   | 2023-03-01 09:00:00 | Compra de alimentos         | 4567890145678901 |
| 5         | 1200.99 | 2023-03-10 16:45:00 | Compra de muebles           | 5678901256789012 |

---

**pagos_tc**

| ID Pago | Monto   | Fecha               | Número Tarjeta   |
| ------- | ------- | ------------------- | ---------------- |
| 1       | 150.00  | 2023-01-11 10:00:00 | 1234567812345678 |
| 2       | 300.50  | 2023-01-16 12:30:00 | 2345678923456789 |
| 3       | 500.25  | 2023-02-21 14:15:00 | 3456789034567890 |
| 4       | 75.80   | 2023-03-02 09:00:00 | 4567890145678901 |
| 5       | 1200.99 | 2023-03-11 16:45:00 | 5678901256789012 |

---

**auditorias_transacciones**

| ID Auditoría | Comentario                         | ID Transacción | ID Empleado |
| ------------ | ---------------------------------- | -------------- | ----------- |
| 1            | Transacción revisada correctamente | 1              | 101         |
| 2            | Transacción sospechosa             | 2              | 102         |
| 3            | Transacción aprobada               | 3              | 103         |
| 4            | Error en la transacción            | 4              | 104         |
| 5            | Transacción completada             | 5              | 105         |

---

**pagos_prestamos**

| ID Pago Préstamo | Monto   | Fecha               | ID Préstamo |
| ---------------- | ------- | ------------------- | ----------- |
| 1                | 1000.00 | 2023-01-10 10:00:00 | 1           |
| 2                | 500.00  | 2023-02-15 12:30:00 | 2           |
| 3                | 750.00  | 2023-03-20 14:15:00 | 3           |
| 4                | 300.00  | 2023-04-01 09:00:00 | 4           |
| 5                | 600.00  | 2023-05-05 16:45:00 | 5           |



## Diagrama Matricial 

| **Tablas**                | **Agencia** | **Auditoría Transacción** | **Cliente** | **Compra TC** | **Cuenta**    | **Departamento** | **Empleado**  | **Estado Préstamo** | **Estado Tarjeta** | **Municipio** | **Pago Préstamo** | **Pago TC** | **Préstamo** | **Rol**   | **Tarjeta Crédito** | **Tipo Agencia Sucursal** | **Tipo Cuentas** | **Tipo Transacción** | **Transacción** |
| ------------------------- | ----------- | ------------------------- | ----------- | ------------- | ------------- | ---------------- | ------------- | ------------------- | ------------------ | ------------- | ----------------- | ----------- | ------------ | --------- | ------------------- | ------------------------- | ---------------- | -------------------- | --------------- |
| **Agencia**               | ——-         | No aplica                 | No aplica   | No aplica     | No aplica     | pertenece        | tiene         | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | tiene                     | No aplica        | No aplica            | No aplica       |
| **Auditoría Transacción** | No aplica   | ——-                       | No aplica   | No aplica     | No aplica     | No aplica        | realizada por | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | Es auditada     |
| **Cliente**               | No aplica   | No aplica                 | ——-         | No aplica     | tiene         | No aplica        | No aplica     | no aplica           | No aplica          | No aplica     | No aplica         | No aplica   | hace         | No aplica | tiene               | No aplica                 | No aplica        | No aplica            | hace            |
| **Compra TC**             | No aplica   | No aplica                 | No aplica   | ——-           | No aplica     | No aplica        | No aplica     | No aplica           | No aplica          | No aplica     | No aplica         | No Aplica   | No aplica    | No aplica | realizada por       | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Cuenta**                | No aplica   | No aplica                 | pertenece   | No aplica     | ——-           | No aplica        | No aplica     | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | pertenece        | No aplica            | realiza         |
| **Departamento**          | tiene       | No aplica                 | No aplica   | No aplica     | No aplica     | ——-              | No aplica     | No aplica           | No aplica          | tiene         | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Empleado**              | trabaja     | No aplica                 | No aplica   | No aplica     | No aplica     | No aplica        | ——-           | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | tiene     | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Estado Préstamo**       | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica     | No aplica        | No aplica     | ——-                 | No aplica          | No aplica     | No aplica         | No aplica   | pertenece    | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Estado Tarjeta**        | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica     | No aplica        | No aplica     | No aplica           | ——-                | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | aplica a            | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Municipio**             | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica     | pertenece        | No aplica     | No aplica           | No aplica          | ——-           | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Pago Préstamo**         | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica     | No aplica        | No aplica     | No aplica           | No aplica          | No aplica     | ——-               | No aplica   | hecho por    | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Pago TC**               | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica     | No aplica        | No aplica     | No aplica           | pertenece          | No aplica     | No aplica         | ——-         | No aplica    | No aplica | pertenece           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Préstamo**              | No aplica   | No aplica                 | hecho por   | No aplica     | No aplica     | No aplica        | No aplica     | aplica a            | No aplica          | No aplica     | No aplica         | No aplica   | ——-          | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Rol**                   | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica     | No aplica        | es ocupado    | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | ——-       | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Tarjeta Crédito**       | No aplica   | No aplica                 | pertenece   | No aplica     | No aplica     | No aplica        | No aplica     | No aplica           | tiene              | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | ——-                 | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Tipo Agencia Sucursal** | pertenece   | No aplica                 | No aplica   | No aplica     | No aplica     | No aplica        | No aplica     | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | ——-                       | No aplica        | No aplica            | No aplica       |
| **Tipo Cuentas**          | No aplica   | No aplica                 | No aplica   | No aplica     | pertenece     | No aplica        | No aplica     | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | ——-              | No aplica            | No aplica       |
| **Tipo Transacción**      | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica     | No aplica        | No aplica     | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | No aplica        | ——-                  | pertenece       |
| **Transacción**           | No aplica   | involucra                 | No aplica   | No aplica     | realizada por | No aplica        | No aplica     | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | ——-             |

## Relaciones

| **Tablas**                | **Agencia** | **Auditoría Transacción** | **Cliente** | **Compra TC** | **Cuenta** | **Departamento** | **Empleado** | **Estado Préstamo** | **Estado Tarjeta** | **Municipio** | **Pago Préstamo** | **Pago TC** | **Préstamo** | **Rol**   | **Tarjeta Crédito** | **Tipo Agencia Sucursal** | **Tipo Cuentas** | **Tipo Transacción** | **Transacción** |
| ------------------------- | ----------- | ------------------------- | ----------- | ------------- | ---------- | ---------------- | ------------ | ------------------- | ------------------ | ------------- | ----------------- | ----------- | ------------ | --------- | ------------------- | ------------------------- | ---------------- | -------------------- | --------------- |
| **Agencia**               | ---         | No aplica                 | No aplica   | No aplica     | No aplica  | N:1              | 1:N          | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | 1:1                       | No aplica        | No aplica            | No aplica       |
| **Auditoría Transacción** | No aplica   | ---                       | No aplica   | No aplica     | No aplica  | No aplica        | N:1          | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | N:1             |
| **Cliente**               | No aplica   | No aplica                 | ---         | No aplica     | 1:N        | No aplica        | No aplica    | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | 1:N          | No aplica | 1:N                 | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Compra TC**             | No aplica   | No aplica                 | No aplica   | ---           | No aplica  | No aplica        | No aplica    | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | N:1                 | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Cuenta**                | No aplica   | No aplica                 | N:1         | No aplica     | ---        | No aplica        | No aplica    | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | 1:N              | No aplica            | N:N             |
| **Departamento**          | 1:N         | No aplica                 | No aplica   | No aplica     | No aplica  | ---              | No aplica    | No aplica           | No aplica          | 1:N           | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Empleado**              | 1:N         | 1:N                       | No aplica   | No aplica     | No aplica  | No aplica        | ---          | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | 1:1       | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Estado Préstamo**       | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica  | No aplica        | No aplica    | ---                 | No aplica          | No aplica     | 1:1               | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Estado Tarjeta**        | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica  | No aplica        | No aplica    | No aplica           | ---                | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | 1:1                 | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Municipio**             | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica  | N:1              | No aplica    | No aplica           | No aplica          | ---           | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Pago Préstamo**         | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica  | No aplica        | No aplica    | No aplica           | No aplica          | No aplica     | ---               | No aplica   | N:1          | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Pago TC**               | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica  | No aplica        | No aplica    | No aplica           | No aplica          | No aplica     | No aplica         | ---         | No aplica    | No aplica | N:1                 | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Préstamo**              | No aplica   | No aplica                 | N:1         | No aplica     | No aplica  | No aplica        | No aplica    | 1:1                 | No aplica          | No aplica     | N:1               | No aplica   | ---          | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Rol**                   | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica  | No aplica        | 1:1          | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | ---       | No aplica           | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Tarjeta Crédito**       | No aplica   | No aplica                 | N:1         | 1:N           | No aplica  | No aplica        | No aplica    | No aplica           | 1:1                | No aplica     | No aplica         | 1:N         | No aplica    | No aplica | ---                 | No aplica                 | No aplica        | No aplica            | No aplica       |
| **Tipo Agencia Sucursal** | 1:N         | No aplica                 | No aplica   | No aplica     | No aplica  | No aplica        | No aplica    | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | ---                       | No aplica        | No aplica            | No aplica       |
| **Tipo Cuentas**          | No aplica   | No aplica                 | No aplica   | No aplica     | 1:1        | No aplica        | No aplica    | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | ---              | No aplica            | No aplica       |
| **Tipo Transacción**      | No aplica   | No aplica                 | No aplica   | No aplica     | No aplica  | No aplica        | No aplica    | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | No aplica        | ---                  | 1:1             |
| **Transacción**           | No aplica   | 1:N                       | N:1         | No aplica     | N:1        | No aplica        | No aplica    | No aplica           | No aplica          | No aplica     | No aplica         | No aplica   | No aplica    | No aplica | No aplica           | No aplica                 | No aplica        | No aplica            | ---             |




## 🧠 Modelo Logico

![alt text](imgs/Logical.jpg)


**CLIENTE - TARJETA_CREDITO**

- Cada elemento de la entidad **CLIENTE** puede estar asociado con uno o muchos elementos de la entidad **TARJETA_CREDITO**.
- Cada elemento de la entidad **TARJETA_CREDITO** debe estar asociado con uno y solamente un elemento de la entidad **CLIENTE**.

---

**CLIENTE - PRESTAMO**

- Cada elemento de la entidad **CLIENTE** puede estar asociado con uno o muchos elementos de la entidad **PRESTAMO**.
- Cada elemento de la entidad **PRESTAMO** debe estar asociado con uno y solamente un elemento de la entidad **CLIENTE**.

---

**CLIENTE - CUENTA**

- Cada elemento de la entidad **CLIENTE** puede estar asociado con uno o muchos elementos de la entidad **CUENTA**.
- Cada elemento de la entidad **CUENTA** debe estar asociado con uno y solamente un elemento de la entidad **CLIENTE**.

---

**CUENTA - TRANSACCION**

- Cada elemento de la entidad **CUENTA** puede estar asociado con uno o muchos elementos de la entidad **TRANSACCION**.
- Cada elemento de la entidad **TRANSACCION** debe estar asociado con uno y solamente un elemento de la entidad **CUENTA**.

---

**TARJETA_CREDITO - PAGO_TC**

- Cada elemento de la entidad **TARJETA_CREDITO** puede estar asociado con uno o muchos elementos de la entidad **PAGO_TC**.
- Cada elemento de la entidad **PAGO_TC** debe estar asociado con uno y solamente un elemento de la entidad **TARJETA_CREDITO**.

---

**EMPLEADO - AGENCIA**

- Cada elemento de la entidad **AGENCIA** puede estar asociado con uno o muchos elementos de la entidad **EMPLEADO**.
- Cada elemento de la entidad **EMPLEADO** debe estar asociado con uno y solamente un elemento de la entidad **AGENCIA**.

---

**EMPLEADO - TRANSACCION**

- Cada elemento de la entidad **EMPLEADO** puede estar asociado con uno o muchos elementos de la entidad **TRANSACCION**.
- Cada elemento de la entidad **TRANSACCION** debe estar asociado con uno y solamente un elemento de la entidad **EMPLEADO**.

---

**TARJETA_CREDITO - COMPRA_TC**

- Cada elemento de la entidad **TARJETA_CREDITO** puede estar asociado con uno o muchos elementos de la entidad **COMPRA_TC**.
- Cada elemento de la entidad **COMPRA_TC** debe estar asociado con uno y solamente un elemento de la entidad **TARJETA_CREDITO**.

---

**TARJETA_CREDITO - ESTADO_TARJETA**

- Cada elemento de la entidad **ESTADO_TARJETA** puede estar asociado con uno y solo un elemento de la entidad **TARJETA_CREDITO**.
- Cada elemento de la entidad **TARJETA_CREDITO** debe estar asociado con uno y solamente un elemento de la entidad **ESTADO_TARJETA**.

---

**PRESTAMO - PAGO_PRESTAMO**

- Cada elemento de la entidad **PRESTAMO** puede estar asociado con uno o muchos elementos de la entidad **PAGO_PRESTAMO**.
- Cada elemento de la entidad **PAGO_PRESTAMO** debe estar asociado con uno y solamente un elemento de la entidad **PRESTAMO**.

---

**PRESTAMO - ESTADO_PRESTAMO**

- Cada elemento de la entidad **ESTADO_PRESTAMO** puede estar asociado con uno y solo un elemento de la entidad **PRESTAMO**.
- Cada elemento de la entidad **PRESTAMO** debe estar asociado con uno y solamente un elemento de la entidad **ESTADO_PRESTAMO**.

---

**CUENTA - TIPO_CUENTA**

- Cada elemento de la entidad **TIPO_CUENTA** puede estar asociado con uno y solo un elemento de la entidad **CUENTA**.
- Cada elemento de la entidad **CUENTA** debe estar asociado con uno y solamente un elemento de la entidad **TIPO_CUENTA**.

---

**AGENCIA - TIPO_AGENCIA_SUCURSAL**

- Cada elemento de la entidad **TIPO_AGENCIA_SUCURSAL** puede estar asociado con uno y solo un elemento de la entidad **AGENCIA**.
- Cada elemento de la entidad **AGENCIA** debe estar asociado con uno y solamente un elemento de la entidad **TIPO_AGENCIA_SUCURSAL**.

---

**DEPARTAMENTO - MUNICIPIO**

- Cada elemento de la entidad **DEPARTAMENTO** puede estar asociado con uno o muchos elementos de la entidad **MUNICIPIO**.
- Cada elemento de la entidad **MUNICIPIO** debe estar asociado con uno y solamente un elemento de la entidad **DEPARTAMENTO**.

---

**ROL - EMPLEADO**

- Cada elemento de la entidad **ROL** puede estar asociado con uno o muchos elementos de la entidad **EMPLEADO**.
- Cada elemento de la entidad **EMPLEADO** debe estar asociado con uno y solamente un elemento de la entidad **ROL**.

## Modelo Fisico

![alt text](imgs/Relational.jpg)


## Implementación

### **Tabla `tipos_cuentas`**:

```sql
CREATE TABLE tipos_cuentas
(
    id_tipo_cuenta NUMBER PRIMARY KEY,
    nombre         VARCHAR2(20) NOT NULL UNIQUE
);
```

- **`id_tipo_cuenta`**: Clave primaria que identifica de manera única a cada tipo de cuenta.
- **`nombre`**: Campo único y obligatorio que almacena el nombre del tipo de cuenta, como "Cuenta Corriente" o "Cuenta de Ahorros". La restricción **UNIQUE** garantiza que no se repitan nombres de tipos de cuentas.

---

### **Tabla `estados_prestamos`**:

```sql
CREATE TABLE estados_prestamos
(
    id_estado_prestamo NUMBER PRIMARY KEY,
    estado             VARCHAR2(9) NOT NULL UNIQUE
);
```

- **`id_estado_prestamo`**: Clave primaria para identificar cada estado de un préstamo.
- **`estado`**: Nombre del estado (por ejemplo, "Aprobado", "Rechazado"). Este campo es único y obligatorio.

---

### **Tabla `estados_tarjetas`**:

```sql
CREATE TABLE estados_tarjetas
(
    id_estado NUMBER PRIMARY KEY,
    estado    VARCHAR2(10) NOT NULL UNIQUE
);
```

- **`id_estado`**: Clave primaria que identifica cada estado.
- **`estado`**: Nombre del estado de la tarjeta de crédito (ej. "Activa", "Bloqueada"). Este campo es obligatorio y único.

---

### **Tabla `tipos_roles`**:

```sql
CREATE TABLE tipos_roles
(
    id_rol NUMBER PRIMARY KEY,
    rol    VARCHAR2(35) NOT NULL UNIQUE
);
```

- **`id_rol`**: Clave primaria que identifica cada rol de empleado.
- **`rol`**: Almacena el nombre del rol (ej. "Gerente", "Cajero"). El campo es obligatorio y único.

---

### **Tabla `departamentos`**:

```sql
CREATE TABLE departamentos
(
    id_departamento NUMBER PRIMARY KEY,
    nombre          VARCHAR(14) NOT NULL UNIQUE
);
```

- **`id_departamento`**: Clave primaria que identifica cada departamento.
- **`nombre`**: Nombre del departamento (ej. "Marketing", "Ventas"). Es obligatorio y único.

---

### **Tabla `municipios`**:

```sql
CREATE TABLE municipios
(
    id_municipio    NUMBER PRIMARY KEY,
    nombre          VARCHAR2(27) NOT NULL UNIQUE,
    codigo_Postal   NUMBER       NOT NULL,
    id_departamento NUMBER       NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamentos (id_departamento)
);
```

- **`id_municipio`**: Clave primaria que identifica cada municipio.
- **`nombre`**: Nombre del municipio, es único y obligatorio.
- **`codigo_Postal`**: Código postal del municipio, es obligatorio.
- **`id_departamento`**: Clave foránea que vincula al municipio con un departamento.

---

### **Tabla `tipos_agencias_sucursales`**:

```sql
CREATE TABLE tipos_agencias_sucursales
(
    id_tipo_agencia_sucursal NUMBER PRIMARY KEY,
    tipo                     VARCHAR2(8) NOT NULL UNIQUE
);
```

- **`id_tipo_agencia_sucursal`**: Clave primaria que identifica el tipo de agencia o sucursal.
- **`tipo`**: Nombre del tipo de agencia (ej. "Banco", "Sucursal"), es obligatorio y único.

---

### **Tabla `agencias`**:

```sql
CREATE TABLE agencias
(
    id_agencia               NUMBER PRIMARY KEY,
    nombre                   VARCHAR2(50) NOT NULL,
    telefono                 VARCHAR2(14) NOT NULL UNIQUE,
    direccion                VARCHAR2(50) NOT NULL,
    id_departamento          NUMBER       NOT NULL,
    id_tipo_agencia_sucursal NUMBER       NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamentos (id_departamento),
    FOREIGN KEY (id_tipo_agencia_sucursal) REFERENCES tipos_agencias_sucursales (id_tipo_agencia_sucursal)
);
```

- **`id_agencia`**: Clave primaria que identifica la agencia.
- **`nombre`**: Nombre de la agencia, es obligatorio.
- **`telefono`**: Teléfono único de la agencia.
- **`direccion`**: Dirección de la agencia.
- **`id_departamento`**: Clave foránea que vincula la agencia con un departamento.
- **`id_tipo_agencia_sucursal`**: Clave foránea que identifica el tipo de la agencia o sucursal.

---

### **Tabla `clientes`**:

```sql
CREATE TABLE clientes
(
    id_cliente NUMBER PRIMARY KEY,
    nombre     VARCHAR2(50) NOT NULL,
    apellido   VARCHAR2(50) NOT NULL,
    telefono   VARCHAR2(14) NOT NULL UNIQUE
);
```

- **`id_cliente`**: Clave primaria que identifica a cada cliente.
- **`nombre`** y **`apellido`**: Campos obligatorios que almacenan el nombre y apellido del cliente.
- **`telefono`**: Teléfono único de cada cliente, es obligatorio.

---

### **Tabla `cuentas`**:

```sql
CREATE TABLE cuentas
(
    numero_cuenta  VARCHAR(10) PRIMARY KEY,
    saldo          NUMBER(10, 2) NOT NULL CHECK ( saldo >= 0 ),
    fecha_apertura DATE          NOT NULL,
    id_tipo_cuenta NUMBER        NOT NULL,
    id_cliente     NUMBER        NOT NULL,
    FOREIGN KEY (id_tipo_cuenta) REFERENCES tipos_cuentas (id_tipo_cuenta),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);
```

- **`numero_cuenta`**: Clave primaria de la cuenta bancaria.
- **`saldo`**: El saldo actual de la cuenta. La restricción **CHECK (saldo >= 0)** asegura que no haya saldos negativos.
- **`fecha_apertura`**: Fecha en que se abrió la cuenta.
- **`id_tipo_cuenta`** y **`id_cliente`**: Claves foráneas que vinculan la cuenta con su tipo y el cliente propietario.

---

### **Tabla `prestamos`**:

```sql
CREATE TABLE prestamos
(
    id_prestamo        NUMBER PRIMARY KEY,
    monto              NUMBER(10, 2) NOT NULL CHECK ( monto > 0 ),
    tasa_interes       NUMBER(5, 2)  NOT NULL CHECK ( tasa_interes > 0 AND tasa_interes < 100 ),
    fecha_desembolso   DATE          NOT NULL,
    fecha_vencimiento  DATE          NOT NULL,
    saldo_pendiente    NUMBER(10, 2) NOT NULL CHECK ( saldo_pendiente >= 0 ),
    id_cliente         NUMBER        NOT NULL,
    id_estado_prestamo NUMBER        NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_estado_prestamo) REFERENCES estados_prestamos (id_estado_prestamo),
    CONSTRAINT chk_fecha_vencimiento CHECK (fecha_vencimiento > fecha_desembolso)
);
```

- **`monto`**: El monto del préstamo, debe ser mayor que 0, validado por **CHECK (monto > 0)**.
- **`tasa_interes`**: La tasa de interés del préstamo, validada por **CHECK (tasa_interes > 0 AND tasa_interes < 100)** para asegurar que esté en un rango lógico.
- **`fecha_vencimiento`**: Debe ser posterior a la fecha de desembolso, validada con **CHECK (fecha_vencimiento > fecha_desembolso)**.
- **`saldo_pendiente`**: El saldo del préstamo no puede ser negativo, validado con **CHECK (saldo_pendiente >= 0)**.

---

### **Tabla `pagos_prestamos`**:

```sql
CREATE TABLE pagos_prestamos
(
    id_pago_prestamo NUMBER PRIMARY KEY,
    monto            NUMBER(10, 2) NOT NULL CHECK ( monto > 0 ),
    fecha            TIMESTAMP     NOT NULL,
    id_prestamo      NUMBER        NOT NULL,
    FOREIGN KEY (id_prestamo) REFERENCES prestamos (id_prestamo)
);
```

- **`monto`**: El monto del pago no puede ser negativo, validado con **CHECK (monto > 0)**.
- **`id_prestamo`**: Clave foránea que vincula el pago al préstamo correspondiente.

---

### **Tabla `tipos_transacciones`**:

```sql
CREATE TABLE tipos_transacciones
(
    id_tipo_transaccion NUMBER PRIMARY KEY,
    tipo                VARCHAR2(15) NOT NULL UNIQUE
);
```


---

### **Tabla `tipos_transacciones`**:

```sql
CREATE TABLE tipos_transacciones
(
    id_tipo_transaccion NUMBER PRIMARY KEY,
    tipo                VARCHAR2(15) NOT NULL UNIQUE
);
```

- **`id_tipo_transaccion`**: Clave primaria que identifica cada tipo de transacción.
- **`tipo`**: Nombre del tipo de transacción (ej. "Depósito", "Retiro"). Es un campo obligatorio y único para garantizar que no se repitan tipos de transacciones.

---

### **Tabla `empleados`**:

```sql
CREATE TABLE empleados
(
    id_empleado     NUMBER PRIMARY KEY,
    nombre          VARCHAR2(50) NOT NULL,
    apellido        VARCHAR2(50) NOT NULL,
    telefono        VARCHAR2(14) NOT NULL UNIQUE,
    id_rol          NUMBER       NOT NULL,
    id_agencia      NUMBER       NOT NULL,
    id_departamento NUMBER       NOT NULL,
    FOREIGN KEY (id_rol) REFERENCES tipos_roles (id_rol),
    FOREIGN KEY (id_agencia) REFERENCES agencias (id_agencia),
    FOREIGN KEY (id_departamento) REFERENCES departamentos (id_departamento)
);
```

- **`id_empleado`**: Clave primaria que identifica cada empleado.
- **`nombre`** y **`apellido`**: Campos obligatorios que almacenan el nombre y apellido del empleado.
- **`telefono`**: Número de teléfono único del empleado.
- **`id_rol`**, **`id_agencia`** y **`id_departamento`**: Claves foráneas que vinculan al empleado con su rol, la agencia en la que trabaja y el departamento.

---

### **Tabla `transacciones`**:

```sql
CREATE TABLE transacciones
(
    id_transaccion      NUMBER PRIMARY KEY,
    cuenta_origen       VARCHAR(10)   NOT NULL,
    cuenta_destino      VARCHAR2(10)  NOT NULL,
    monto               NUMBER(10, 2) NOT NULL CHECK ( monto > 0 ),
    fecha               TIMESTAMP     NOT NULL,
    descripcion         VARCHAR2(50)  NOT NULL,
    id_tipo_transaccion NUMBER        NOT NULL,
    id_agencia          NUMBER        NOT NULL,
    FOREIGN KEY (id_tipo_transaccion) REFERENCES tipos_transacciones (id_tipo_transaccion),
    FOREIGN KEY (id_agencia) REFERENCES agencias (id_agencia),
    FOREIGN KEY (cuenta_origen) REFERENCES cuentas (numero_cuenta)
);
```

- **`id_transaccion`**: Clave primaria de la transacción.
- **`cuenta_origen`** y **`cuenta_destino`**: Referencias a las cuentas involucradas en la transacción.
- **`monto`**: Monto de la transacción. La restricción **CHECK (monto > 0)** asegura que solo se realicen transacciones con un valor positivo.
- **`descripcion`**: Descripción de la transacción.
- **`id_tipo_transaccion`**: Clave foránea que indica el tipo de transacción realizada.
- **`id_agencia`**: Clave foránea que indica en qué agencia se realizó la transacción.

---

### **Tabla `tarjetas_credito`**:

```sql
CREATE TABLE tarjetas_credito
(
    numero_tarjeta    NUMBER(16) PRIMARY KEY,
    limite_credito    NUMBER(10, 2) NOT NULL CHECK ( limite_credito > 0 ),
    saldo             NUMBER(10, 2) NOT NULL CHECK ( saldo >= 0 ),
    fecha_emision     DATE          NOT NULL,
    fecha_expiracion  DATE          NOT NULL,
    fecha_corte       DATE          NOT NULL,
    dia_ciclo         NUMBER(2)     NOT NULL CHECK (dia_ciclo BETWEEN 1 AND 31),
    id_cliente        NUMBER        NOT NULL,
    id_estado_tarjeta NUMBER        NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_estado_tarjeta) references estados_tarjetas (id_estado)
);
```

- **`numero_tarjeta`**: Clave primaria, número único de la tarjeta de crédito.
- **`limite_credito`**: El límite de crédito no puede ser negativo, validado con **CHECK (limite_credito > 0)**.
- **`saldo`**: El saldo de la tarjeta no puede ser negativo, validado con **CHECK (saldo >= 0)**.
- **`dia_ciclo`**: Número del día del ciclo de facturación. Debe estar entre 1 y 31, validado con **CHECK (dia_ciclo BETWEEN 1 AND 31)**.
- **`id_cliente`**: Clave foránea que identifica al cliente propietario de la tarjeta.
- **`id_estado_tarjeta`**: Clave foránea que identifica el estado de la tarjeta de crédito.

---

### **Tabla `compras_tc`**:

```sql
CREATE TABLE compras_tc
(
    id_compra      NUMBER PRIMARY KEY,
    monto          NUMBER(10, 2) NOT NULL CHECK ( monto > 0 ),
    fecha          TIMESTAMP     NOT NULL,
    descripcion    VARCHAR2(150),
    numero_tarjeta NUMBER(16)  NOT NULL,
    FOREIGN KEY (numero_tarjeta) REFERENCES tarjetas_credito (numero_tarjeta)
);
```

- **`monto`**: El monto de la compra debe ser positivo, validado con **CHECK (monto > 0)**.
- **`descripcion`**: Descripción opcional de la compra.
- **`numero_tarjeta`**: Clave foránea que identifica la tarjeta utilizada en la compra.

---

### **Tabla `pagos_tc`**:

```sql
CREATE TABLE pagos_tc
(
    id_pago        NUMBER PRIMARY KEY,
    monto          NUMBER(10, 2) NOT NULL CHECK ( monto > 0 ),
    fecha          TIMESTAMP     NOT NULL,
    numero_tarjeta NUMBER(16)  NOT NULL,
    FOREIGN KEY (numero_tarjeta) REFERENCES tarjetas_credito (numero_tarjeta)
);
```

- **`monto`**: El monto del pago debe ser positivo, validado con **CHECK (monto > 0)**.
- **`numero_tarjeta`**: Clave foránea que identifica la tarjeta de crédito a la cual se realiza el pago.

---

### **Tabla `auditorias_transacciones`**:

```sql
CREATE TABLE auditorias_transacciones
(
    id_auditoria   NUMBER PRIMARY KEY,
    comentario     VARCHAR2(150),
    id_transaccion NUMBER NOT NULL,
    id_empleado    NUMBER NOT NULL,
    FOREIGN KEY (id_transaccion) REFERENCES transacciones (id_transaccion),
    FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
);
```

- **`comentario`**: Comentario opcional sobre la auditoría de la transacción.
- **`id_transaccion`** y **`id_empleado`**: Claves foráneas que vinculan la auditoría con la transacción y el empleado responsable.

---

## **TRIGGERS**

### **Trigger `actualizar_saldo_transaccion`**:

```sql
CREATE OR REPLACE TRIGGER actualizar_saldo_transaccion
    AFTER INSERT
    ON transacciones
    FOR EACH ROW
BEGIN
    -- Actualizar saldo de la cuenta origen (resta el monto)
    UPDATE cuentas
    SET saldo = saldo - :NEW.monto
    WHERE numero_cuenta = :NEW.cuenta_origen;

    -- Actualizar saldo de la cuenta destino (suma el monto)
    UPDATE cuentas
    SET saldo = saldo + :NEW.monto
    WHERE numero_cuenta = :NEW.cuenta_destino;
END;
```

- Este trigger actualiza automáticamente el saldo de las cuentas involucradas en una transacción después de que se inserte una nueva transacción.

---

### **Trigger `actualizar_saldo_tarjeta_credito`**:

```sql
CREATE OR REPLACE TRIGGER actualizar_saldo_tarjeta_credito
    AFTER INSERT
    ON compras_tc
    FOR EACH ROW
BEGIN
    -- Actualizar saldo de la tarjeta de crédito (resta el monto de la compra)
    UPDATE tarjetas_credito
    SET saldo = saldo - :NEW.monto
    WHERE numero_tarjeta = :NEW.numero_tarjeta;
END;
```

- Este trigger se ejecuta después de una compra con tarjeta de crédito y disminuye el saldo de la tarjeta según el monto de la compra.

---

### **Trigger `actualizar_saldo_pago_tarjeta_credito`**:

```sql
CREATE OR REPLACE TRIGGER actualizar_saldo_pago_tarjeta_credito
    AFTER INSERT
    ON pagos_tc
    FOR EACH ROW
BEGIN
    -- Actualizar saldo de la tarjeta de crédito (suma el monto del pago)
    UPDATE tarjetas_credito
    SET saldo = saldo + :NEW.monto
    WHERE numero_tarjeta = :NEW.numero_tarjeta;
END;
```

- Este trigger se ejecuta después de que se registra un pago de tarjeta de crédito y aumenta el saldo de la tarjeta según el monto pagado.

---

### **Trigger `actualizar_saldo_pendiente_prestamo`**:

```sql
CREATE OR REPLACE TRIGGER actualizar_saldo_pendiente_prestamo
    AFTER INSERT
    ON pagos_prestamos
    FOR EACH ROW
BEGIN
    -- Actualizar el saldo pendiente del préstamo
    UPDATE prestamos
    SET saldo_pendiente = saldo_pendiente - :NEW.monto
    WHERE id_prestamo = :NEW.id_prestamo;
END;
```

- Este trigger reduce automáticamente el saldo pendiente de un préstamo cuando se realiza un pago a un prestamo
