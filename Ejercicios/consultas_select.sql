USE dsrp_prestamos_financieros_6;
GO
--Igualdad simple "Selecionar el dni, nombre completo y email de todos
-- las personas naturales que se llamen David"


SELECT*FROM personas_naturales;

SELECT
	numero_documento AS 'DNI',
	CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno) AS 'Nombre Completo',
	email 
FROM personas_naturales
WHERE nombres='Juan';

--Encontra filas que contienen un valor como parte de una cadena.
-- Seleccionar todos las personas naturales cuyo apellido paterno
-- contengan la cadena "ez"

SELECT
	numero_documento AS 'DNI',
	CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno) AS 'Nombre Completo',
	email 
FROM personas_naturales
WHERE apellido_paterno LIKE ('%ez%');

-- Los apellidos paternos que empiecen con "R"
SELECT
	numero_documento AS 'DNI',
	CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno) AS 'Nombre Completo',
	email 
FROM personas_naturales
WHERE apellido_paterno LIKE('R%');

-- Los apellidos paternos que terminen con "S"
SELECT
	numero_documento AS 'DNI',
	CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno) AS 'Nombre Completo',
	email 
FROM personas_naturales
WHERE apellido_paterno LIKE('%s');

-- Encontrar filas mediante un operador de comparación
-- Listar los clientes cuyo id sea mayor a 90
SELECT*FROM clientes
WHERE id > 90;
-- Mayor igual a 90
SELECT*FROM clientes
WHERE id >= 90;

-- Listar los clientes cuyo id sea menor a 90
SELECT*FROM clientes
WHERE id < 90;
-- Menor igual a 90
SELECT*FROM clientes
WHERE id <= 90;

-- listar los clientes cuyo id este entre 90 y 100

SELECT*FROM clientes
WHERE id>90 AND id < 100;

SELECT*FROM clientes
WHERE id>=90 AND id <= 100;

SELECT*FROM clientes
WHERE id BETWEEN 90 AND 100;

--Seleccionar todos los id diferentes de noventa
SELECT*FROM clientes
WHERE tipo_persona != 90;