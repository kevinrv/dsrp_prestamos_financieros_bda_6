USE dsrp_prestamos_financieros_6;
GO

-- Crear un procedimiento almacenado que al momento de insertar un prestamo le genere automaticamente 
-- su calendario cuotas

SELECT*FROM prestamos WHERE id=2;
SELECT*FROM cuotas;

CREATE PROCEDURE sp_kv_insertar_cuotas_prestamo 
	@id_prestamo INT
AS
	SET NOCOUNT ON;
	DECLARE @plazo INT
	SELECT @plazo=plazo FROM prestamos WHERE id=@id_prestamo;
	-- SET @plazo=(SELECT plazo FROM prestamos WHERE id=@id_prestamo);
	-- Insertar cuotas
	DECLARE @Counter INT
	SET @Counter = 0

	WHILE @Counter < @plazo
	BEGIN
	INSERT INTO cuotas(prestamo_id,numero_cuota,monto,fecha_vencimiento,estado, monto_pendiente) 
	SELECT 
		@id_prestamo,
		@Counter + 1,
		(monto_otorgado+monto_otorgado*tasa_interes)/plazo AS 'monto',
		CAST(DATEADD(MONTH,@Counter + 1,fecha_inicio) AS DATE) AS 'fecha_vencimiento',
		'Pendiente' AS 'estado',
		(monto_otorgado+monto_otorgado*tasa_interes)/plazo AS 'monto_pendiente'
	FROM prestamos
	WHERE id=@id_prestamo
	ORDER BY NEWID()
	OFFSET 0 ROWS
	FETCH NEXT 1 ROWS ONLY;
		SET @Counter = @Counter + 1
	END
GO

EXEC dbo.sp_kv_insertar_cuotas_prestamo 2;

SELECT*FROM cuotas;
-- REINICIAR ID
DBCC CHECKIDENT('cuotas' , RESEED, 0)

SELECT CAST(DATEADD(MONTH,2,'2023-04-07') AS DATE)
-- Eliminar procedimientos almacenado
DROP PROCEDURE sp_kv_insertar_cuotas_prestamo;

SELECT NEWID();

-- Evaluando la consulta del procedimiento
	DECLARE @id_prestamo INT
	SET @id_prestamo=1
	DECLARE @plazo INT
	SELECT @plazo=plazo FROM prestamos WHERE id=@id_prestamo;
	-- SET @plazo=(SELECT plazo FROM prestamos WHERE id=@id_prestamo);
	-- Insertar cuotas
	DECLARE @Counter INT
	SET @Counter = 0

	WHILE @Counter < @plazo
	BEGIN
	INSERT INTO cuotas(prestamo_id,numero_cuota,monto,fecha_vencimiento,estado, monto_pendiente) 
	SELECT 
		@id_prestamo,
		@Counter + 1,
		(monto_otorgado+monto_otorgado*tasa_interes)/plazo AS 'monto',
		CAST(DATEADD(MONTH,@Counter + 1,fecha_inicio) AS DATE) AS 'fecha_vencimiento',
		'Pendiente' AS 'estado',
		(monto_otorgado+monto_otorgado*tasa_interes)/plazo AS 'monto_pendiente'
	FROM prestamos
	WHERE id=@id_prestamo
	ORDER BY NEWID()
	OFFSET 0 ROWS
	FETCH NEXT 1 ROWS ONLY;
		SET @Counter = @Counter + 1
	END
-- Actualizar las cuotas de los prestamos
DECLARE @num_prestamos INT
SELECT @num_prestamos=COUNT(*) FROM prestamos;
DECLARE @Counter1 INT
	SET @Counter1 = 3

	WHILE @Counter1 <= @num_prestamos
	BEGIN
	EXEC dbo.sp_kv_insertar_cuotas_prestamo @Counter1
	SET @Counter1 = @Counter1 + 1
	END

--- Update cuotas: Todas las cuotas con fecha anterior a la actual las ponemos en estado Vencido

UPDATE cuotas SET estado='Vencido'
WHERE fecha_vencimiento<GETDATE();

SELECT*FROM cuotas WHERE estado='Vencido';

-- Analizando los pagos
SELECT*FROM pagos;
SELECT*FROM detalle_pagos;
SELECT*FROM cuotas WHERE id IN (1,2,3,4);

DELETE FROM detalle_pagos;
DELETE FROM pagos;


-- Insertamos el pago de la cuota de id=1
DECLARE @cuota_id INT
SET @cuota_id=1
DECLARE @monto_pagar MONEY
DECLARE @fecha_pago DATETIME
SELECT @monto_pagar=monto_pendiente,@fecha_pago=fecha_vencimiento FROM cuotas WHERE id=@cuota_id;
--- Insertando pago
INSERT INTO pagos (codigo_operacion,fecha_pago,monto_abonado)
VALUES (ROUND(RAND()*1000000,0),@fecha_pago,@monto_pagar);

INSERT INTO detalle_pagos (cuota_id,pago_id, monto_afectado)
VALUES(@cuota_id,SCOPE_IDENTITY(),@monto_pagar);

--Actualizar cuotas
UPDATE cuotas SET estado='Pagado', monto_pendiente=monto_pendiente-@monto_pagar
WHERE id=@cuota_id;

-- Procedimiento almacenado para registrar pagos v1

CREATE PROCEDURE sp_kv_registra_pagos_cuota 
	@cuota_id INT
AS
	SET NOCOUNT ON;
	DECLARE @monto_pagar MONEY
	DECLARE @fecha_pago DATETIME
	SELECT @monto_pagar=monto_pendiente,@fecha_pago=fecha_vencimiento FROM cuotas WHERE id=@cuota_id;
	--- Insertando pago
	INSERT INTO pagos (codigo_operacion,fecha_pago,monto_abonado)
	VALUES (ROUND(RAND()*1000000,0),@fecha_pago,@monto_pagar);

	INSERT INTO detalle_pagos (cuota_id,pago_id, monto_afectado)
	VALUES(@cuota_id,SCOPE_IDENTITY(),@monto_pagar);

	--Actualizar cuotas
	UPDATE cuotas SET estado='Pagado', monto_pendiente=monto_pendiente-@monto_pagar
	WHERE id=@cuota_id;

GO

EXEC dbo.sp_kv_registra_pagos_cuota 1000

--v2
CREATE PROCEDURE sp_kv_registra_pagos_cuota_v2
	@cuota_id INT,
	@monto_ingresado MONEY
AS
	SET NOCOUNT ON;
	DECLARE @monto_pagar MONEY
	DECLARE @fecha_pago DATETIME
	SELECT @monto_pagar=monto_pendiente, @fecha_pago=fecha_vencimiento FROM cuotas WHERE id=@cuota_id;
	--- Insertando pago
	INSERT INTO pagos (codigo_operacion,fecha_pago,monto_abonado)
	VALUES (ROUND(RAND()*1000000,0),@fecha_pago,@monto_ingresado);

	INSERT INTO detalle_pagos (cuota_id,pago_id, monto_afectado)
	VALUES(@cuota_id,SCOPE_IDENTITY(),@monto_ingresado);

	--Actualizar cuotas
	IF @monto_pagar=@monto_ingresado BEGIN
		UPDATE cuotas SET estado='Pagado', monto_pendiente=monto_pendiente-@monto_ingresado
		WHERE id=@cuota_id;
	END
	ELSE BEGIN 
		UPDATE cuotas SET estado='Pendiente', monto_pendiente=monto_pendiente-@monto_ingresado
		WHERE id=@cuota_id;
	END
GO

EXEC dbo.sp_kv_registra_pagos_cuota_v2 '142','500.00';

