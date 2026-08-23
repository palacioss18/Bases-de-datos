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
--INNER JOIN
SELECT c.nombre,v.monto,v.categoria FROM Clientes AS c INNER JOIN Ventas AS v ON c.idCliente = v.idCliente;

--GROUP BY
SELECT c.nombre,sum(v.monto) AS totalGastado FROM Clientes AS c INNER JOIN Ventas AS v ON c.idCliente = v.idCliente GROUP BY c.nombre;

--ORDER BY
SELECT 
    c.nombre,c.ciudad,SUM(v.monto) AS totalComprado FROM Clientes AS c INNER JOIN Ventas AS v ON c.idCliente = v.idCliente
	GROUP BY c.nombre, c.ciudad ORDER BY totalComprado DESC;

UPDATE Clientes SET nombre = 'Messias' WHERE nombre = 'Messi' AND idCliente = 4;
SELECT nombre FROM Clientes;

--AJUSTE DE PRECIO
UPDATE Ventas SET monto = monto + monto*0.20 WHERE categoria = 'ropa';

--REPORTE DE CLIENTES VIP
SELECT c.nombre
	   ,c.ciudad,
	   sum(t.monto) AS totalGastado FROM Clientes AS c INNER JOIN Ventas AS t ON c.idCliente = t.idCliente 
	   GROUP BY c.nombre,c.ciudad HAVING SUM(t.monto) > 3000 ORDER BY totalGastado DESC;

--AUDITORIA DE INACTIVOS
SELECT c.nombre,c.ciudad FROM clientes AS c LEFT JOIN Ventas ON c.idCliente = Ventas.idCliente WHERE Ventas.idCliente IS NULL;

--DETECCIÓN DE VENTAS ANÓNIMAS
SELECT 
    v.idVenta,
    v.monto,
    v.categoria 
	FROM Ventas AS v LEFT JOIN Clientes AS c ON v.idCliente = c.idCliente WHERE c.idCliente IS NULL;

--Métrica Global por Categoria
SELECT v.categoria,
	   COUNT(v.categoria) AS CantidadDeVentas,
	   SUM(v.monto) AS TotalFacturado,
	   AVG(v.monto) AS PromedioDeVenta
	   FROM Ventas AS v LEFT JOIN Clientes AS c ON v.idCliente = c.idCliente GROUP BY v.categoria ORDER BY TotalFacturado DESC;

--ARRANCAMOS CON SUBCONSULTA
SELECT * FROM Ventas WHERE monto > (SELECT AVG(monto) FROM Ventas);
