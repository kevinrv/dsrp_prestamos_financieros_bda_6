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

-- Encontrar filas que cumplan con cualquiera de las 3 condiciones
--su id sea 1
-- su telefono sea 1857687
-- Que su dirección se una avenida

SELECT*FROM personas_juridicas
WHERE 
	id=1 OR
	telefono='32165894' OR
	direccion LIKE 'AV.%' OR
	direccion LIKE 'Avenida%';

-- Encontrar filas que deben cumplir varias condiciones
-- Que su codigo sea mayor a 654789130
-- Que en su nombre contenga la palabra sucursal
-- Que su dirección no sea una Avenida
SELECT*FROM sucursales
WHERE
	codigo > '654789130' AND
	nombres Like '%Sucursal%' AND
	direccion NOT LIKE 'AV%';

-- Encontrar filas que esten en una lista de valores

SELECT*FROM personas_naturales
WHERE numero_documento IN ('67890123','78901234','89012345','90123456','12323456');

-- Encontrar filas que NO esten en una lista de valores

SELECT*FROM personas_naturales
WHERE numero_documento NOT IN ('67890123','78901234','89012345','90123456','12323456');

-- Funciones Matematicas

SELECT*FROM prestamos;
--Monto total otorgado en prestamos de la sucursal de id  1 y 10
--SUM
SELECT 
	sucursal_id,
	SUM(monto_otorgado) AS 'Monto_total_otorgado'
FROM prestamos
WHERE sucursal_id IN (1,10,15,11,5)
GROUP BY sucursal_id
ORDER BY 2 ASC;

-- MAX MIN
SELECT 
	sucursal_id,
	MIN(monto_otorgado) AS 'Monto_total_otorgado'
FROM prestamos
WHERE sucursal_id IN (1,10,15,11,5)
GROUP BY sucursal_id
ORDER BY 2 ASC;

-- Contar
SELECT 
	sucursal_id,
	COUNT(sucursal_id) AS 'Num_prestamos'
FROM prestamos
WHERE sucursal_id IN (1,10,15,11,5)
GROUP BY sucursal_id
ORDER BY 2 ASC;

--HAVING
SELECT 
	sucursal_id,
	COUNT(id) AS 'Num_prestamos'
FROM prestamos
GROUP BY sucursal_id
HAVING COUNT(sucursal_id)>5
ORDER BY 2 ASC;

--CREATE VIEW 

CREATE VIEW vw_kv_listar_personas_naturales AS
SELECT
	numero_documento AS 'DNI',
	CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno) AS 'Nombre Completo',
	email 
FROM personas_naturales;

SELECT*FROM vw_kv_listar_personas_naturales;

-- COMBINACIÓN de Tablas

SELECT 
	p.sucursal_id,
	s.nombres AS 'Sucursal',
	COUNT(p.id) AS 'Num_prestamos'
FROM prestamos p, sucursales s
WHERE p.sucursal_id=s.id
GROUP BY p.sucursal_id,s.nombres
HAVING COUNT(p.id)>5
ORDER BY 2 ASC;

SELECT 
	p.sucursal_id,
	s.nombres AS 'Sucursal',
	COUNT(p.id) AS 'Num_prestamos'
FROM prestamos p
INNER JOIN sucursales s ON p.sucursal_id=s.id
GROUP BY p.sucursal_id,s.nombres
HAVING COUNT(p.id)>5
ORDER BY 2 ASC;

--JOINS

-- INNER JOIN 
SELECT 
	c.persona_id, 
	c.tipo_persona AS 'tipo_cliente',
	monto_otorgado,
	fecha_inicio
FROM clientes c
INNER JOIN prestamos p ON p.cliente_id=c.id;

-- LEFT JOIN
SELECT 
	c.persona_id, 
	c.tipo_persona AS 'tipo_cliente',
	monto_otorgado,
	fecha_inicio
FROM clientes c
LEFT JOIN prestamos p ON p.cliente_id=c.id;

-- RIGTH JOIN
SELECT 
	c.persona_id, 
	c.tipo_persona AS 'tipo_cliente',
	monto_otorgado,
	fecha_inicio
FROM prestamos p
RIGHT JOIN clientes c ON p.cliente_id=c.id;

-- FULL JOIN 

SELECT 
	c.persona_id, 
	c.tipo_persona AS 'tipo_cliente',
	monto_otorgado,
	fecha_inicio
FROM prestamos p
CROSS JOIN clientes c;

SELECT*FROM clientes;
SELECT*FROM prestamos;


-- Seleccionar la lista de empleados (nombre completo, dni, direccion, cod_empleado, cargo,
--nombre completo del supervisor y sucursal al que pertenece) con sus supervisores


-- Franklin
SELECT*FROM empleados;

SELECT 
	e.id AS 'empleado_id',
	CONCAT(pt.nombres,' ', pt.apellido_paterno,' ', pt.apellido_materno) AS 'Nombre completo',
	pt.numero_documento AS 'DNI',
	pt.direccion, 
	e.codigo_empleado,
	e.cargo,
	s.id AS 'supervisor_id',
	CONCAT(ps.nombres,' ', ps.apellido_paterno,' ', ps.apellido_materno) AS 'Supervisor'
FROM empleados e 
INNER JOIN personas_naturales pt ON pt.id = e.persona_id
INNER JOIN empleados s ON s.id=e.supervisor_id
INNER JOIN personas_naturales ps ON ps.id = s.persona_id
INNER JOIN sucursales sc ON sc.id=e.sucursal_id;

-- Joel 
 SELECT CONCAT(pn.nombres, ' ', pn.apellido_paterno, ' ', pn.apellido_materno) AS 'nombre_completo',	   pn.numero_documento,	   pn.direccion,	   e.codigo_empleado,	   e.cargoFROM personas_naturales pnINNER JOIN empleados e ON e.persona_id = pn.id;
