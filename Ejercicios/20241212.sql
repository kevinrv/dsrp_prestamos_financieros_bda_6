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

-- Alaizando los pagos