USE [master]
GO
/****** Object:  Database [dsrp_prestamos_financieros_6]    Script Date: 28/11/2024 20:45:24 ******/
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
ALTER DATABASE [dsrp_prestamos_financieros_6] SET  ENABLE_BROKER 
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
/****** Object:  Table [dbo].[clientes]    Script Date: 28/11/2024 20:45:25 ******/
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
/****** Object:  Table [dbo].[cuotas]    Script Date: 28/11/2024 20:45:25 ******/
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
/****** Object:  Table [dbo].[detalle_pagos]    Script Date: 28/11/2024 20:45:25 ******/
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
/****** Object:  Table [dbo].[empleados]    Script Date: 28/11/2024 20:45:25 ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagos]    Script Date: 28/11/2024 20:45:25 ******/
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
/****** Object:  Table [dbo].[personas_juridicas]    Script Date: 28/11/2024 20:45:25 ******/
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
/****** Object:  Table [dbo].[personas_naturales]    Script Date: 28/11/2024 20:45:25 ******/
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
/****** Object:  Table [dbo].[prestamos]    Script Date: 28/11/2024 20:45:25 ******/
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
	[fecha_vencimiento] [date] NOT NULL,
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
/****** Object:  Table [dbo].[sucursales]    Script Date: 28/11/2024 20:45:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [char](6) NOT NULL,
	[nombres] [varchar](100) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
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
/****** Object:  Table [dbo].[tipos_prestamo]    Script Date: 28/11/2024 20:45:25 ******/
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
USE [master]
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET  READ_WRITE 
GO
