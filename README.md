# 🗄️ SQL Server + C# — Bases de Datos y Backend

Repositorio donde documento mi aprendizaje y práctica de **SQL Server, T-SQL y C#**, comenzando por los fundamentos de las bases de datos relacionales y avanzando progresivamente hacia consultas complejas, programación orientada a objetos, conexión entre aplicaciones y bases de datos y desarrollo backend.

El objetivo es construir una base sólida en **bases de datos + C# + backend**, con una orientación progresiva hacia el desarrollo de **sistemas bancarios y financieros**.

---

## 🎯 Objetivos

* Dominar SQL Server y T-SQL.
* Comprender el diseño de bases de datos relacionales.
* Aprender consultas SQL desde nivel básico hasta avanzado.
* Aprender C# aplicado al desarrollo de aplicaciones.
* Conectar aplicaciones C# con SQL Server.
* Practicar CRUD desde C#.
* Comprender transacciones y consistencia de datos.
* Aplicar programación orientada a objetos.
* Desarrollar proyectos de backend.
* Diseñar sistemas orientados al sector bancario.

---

# 🛠️ Tecnologías

* **C#**
* **.NET**
* **SQL Server**
* **T-SQL**
* **ADO.NET**
* **Git**
* **GitHub**

---

# 📚 SQL Server

## 🟢 Nivel 1 — Fundamentos

* [x] Bases de datos relacionales
* [x] Tablas y registros
* [x] `CREATE TABLE`
* [x] `INSERT INTO`
* [x] `SELECT`
* [x] `UPDATE`
* [x] `DELETE`
* [x] Tipos de datos
* [x] `PRIMARY KEY`
* [x] `FOREIGN KEY`
* [x] `IDENTITY`
* [x] `NOT NULL`
* [x] `UNIQUE`

---

## 🟡 Nivel 2 — SQL Intermedio

* [x] `WHERE`
* [x] `AND / OR`
* [x] `IN`
* [x] `BETWEEN`
* [x] `LIKE`
* [x] Comodines
* [x] Alias con `AS`
* [x] `ORDER BY`
* [x] `INNER JOIN`
* [x] `LEFT JOIN`
* [x] `GROUP BY`
* [x] `HAVING`
* [x] `SUM()`
* [x] `COUNT()`
* [x] `AVG()`
* [x] Manejo de `NULL`
* [x] Consultas y reportes sobre varias tablas

---

## 🚧 Nivel 3 — SQL Intermedio/Avanzado

Actualmente estoy trabajando en este nivel.

* [x] Subconsultas
* [ ] Subconsultas correlacionadas
* [ ] `CASE`
* [ ] `COALESCE`
* [ ] `EXISTS`
* [ ] `NOT EXISTS`
* [ ] CTE (`WITH`)
* [ ] `ROW_NUMBER()`
* [ ] `RANK()`
* [ ] `DENSE_RANK()`
* [ ] `OVER()`
* [ ] `PARTITION BY`
* [ ] Funciones de ventana
* [ ] Consultas complejas
* [ ] Reportes avanzados

---

## 🔜 Nivel 4 — SQL para Backend

* [ ] Transacciones
* [ ] `BEGIN TRANSACTION`
* [ ] `COMMIT`
* [ ] `ROLLBACK`
* [ ] `TRY...CATCH`
* [ ] Stored Procedures
* [ ] Views
* [ ] Triggers
* [ ] Integridad de datos
* [ ] Manejo de errores
* [ ] Concurrencia

---

## 🔴 Nivel 5 — SQL Profesional

* [ ] Índices
* [ ] Índices clustered / non-clustered
* [ ] Execution Plans
* [ ] Optimización de consultas
* [ ] Bloqueos
* [ ] Deadlocks
* [ ] Concurrencia avanzada
* [ ] Normalización
* [ ] Diseño de bases de datos
* [ ] Optimización de rendimiento

---

# 💻 C#

## 🟢 Fundamentos

* [x] Variables y tipos de datos
* [x] Condicionales
* [x] Bucles
* [x] Métodos
* [x] Arrays
* [x] `List<T>`
* [x] Manejo de excepciones
* [x] Entrada y salida de datos

## 🟡 Programación Orientada a Objetos

* [x] Clases y objetos
* [x] Constructores
* [x] Encapsulamiento
* [x] `public`
* [x] `private`
* [x] `protected`
* [x] Herencia
* [x] Polimorfismo
* [x] Interfaces
* [x] Clases abstractas

## 🔵 C# + SQL Server

* [ ] Conexión C# → SQL Server
* [ ] ADO.NET
* [ ] `SqlConnection`
* [ ] `SqlCommand`
* [ ] `SqlDataReader`
* [ ] Parámetros SQL
* [ ] CRUD desde C#
* [ ] Consultas parametrizadas
* [ ] Manejo de errores
* [ ] Transacciones desde C#

---

# 🧪 Proyectos de Práctica

## 🛒 Negocio

Proyecto utilizado para practicar relaciones entre clientes y ventas.

### Tablas

```text
Clientes
   │
   │ 1:N
   ▼
Ventas
```

Conceptos practicados:

* `PRIMARY KEY`
* `FOREIGN KEY`
* `INNER JOIN`
* `LEFT JOIN`
* `GROUP BY`
* `HAVING`
* Funciones de agregación
* `NULL`
* `UPDATE`
* Reportes
* Consultas sobre registros relacionados y no relacionados

---

## 💻 Próximo proyecto — C# + SQL Server

### 🏦 Sistema de Gestión de Cuentas Bancarias

Primer proyecto de integración entre **C# y SQL Server**.

### Base de datos

```text
Clientes
   │
   │ 1:N
   ▼
Cuentas
   │
   │ 1:N
   ▼
Movimientos
```

### Funcionalidades previstas

* [ ] Registrar cliente
* [ ] Consultar cliente
* [ ] Modificar cliente
* [ ] Eliminar cliente
* [ ] Crear cuenta bancaria
* [ ] Consultar cuenta
* [ ] Consultar saldo
* [ ] Depositar dinero
* [ ] Retirar dinero
* [ ] Registrar movimientos
* [ ] Consultar movimientos
* [ ] Conectar C# con SQL Server
* [ ] Implementar CRUD con ADO.NET
* [ ] Utilizar consultas parametrizadas
* [ ] Implementar transacciones

---

# 🏦 Proyectos Bancarios Futuros

Una vez consolidado SQL, C# y los conceptos de backend, desarrollaré proyectos independientes orientados al sector bancario.

### Proyectos previstos

* 🏦 Sistema de cuentas bancarias
* 💸 Sistema de transferencias
* 💳 Sistema de tarjetas
* 💰 Sistema de movimientos
* 🏦 Sistema de préstamos

Estos proyectos buscarán aplicar conceptos como:

* SQL Server
* C#
* POO
* ADO.NET
* CRUD
* Transacciones
* Integridad de datos
* Manejo de errores
* Concurrencia
* Diseño de bases de datos

---

# 📁 Estructura del repositorio

```text
Bases-de-datos/
│
├── README.md
│
├── SQL/
│   ├── Nivel-01-Fundamentos/
│   ├── Nivel-02-Intermedio/
│   ├── Nivel-03-Intermedio-Avanzado/
│   └── Nivel-04-Backend/
│
├── CSharp/
│   ├── Fundamentos/
│   ├── POO/
│   └── SQLServer/
│
└── Proyectos/
    ├── Negocio/
    └── Gestion-Cuentas/
```

---

# 📈 Progreso

Mi aprendizaje sigue una progresión:

```text
SQL Básico
    ↓
SQL Intermedio
    ↓
SQL Intermedio/Avanzado
    ↓
C# y POO
    ↓
C# + SQL Server
    ↓
Transacciones y Backend
    ↓
Optimización y Concurrencia
    ↓
Sistemas Bancarios
```

Este repositorio se actualiza a medida que incorporo nuevos conocimientos, ejercicios y proyectos.

---

## 📌 Objetivo Final

Construir una base sólida en **SQL Server, C# y desarrollo backend**, utilizando estos conocimientos para desarrollar sistemas cada vez más complejos y orientados principalmente al **sector bancario y financiero**.
