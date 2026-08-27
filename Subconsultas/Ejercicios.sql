USE Practica;
GO

-- ============================================================================
-- 1. LIMPIEZA Y CREACIÓN DE LA ESTRUCTURA DE BASE DE DATOS
-- ============================================================================

-- Eliminar tablas en orden inverso a sus dependencias de Clave Foránea
DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Clientes;

-- Crear tabla principal (Padre)
CREATE TABLE Clientes (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    ciudad VARCHAR(30) NOT NULL
);

-- Crear tabla dependiente (Hija) con FK que permite valores NULL (ventas anónimas)
CREATE TABLE Ventas (
    idVenta INT IDENTITY(1,1) PRIMARY KEY,
    idCliente INT NULL, -- NULL permite evaluar comportamiento de LEFT JOIN / NOT IN
    monto DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    CONSTRAINT FK_Ventas_Clientes FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

-- ============================================================================
-- 2. INSERCIÓN DE DATOS DE PRUEBA
-- ============================================================================

INSERT INTO Clientes (nombre, ciudad) VALUES	
    ('Jose', 'Pilar'),
    ('Goku', 'VEGETTA'),
    ('Picollo', 'Tierra'),
    ('Messi', 'Rosario'); -- Messi no tendrá ventas para probar casos límites

INSERT INTO Ventas (idCliente, monto, categoria) VALUES	
    (1, 1500.00, 'Tecnologia'),
    (1, 2500.00, 'Ropa'),
    (2, 5000.00, 'Tecnologia'),
    (2, 1200.00, 'Tecnologia'),
    (3, 800.00, 'Hogar'),
    (NULL, 3000.00, 'Ropa'); -- Venta anónima sin cliente asociado
GO

-- ============================================================================
-- 3. COMPARATIVAS GENERALES CON CASE Y SUBCONSULTAS
-- ============================================================================

-- Evalúa cada venta contra el promedio global de todas las ventas
SELECT 
    idVenta,
    monto,
    categoria,
    CASE
        WHEN monto > (SELECT AVG(monto) FROM Ventas) THEN 'SOBRE EL PROMEDIO'
        ELSE 'BAJO EL PROMEDIO'
    END AS comparativaPromedio
FROM Ventas;

-- Clasifica clientes como 'TOP SPENDER' si su gasto acumulado superó el promedio gastado por cliente activo
SELECT 
    c.nombre,
    c.ciudad,
    SUM(v.monto) AS TotalGastado,
    CASE
        WHEN SUM(v.monto) >= (
            SELECT AVG(TotalPorCliente) 
            FROM (
                SELECT SUM(monto) AS TotalPorCliente 
                FROM Ventas 
                WHERE idCliente IS NOT NULL 
                GROUP BY idCliente
            ) AS SubPromedios
        ) THEN 'TOP SPENDER'
        ELSE 'ESTÁNDAR'
    END AS estadoCliente
FROM Clientes AS c 
INNER JOIN Ventas AS v ON c.idCliente = v.idCliente 
GROUP BY c.nombre, c.ciudad;

-- ============================================================================
-- 4. EJERCICIOS DE SUBCONSULTAS DIVERSAS
-- ============================================================================

-- 1. Clientes cuyo total consumido supera el promedio de venta individual
SELECT 
    c.nombre,
    c.ciudad,
    SUM(v.monto) AS VentasPorEncimaDelPromedio 
FROM Clientes AS c 
INNER JOIN Ventas AS v ON c.idCliente = v.idCliente 
GROUP BY c.nombre, c.ciudad
HAVING SUM(v.monto) > (SELECT AVG(monto) FROM Ventas);

-- 2. Cliente ordenado al final alfabéticamente mediante función de agregación textual
SELECT 
    nombre,
    ciudad 
FROM Clientes 
GROUP BY nombre, ciudad 
HAVING nombre = (SELECT MAX(nombre) FROM Clientes);

-- 3. Clientes que no registran compras en la tabla de Ventas
SELECT 
    c.nombre
FROM Clientes AS c
WHERE NOT EXISTS (
    SELECT 1 
    FROM Ventas AS v 
    WHERE v.idCliente = c.idCliente
);

-- 4. Clientes con al menos una compra en la categoría 'Tecnologia'
SELECT 
    c.nombre 
FROM Clientes AS c 
WHERE c.idCliente IN (
    SELECT v.idCliente 
    FROM Ventas AS v 
    WHERE categoria = 'Tecnologia'
);

-- 5. Subconsulta Correlacionada: Identifica la venta de mayor valor de cada cliente
SELECT 
    v1.idCliente, 
    v1.idVenta, 
    v1.monto
FROM Ventas v1
WHERE v1.idCliente IS NOT NULL
  AND v1.monto = (
      SELECT MAX(v2.monto)
      FROM Ventas v2
      WHERE v2.idCliente = v1.idCliente
  );

-- 6. Muestra el promedio correspondiente a la misma categoría junto a cada registro
SELECT 
    idVenta, 
    categoria, 
    monto,
    (
        SELECT AVG(v2.monto) 
        FROM Ventas v2 
        WHERE v2.categoria = v1.categoria
    ) AS PromedioCategoria
FROM Ventas v1;

-- ============================================================================
-- 5. CLASIFICACIONES ADICIONALES CON EXPRESIONES CASE
-- ============================================================================

-- Evaluador individual de montos de ventas
SELECT 
    idVenta,
    monto,
    CASE
        WHEN monto > (SELECT AVG(monto) FROM Ventas) THEN 'Por encima del promedio'
        ELSE 'Por debajo del promedio'
    END AS Evaluacion
FROM Ventas;

-- Estado de actividad de cada cliente usando EXISTS
SELECT 
    c.nombre,
    CASE
        WHEN EXISTS (SELECT 1 FROM Ventas AS v WHERE v.idCliente = c.idCliente) THEN 'Cliente activo'
        ELSE 'Sin compras'
    END AS EstadoCliente
FROM Clientes AS c;

-- Clientes con compras en la categoría 'Ropa'
SELECT 
    c.nombre 
FROM Clientes AS c 
WHERE c.idCliente IN (
    SELECT v.idCliente 
    FROM Ventas AS v 
    WHERE v.categoria = 'Ropa'
);

-- Categorías consumidas por el cliente 'Goku'
SELECT DISTINCT 
    categoria
FROM Ventas v
WHERE EXISTS (
    SELECT 1 
    FROM Clientes c 
    WHERE c.idCliente = v.idCliente 
      AND c.nombre = 'Goku'
);

-- ============================================================================
-- 6. DEMOSTRACIÓN: LÓGICA TRIVALENTE Y TRAPAS DE NULL CON NOT IN VS NOT EXISTS
-- ============================================================================

-- Consulta A: FALLA (Devuelve 0 filas. Al haber un idCliente NULL en Ventas, la comparación lógica evalúa a UNKNOWN)
SELECT nombre 
FROM Clientes 
WHERE idCliente NOT IN (
    SELECT idCliente 
    FROM Ventas
);

-- Consulta B: FUNCIONA (Devuelve 'Messi'. NOT EXISTS procesa de forma segura los valores NULL)
SELECT nombre 
FROM Clientes c
WHERE NOT EXISTS (
    SELECT 1 
    FROM Ventas v 
    WHERE v.idCliente = c.idCliente
);

-- Consulta C: FUNCIONA (Devuelve 'Messi'. Soluciona NOT IN filtrando los valores NULL manualmente)
SELECT nombre 
FROM Clientes 
WHERE idCliente NOT IN (
    SELECT idCliente 
    FROM Ventas 
    WHERE idCliente IS NOT NULL
);

-- ============================================================================
-- 7. PRÁCTICA FINAL Y DESAFÍOS DE SUBCONSULTAS
-- ============================================================================

-- Obtener nombres de clientes con alguna compra mayor a $2,000.00
SELECT nombre 
FROM Clientes AS c 
WHERE c.idCliente IN (
    SELECT v.idCliente 
    FROM Ventas AS v 
    WHERE monto > 2000.00
);

-- Obtener clientes residenciados en 'Pilar' con al menos una compra registrada
SELECT c.nombre
FROM Clientes AS c 
WHERE c.ciudad = 'Pilar'
  AND EXISTS (
      SELECT 1 
      FROM Ventas AS v 
      WHERE v.idCliente = c.idCliente
  );

-- Obtener ventas huérfanas (sin cliente asignado o anónimas)
SELECT 
    idVenta, 
    monto, 
    categoria 
FROM Ventas AS v 
WHERE NOT EXISTS (
    SELECT 1 
    FROM Clientes AS c 
    WHERE c.idCliente = v.idCliente
);

-- DESAFÍO DE NIVEL: Total consumido exclusivamente en 'Tecnologia' asignando 0.00 a quien no compró
SELECT 
    c.nombre,
    c.ciudad,
    ISNULL(
        (
            SELECT SUM(v.monto) 
            FROM Ventas AS v 
            WHERE v.idCliente = c.idCliente 
              AND v.categoria = 'Tecnologia'
        ),
        0.00
    ) AS TotalTecnologia 
FROM Clientes AS c;
