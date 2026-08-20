USE Banco;
-- 1. LIMPIEZA Y RECREACIÓN DE TABLAS
DROP TABLE IF EXISTS Cuentas;
DROP TABLE IF EXISTS Clientes;

CREATE TABLE Clientes (
	idCliente INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Dni VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Cuentas (
	idCuenta INT IDENTITY(1,1) PRIMARY KEY,
	idCliente INT NOT NULL,
	tipoCuenta VARCHAR(30) NOT NULL,
	saldo DECIMAL(15,2) NOT NULL,
	CONSTRAINT FK_Cuentas_Clientes FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

INSERT INTO Clientes (Nombre, Apellido, Dni) VALUES 
('Jose', 'Palacios', '47385714'),
('Carlos', 'Gomez', '20435493'),
('Maria', 'Lopez', '20321232');

INSERT INTO Cuentas (idCliente, tipoCuenta, saldo) VALUES 
(1, 'Ahorro', 150000.00),
(1, 'Corriente', 500000.00),
(2, 'Ahorro', 800000.00),
(3, 'Corriente', 120000.00),
(3, 'Ahorro', 50000.00);

--------------------------------------------------------------------------------------
--GROUP BY
SELECT 
    c.Nombre, 
    c.Apellido, 
    SUM(p.saldo) AS SaldoTotal
FROM Clientes AS c INNER JOIN Cuentas AS p ON c.idCliente = p.idCliente GROUP BY c.Nombre, c.Apellido;


--EJERCICIO
SELECT t.tipoCuenta, SUM(t.saldo) AS SaldoTotal FROM Cuentas AS t GROUP BY t.tipoCuenta;

-- 1. Contar Cuentas por cliente
SELECT n.Nombre,
	   n.Apellido,
	   COUNT(c.tipoCuenta) AS Cantidad_de_cuentas FROM Clientes AS n INNER JOIN Cuentas AS c ON n.idCliente = c.idCliente GROUP BY n.Nombre,n.Apellido;

-- 2. Promedio de saldo por tipo de cuenta
SELECT 
    tipoCuenta, 
    AVG(saldo) AS SaldoPromedio 
FROM Cuentas 
GROUP BY tipoCuenta;


-- 3. Filtrar clientes por saldo total acumulado
SELECT c.Nombre,
	   c.Apellido,
	   SUM(p.saldo) AS SALDO_TOTAL_ACUMULADO 
	   FROM Clientes AS c INNER JOIN Cuentas AS p ON c.idCliente = p.idCliente GROUP BY c.Nombre,c.Apellido HAVING SUM(p.saldo) > 200000;

--TEORIA-- --TEORIA-- --TEORIA-- --TEORIA--
SELECT 
    c.Nombre, 
    SUM(p.saldo) AS SaldoTotal
FROM Clientes AS c INNER JOIN Cuentas AS p ON c.idCliente = p.idCliente
WHERE p.tipoCuenta = 'Ahorro'      -- 1. Primero descarta las cuentas que no sean de Ahorro
GROUP BY c.Nombre                 -- 2. Agrupa lo que quedó por Nombre
HAVING SUM(p.saldo) > 100000;     -- 3. Finalmente muestra solo a los clientes cuya SUMA sea mayor a 100.000
