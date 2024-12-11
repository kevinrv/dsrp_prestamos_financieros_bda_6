USE dsrp_prestamos_financieros_6;
/* Ejercicios Propuestos:
Inserción de Datos Iniciales:

Inserta al menos 3 registros en cada una de las tablas personas_naturales y personas_juridicas.
Registra 5 sucursales con códigos únicos y direcciones ficticias.
Crea 3 tipos de préstamo con descripciones.
*/
/*Consulta Básica:

Obtén una lista de todos los clientes (personas naturales y jurídicas) con su tipo de persona (tipo_persona).
*/

SELECT*FROM clientes;
SELECT*FROM personas_naturales;
SELECT*FROM personas_juridicas;

SELECT
	c.tipo_persona AS 'Tipo Cliente',
	numero_documento,
	ISNULL(nt.nombres, '') + ' ' +ISNULL(nt.apellido_paterno, '')+' '+ISNULL(nt.apellido_materno,'') AS 'Cliente',
	nt.email,
	nt.celular AS 'Celular/Telefono',
	nt.direccion
FROM clientes c
INNER JOIN personas_naturales nt ON nt.id=c.persona_id AND c.tipo_persona='Persona Natural'
UNION
SELECT
	c.tipo_persona AS 'Tipo Cliente',
	pj.numero_documento,
	pj.razon_social 'Cliente',
	pj.email,
	pj.telefono AS 'Celular/Telefono',
	pj.direccion
FROM clientes c
INNER JOIN personas_juridicas pj ON pj.id=c.persona_id AND c.tipo_persona='Persona Jurídica';


/*Relación Cliente-Préstamo:
Inserta al menos 5 registros en la tabla clientes, vinculando algunos con personas_naturales y otros con personas_juridicas.
Registra 3 préstamos asignados a diferentes sucursales y empleados, especificando los tipos de préstamo.
Pagos y Cuotas:

Para cada préstamo registrado, crea 3 cuotas con fechas de vencimiento consecutivas y estados alternados entre "Pendiente" y "Pagado".
Registra pagos realizados para cubrir una o más cuotas y genera los correspondientes registros en detalle_pagos.
*/
SELECT*FROM clientes;
SELECT*FROM prestamos WHERE plazo=12;

-- Inserción cuotas
INSERT INTO cuotas(prestamo_id,numero_cuota,monto,fecha_vencimiento,estado,monto_pendiente) VALUES
(3,1,'7044.89','2024-04-01','Pagado',0),
(3,2,'7044.89','2024-05-01','Pagado',0),
(3,3,'7044.89','2024-06-01','Pagado',0),
(3,4,'7044.89','2024-07-01','Pagado',0),
(3,5,'7044.89','2024-08-01','Pagado',0),
(3,6,'7044.89','2024-09-01','Pagado',0),
(3,7,'7044.89','2024-10-01','Pagado',0),
(3,8,'7044.89','2024-11-01','Pagado',0),
(3,9,'7044.89','2024-12-01','Pagado',0),
(3,10,'7044.89','2025-01-01','Pendiente',7044.89),
(3,11,'7044.89','2025-02-01','Pendiente',7044.89),
(3,12,'7044.89','2025-03-01','Pendiente',7044.89);

-- Inserción Pagos
INSERT INTO pagos (codigo_operacion,fecha_pago, monto_abonado)
VALUES
('000000003','2024-04-01',14089.78),
('000000004','2024-05-30',7044.89),
('000000005','2024-06-01',7044.89),
('000000006','2024-07-01',7044.89),
('000000007','2024-08-31',7044.89),
('000000008','2024-09-01',7044.89),
('000000009','2024-10-30',7044.89),
('000000010','2024-11-15',4044.89),
('000000011','2024-12-01',3000.00);

SELECT 7044.89*2
SELECT*FROM cuotas;
SELECT*FROM pagos;
SELECT*FROM detalle_pagos;

DELETE FROM pagos;

INSERT INTO detalle_pagos (cuota_id,pago_id,monto_afectado)
VALUES
(1,22,7044.89),
(2,22,7044.89),
(3,23,7044.89),
(4,24,7044.89),
(5,25,7044.89),
(6,26,7044.89),
(7,27,7044.89),
(8,28,7044.89),
(9,29,4044.89),
(9,30,3000.00);


-- Calculo del valor de la cuota
SELECT id,plazo,ROUND((monto_otorgado+monto_otorgado*tasa_interes)/plazo,2) AS 'monto_cuota'
FROM prestamos WHERE plazo=12

-- Actualizar fecha vencimiento en la tabla prestamos
SELECT 
fecha_inicio,
plazo,
fecha_vencimiento,
DATEADD(MONTH,plazo,fecha_inicio) as 'fecha_vencimiento_calculado'
FROM prestamos;

UPDATE prestamos 
	SET 
		fecha_vencimiento = DATEADD(MONTH,plazo,fecha_inicio), 
		updated_at = GETDATE(),
		updated_by = '1';
---

/*
Consultas Intermedias:

1.Lista los préstamos activos, mostrando el cliente, el tipo de préstamo, y el monto otorgado.
*/
SELECT*FROM prestamos;
-- JOEL
SELECT CASE			WHEN c.tipo_persona = 'Persona Natural' THEN CONCAT(pn.nombres, ' ', pn.apellido_paterno, ' ', pn.apellido_materno)			WHEN c.tipo_persona = 'Persona Jurídica' THEN pj.razon_social			ELSE 'desconocido'	   END AS 'nombre_cliente',	   tp.nombre AS 'tipo_prestamo',	   p.monto_otorgadoFROM prestamos p	INNER JOIN tipos_prestamo tp ON tp.id = p.tipo_prestamo_id	INNER JOIN clientes c ON c.id = p.cliente_id	LEFT JOIN personas_naturales pn ON pn.id = c.persona_id AND c.tipo_persona = 'Persona Natural'	LEFT JOIN personas_juridicas pj ON pj.id = c.persona_id AND c.tipo_persona = 'Persona Jurídica'WHERE p.fecha_vencimiento > GETDATE();

-- FORMA 2

SELECT CONCAT(pn.nombres, ' ', pn.apellido_paterno, ' ', pn.apellido_materno) AS 'Cliente',	   tp.nombre AS 'tipo_prestamo',	   p.monto_otorgadoFROM prestamos p	INNER JOIN tipos_prestamo tp ON tp.id = p.tipo_prestamo_id	INNER JOIN clientes c ON c.id = p.cliente_id	INNER JOIN personas_naturales pn ON pn.id = c.persona_id AND c.tipo_persona = 'Persona Natural'
WHERE p.fecha_vencimiento > GETDATE()
UNION
SELECT pj.razon_social AS 'Cliente',	   tp.nombre AS 'tipo_prestamo',	   p.monto_otorgadoFROM prestamos p	INNER JOIN tipos_prestamo tp ON tp.id = p.tipo_prestamo_id	INNER JOIN clientes c ON c.id = p.cliente_id	INNER JOIN personas_juridicas pj ON pj.id = c.persona_id AND c.tipo_persona = 'Persona Jurídica'
WHERE p.fecha_vencimiento > GETDATE();


/*
2.Encuentra todas las cuotas pendientes, incluyendo el nombre del cliente y el código del préstamo.
*/
SELECT CASE			WHEN c.tipo_persona = 'Persona Natural' THEN CONCAT(pn.nombres, ' ', pn.apellido_paterno, ' ', pn.apellido_materno)			WHEN c.tipo_persona = 'Persona Jurídica' THEN pj.razon_social			ELSE 'desconocido'	   END AS 'nombre_cliente',	   p.id AS 'prestamo_id',	   ct.numero_cuota,	   ct.monto_pendiente,	   ct.fecha_vencimientoFROM prestamos p	INNER JOIN tipos_prestamo tp ON tp.id = p.tipo_prestamo_id	INNER JOIN clientes c ON c.id = p.cliente_id	LEFT JOIN personas_naturales pn ON pn.id = c.persona_id AND c.tipo_persona = 'Persona Natural'	LEFT JOIN personas_juridicas pj ON pj.id = c.persona_id AND c.tipo_persona = 'Persona Jurídica'	INNER JOIN cuotas ct ON ct.prestamo_id=p.idWHERE ct.estado='Pendiente';

SELECT*FROM prestamos;
/*


3.Obtén el total abonado por cada cliente en sus pagos.
*/

SELECT CASE			WHEN c.tipo_persona = 'Persona Natural' THEN CONCAT(pn.nombres, ' ', pn.apellido_paterno, ' ', pn.apellido_materno)			WHEN c.tipo_persona = 'Persona Jurídica' THEN pj.razon_social			ELSE 'desconocido'	   END AS 'nombre_cliente',	   SUM(monto_abonado) AS 'total_abonado'FROM prestamos p	INNER JOIN clientes c ON c.id = p.cliente_id	LEFT JOIN personas_naturales pn ON pn.id = c.persona_id AND c.tipo_persona = 'Persona Natural'	LEFT JOIN personas_juridicas pj ON pj.id = c.persona_id AND c.tipo_persona = 'Persona Jurídica'
	INNER JOIN cuotas ct ON ct.prestamo_id=p.id
	INNER JOIN detalle_pagos dp ON dp.cuota_id=ct.id
	INNER JOIN pagos pg ON pg.id=dp.pago_id
GROUP BY c.tipo_persona,pn.nombres, pn.apellido_paterno, pn.apellido_materno, pj.razon_social;

-- SOLO CON EL CODIGO(id) DE CLIENTE
SELECT c.id AS 'cliente_id',	   SUM(monto_abonado) AS 'total_abonado'FROM prestamos p	INNER JOIN clientes c ON c.id = p.cliente_id
	INNER JOIN cuotas ct ON ct.prestamo_id=p.id
	INNER JOIN detalle_pagos dp ON dp.cuota_id=ct.id
	INNER JOIN pagos pg ON pg.id=dp.pago_id
GROUP BY c.id;


/*
Actualizaciones y Eliminaciones:

--Actualiza la dirección de una sucursal.
*/
SELECT*FROM sucursales;

UPDATE sucursales SET direccion='Av. Alfonso Ugarte N° 205'
WHERE id=2;
/*
--Marca como eliminados (llenando deleted_at y deleted_by) todos los préstamos cuyo plazo 
ya haya vencido.
*/
UPDATE prestamos
	SET 
		deleted_at=GETDATE(),
		deleted_by=1
WHERE fecha_vencimiento<GETDATE() AND deleted_at IS NULL;

SELECT*FROM prestamos WHERE deleted_at IS NOT NULL;





/*
--Elimina un cliente y todos los registros asociados (préstamos, cuotas, etc.).


Estadísticas y Agregaciones:

Calcula el promedio de los montos otorgados en los préstamos.
Determina cuál sucursal ha otorgado el mayor número de préstamos.
Genera un reporte con el total de intereses generados por los préstamos.
Validaciones:

Intenta insertar un registro en clientes con un tipo_persona no permitido y verifica la restricción CHECK.
Inserta un empleado con un supervisor_id que no existe y observa el resultado.
Procedimientos Almacenados:

Crea un procedimiento almacenado que registre automáticamente un pago y actualice las cuotas afectadas.
Diseña un procedimiento para generar un reporte con los préstamos activos de una sucursal específica.
Consultas Avanzadas:

Encuentra todos los préstamos con cuotas vencidas, incluyendo el nombre del cliente y el monto pendiente.
Lista los empleados que no tienen supervisor.*/