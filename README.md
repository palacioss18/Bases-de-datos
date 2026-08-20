# 🗄️ Aprendiendo Bases de Datos Relacionales (SQL)

¡Bienvenido a mi repositorio de aprendizaje de SQL! En este proyecto voy documentando mi progreso aprendiendo bases de datos relacionales desde cero utilizando **SQL Server**.

---

## 📌 Conceptos Clave Aprendidos

- **Tablas y Registros**: Creación de tablas (`CREATE TABLE`) con tipos de datos (`INT`, `VARCHAR`, `DECIMAL`, `DATE`).
- **Llaves (Keys)**:
  - `PRIMARY KEY` (`idCliente`, `idCuenta`): Identificador único e irrepetible para cada fila.
  - `FOREIGN KEY` (`FK_Cuentas_Clientes`): Relación e integridad referencial entre la tabla `Cuentas` y `Clientes`.
- **Restricciones y Autoincremento**:
  - `IDENTITY(1,1)`: Asignación automática e incremental de IDs.
  - `NOT NULL` y `UNIQUE`: Reglas para campos obligatorios y valores no repetidos.

---

## 🔄 Operaciones CRUD y Consultas Avanzadas

A través de los scripts del proyecto practico las operaciones fundamentales y consultas relacionales:

1. **Create (Crear)**: Inserción de datos utilizando `INSERT INTO`.
2. **Read (Leer)**:
   - Consultas con `SELECT` y selección de columnas específicas.
   - Filtrado de datos con `WHERE` (`BETWEEN`, `IN`, `AND`, `OR`).
   - Búsqueda por coincidencia de texto usando `LIKE` y comodines (`%`).
   - Ordenamiento de resultados con `ORDER BY` (`ASC` / `DESC`).
   - Renombrado de columnas y tablas usando alias (`AS`).
   - Funciones de agregación para cálculos automáticos: `COUNT()`, `SUM()`, `AVG()`.
   - Relación y cruce de datos entre múltiples tablas mediante `INNER JOIN ... ON`.
   - Agrupamiento de datos con `GROUP BY`.
   - Filtrado de agregaciones mediante `HAVING`.
3. **Update (Actualizar)**: Modificación de registros existentes con `UPDATE ... SET` filtrando por la `PRIMARY KEY`.
4. **Delete (Eliminar)**: Borrado seguro de datos respetando la integridad referencial de las `FOREIGN KEY`.

---

## 📁 Archivos del Repositorio

- **`cuentabancaria.sql`**: Script base con creación de tablas, inserción de datos, pruebas CRUD y primer `INNER JOIN`.
- **`cuentabancaria2.sql`**: Prácticas de agrupación con `GROUP BY`, agregaciones (`COUNT`, `SUM`, `AVG`) y filtros sobre agregados con `HAVING`.
