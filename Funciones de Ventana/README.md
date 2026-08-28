# Funciones de Ventana (Window Functions)

Cálculos avanzados sobre conjuntos de filas vinculadas al registro actual sin colapsar el agrupamiento.

## 📌 Conceptos clave
- Particionamiento y orden (`OVER (PARTITION BY ... ORDER BY ...)`)
- Clasificación (`ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `NTILE()`)
- Funciones de valor y desplazamiento (`LAG()`, `LEAD()`, `FIRST_VALUE()`)
- Acumulados y promedios móviles (`SUM() OVER ...`)

## 📂 Contenido del directorio
- `Ranking.sql`: Paginación y ordenamiento analítico.
- `Analisis_Temporal.sql`: Comparativas entre registros (uso de `LAG` y `LEAD`).
