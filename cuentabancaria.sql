-- 1. LIMPIEZA INICIAL (Borramos en orden inverso para no romper FK)
DROP TABLE IF EXISTS Cuentas;
DROP TABLE IF EXISTS Clientes;

-- 2. TABLA CLIENTES
CREATE TABLE Clientes (
	idCliente INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Dni VARCHAR(20) NOT NULL UNIQUE,
	Email VARCHAR(100),
	FechaNacimiento DATE
);

INSERT INTO Clientes (Nombre, Apellido, Dni, Email, FechaNacimiento) 
VALUES	('jose', 'palacios', '47385714', 'jose@gmail.com', '2006-05-10'),
	('carlos', 'gomez', '20435493', 'carlos@gmail.com', '1998-08-20'),
	('maria', 'lopez', '20321232', 'maria@gmail.com', '2001-03-30');

-- 3. TABLA CUENTAS
CREATE TABLE Cuentas (
	idCuenta INT IDENTITY(1,1) PRIMARY KEY,
	idCliente INT NOT NULL,
	tipoCuenta VARCHAR(30) NOT NULL,
	saldo DECIMAL(15,2) NOT NULL,
	CONSTRAINT FK_Cuentas_Clientes FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

-- Insertamos las cuentas MIENTRAS Maria (idCliente 3) existe
INSERT INTO Cuentas (idCliente, tipoCuenta, saldo) 
VALUES (1, 'Ahorro', 150000.00),
       (1, 'Corriente', 500000.00),
       (2, 'Ahorro', 800000.00),
       (3, 'Corriente', 120000.00);

-- 4. CONSULTAS Y PRUEBAS CRUD
SELECT * FROM Clientes;
SELECT * FROM Cuentas;

-- UPDATE: Cambiar email de Jose
UPDATE Clientes 
SET Email = 'jose.palacios.nuevo@gmail.com' 
WHERE idCliente = 1;

-- IMPORTANTE: Para borrar al cliente 3, primero debes borrar sus cuentas vinculadas
DELETE FROM Cuentas WHERE idCliente = 3; -- Borra primero la cuenta
DELETE FROM Clientes WHERE idCliente = 3; -- Ahora sí te deja borrar al cliente

-- Verificamos los cambios finales
SELECT * FROM Clientes;
SELECT * FROM Cuentas;
SELECT Dni FROM Clientes WHERE Dni = '47385714';

------------------------------------------------------------------------------------

--FILTRAR DATOS AVANZADOS (WHERE)-- AND,OR,IN,BETWEEN
-- Clientes que nacieron después del año 2000 Y se llaman 'jose'
SELECT * FROM Clientes 
WHERE FechaNacimiento >= '2000-01-01' AND Nombre = 'jose';

-- Buscar saldos dentro de un rango determinado
SELECT * FROM Cuentas 
WHERE saldo BETWEEN 100000.00 AND 600000.00;

-- Buscar cuentas que pertenezcan a varios clientes específicos
SELECT * FROM Cuentas 
WHERE idCliente IN (1, 3);

-------------------------------------------------------------------------------------

--Búsqueda por texto parcial (LIKE)
-- Buscar emails que terminen en '@gmail.com'
SELECT * FROM Clientes 
WHERE Email LIKE '%@gmail.com';

-- Buscar apellidos que empiecen con 'P'
SELECT * FROM Clientes 
WHERE Apellido LIKE 'P%';

--------------------------------------------------------------------------------------

-- Traer las cuentas ordenadas del mayor saldo al menor
SELECT * FROM Cuentas 
ORDER BY saldo DESC;

--------------------------------------------------------------------------------------

--EJERCICIO--

-- Ejercicio 1
SELECT Nombre, Dni FROM Clientes;

-- Ejercicio 2 (Agregamos la cuenta o cliente para saber de quién es el saldo)
SELECT idCuenta, idCliente, saldo FROM Cuentas WHERE saldo > 200000;

-- Ejercicio 3 (Traemos toda la información del cliente que coincide)
SELECT * FROM Clientes WHERE Apellido LIKE 'G%' OR Apellido LIKE 'L%';

-- Ejercicio 4
SELECT * FROM Clientes ORDER BY FechaNacimiento DESC;

--------------------------------------------------------------------------------------

--CONTAR FILAS (COUNT)-- Cuenta la cantidad total de registros que cumplen con una condición.

-- Contar cuántos clientes hay en total
SELECT COUNT(*) AS TotalClientes FROM Clientes;

-- Contar cuántas cuentas tienen más de $200.000
SELECT COUNT(*) AS CuentasAltas FROM Cuentas WHERE saldo > 200000;	


-- SUMAR VALORES (SUM) Suma todos los valores numéricos de una columna.

-- Sumar todo el dinero guardado en el banco
SELECT SUM(saldo) AS TotalDineroEnBanco FROM Cuentas;

-- Sumar solo el dinero de las cuentas de 'Ahorro'
SELECT SUM(saldo) AS TotalAhorros FROM Cuentas WHERE tipoCuenta = 'Ahorro';

--------------------------------------------------------------------------------------
--EJERCICIO--

SELECT tipoCuenta AS Tipo_De_Cuenta , saldo AS Monto_Disponible FROM Cuentas;
SELECT COUNT(tipoCuenta) as CANTIDAD_DE_CUENTAS_CORRIENTES FROM Cuentas WHERE tipoCuenta = 'Corriente';
SELECT SUM(saldo) AS SALDO_TOTAL FROM Cuentas WHERE idCliente = 1;

--------------------------------------------------------------------------------------

SELECT 
    cli.Nombre, 
    cli.Apellido, 
    cue.tipoCuenta, 
    cue.saldo FROM Clientes AS cli INNER JOIN Cuentas AS cue ON cli.idCliente = cue.idCliente;

--EJERCICIO-- Escribe un INNER JOIN que muestre el Nombre, Apellido y saldo, pero filtrando solo para los saldos mayores a 200,000.
SELECT c.Nombre,c.Apellido,p.saldo FROM Clientes AS c INNER JOIN Cuentas AS p ON c.idCliente = p.idCliente WHERE saldo > 200000;
