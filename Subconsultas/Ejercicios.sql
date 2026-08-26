USE Practica;
GO
DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Clientes;
CREATE TABLE Clientes (
	idCliente INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	ciudad VARCHAR(30) NOT NULL
);


CREATE TABLE Ventas(
	idVenta INT IDENTITY(1,1) PRIMARY KEY,
	idCliente INT NULL, --PERMITE NULL PARA PROBAR EL LEFT JOIN
	monto DECIMAL(10,2) NOT NULL,
	categoria VARCHAR(30) NOT NULL,
	CONSTRAINT FK_Ventas_Clientes FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
	);

--INSERTAR CLIENTES
INSERT INTO Clientes(nombre,ciudad) VALUES
	('Jose','Pilar'),
	('Goku','VEGETTA'),
	('Picollo','Tierra'),
	('Messi','Rosario'); -- MESSI NO VA TENER VENTAS PARA PROBAR EL LEFT JOIN

--INSERTAR VENTAS
INSERT INTO Ventas(idCliente,monto,categoria) VALUES
	(1,1500.00,'Tecnologia'),
	(1,2500.00,'Ropa'),
	(2,5000.00,'Tecnologia'),
	(2,1200.00,'Tecnologia'),
	(3,800.00,'Hogar'),
	(NULL,3000.00,'Ropa'); --VENTA ANONIMA SIN CLIENTE

GO

SELECT idVenta,
	   monto,
	   categoria,
	   CASE
			WHEN monto > (SELECT AVG(monto) FROM Ventas) THEN 'SOBRE EL PROMEDIO'
			ELSE 'BAJO EL PROMEDIO'
		END AS comparativaPromedio
	FROM Ventas;



SELECT c.nombre,
	   c.ciudad,
	   SUM(v.monto) AS TotalGastado,
	   CASE
			WHEN SUM(v.monto) >= (SELECT AVG(TotalPorCliente) 
				FROM (SELECT SUM(monto) AS TotalPorCliente 
				FROM Ventas WHERE idCliente IS NOT NULL GROUP BY idCliente) AS SubPromedios) THEN 'TOP SPENDER'
			ELSE 'ESTÁNDAR'
		END AS estadoCliente
	   FROM Clientes AS c INNER JOIN Ventas AS v ON c.idCliente = v.idCliente GROUP BY c.nombre,c.ciudad;



----------------------------------------

--SUBCONSULTAS es una consulta SQL que se puede encontrar dentro de otra consulta SQL
-- 1. Ventas mayores al promedio
SELECT c.nombre,
	   c.ciudad,
	   SUM(v.monto) AS VentasPorEncimaDelPromedio 
	   FROM Clientes AS c INNER JOIN Ventas AS v 
	   ON c.idCliente = v.idCliente GROUP BY c.nombre,c.ciudad
	   HAVING SUM(v.monto) > (SELECT AVG(monto) FROM Ventas) ;

-- 2. Cliente con el mayor nombre alfabéticamente 
SELECT nombre,
	   ciudad 
	   FROM Clientes GROUP BY nombre,ciudad 
	   HAVING nombre = (SELECT MAX(nombre) From Clientes);


-- 3. Clientes sin compras 
SELECT c.nombre
FROM Clientes AS c
WHERE NOT EXISTS (
    SELECT 1 
    FROM Ventas AS v 
    WHERE v.idCliente = c.idCliente
);


-- 4. Clientes con compras en Tecnologia
SELECT c.nombre FROM Clientes AS c 
WHERE c.idCliente IN (
	SELECT v.idCliente FROM Ventas AS v WHERE categoria = 'Tecnologia'
	);


-- 5. Venta más alta por cliente
SELECT v1.idCliente, v1.idVenta, v1.monto
FROM Ventas v1
WHERE v1.idCliente IS NOT NULL
  AND v1.monto = (
      SELECT MAX(v2.monto)
      FROM Ventas v2
      WHERE v2.idCliente = v1.idCliente
  );

-- 6. Promedio de la misma categoría
SELECT 
    idVenta, 
    categoria, 
    monto,
    (SELECT AVG(v2.monto) 
     FROM Ventas v2 
     WHERE v2.categoria = v1.categoria) AS PromedioCategoria
FROM Ventas v1;
