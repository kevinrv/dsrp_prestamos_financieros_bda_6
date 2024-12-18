USE dsrp_prestamos_financieros_6;
GO
/* 
Ejercicios Propuestos de Nivel Intermedio y Avanzado
Intermedio
Consulta con JOINs múltiples:

Obtén una lista de todos los préstamos, mostrando:
El cliente (nombre o razón social según corresponda).
La sucursal.
El empleado que gestionó el préstamo.
El tipo de préstamo.
El monto total otorgado y la tasa de interés.*/

SELECT 
	p.id AS 'prestamo_id',
	c.tipo_persona AS 'Tipo_cliente',
	CONCAT(pt.nombres,' ',pt.apellido_paterno,' ',pt.apellido_materno) AS 'cliente',
	s.nombres AS 'sucursal',
	e.codigo_empleado,
	CONCAT(pe.nombres,' ',pe.apellido_paterno,' ',pe.apellido_materno) AS 'Empleado',
	tp.nombre AS 'Tipo_prestamo',
	p.monto_otorgado,
	p.tasa_interes,
	p.plazo
FROM prestamos p
	INNER JOIN clientes c ON c.id=p.cliente_id
	INNER JOIN personas_naturales pt ON pt.id=c.persona_id AND c.tipo_persona='Persona Natural'
	INNER JOIN sucursales s ON p.sucursal_id=s.id
	INNER JOIN empleados e ON e.id=p.empleado_id
	INNER JOIN personas_naturales pe ON pe.id=e.persona_id
	INNER JOIN tipos_prestamo tp ON tp.id=p.tipo_prestamo_id
UNION
SELECT 
	p.id AS 'prestamo_id',
	c.tipo_persona AS 'Tipo_cliente',
	pj.razon_social AS 'cliente',
	s.nombres AS 'sucursal',
	e.codigo_empleado,
	CONCAT(pe.nombres,' ',pe.apellido_paterno,' ',pe.apellido_materno) AS 'Empleado',
	tp.nombre AS 'Tipo_prestamo',
	p.monto_otorgado,
	p.tasa_interes,
	p.plazo
FROM prestamos p
	INNER JOIN clientes c ON c.id=p.cliente_id
	INNER JOIN personas_juridicas pj ON pj.id=c.persona_id AND c.tipo_persona='Persona Jurídica'
	INNER JOIN sucursales s ON p.sucursal_id=s.id
	INNER JOIN empleados e ON e.id=p.empleado_id
	INNER JOIN personas_naturales pe ON pe.id=e.persona_id
	INNER JOIN tipos_prestamo tp ON tp.id=p.tipo_prestamo_id
ORDER BY 3;

SELECT*FROM cuotas;
/*
Cuotas Pendientes:

Crea una consulta para listar las cuotas vencidas que no han sido completamente abonadas, mostrando:
El cliente.
El préstamo relacionado.
El número de cuota y el monto pendiente.
*/

SELECT 
	p.id AS 'prestamo_id',
	c.tipo_persona AS 'Tipo_cliente',
	CONCAT(pt.nombres,' ',pt.apellido_paterno,' ',pt.apellido_materno) AS 'cliente',
	ct.numero_cuota,
	ct.monto_pendiente,
	ct.fecha_vencimiento
FROM prestamos p
	INNER JOIN clientes c ON c.id=p.cliente_id
	INNER JOIN personas_naturales pt ON pt.id=c.persona_id AND c.tipo_persona='Persona Natural'
	INNER JOIN cuotas ct ON ct.prestamo_id=p.id
WHERE estado='Vencido'
UNION
SELECT 
	p.id AS 'prestamo_id',
	c.tipo_persona AS 'Tipo_cliente',
	pj.razon_social AS 'cliente',
	ct.numero_cuota,
	ct.monto_pendiente,
	ct.fecha_vencimiento
FROM prestamos p
	INNER JOIN clientes c ON c.id=p.cliente_id
	INNER JOIN personas_juridicas pj ON pj.id=c.persona_id AND c.tipo_persona='Persona Jurídica'
	INNER JOIN cuotas ct ON ct.prestamo_id=p.id
WHERE estado='Vencido'
ORDER BY 3;



/*
Reporte de Saldos por Préstamo:

Calcula el monto pendiente total de cada préstamo (suma de monto_pendiente de las cuotas relacionadas) y clasifícalos como:
"Al día" si no tienen cuotas vencidas.
"En mora" si tienen al menos una cuota vencida.*/
SELECT*FROM cuotas;

SELECT 
	p.id, 
	SUM(monto_pendiente) AS 'Monto_pendiente_total',
	CASE WHEN c.estado != 'Vencido' THEN 'Al día'
	ELSE 'En mora' END AS 'estado_prestamo'
FROM prestamos p
INNER JOIN cuotas c ON c.prestamo_id=p.id
GROUP BY p.id,c.estado
ORDER BY 2 DESC;

/*
Pagos por Cliente:

Diseña una consulta que liste los clientes y el total de dinero que han abonado hasta
la fecha, incluyendo aquellos que no han realizado ningún pago.
*/
SELECT
	CONCAT(pt.nombres,' ',pt.apellido_paterno,' ',pt.apellido_materno) AS 'cliente',
	CASE WHEN dp.id IS NULL THEN 0
	ELSE SUM(dp.monto_afectado) END AS 'total_abonado'
FROM clientes cl
	INNER JOIN personas_naturales pt ON pt.id=cl.persona_id AND cl.tipo_persona='Persona Natural'
	INNER JOIN prestamos p ON p.cliente_id=cl.id
	INNER JOIN cuotas ct ON ct.prestamo_id=p.id
	LEFT JOIN detalle_pagos dp ON dp.cuota_id=ct.id
GROUP BY 
	pt.nombres,
	pt.apellido_paterno,
	pt.apellido_materno,
	dp.id;



/*
Validación de Restricciones:

Intenta insertar un préstamo cuyo tipo_prestamo_id no exista en la tabla tipos_prestamo y analiza el error generado.
Actualización Masiva:

Crea una consulta que aumente la tasa_interes de todos los préstamos en 0.5% si el monto otorgado es mayor a 50,000.
Avanzado
Reporte Consolidado de Préstamos:

Genera un reporte con el siguiente formato:
Nombre o Razón Social del cliente.
Cantidad total de préstamos activos.
Monto total otorgado en todos sus préstamos.
Monto total pendiente.

Subconsultas Correlacionadas:

Encuentra los empleados que han gestionado al menos un préstamo en cada sucursal.
*/

SELECT 
	e.codigo_empleado, 
	COUNT(DISTINCT s.id) AS 'num_suscursales'
FROM prestamos p
	INNER JOIN sucursales s ON s.id=p.sucursal_id
	INNER JOIN empleados e ON e.id=p.empleado_id
GROUP BY e.codigo_empleado
HAVING COUNT(DISTINCT s.id)=(SELECT COUNT(*)  FROM sucursales)
ORDER BY 1,2;



-- Joel

SELECT t2.persona_id,	   CONCAT(pn.nombres, ' ', pn.apellido_paterno, ' ', pn.apellido_materno) AS 'nombre_empleados'FROM (		SELECT *,			   ROW_NUMBER() OVER (PARTITION BY t1.persona_id ORDER BY t1.persona_id) AS fila		FROM (				SELECT DISTINCT e.persona_id, p.sucursal_id				FROM empleados e				INNER JOIN prestamos p ON p.empleado_id = e.id		) AS t1	 ) AS t2INNER JOIN personas_naturales pn ON pn.id = t2.persona_id WHERE t2.fila = 16;

SELECT*FROM sucursales;

/*


Pagos Detallados por Cuotas:

Lista todas las cuotas pagadas parcialmente, mostrando:
El cliente.
El préstamo relacionado.
El número de cuota.
El monto pendiente inicial, el monto abonado, y el saldo restante.
Cuotas Vencidas en un Rango de Fechas:

Crea una consulta parametrizada que permita listar las cuotas vencidas en un rango de fechas especificado por el usuario.
Procedimiento Almacenado - Registro de Préstamos:

Diseña un procedimiento almacenado que registre un nuevo préstamo, asignando automáticamente las cuotas relacionadas (según el plazo) con:
Montos iguales distribuidos en todas las cuotas.
Fechas de vencimiento calculadas según el plazo y la fecha de inicio.
Disparador para Pagos:

Crea un disparador (TRIGGER) que:
Se active al insertar un nuevo pago en la tabla pagos.
Actualice automáticamente el monto_pendiente en la tabla cuotas.
Cambie el estado de la cuota a "Pagado" si su saldo pendiente llega a cero.*/

SELECT*FROM cuotas WHERE id=110;
SELECT*FROM detalle_pagos;
SELECT*FROM pagos;
UPDATE cuotas set monto_pendiente=0
WHERE monto_pendiente<0;

DROP TRIGGER trg_kv_actualizar_cuotas;
CREATE TRIGGER trg_kv_actualizar_cuotas
ON detalle_pagos
AFTER INSERT
AS
BEGIN 
	SET NOCOUNT ON;
	UPDATE c
	SET c.monto_pendiente=c.monto_pendiente-dp.monto_afectado,
		c.estado= CASE 
			WHEN c.monto_pendiente-dp.monto_afectado<=0 THEN  'Pagado'
			ELSE c.estado END
	FROM cuotas c
	INNER JOIN detalle_pagos dp ON dp.cuota_id=c.id
	INNER JOIN inserted i ON i.id=dp.id;
	PRINT 'Se inserto correctamente el pago'
END;
GO





INSERT INTO pagos VALUES('11231313', GETDATE(),'988.1047')--Pago cuota id=110
INSERT INTO detalle_pagos VALUES(110,42,'988.1047');

EXEC dbo.sp_kv_registra_pagos_cuota_v3 '41','6046.24'

SELECT*FROM cuotas WHERE id=41;
/*


Reporte de Eficiencia de Sucursales:

Genera un reporte que muestre:
El nombre de cada sucursal.
El número total de préstamos gestionados.
El porcentaje de estos préstamos que están al día.
El monto total otorgado.
Optimización de Cuotas con Pagos Parciales:

Diseña un procedimiento almacenado que redistribuya automáticamente pagos parciales de una cuota en cuotas futuras cuando el monto abonado supera el saldo pendiente de la cuota actual.

Consulta Jerárquica de Empleados: Resolver con un cursor

Lista los empleados junto con sus supervisores directos y, si aplica, el supervisor del supervisor, mostrando:
Nombre del empleado.
Nombre del supervisor directo.*/

SELECT*FROM empleados;

UPDATE empleados SET supervisor_id = NULL, sucursal_id = NULL
WHERE id=11;
-- cursor imprime cod_empleado
DECLARE @empleado AS varchar(255)
DECLARE @cod_empleado AS varchar(255)
DECLARE cr_kv_imprime_cod_empleado CURSOR FOR 
	SELECT 
		CONCAT(pt.nombres,' ',pt.apellido_paterno,' ',pt.apellido_materno) AS 'empleado',
		e.codigo_empleado AS 'cod_empleado'
	FROM empleados e
	INNER JOIN personas_naturales pt ON pt.id=e.persona_id
OPEN cr_kv_imprime_cod_empleado
FETCH NEXT FROM cr_kv_imprime_cod_empleado INTO @empleado, @cod_empleado
WHILE @@fetch_status = 0
BEGIN
    PRINT 'El empleado(a) '+@empleado+' tiene el código: ' +@cod_empleado
    FETCH NEXT FROM cr_kv_imprime_cod_empleado INTO @empleado,@cod_empleado
END
CLOSE cr_kv_imprime_cod_empleado
DEALLOCATE cr_kv_imprime_cod_empleado

-- Cursor para listar a los supervisores con sus respectivos empleados a cargo

DECLARE @supervisor AS varchar(255),  @message VARCHAR(80),
		@cod_supervisor AS varchar(255),
		@empleado AS varchar(255), @cod_empleado AS varchar(255), @id_supervisor AS INT

PRINT '-------- Reporte de Supervisores con sus empleados a Cargo --------';
-- Cursor principal para listar los supervisores
DECLARE cr_kv_imprime_supervisores CURSOR FOR 
	SELECT 
		CONCAT(pt.nombres,' ',pt.apellido_paterno,' ',pt.apellido_materno) AS 'supervisor',
		e.codigo_empleado AS 'cod_supervisor',
		e.id AS 'id_supervisor'
	FROM empleados e
	INNER JOIN personas_naturales pt ON pt.id=e.persona_id
	WHERE supervisor_id IS NULL
OPEN cr_kv_imprime_supervisores
FETCH NEXT FROM cr_kv_imprime_supervisores INTO @supervisor, @cod_supervisor, @id_supervisor
WHILE @@fetch_status = 0
BEGIN
    PRINT ' '
    SELECT @message = '----- Empleados del  Supervisor ' +
        @supervisor+' ('+@cod_supervisor+')'
    PRINT @message
    -- Cursor para listas empleados a cargo de cada supervisor
	DECLARE cr_kv_imprime_empleados CURSOR FOR 
	SELECT 
		CONCAT(pt.nombres,' ',pt.apellido_paterno,' ',pt.apellido_materno) AS 'empleado',
		e.codigo_empleado AS 'cod_empleado'
	FROM empleados e
	INNER JOIN personas_naturales pt ON pt.id=e.persona_id
	WHERE supervisor_id=@id_supervisor
	OPEN cr_kv_imprime_empleados
	FETCH NEXT FROM cr_kv_imprime_empleados INTO @empleado,@cod_empleado

    IF @@FETCH_STATUS <> 0
        PRINT '         Por el momento no cuenta con empleados a cargo.'

    WHILE @@FETCH_STATUS = 0
    BEGIN

        SELECT @message = '         ' + @empleado + ' ('+@cod_empleado+')'
        PRINT @message
        FETCH NEXT FROM cr_kv_imprime_empleados INTO @empleado,@cod_empleado
        END

    CLOSE cr_kv_imprime_empleados
    DEALLOCATE cr_kv_imprime_empleados

	---
    FETCH NEXT FROM cr_kv_imprime_supervisores 
	INTO @supervisor, @cod_supervisor,@id_supervisor
END
CLOSE cr_kv_imprime_supervisores
DEALLOCATE cr_kv_imprime_supervisores

/*



Auditoría de Cambios:

Crea una tabla de auditoría para registrar cualquier cambio en la tabla prestamos
(incluyendo actualizaciones y eliminaciones), con:
El ID del préstamo afectado.
El tipo de cambio (INSERT, UPDATE, DELETE).
La fecha y el usuario que realizó el cambio.*/

-- Creamos la tabla auditoria_prestamos

CREATE TABLE audit_prestamos (
id INT PRIMARY KEY IDENTITY (1,1),
prestamo_id INT NOT NULL,
tipo_cambio VARCHAR(50) NOT NULL,
fecha_cambio DATETIME DEFAULT GETDATE(),
usuario VARCHAR(100) NOT NULL
);

GO

SELECT SYSTEM_USER;

CREATE TRIGGER trg_kv_auditorias_prestamos
ON prestamos
AFTER INSERT, UPDATE, DELETE
AS 
BEGIN 
	SET NOCOUNT ON;

	DECLARE @user_change VARCHAR(100);
	SET @user_change = SYSTEM_USER;

	--INSERT

	IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
	BEGIN
		INSERT INTO audit_prestamos (prestamo_id,tipo_cambio,usuario)
		SELECT id,'INSERT',@user_change
		FROM inserted;
	END;

	--DELETE

	IF NOT EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
	BEGIN
		INSERT INTO audit_prestamos (prestamo_id,tipo_cambio,usuario)
		SELECT id,'DELETE',@user_change
		FROM deleted;
	END;

	--UPDATE
	IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
	BEGIN
	INSERT INTO audit_prestamos (prestamo_id,tipo_cambio,usuario)
	SELECT id,'UPDATE',@user_change
		FROM inserted;
	END;
END;
GO

SELECT*FROM prestamos WHERE id=104;

SELECT*FROM audit_prestamos;

DELETE FROM prestamos WHERE id=105;

UPDATE prestamos SET monto_otorgado=10000
WHERE id=104;