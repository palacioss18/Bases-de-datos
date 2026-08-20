DROP TABLE IF EXISTS Clientes;

--Instrucción para crear una tabla Nueva.
create table Clientes (
	idCliente int IDENTITY(1,1) PRIMARY KEY, --IDENTITY asigna el nro de id automaticamente
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Dni VARCHAR(20) NOT NULL UNIQUE,
	Email VARCHAR(100),
	FechaNacimiento DATE
);

INSERT INTO Clientes 
(Nombre,Apellido,Dni,Email,FechaNacimiento) Values	('jose','palacios','47385714','jose@gmail.com','2006-05-10'),
('carlos','gomez','20435493','carlos@gmail.com','1998-08-20'),
('maria','lopez','20321232','maria@gmail.com','2001-03-30');

SELECT * FROM Clientes;

DROP TABLE IF EXISTS Cuentas;
create table Cuentas(
	idCuenta INT IDENTITY(1,1) PRIMARY KEY,
	idCliente INT NOT NULL,
	tipoCuenta VARCHAR(30) NOT NULL,
	saldo DECIMAL(15,2) NOT NULL
	CONSTRAINT FK_Cuentas_Clientes FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

INSERT INTO Cuentas(idCliente, tipoCuenta, saldo) Values 
(1,'Ahorro',150000.00),
(1,'Corriente',500000.00),
(2,'Ahorro',800000.00),
(3,'Corriente',120000.00);

SELECT * FROM Cuentas;
