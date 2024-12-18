USE [master]
GO
/****** Object:  Database [dsrp_prestamos_financieros_6]    Script Date: 12/12/2024 22:02:52 ******/
CREATE DATABASE [dsrp_prestamos_financieros_6]

ALTER DATABASE [dsrp_prestamos_financieros_6] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dsrp_prestamos_financieros_6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET ARITHABORT OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET RECOVERY FULL 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET  MULTI_USER 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dsrp_prestamos_financieros_6', N'ON'
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET QUERY_STORE = OFF
GO
USE [dsrp_prestamos_financieros_6]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_KV_RETORNA_NOMBRE_COMPLETO]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FN_KV_RETORNA_NOMBRE_COMPLETO](@nombres VARCHAR(255),@app VARCHAR(255),@apm VARCHAR(255))

RETURNS VARCHAR(1000)
AS
BEGIN
DECLARE @nombre_completo VARCHAR (1000);
SELECT @nombre_completo=CONCAT(@app,' ',@apm,' ',@nombres);

RETURN @nombre_completo;
END
GO
/****** Object:  Table [dbo].[personas_naturales]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personas_naturales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](25) NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[celular] [varchar](20) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_kv_listar_personas_naturales]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_kv_listar_personas_naturales] AS
SELECT
	numero_documento AS 'DNI',
	CONCAT(nombres,' ',apellido_paterno,' ',apellido_materno) AS 'Nombre Completo',
	email 
FROM personas_naturales;
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_persona] [varchar](55) NOT NULL,
	[persona_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cuotas]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuotas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prestamo_id] [int] NOT NULL,
	[numero_cuota] [int] NOT NULL,
	[monto] [money] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[monto_pendiente] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_pagos]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_pagos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cuota_id] [int] NOT NULL,
	[pago_id] [int] NOT NULL,
	[monto_afectado] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[persona_id] [int] NOT NULL,
	[codigo_empleado] [varchar](6) NOT NULL,
	[cargo] [varchar](100) NOT NULL,
	[supervisor_id] [int] NULL,
	[sucursal_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagos]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo_operacion] [varchar](20) NOT NULL,
	[fecha_pago] [datetime] NULL,
	[monto_abonado] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personas_juridicas]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personas_juridicas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](20) NOT NULL,
	[razon_social] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prestamos]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prestamos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NOT NULL,
	[sucursal_id] [int] NOT NULL,
	[empleado_id] [int] NOT NULL,
	[tipo_prestamo_id] [int] NOT NULL,
	[monto_otorgado] [money] NOT NULL,
	[tasa_interes] [float] NOT NULL,
	[plazo] [int] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_vencimiento] [datetime] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[created_by] [int] NOT NULL,
	[updated_by] [int] NULL,
	[deleted_by] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursales]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](20) NULL,
	[nombres] [varchar](100) NOT NULL,
	[direccion] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombres] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_prestamo]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_prestamo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[pagos] ADD  DEFAULT (getdate()) FOR [fecha_pago]
GO
ALTER TABLE [dbo].[cuotas]  WITH CHECK ADD  CONSTRAINT [FK_prestamo_cuota] FOREIGN KEY([prestamo_id])
REFERENCES [dbo].[prestamos] ([id])
GO
ALTER TABLE [dbo].[cuotas] CHECK CONSTRAINT [FK_prestamo_cuota]
GO
ALTER TABLE [dbo].[detalle_pagos]  WITH CHECK ADD  CONSTRAINT [FK_cuotas_detalles_pagos] FOREIGN KEY([cuota_id])
REFERENCES [dbo].[cuotas] ([id])
GO
ALTER TABLE [dbo].[detalle_pagos] CHECK CONSTRAINT [FK_cuotas_detalles_pagos]
GO
ALTER TABLE [dbo].[detalle_pagos]  WITH CHECK ADD  CONSTRAINT [FK_pagos_detalles_pagos] FOREIGN KEY([pago_id])
REFERENCES [dbo].[pagos] ([id])
GO
ALTER TABLE [dbo].[detalle_pagos] CHECK CONSTRAINT [FK_pagos_detalles_pagos]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_persona_natural_empleados] FOREIGN KEY([persona_id])
REFERENCES [dbo].[personas_naturales] ([id])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [FK_persona_natural_empleados]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [fk_sucursal_empleados] FOREIGN KEY([sucursal_id])
REFERENCES [dbo].[sucursales] ([id])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [fk_sucursal_empleados]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_supervisor_empleado] FOREIGN KEY([supervisor_id])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [FK_supervisor_empleado]
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_clientes_prestamos] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_clientes_prestamos]
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_empleados_prestamos] FOREIGN KEY([empleado_id])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_empleados_prestamos]
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_sucursales_prestamos] FOREIGN KEY([sucursal_id])
REFERENCES [dbo].[sucursales] ([id])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_sucursales_prestamos]
GO
ALTER TABLE [dbo].[prestamos]  WITH CHECK ADD  CONSTRAINT [FK_tipos_prestamo_prestamos] FOREIGN KEY([tipo_prestamo_id])
REFERENCES [dbo].[tipos_prestamo] ([id])
GO
ALTER TABLE [dbo].[prestamos] CHECK CONSTRAINT [FK_tipos_prestamo_prestamos]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [check_tipo_persona] CHECK  (([tipo_persona]='Persona Jurídica' OR [tipo_persona]='Persona Natural'))
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [check_tipo_persona]
GO
/****** Object:  StoredProcedure [dbo].[sp_kv_insertar_cuotas_prestamo]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_kv_insertar_cuotas_prestamo] 
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
/****** Object:  StoredProcedure [dbo].[SP_KV_PRESTAMOS_ACTIVOS_SUCURSAL]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KV_PRESTAMOS_ACTIVOS_SUCURSAL] 
	@id_sucursal INT
AS
	SET NOCOUNT ON;
	SELECT 
		id AS 'prestamo_id',
		monto_otorgado,
		plazo,
		tasa_interes,
		fecha_inicio,
		fecha_vencimiento
	FROM prestamos
	WHERE sucursal_id=@id_sucursal AND deleted_at IS NULL;

GO
/****** Object:  StoredProcedure [dbo].[sp_kv_registra_pagos_cuota]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_kv_registra_pagos_cuota] 
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
/****** Object:  StoredProcedure [dbo].[sp_kv_registra_pagos_cuota_v2]    Script Date: 12/12/2024 22:02:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_kv_registra_pagos_cuota_v2]
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
USE [master]
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET  READ_WRITE 
GO
