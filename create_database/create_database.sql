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
ADD CONSTRAINT check_tipo_persona CHECK (tipo_persona IN ('Persona Natural','Persona Jurídica'));

SELECT*FROM clientes;
INSERT INTO clientes VALUES ('Persona Natural','1');

-- Sucursales
CREATE TABLE sucursales(
id INT PRIMARY KEY IDENTITY(1,1),
codigo CHAR(6) NOT NULL,
nombres VARCHAR(100) UNIQUE NOT NULL,
direccion VARCHAR(255) NOT NULL);
GO
-- Pagos

CREATE TABLE pagos(
id INT PRIMARY KEY IDENTITY(1,1),
codigo_operacion VARCHAR(20) NOT NULL,
fecha_pago DATETIME DEFAULT GETDATE() NOT NULL,
monto_abonado MONEY NOT NULL);
GO

INSERT INTO pagos(codigo_operacion,monto_abonado) VALUES('000000001',100.00);
INSERT INTO pagos VALUES('000000002',DEFAULT,200.00);

-- tipo_prestamos

CREATE TABLE tipos_prestamo(
id INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(100) NOT NULL,
descripcion TEXT NULL );
GO

-- Empleados

CREATE TABLE empleados(
id INT PRIMARY KEY IDENTITY(1,1),
persona_id INT NOT NULL,
codigo_empleado VARCHAR(6) NOT NULL,
cargo VARCHAR(100) NOT NULL, 
supervisor_id INT NULL,
CONSTRAINT FK_persona_natural_empleados FOREIGN KEY (persona_id) REFERENCES personas_naturales(id),
CONSTRAINT FK_supervisor_empleado FOREIGN KEY (supervisor_id) REFERENCES empleados(id)
);
GO

ALTER TABLE empleados
ADD sucursal_id INT;


ALTER TABLE empleados
ADD CONSTRAINT fk_sucursal_empleados FOREIGN KEY (sucursal_id) REFERENCES sucursales (id);
-- Prestamos
CREATE TABLE prestamos(
id INT PRIMARY KEY IDENTITY(1,1),
cliente_id INT NOT NULL,
sucursal_id INT NOT NULL,
empleado_id INT NOT NULL,
tipo_prestamo_id INT NOT NULL,
monto_otorgado MONEY NOT NULL,
tasa_interes FLOAT NOT NULL,
plazo INT NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_vencimiento DATE NOT NULL,
created_at DATETIME NOT NULL,
updated_at DATETIME NULL,
deleted_at DATETIME NULL,
created_by INT NOT NULL,
updated_by INT NULL,
deleted_by INT NULL,
CONSTRAINT FK_clientes_prestamos FOREIGN KEY (cliente_id) REFERENCES clientes(id),
CONSTRAINT FK_sucursales_prestamos FOREIGN KEY (sucursal_id) REFERENCES sucursales(id),
CONSTRAINT FK_empleados_prestamos FOREIGN KEY (empleado_id) REFERENCES empleados(id),
CONSTRAINT FK_tipos_prestamo_prestamos FOREIGN KEY (tipo_prestamo_id) REFERENCES tipos_prestamo(id));

ALTER TABLE prestamos
ALTER COLUMN fecha_vencimiento DATETIME NULL;
--cuotas
CREATE TABLE cuotas(
id INT PRIMARY KEY IDENTITY(1,1),
prestamo_id INT NOT NULL,
numero_cuota INT NOT NULL,
monto MONEY NOT NULL,
fecha_vencimiento DATE NOT NULL,
estado VARCHAR(50) NOT NULL,
monto_pendiente MONEY NOT NULL,
CONSTRAINT FK_prestamo_cuota FOREIGN KEY(prestamo_id) REFERENCES prestamos(id)
);


-- detalle_pagos

CREATE TABLE detalle_pagos(
id INT PRIMARY KEY IDENTITY(1,1),
cuota_id INT NOT NULL,
pago_id INT NOT NULL,
monto_afectado FLOAT NOT NULL,
CONSTRAINT FK_cuotas_detalles_pagos FOREIGN KEY (cuota_id) REFERENCES cuotas(id),
CONSTRAINT FK_pagos_detalles_pagos FOREIGN KEY (pago_id) REFERENCES pagos(id));
