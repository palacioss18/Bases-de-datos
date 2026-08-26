# 🗄️ SQL Server + C# — Bases de Datos y Backend

Repositorio donde documento mi aprendizaje y práctica de **SQL Server, T-SQL y C#**, comenzando por los fundamentos de las bases de datos relacionales y avanzando progresivamente hacia consultas complejas, programación orientada a objetos, conexión entre aplicaciones y desarrollo backend.

El objetivo principal es construir un perfil sólido en **SQL Server + C# + Backend**, con una orientación progresiva hacia el desarrollo de **sistemas bancarios y financieros**.

---

## 🎯 Objetivos

* Dominar SQL Server y T-SQL.
* Comprender el diseño y normalización de bases de datos relacionales.
* Escribir desde consultas básicas hasta lógica compleja con funciones de ventana y CTEs.
* Dominar C# orientado al desarrollo backend de aplicaciones robustas.
* Integrar aplicaciones C# con SQL Server usando ADO.NET (CRUD, parámetros y transacciones).
* Garantizar la consistencia e integridad de datos en escenarios concurrentes.
* Diseñar e implementar sistemas orientados al sector bancario y financiero.

---

## 🛠️ Tecnologías

* **Lenguajes:** C#, T-SQL (SQL Server)
* **Plataforma & Librerías:** .NET Core / .NET SDK, ADO.NET
* **Motor de BD:** SQL Server Management Studio (SSMS) / SQL Server
* **Herramientas:** Git, GitHub

---

# 📚 SQL Server

## 🟢 Nivel 1 — DML y DDL Básico (Fundamentos)

* [x] Modelado relacional (`PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, `NOT NULL`, `IDENTITY`)
* [x] Creación y manipulación básica (`CREATE TABLE`, `INSERT INTO`, `UPDATE`, `DELETE`)
* [x] Consultas simples (`SELECT`, alias `AS`)
* [x] Operadores de filtrado y orden (`WHERE`, `AND / OR`, `IN`, `BETWEEN`, `LIKE`, `ORDER BY`)
* [x] Tipos de datos en SQL Server

---

## 🟡 Nivel 2 — SQL Intermedio & Agregación

* [x] Combinación de tablas (`INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`)
* [x] Agrupamiento y métricas (`GROUP BY`, `HAVING`)
* [x] Funciones de agregación (`SUM()`, `COUNT()`, `AVG()`, `MIN()`, `MAX()`)
* [x] Manejo de valores nulos (`IS NULL`, `IS NOT NULL`)
* [x] Lógica condicional básica en consultas (`CASE WHEN`)

---

## 🚧 Nivel 3 — DML Avanzado & Funciones de Ventana

Actualmente trabajando en esta sección.

* [x] Subconsultas (Escalares y de lista)
* [ ] Subconsultas correlacionadas (`EXISTS`, `NOT EXISTS`)
* [ ] Manejo avanzado de `NULL` (`COALESCE`, `NULLIF`)
* [ ] Expresiones de Tabla Comunes — CTEs (`WITH`) y CTEs recursivas
* [ ] Funciones de Ventana — Posicionamiento y Ranking (`ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`)
* [ ] Clausulados analíticos (`OVER()`, `PARTITION BY`, `ORDER BY`)
* [ ] Agregaciones sobre ventanas móvil (`SUM() OVER...`)

---

## 🔜 Nivel 4 — Programación en T-SQL & Backend BD

* [ ] Control de Transacciones (`BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK`)
* [ ] Control de Excepciones y Manejo de Errores (`TRY...CATCH`, `RAISERROR`, `THROW`)
* [ ] Procedimientos Almacenados (Stored Procedures con parámetros `IN`/`OUT`)
* [ ] Vistas (`VIEWS`) y Vistas Indizadas
* [ ] Funciones Definidas por el Usuario (UDF Escalares y de Tabla)
* [ ] Disparadores (`TRIGGERS` - `AFTER`, `INSTEAD OF`)

---

## 🔴 Nivel 5 — Optimización & Arquitectura Profesional

* [ ] Estrategias de Indización (`Clustered` vs `Non-Clustered`, Índices Incluidos)
* [ ] Análisis de Planes de Ejecución (*Execution Plans*)
* [ ] Detección de Cuellos de Botella y Tuning de Consultas
* [ ] Gestión de Concurrencia (Niveles de Aislamiento, Bloqueos y *Deadlocks*)
* [ ] Normalización de BD (1FN, 2FN, 3FN) y Desnormalización Estratégica

---

# 💻 C#

## 🟢 Fundamentos del Lenguaje
* [x] Variables, tipos por valor/referencia y conversión de tipos
* [x] Estructuras de control y flujo (`if/else`, `switch`, `for`, `foreach`, `while`)
* [x] Métodos, firmas y paso de parámetros
* [x] Colecciones básicas (`Arrays`, `List<T>`)
* [x] Control de excepciones (`try-catch-finally`)

## 🟡 Programación Orientada a Objetos (POO)
* [x] Clases, objetos y ciclo de vida (Constructores/Destructores)
* [x] Encapsulamiento y modificadores de acceso (`public`, `private`, `protected`, `internal`)
* [x] Abstracción y Herencia
* [x] Polimorfismo (Sobrecarga y Sobrescritura `override`)
* [x] Contratos y Abstracción pura (`Interfaces` y `Clases Abstractas`)

## 🔵 C# + SQL Server (Capa de Datos / ADO.NET)
* [ ] Cadenas de conexión (*Connection Strings*) y gestión de conexiones (`SqlConnection`)
* [ ] Ejecución de comandos (`SqlCommand`, `ExecuteNonQuery`, `ExecuteScalar`, `ExecuteReader`)
* [ ] Lectura eficiente de datos streaming (`SqlDataReader`)
* [ ] Prevención de SQL Injection mediante Consultas Parametrizadas (`SqlParameter`)
* [ ] Patrón Repositorio y Arquitectura en Capas
* [ ] Gestión de Transacciones distribuida/explícita desde C# (`SqlTransaction`)

---

# 🧪 Proyectos de Práctica

## 🛒 1. Práctica DML: Sistema de Clientes y Ventas
* **Descripción:** Base de datos relacional para modelar relaciones 1:N entre clientes y transacciones de venta.
* **Conceptos aplicados:** Constraints (`PK`, `FK`), `JOINs`, agrupamientos con `GROUP BY/HAVING`, reportes con funciones de agregación y análisis de clientes sin compras asociadas.

## 🏦 2. Integración Backend: Sistema de Gestión de Cuentas Bancarias (En Desarrollo)
* **Descripción:** Aplicación de consola/servicio C# conectada a SQL Server para administración de operativas bancarias básicas.
* **Arquitectura de BD:** `Clientes (1) ── (N) Cuentas (1) ── (N) Movimientos`
* **Funcionalidades a implementar:**
  * [ ] CRUD completo de clientes y cuentas mediante **ADO.NET**
  * [ ] Depósitos y retiros garantizados por **Transacciones SQL / C#**
  * [ ] Auditoría e historial de movimientos bancarios
  * [ ] Manejo defensivo de errores y validaciones de saldo desde C# y Stored Procedures

---

# 🏦 Proyectos Bancarios Futuros

Objetivos orientados a simular componentes reales de la industria financiera:

* 💳 **Sistema de Gestión de Tarjetas y Métricas de Consumo:** Crédito, débito, cierres de tarjeta y límites.
* 💸 **Motor de Transferencias e Interbancarias:** Enfoque en transacciones ACID, manejo estricto de concurrencia y prevención de *deadlocks*.
* 💰 **Sistema de Préstamos y Amortizaciones:** Cálculo analítico de cuotas usando funciones de ventana y ejecución de tablas de amortización.

---

# 📁 Estructura del Repositorio

```text
Bases-de-datos/
│
├── README.md
│
├── SQL/
│   ├── DML AVANZADO/
│   ├── Funciones de Ventana/
│   ├── Subconsultas/
│   └── Programacion T-SQL/       # Stored Procedures, Triggers, Views
│
├── CSharp/
│   ├── Fundamentos/
│   ├── POO/
│   └── SQLServer-ADONET/
│
└── Proyectos/
    ├── Negocio-Clientes-Ventas/
    └── Sistema-Gestion-Bancaria/
