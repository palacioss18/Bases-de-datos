# 🗄️ SQL Server — Bases de Datos Relacionales y Backend

Repositorio donde documento mi aprendizaje y práctica de **SQL Server**, comenzando por los fundamentos de las bases de datos relacionales y avanzando progresivamente hacia consultas complejas, diseño de bases de datos y conceptos utilizados en backend.

El objetivo es construir una base sólida en SQL y posteriormente aplicar estos conocimientos al desarrollo de **sistemas bancarios**.

---

## 🎯 Objetivos

* Dominar SQL Server.
* Comprender el diseño y las relaciones entre bases de datos.
* Resolver problemas utilizando consultas SQL.
* Aprender SQL intermedio y avanzado.
* Comprender transacciones y consistencia de datos.
* Aplicar SQL en proyectos de backend.
* Diseñar bases de datos orientadas a sistemas bancarios.

---

# 📚 Contenido

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

* [ ] Subconsultas
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

Se practican:

* `PRIMARY KEY`
* `FOREIGN KEY`
* `INNER JOIN`
* `LEFT JOIN`
* `GROUP BY`
* `HAVING`
* Funciones de agregación
* `NULL`
* Actualización de datos
* Reportes
* Consultas sobre registros relacionados y no relacionados

---

# 🏦 Próximamente — Proyectos Bancarios

Una vez consolidado SQL avanzado, aplicaré los conocimientos en proyectos orientados al backend bancario.

### Banco

```text
Clientes
   │
   ├── Cuentas
   │      │
   │      └── Movimientos
   │
   ├── Tarjetas
   │
   ├── Transferencias
   │
   └── Préstamos
```

### Proyectos previstos

* 🏦 Sistema de cuentas bancarias
* 💳 Sistema de tarjetas
* 💸 Sistema de transferencias
* 💰 Sistema de movimientos
* 🏦 Sistema de préstamos

El objetivo será aplicar conceptos de SQL como **transacciones, integridad de datos, consultas complejas y concurrencia** en escenarios similares a los que pueden aparecer en sistemas financieros.

---

# 🛠️ Tecnologías

* **SQL Server**
* **T-SQL**
* **Git**
* **GitHub**

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
SQL para Backend
    ↓
Optimización y Concurrencia
    ↓
Sistemas Bancarios
```

Este repositorio se actualiza a medida que incorporo nuevos conocimientos y proyectos.

---

## 📌 Objetivo Final

Construir una base sólida en **SQL Server y bases de datos** para posteriormente integrarla con desarrollo backend y crear sistemas orientados principalmente al **sector bancario y financiero**.

