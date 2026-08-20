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

## 🔄 Operaciones CRUD

A través del archivo `cuentabancaria.sql` practico las 4 operaciones fundamentales:

1. **Create (Crear)**: Inserción de datos utilizando `INSERT INTO`.
2. **Read (Leer)**: Consultas con `SELECT`, filtrado con `WHERE`, búsquedas con `LIKE` y ordenamiento con `ORDER BY`.
3. **Update (Actualizar)**: Modificación de registros existentes con `UPDATE ... SET` filtrando por ID.
4. **Delete (Eliminar)**: Borrado seguro de datos respetando las restricciones de llave foránea mediante `DELETE FROM`.

---

## 📁 Archivos del Repositorio

- **`cuentabancaria.sql`**: Script completo con la creación de las tablas `Clientes` y `Cuentas`, inserción de datos iniciales y consultas de prueba.
