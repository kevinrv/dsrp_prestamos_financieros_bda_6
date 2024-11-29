CREATE DATABASE dsrp_prestamos_financieros_6;
GO

USE dsrp_prestamos_financieros_6;
GO
-- Personas naturales
CREATE TABLE personas_naturales(
	id INT PRIMARY KEY IDENTITY(1,1),
	numero_documento VARCHAR(20) UNIQUE NOT NULL,
	nombres VARCHAR(255) NOT NULL,
	apellido_paterno VARCHAR(255) NOT NULL,
	apellido_materno VARCHAR(255) NOT NULL,
	email VARCHAR(100) NOT NULL,
	celular VARCHAR (20) NOT NULL,
	direccion VARCHAR (255) NOT NULL
); 
GO
ALTER TABLE personas_naturales
ALTER COLUMN numero_documento VARCHAR(25) NOT NULL;

SELECT*FROM personas_naturales;

EXEC SP_HELP personas_naturales;

--Personas Juridicas 
CREATE TABLE personas_juridicas(
	id INT PRIMARY KEY IDENTITY(1,1),
	numero_documento VARCHAR(20) UNIQUE NOT NULL,
	razon_social VARCHAR(255) NOT NULL,
	email VARCHAR(100) NOT NULL,
	telefono VARCHAR (20) NOT NULL,
	direccion VARCHAR (255) NOT NULL
); 
GO

--Clientes

CREATE TABLE clientes(
id INT PRIMARY KEY IDENTITY(1,1),
tipo_persona VARCHAR(55) NOT NULL,
persona_id INT NOT NULL);
Go

ALTER TABLE clientes
ADD CONSTRAINT check_tipo_persona CHECK (tipo_persona IN ('Persona Natural','Persona Jur�dica'));

SELECT*FROM clientes;
INSERT INTO clientes VALUES ('Persona Natural','1');