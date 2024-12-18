USE [master]
GO
/****** Object:  Database [dsrp_prestamos_financieros_6]    Script Date: 5/12/2024 19:11:09 ******/
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
/****** Object:  Table [dbo].[personas_naturales]    Script Date: 5/12/2024 19:11:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_kv_listar_personas_naturales]    Script Date: 5/12/2024 19:11:09 ******/
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
/****** Object:  Table [dbo].[clientes]    Script Date: 5/12/2024 19:11:09 ******/
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
/****** Object:  Table [dbo].[cuotas]    Script Date: 5/12/2024 19:11:09 ******/
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
/****** Object:  Table [dbo].[detalle_pagos]    Script Date: 5/12/2024 19:11:09 ******/
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
/****** Object:  Table [dbo].[empleados]    Script Date: 5/12/2024 19:11:09 ******/
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
/****** Object:  Table [dbo].[pagos]    Script Date: 5/12/2024 19:11:09 ******/
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
/****** Object:  Table [dbo].[personas_juridicas]    Script Date: 5/12/2024 19:11:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prestamos]    Script Date: 5/12/2024 19:11:09 ******/
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
/****** Object:  Table [dbo].[sucursales]    Script Date: 5/12/2024 19:11:09 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_prestamo]    Script Date: 5/12/2024 19:11:09 ******/
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
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (63, N'Persona Jurídica', 1)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (64, N'Persona Jurídica', 2)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (65, N'Persona Jurídica', 3)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (66, N'Persona Jurídica', 4)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (67, N'Persona Jurídica', 5)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (68, N'Persona Jurídica', 6)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (69, N'Persona Jurídica', 7)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (70, N'Persona Jurídica', 8)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (71, N'Persona Jurídica', 9)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (72, N'Persona Jurídica', 10)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (73, N'Persona Jurídica', 11)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (74, N'Persona Jurídica', 12)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (75, N'Persona Jurídica', 13)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (76, N'Persona Jurídica', 14)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (77, N'Persona Jurídica', 15)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (78, N'Persona Jurídica', 16)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (79, N'Persona Jurídica', 17)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (80, N'Persona Jurídica', 18)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (81, N'Persona Jurídica', 19)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (82, N'Persona Jurídica', 20)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (83, N'Persona Jurídica', 21)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (84, N'Persona Jurídica', 22)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (85, N'Persona Jurídica', 23)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (86, N'Persona Jurídica', 24)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (87, N'Persona Jurídica', 25)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (88, N'Persona Jurídica', 26)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (89, N'Persona Jurídica', 27)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (90, N'Persona Jurídica', 28)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (91, N'Persona Jurídica', 29)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (92, N'Persona Jurídica', 30)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (93, N'Persona Natural', 1)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (94, N'Persona Natural', 2)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (95, N'Persona Natural', 3)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (96, N'Persona Natural', 4)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (97, N'Persona Natural', 5)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (98, N'Persona Natural', 6)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (99, N'Persona Natural', 7)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (100, N'Persona Natural', 8)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (101, N'Persona Natural', 9)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (102, N'Persona Natural', 10)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (103, N'Persona Natural', 11)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (104, N'Persona Natural', 12)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (105, N'Persona Natural', 13)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (106, N'Persona Natural', 14)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (107, N'Persona Natural', 15)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (108, N'Persona Natural', 16)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (109, N'Persona Natural', 17)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (110, N'Persona Natural', 18)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (111, N'Persona Natural', 19)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (112, N'Persona Natural', 20)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (113, N'Persona Natural', 21)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (114, N'Persona Natural', 22)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (115, N'Persona Natural', 23)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (116, N'Persona Natural', 24)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (117, N'Persona Natural', 25)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (118, N'Persona Natural', 26)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (119, N'Persona Natural', 27)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (120, N'Persona Natural', 28)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (121, N'Persona Natural', 29)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (122, N'Persona Natural', 30)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (123, N'Persona Natural', 31)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (124, N'Persona Natural', 32)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (125, N'Persona Natural', 33)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (126, N'Persona Natural', 34)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (127, N'Persona Natural', 35)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (128, N'Persona Natural', 36)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (129, N'Persona Natural', 37)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (130, N'Persona Natural', 38)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (131, N'Persona Natural', 39)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (132, N'Persona Natural', 40)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (133, N'Persona Natural', 41)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (134, N'Persona Natural', 42)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (135, N'Persona Natural', 43)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (136, N'Persona Natural', 44)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (137, N'Persona Natural', 45)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (138, N'Persona Natural', 46)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (139, N'Persona Natural', 47)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (140, N'Persona Natural', 48)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (141, N'Persona Natural', 49)
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[empleados] ON 

INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (1, 50, N'MR0010', N'supervisor', NULL, NULL)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (2, 51, N'CV0010', N'supervisor', NULL, NULL)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (3, 52, N'VR0010', N'supervisor', NULL, NULL)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (4, 53, N'MT0010', N'supervisor', NULL, NULL)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (5, 54, N'RP0010', N'supervisor', NULL, NULL)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (6, 55, N'FG0010', N'supervisor', NULL, NULL)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (7, 56, N'DL0010', N'supervisor', NULL, NULL)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (8, 57, N'SF0010', N'supervisor', NULL, NULL)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (9, 58, N'RM0010', N'supervisor', NULL, NULL)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (10, 59, N'PS0010', N'supervisor', NULL, NULL)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (11, 60, N'VC003', N'empleado', 4, 1)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (12, 61, N'SC009', N'empleado', 1, 4)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (13, 62, N'LC006', N'empleado', 6, 9)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (14, 63, N'RH0010', N'empleado', 2, 9)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (15, 64, N'GT006', N'empleado', 6, 3)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (16, 65, N'HQ005', N'empleado', 7, 2)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (17, 66, N'CR002', N'empleado', 8, 10)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (18, 67, N'SL005', N'empleado', 6, 1)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (19, 68, N'MC002', N'empleado', 6, 8)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (20, 69, N'AJ009', N'empleado', 1, 12)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (21, 70, N'PV003', N'empleado', 10, 8)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (22, 71, N'NA004', N'empleado', 2, 15)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (23, 72, N'CL008', N'empleado', 5, 8)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (24, 73, N'PG001', N'empleado', 1, 11)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (25, 74, N'BF008', N'empleado', 5, 14)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (26, 75, N'IZ001', N'empleado', 8, 4)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (27, 76, N'ZM002', N'empleado', 2, 1)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (29, 78, N'ÁP009', N'empleado', 9, 6)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (30, 79, N'ZA004', N'empleado', 1, 3)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (31, 80, N'PR000', N'empleado', 8, 7)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (32, 81, N'CV0010', N'empleado', 9, 8)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (33, 82, N'VM008', N'empleado', 6, 6)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (34, 83, N'QE006', N'empleado', 5, 2)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (35, 84, N'BS002', N'empleado', 6, 9)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (36, 85, N'CV007', N'empleado', 1, 9)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (37, 86, N'RP004', N'empleado', 8, 13)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (38, 87, N'VM002', N'empleado', 5, 9)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (39, 88, N'RG004', N'empleado', 3, 11)
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado], [cargo], [supervisor_id], [sucursal_id]) VALUES (40, 89, N'TR009', N'empleado', 6, 12)
SET IDENTITY_INSERT [dbo].[empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[pagos] ON 

INSERT [dbo].[pagos] ([id], [codigo_operacion], [fecha_pago], [monto_abonado]) VALUES (1, N'000000001', CAST(N'2024-11-28T19:50:09.887' AS DateTime), 100.0000)
INSERT [dbo].[pagos] ([id], [codigo_operacion], [fecha_pago], [monto_abonado]) VALUES (2, N'000000002', CAST(N'2024-11-28T19:51:07.680' AS DateTime), 200.0000)
SET IDENTITY_INSERT [dbo].[pagos] OFF
GO
SET IDENTITY_INSERT [dbo].[personas_juridicas] ON 

INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (1, N'12345678910', N'JKC Tecnología e Información', N'jkcit@gmail.com', N'32165894', N'Huaraz-Ancash')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (2, N'20100000001', N'Empresa Alpha S.A.', N'emp@gmail.com', N'1857687', N'AV. Industrial 123')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (3, N'20100000002', N'Beta Corp.', N'bet@gmail.com', N'1857687', N'Calle Comercio 456')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (4, N'20100000003', N'Gamma S.R.L.', N'gam@gmail.com', N'1857687', N'Av. Producción 789')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (5, N'20100000004', N'Delta y Asociados', N'del@gmail.com', N'1857687', N'Calle Negocios 101')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (6, N'20100000005', N'Epsilon Ltda.', N'eps@gmail.com', N'1857687', N'Av. Servicios 202')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (7, N'20100000006', N'Zeta Consultores', N'zet@gmail.com', N'1857687', N'Calle Soluciones 303')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (8, N'20100000007', N'Theta Innovaciones', N'the@gmail.com', N'1857687', N'Av. Proyectos 404')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (9, N'20100000008', N'Iota Ingeniería S.A.C.', N'iot@gmail.com', N'1857687', N'Calle Desarrollo 505')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (10, N'20100000009', N'Kappa Tecnología', N'kap@gmail.com', N'1857687', N'Av. Avances 606')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (11, N'20100000010', N'Lambda Construcciones', N'lam@gmail.com', N'1857687', N'Calle Obras 707')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (12, N'20100000011', N'Mu Financiera', N'mu @gmail.com', N'1857687', N'Av. Capital 808')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (13, N'20100000012', N'Nu Servicios S.A.', N'nu @gmail.com', N'1857687', N'Calle Asesoría 909')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (14, N'20100000013', N'Xi Consultoría', N'xi @gmail.com', N'1857687', N'Av. Estrategia 1010')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (15, N'20100000014', N'Omicron Logística', N'omi@gmail.com', N'1857687', N'Calle Distribución 1111')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (16, N'20100000015', N'Pi Internacional', N'pi @gmail.com', N'1857687', N'Av. Comercio Exterior 1212')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (17, N'20100000016', N'Rho Exportaciones', N'rho@gmail.com', N'1857687', N'Calle Global 1313')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (18, N'20100000017', N'Sigma Importaciones', N'sig@gmail.com', N'1857687', N'Av. Importadores 1414')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (19, N'20100000018', N'Tau Energía S.A.', N'tau@gmail.com', N'1857687', N'Calle Recursos 1515')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (20, N'20100000019', N'Upsilon Tecnológica', N'ups@gmail.com', N'1857687', N'Av. Innovación 1616')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (21, N'20100000020', N'Phi Construcciones', N'phi@gmail.com', N'1857687', N'Calle Edificaciones 1717')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (22, N'20100000021', N'Chi Industrial', N'chi@gmail.com', N'1857687', N'Av. Manufactura 1818')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (23, N'20100000022', N'Psi Consultores', N'psi@gmail.com', N'1857687', N'Calle Planeación 1919')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (24, N'20100000023', N'Omega Global S.A.C.', N'ome@gmail.com', N'1857687', N'Av. Internacional 2020')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (25, N'20100000024', N'Alpha Soluciones', N'alp@gmail.com', N'1857687', N'Calle Innovación 2121')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (26, N'20100000025', N'Beta Tech', N'bet@gmail.com', N'1857687', N'Av. Tecnología 2222')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (27, N'20100000026', N'Gamma Logística', N'gam@gmail.com', N'1857687', N'Calle Distribución 2323')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (28, N'20100000027', N'Delta Asesoría', N'del@gmail.com', N'1857687', N'Av. Negocios 2424')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (29, N'20100000028', N'Epsilon Innovación', N'eps@gmail.com', N'1857687', N'Calle Futuro 2525')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (30, N'20100000029', N'Zeta Proyectos', N'zet@gmail.com', N'1857687', N'Av. Emprendedores 2626')
SET IDENTITY_INSERT [dbo].[personas_juridicas] OFF
GO
SET IDENTITY_INSERT [dbo].[personas_naturales] ON 

INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (1, N'12345678', N'Juan', N'Pérez', N'Gómez', N'juan.perez@example.com', N'987654321', N'Av. Siempre Viva 123')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (2, N'23456789', N'María', N'Rodríguez', N'López', N'maria.rodriguez@example.com', N'987654322', N'Calle Falsa 456')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (3, N'34567890', N'Pedro', N'Sánchez', N'Martínez', N'pedro.sanchez@example.com', N'987654323', N'Plaza Mayor 789')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (4, N'45678901', N'Ana', N'García', N'Fernández', N'ana.garcia@example.com', N'987654324', N'Calle Real 101')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (5, N'56789012', N'Carlos', N'Hernández', N'Gómez', N'carlos.hernandez@example.com', N'987654325', N'Av. Libertad 102')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (6, N'67890123', N'Lucía', N'Martínez', N'González', N'lucia.martinez@example.com', N'987654326', N'Calle Sol 203')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (7, N'78901234', N'José', N'López', N'Pérez', N'jose.lopez@example.com', N'987654327', N'Calle Luna 204')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (8, N'89012345', N'Isabel', N'González', N'Sánchez', N'isabel.gonzalez@example.com', N'987654328', N'Av. 9 de Julio 305')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (9, N'90123456', N'Francisco', N'García', N'Ramírez', N'francisco.garcia@example.com', N'987654329', N'Calle Rosario 406')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (10, N'12323456', N'Marta', N'Sánchez', N'Torres', N'marta.sanchez@example.com', N'987654330', N'Calle del Río 507')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (11, N'23434567', N'Luis', N'Rodríguez', N'Lozano', N'luis.rodriguez@example.com', N'987654331', N'Av. del Sol 608')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (12, N'34545678', N'Carmen', N'Hernández', N'Alvarez', N'carmen.hernandez@example.com', N'987654332', N'Plaza Central 709')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (13, N'45656789', N'Raúl', N'Martínez', N'Suárez', N'raul.martinez@example.com', N'987654333', N'Calle San Pedro 810')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (14, N'56767890', N'Patricia', N'González', N'Martínez', N'patricia.gonzalez@example.com', N'987654334', N'Av. Primavera 911')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (15, N'67878901', N'Juan', N'Alvarez', N'Lopez', N'juan.alvarez@example.com', N'987654335', N'Calle Viento 102')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (16, N'78989012', N'Elena', N'Suárez', N'Jiménez', N'elena.suarez@example.com', N'987654336', N'Calle Monte 203')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (17, N'89090123', N'Javier', N'García', N'Torres', N'javier.garcia@example.com', N'987654337', N'Calle del Sol 304')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (18, N'90101234', N'Rosa', N'Rodríguez', N'Reyes', N'rosa.rodriguez@example.com', N'987654338', N'Plaza Mayor 405')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (19, N'12334567', N'Víctor', N'Martínez', N'Díaz', N'victor.martinez@example.com', N'987654339', N'Av. Del Mar 506')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (20, N'23445678', N'Claudia', N'López', N'González', N'claudia.lopez@example.com', N'987654340', N'Calle Nuevo 607')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (21, N'34556789', N'Felipe', N'González', N'Torres', N'felipe.gonzalez@example.com', N'987654341', N'Calle Oeste 708')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (22, N'45667890', N'Verónica', N'Sánchez', N'Gómez', N'veronica.sanchez@example.com', N'987654342', N'Calle Norte 809')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (23, N'56778901', N'Eduardo', N'Hernández', N'López', N'eduardo.hernandez@example.com', N'987654343', N'Av. del Norte 910')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (24, N'67889012', N'Sofía', N'García', N'Alonso', N'sofia.garcia@example.com', N'987654344', N'Plaza Independencia 1011')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (25, N'78990123', N'José', N'Jiménez', N'Fernández', N'jose.jimenez@example.com', N'987654345', N'Calle Centro 1112')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (26, N'89001234', N'Patricia', N'Torres', N'Mora', N'patricia.torres@example.com', N'987654346', N'Calle Europa 1213')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (27, N'90112345', N'David', N'Suárez', N'García', N'david.suarez@example.com', N'987654347', N'Av. Costanera 1314')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (28, N'12345679', N'Raquel', N'Ramírez', N'Fernández', N'raquel.ramirez@example.com', N'987654348', N'Calle del Carmen 1415')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (29, N'23456780', N'Manuel', N'Sánchez', N'Pérez', N'manuel.sanchez@example.com', N'987654349', N'Calle Real 1516')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (30, N'34567891', N'Sara', N'González', N'Vásquez', N'sara.gonzalez@example.com', N'987654350', N'Av. de la Paz 1617')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (31, N'45678902', N'Oscar', N'López', N'Rivas', N'oscar.lopez@example.com', N'987654351', N'Plaza Mayor 1718')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (32, N'56789023', N'Mónica', N'Ramírez', N'Castro', N'monica.ramirez@example.com', N'987654352', N'Calle Libertad 1819')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (33, N'67890134', N'Ricardo', N'Jiménez', N'Bravo', N'ricardo.jimenez@example.com', N'987654353', N'Av. del Sol 1920')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (34, N'78901245', N'Jessica', N'Suárez', N'Medina', N'jessica.suarez@example.com', N'987654354', N'Calle Monte 2021')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (35, N'89012356', N'Martín', N'Rodríguez', N'Gómez', N'martin.rodriguez@example.com', N'987654355', N'Av. Viento 2122')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (36, N'90123467', N'Patricia', N'González', N'Navarro', N'patricia.gonzalez@example.com', N'987654356', N'Calle Ancha 2223')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (37, N'12334578', N'Carlos', N'Martínez', N'Lozano', N'carlos.martinez@example.com', N'987654357', N'Plaza del Río 2324')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (38, N'23445689', N'Ana', N'Rodríguez', N'González', N'ana.rodriguez@example.com', N'987654358', N'Calle Flor 2425')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (39, N'34556790', N'José', N'López', N'Suárez', N'jose.lopez@example.com', N'987654359', N'Av. del Sol 2526')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (40, N'45667891', N'Julia', N'Martínez', N'Cruz', N'julia.martinez@example.com', N'987654360', N'Calle de la Paz 2627')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (41, N'56778902', N'Antonio', N'Hernández', N'Vega', N'antonio.hernandez@example.com', N'987654361', N'Calle Mayor 2728')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (42, N'67889023', N'Claudia', N'Suárez', N'Morales', N'claudia.suarez@example.com', N'987654362', N'Av. Independencia 2829')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (43, N'78990134', N'Francisco', N'González', N'Paredes', N'francisco.gonzalez@example.com', N'987654363', N'Calle Sol 2930')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (44, N'89001245', N'Alejandro', N'Sánchez', N'Jiménez', N'alejandro.sanchez@example.com', N'987654364', N'Av. de la Luna 3031')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (45, N'90112356', N'Susana', N'Ramírez', N'Lopez', N'susana.ramirez@example.com', N'987654365', N'Plaza Fuerte 3132')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (46, N'12345680', N'Ricardo', N'Torres', N'Núñez', N'ricardo.torres@example.com', N'987654366', N'Calle Fuerte 3233')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (47, N'23456791', N'Jessica', N'González', N'Sánchez', N'jessica.gonzalez@example.com', N'987654367', N'Av. del Sol 3334')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (48, N'34567892', N'Alberto', N'Sánchez', N'Lozano', N'alberto.sanchez@example.com', N'987654368', N'Calle Mar 3435')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (49, N'45678903', N'Verónica', N'Rodríguez', N'Torres', N'veronica.rodriguez@example.com', N'987654369', N'Av. Primavera 3536')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (50, N'67890135', N'Andrea', N'Mendoza', N'Rojas', N'andrea.mendoza@example.com', N'987654370', N'Calle Jardines 456')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (51, N'78901246', N'Miguel', N'Castro', N'Vega', N'miguel.castro@example.com', N'987654371', N'Av. Valle 789')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (52, N'89012357', N'Lorena', N'Vargas', N'Ramírez', N'lorena.vargas@example.com', N'987654372', N'Calle Palmeras 123')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (53, N'90123468', N'Diego', N'Morales', N'Torres', N'diego.morales@example.com', N'987654373', N'Plaza Central 890')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (54, N'12334579', N'Cecilia', N'Ramos', N'Pérez', N'cecilia.ramos@example.com', N'987654374', N'Av. del Bosque 345')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (55, N'23445690', N'Jorge', N'Figueroa', N'Gómez', N'jorge.figueroa@example.com', N'987654375', N'Calle Horizonte 567')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (56, N'34556791', N'Santiago', N'Delgado', N'López', N'santiago.delgado@example.com', N'987654376', N'Calle Maravilla 678')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (57, N'45667892', N'Paula', N'Silva', N'Fernández', N'paula.silva@example.com', N'987654377', N'Av. del Este 789')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (58, N'56778903', N'Natalia', N'Rivera', N'Martínez', N'natalia.rivera@example.com', N'987654378', N'Calle Armonía 910')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (59, N'67889024', N'Fabio', N'Paredes', N'Suárez', N'fabio.paredes@example.com', N'987654379', N'Plaza Unión 1011')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (60, N'67900136', N'Adriana', N'Villanueva', N'Cruz', N'adriana.villanueva@example.com', N'987654380', N'Av. Primavera 345')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (61, N'78911247', N'Luis', N'Soto', N'Carvajal', N'luis.soto@example.com', N'987654381', N'Calle Sol Naciente 456')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (62, N'89021358', N'Verónica', N'López', N'Chávez', N'veronica.lopez@example.com', N'987654382', N'Av. Central 789')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (63, N'90131469', N'Julio', N'Reyes', N'Hernández', N'julio.reyes@example.com', N'987654383', N'Calle Aurora 234')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (64, N'12344580', N'Elena', N'Gómez', N'Torres', N'elena.gomez@example.com', N'987654384', N'Av. Colibrí 567')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (65, N'23455691', N'Renato', N'Herrera', N'Quispe', N'renato.herrera@example.com', N'987654385', N'Plaza Mayor 890')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (66, N'34566792', N'Marcela', N'Chávez', N'Ramos', N'marcela.chavez@example.com', N'987654386', N'Calle Diamante 678')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (67, N'45677893', N'Carlos', N'Salazar', N'López', N'carlos.salazar@example.com', N'987654387', N'Av. Pinos 901')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (68, N'56788904', N'Daniela', N'Medina', N'Cordero', N'daniela.medina@example.com', N'987654388', N'Calle Río Azul 123')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (69, N'67899025', N'Oscar', N'Alarcón', N'Jiménez', N'oscar.alarcon@example.com', N'987654389', N'Plaza de Armas 345')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (70, N'67910136', N'María', N'Ponce', N'Valverde', N'maria.ponce@example.com', N'987654390', N'Av. Amanecer 456')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (71, N'78921247', N'Fabián', N'Núñez', N'Arias', N'fabian.nunez@example.com', N'987654391', N'Calle San Martín 789')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (72, N'89031358', N'Rocío', N'Campos', N'Luna', N'rocio.campos@example.com', N'987654392', N'Av. de las Flores 234')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (73, N'90141469', N'Héctor', N'Peña', N'Guzmán', N'hector.pena@example.com', N'987654393', N'Calle Estrella 567')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (74, N'12354580', N'Ana', N'Benavides', N'Fuentes', N'ana.benavides@example.com', N'987654394', N'Av. Cóndor 890')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (75, N'23465691', N'Mauricio', N'Ibáñez', N'Zeballos', N'mauricio.ibanez@example.com', N'987654395', N'Calle Mirador 678')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (76, N'34576792', N'Luciana', N'Zambrano', N'Mendoza', N'luciana.zambrano@example.com', N'987654396', N'Plaza Bella 901')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (77, N'45687893', N'Javier', N'Estrada', N'Durán', N'javier.estrada@example.com', N'987654397', N'Av. del Norte 123')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (78, N'56798904', N'Natalie', N'Ávila', N'Paredes', N'natalie.avila@example.com', N'987654398', N'Calle Coral 345')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (79, N'67809025', N'Fernando', N'Zavala', N'Arce', N'fernando.zavala@example.com', N'987654399', N'Plaza Sol 567')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (80, N'67920136', N'Mónica', N'Paredes', N'Ríos', N'monica.paredes@example.com', N'987654400', N'Av. Vista Hermosa 678')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (81, N'78931247', N'Esteban', N'Córdova', N'Villalobos', N'esteban.cordova@example.com', N'987654401', N'Calle Horizonte 890')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (82, N'89041358', N'Patricia', N'Vega', N'Maldonado', N'patricia.vega@example.com', N'987654402', N'Av. del Lago 123')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (83, N'90151469', N'Joaquín', N'Quinteros', N'Espinoza', N'joaquin.quinteros@example.com', N'987654403', N'Calle Rivera 234')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (84, N'12364580', N'Diana', N'Barrios', N'Silva', N'diana.barrios@example.com', N'987654404', N'Av. Valle Dorado 456')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (85, N'23475691', N'Ricardo', N'Carranza', N'Vargas', N'ricardo.carranza@example.com', N'987654405', N'Calle Nueva Esperanza 567')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (86, N'34586792', N'Paola', N'Rosas', N'Ponce', N'paola.rosas@example.com', N'987654406', N'Av. Puente Viejo 678')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (87, N'45697893', N'Andrés', N'Valencia', N'Morales', N'andres.valencia@example.com', N'987654407', N'Plaza de la Paz 901')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (88, N'56708904', N'Victoria', N'Rivas', N'García', N'victoria.rivas@example.com', N'987654408', N'Calle Palmeras 345')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (89, N'67819025', N'Emilio', N'Tello', N'Romero', N'emilio.tello@example.com', N'987654409', N'Av. Libertad 678')
SET IDENTITY_INSERT [dbo].[personas_naturales] OFF
GO
SET IDENTITY_INSERT [dbo].[prestamos] ON 

INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (1, 133, 6, 9, 2, 26833.1700, 0.31, 36, CAST(N'2023-04-07' AS Date), NULL, CAST(N'2024-10-09T21:14:36.147' AS DateTime), NULL, NULL, 21, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (2, 118, 10, 20, 1, 75578.0000, 0.04, 13, CAST(N'2023-06-13' AS Date), NULL, CAST(N'2022-11-08T21:14:36.153' AS DateTime), NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (3, 129, 13, 13, 1, 42913.0500, 0.97, 12, CAST(N'2024-03-01' AS Date), NULL, CAST(N'2024-04-06T21:14:36.160' AS DateTime), NULL, NULL, 21, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (4, 137, 12, 2, 3, 46950.1200, 0.52, 26, CAST(N'2024-11-03' AS Date), NULL, CAST(N'2024-01-30T21:14:36.160' AS DateTime), NULL, NULL, 10, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (5, 132, 1, 26, 1, 97635.3500, 0.08, 20, CAST(N'2024-11-09' AS Date), NULL, CAST(N'2024-03-19T21:14:36.167' AS DateTime), NULL, NULL, 26, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (6, 67, 12, 27, 3, 19392.7100, 0.07, 21, CAST(N'2022-12-10' AS Date), NULL, CAST(N'2024-01-18T21:14:36.170' AS DateTime), NULL, NULL, 7, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (7, 105, 1, 35, 2, 5876.8900, 0.52, 34, CAST(N'2024-04-15' AS Date), NULL, CAST(N'2024-02-29T21:14:36.173' AS DateTime), NULL, NULL, 15, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (8, 79, 10, 6, 1, 9688.7900, 0.42, 14, CAST(N'2022-12-17' AS Date), NULL, CAST(N'2024-05-11T21:14:36.177' AS DateTime), NULL, NULL, 37, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (9, 103, 6, 34, 2, 68218.2900, 0.97, 21, CAST(N'2024-05-04' AS Date), NULL, CAST(N'2024-06-15T21:14:36.180' AS DateTime), NULL, NULL, 9, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (10, 117, 9, 9, 3, 9105.1500, 0.39, 34, CAST(N'2023-12-12' AS Date), NULL, CAST(N'2024-07-23T21:14:36.180' AS DateTime), NULL, NULL, 31, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (11, 69, 13, 33, 3, 57950.8500, 0.2, 33, CAST(N'2023-02-26' AS Date), NULL, CAST(N'2023-01-29T21:14:36.183' AS DateTime), NULL, NULL, 19, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (12, 121, 12, 13, 1, 95541.4500, 0.18, 31, CAST(N'2024-04-30' AS Date), NULL, CAST(N'2022-11-03T21:14:36.190' AS DateTime), NULL, NULL, 16, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (13, 138, 8, 35, 2, 94623.5200, 0.62, 32, CAST(N'2024-05-05' AS Date), NULL, CAST(N'2023-01-14T21:14:36.193' AS DateTime), NULL, NULL, 39, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (14, 118, 15, 6, 3, 20545.9500, 0.01, 25, CAST(N'2023-01-13' AS Date), NULL, CAST(N'2024-11-01T21:14:36.197' AS DateTime), NULL, NULL, 35, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (15, 83, 7, 17, 2, 160.5600, 0.41, 16, CAST(N'2024-03-22' AS Date), NULL, CAST(N'2024-04-04T21:14:36.203' AS DateTime), NULL, NULL, 16, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (16, 112, 3, 30, 2, 84881.2400, 0.13, 18, CAST(N'2023-06-25' AS Date), NULL, CAST(N'2024-06-28T21:14:36.210' AS DateTime), NULL, NULL, 34, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (17, 95, 14, 2, 3, 41736.7900, 0.51, 28, CAST(N'2024-12-02' AS Date), NULL, CAST(N'2024-01-21T21:14:36.210' AS DateTime), NULL, NULL, 25, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (18, 141, 1, 38, 2, 47127.8300, 0.27, 27, CAST(N'2024-06-22' AS Date), NULL, CAST(N'2024-11-30T21:14:36.213' AS DateTime), NULL, NULL, 10, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (19, 127, 12, 13, 1, 34031.2300, 0.68, 19, CAST(N'2024-09-16' AS Date), NULL, CAST(N'2024-07-20T21:14:36.217' AS DateTime), NULL, NULL, 13, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (20, 137, 10, 14, 3, 59540.7700, 0.08, 13, CAST(N'2023-10-30' AS Date), NULL, CAST(N'2023-06-08T21:14:36.220' AS DateTime), NULL, NULL, 7, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (21, 70, 9, 19, 2, 31008.8600, 0.96, 22, CAST(N'2024-04-30' AS Date), NULL, CAST(N'2023-09-25T21:14:36.223' AS DateTime), NULL, NULL, 26, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (22, 103, 7, 33, 2, 28382.0000, 0.67, 13, CAST(N'2022-11-10' AS Date), NULL, CAST(N'2024-11-11T21:14:36.227' AS DateTime), NULL, NULL, 18, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (23, 134, 4, 21, 1, 8820.1400, 0.56, 25, CAST(N'2023-10-28' AS Date), NULL, CAST(N'2023-01-01T21:14:36.230' AS DateTime), NULL, NULL, 12, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (24, 108, 2, 10, 3, 32391.1900, 0.59, 35, CAST(N'2024-05-29' AS Date), NULL, CAST(N'2023-12-08T21:14:36.230' AS DateTime), NULL, NULL, 16, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (25, 137, 15, 24, 3, 35274.8300, 0.91, 27, CAST(N'2023-09-23' AS Date), NULL, CAST(N'2024-08-20T21:14:36.233' AS DateTime), NULL, NULL, 23, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (26, 113, 10, 35, 1, 21279.0100, 0.23, 13, CAST(N'2024-02-18' AS Date), NULL, CAST(N'2023-01-06T21:14:36.237' AS DateTime), NULL, NULL, 14, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (27, 100, 15, 35, 1, 72338.1500, 0.29, 33, CAST(N'2024-05-18' AS Date), NULL, CAST(N'2022-10-29T21:14:36.240' AS DateTime), NULL, NULL, 10, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (28, 91, 6, 33, 2, 85382.4200, 0.05, 21, CAST(N'2024-06-23' AS Date), NULL, CAST(N'2024-04-03T21:14:36.247' AS DateTime), NULL, NULL, 38, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (29, 108, 7, 38, 3, 50819.5300, 0.16, 35, CAST(N'2024-06-22' AS Date), NULL, CAST(N'2024-07-31T21:14:36.250' AS DateTime), NULL, NULL, 8, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (30, 118, 3, 38, 1, 84278.5100, 0.84, 29, CAST(N'2022-11-22' AS Date), NULL, CAST(N'2023-02-24T21:14:36.250' AS DateTime), NULL, NULL, 11, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (31, 121, 1, 25, 3, 18117.9800, 0.93, 18, CAST(N'2024-07-27' AS Date), NULL, CAST(N'2024-08-17T21:14:36.253' AS DateTime), NULL, NULL, 30, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (32, 104, 1, 3, 3, 26988.4300, 0.74, 28, CAST(N'2024-06-11' AS Date), NULL, CAST(N'2023-10-14T21:14:36.257' AS DateTime), NULL, NULL, 18, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (33, 105, 8, 19, 1, 35615.1000, 0.95, 26, CAST(N'2023-05-27' AS Date), NULL, CAST(N'2023-08-15T21:14:36.257' AS DateTime), NULL, NULL, 6, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (34, 80, 16, 34, 1, 74795.3300, 0.73, 12, CAST(N'2024-11-12' AS Date), NULL, CAST(N'2023-02-12T21:14:36.260' AS DateTime), NULL, NULL, 18, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (35, 83, 12, 33, 1, 31124.1100, 0.79, 29, CAST(N'2024-01-16' AS Date), NULL, CAST(N'2023-08-21T21:14:36.263' AS DateTime), NULL, NULL, 37, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (36, 77, 16, 16, 3, 10439.3800, 0.06, 17, CAST(N'2023-06-26' AS Date), NULL, CAST(N'2023-10-20T21:14:36.267' AS DateTime), NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (37, 137, 9, 29, 3, 50772.9500, 0.16, 16, CAST(N'2022-12-14' AS Date), NULL, CAST(N'2023-06-17T21:14:36.270' AS DateTime), NULL, NULL, 15, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (38, 122, 5, 3, 1, 93695.9000, 0.86, 15, CAST(N'2024-10-07' AS Date), NULL, CAST(N'2023-10-12T21:14:36.270' AS DateTime), NULL, NULL, 18, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (39, 128, 3, 11, 3, 69354.9100, 0.01, 29, CAST(N'2024-02-26' AS Date), NULL, CAST(N'2024-11-01T21:14:36.273' AS DateTime), NULL, NULL, 25, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (40, 66, 15, 17, 2, 16778.1600, 0.92, 25, CAST(N'2023-10-10' AS Date), NULL, CAST(N'2024-03-26T21:14:36.273' AS DateTime), NULL, NULL, 23, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (41, 109, 3, 24, 3, 84982.1400, 0.4, 14, CAST(N'2023-11-19' AS Date), NULL, CAST(N'2024-07-16T21:14:36.277' AS DateTime), NULL, NULL, 35, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (42, 106, 15, 31, 1, 38848.2200, 0.22, 19, CAST(N'2024-04-26' AS Date), NULL, CAST(N'2024-03-29T21:14:36.280' AS DateTime), NULL, NULL, 38, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (43, 105, 5, 3, 3, 9753.0900, 0.82, 26, CAST(N'2024-04-11' AS Date), NULL, CAST(N'2023-11-18T21:14:36.283' AS DateTime), NULL, NULL, 17, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (44, 130, 2, 4, 2, 52003.8000, 0.85, 21, CAST(N'2023-06-01' AS Date), NULL, CAST(N'2023-12-07T21:14:36.287' AS DateTime), NULL, NULL, 23, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (45, 83, 6, 25, 3, 77709.2000, 0.87, 25, CAST(N'2023-05-14' AS Date), NULL, CAST(N'2024-01-15T21:14:36.290' AS DateTime), NULL, NULL, 37, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (46, 121, 10, 25, 2, 72767.1500, 0.18, 33, CAST(N'2023-08-29' AS Date), NULL, CAST(N'2023-06-13T21:14:36.293' AS DateTime), NULL, NULL, 17, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (48, 116, 14, 31, 1, 75821.9200, 0.42, 27, CAST(N'2024-08-13' AS Date), NULL, CAST(N'2024-10-04T21:14:36.300' AS DateTime), NULL, NULL, 17, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (49, 134, 15, 11, 2, 6622.4100, 0.47, 32, CAST(N'2023-06-19' AS Date), NULL, CAST(N'2023-06-01T21:14:36.303' AS DateTime), NULL, NULL, 19, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (50, 101, 2, 11, 1, 40706.7300, 0.22, 28, CAST(N'2024-03-06' AS Date), NULL, CAST(N'2024-11-19T21:14:36.303' AS DateTime), NULL, NULL, 38, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (51, 141, 9, 38, 1, 71922.9600, 0.83, 33, CAST(N'2024-09-22' AS Date), NULL, CAST(N'2022-12-02T21:16:15.390' AS DateTime), NULL, NULL, 16, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (52, 122, 1, 19, 1, 12943.0500, 0.98, 34, CAST(N'2023-09-07' AS Date), NULL, CAST(N'2023-11-01T21:16:15.393' AS DateTime), NULL, NULL, 17, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (53, 134, 6, 19, 3, 59173.7900, 0.86, 24, CAST(N'2023-03-06' AS Date), NULL, CAST(N'2024-04-13T21:16:15.397' AS DateTime), NULL, NULL, 8, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (54, 120, 15, 13, 2, 48129.9000, 0.38, 36, CAST(N'2023-11-22' AS Date), NULL, CAST(N'2023-01-20T21:16:15.400' AS DateTime), NULL, NULL, 36, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (55, 127, 7, 37, 2, 90102.3400, 0.29, 19, CAST(N'2023-04-19' AS Date), NULL, CAST(N'2023-08-29T21:16:15.410' AS DateTime), NULL, NULL, 24, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (56, 77, 2, 13, 3, 62319.9900, 0.22, 35, CAST(N'2023-12-06' AS Date), NULL, CAST(N'2024-06-14T21:16:15.417' AS DateTime), NULL, NULL, 11, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (57, 92, 4, 20, 2, 12709.3900, 0.11, 27, CAST(N'2023-10-19' AS Date), NULL, CAST(N'2024-02-04T21:16:15.420' AS DateTime), NULL, NULL, 12, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (58, 86, 16, 7, 3, 28610.9700, 0.34, 21, CAST(N'2023-09-30' AS Date), NULL, CAST(N'2024-02-29T21:16:15.423' AS DateTime), NULL, NULL, 34, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (59, 76, 2, 13, 3, 29664.3100, 0.55, 22, CAST(N'2023-11-09' AS Date), NULL, CAST(N'2023-01-15T21:16:15.427' AS DateTime), NULL, NULL, 15, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (60, 79, 8, 37, 2, 32073.1200, 0.78, 23, CAST(N'2023-06-23' AS Date), NULL, CAST(N'2023-05-10T21:16:15.427' AS DateTime), NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (61, 89, 11, 4, 3, 50064.7600, 0.14, 14, CAST(N'2023-11-29' AS Date), NULL, CAST(N'2024-04-21T21:16:15.430' AS DateTime), NULL, NULL, 12, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (62, 140, 3, 27, 3, 54118.6200, 0.76, 31, CAST(N'2024-01-24' AS Date), NULL, CAST(N'2023-11-28T21:16:15.433' AS DateTime), NULL, NULL, 14, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (63, 125, 10, 17, 3, 72235.2000, 0.95, 22, CAST(N'2024-09-12' AS Date), NULL, CAST(N'2023-03-24T21:16:15.437' AS DateTime), NULL, NULL, 8, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (64, 113, 2, 3, 2, 83982.0500, 0.49, 33, CAST(N'2023-03-10' AS Date), NULL, CAST(N'2024-02-21T21:16:15.440' AS DateTime), NULL, NULL, 31, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (65, 114, 3, 22, 1, 60958.8900, 0.56, 22, CAST(N'2024-09-21' AS Date), NULL, CAST(N'2022-12-07T21:16:15.443' AS DateTime), NULL, NULL, 25, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (66, 94, 2, 38, 2, 38765.7700, 0.8, 15, CAST(N'2024-07-15' AS Date), NULL, CAST(N'2023-04-03T21:16:15.447' AS DateTime), NULL, NULL, 14, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (67, 140, 11, 7, 3, 78407.1600, 0.36, 26, CAST(N'2024-04-02' AS Date), NULL, CAST(N'2023-12-19T21:16:15.450' AS DateTime), NULL, NULL, 23, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (68, 105, 10, 10, 1, 36961.9200, 0.62, 28, CAST(N'2023-08-04' AS Date), NULL, CAST(N'2023-08-13T21:16:15.453' AS DateTime), NULL, NULL, 7, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (69, 112, 9, 1, 2, 16407.1800, 0.37, 28, CAST(N'2023-12-14' AS Date), NULL, CAST(N'2022-11-01T21:16:15.460' AS DateTime), NULL, NULL, 11, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (70, 75, 1, 25, 2, 92505.3700, 0.55, 21, CAST(N'2022-10-23' AS Date), NULL, CAST(N'2023-02-08T21:16:15.463' AS DateTime), NULL, NULL, 17, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (71, 136, 10, 24, 3, 49986.7100, 0.93, 31, CAST(N'2022-12-07' AS Date), NULL, CAST(N'2023-04-28T21:16:15.470' AS DateTime), NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (72, 66, 11, 19, 2, 29879.6200, 0.64, 28, CAST(N'2023-07-31' AS Date), NULL, CAST(N'2023-02-18T21:16:15.473' AS DateTime), NULL, NULL, 25, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (73, 75, 2, 12, 1, 98437.0400, 0.28, 21, CAST(N'2023-03-19' AS Date), NULL, CAST(N'2023-04-29T21:16:15.477' AS DateTime), NULL, NULL, 29, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (74, 105, 6, 35, 2, 91717.9800, 0.61, 13, CAST(N'2024-10-26' AS Date), NULL, CAST(N'2023-05-28T21:16:15.480' AS DateTime), NULL, NULL, 11, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (75, 109, 3, 15, 2, 23983.8900, 0.9, 31, CAST(N'2023-04-15' AS Date), NULL, CAST(N'2022-10-25T21:16:15.487' AS DateTime), NULL, NULL, 16, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (76, 141, 15, 38, 3, 69600.6200, 0.21, 21, CAST(N'2022-12-30' AS Date), NULL, CAST(N'2024-05-13T21:16:15.490' AS DateTime), NULL, NULL, 10, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (77, 126, 14, 3, 2, 68691.0600, 0.06, 32, CAST(N'2024-02-24' AS Date), NULL, CAST(N'2024-04-07T21:16:15.493' AS DateTime), NULL, NULL, 36, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (78, 95, 3, 27, 2, 6791.1000, 0.91, 28, CAST(N'2024-05-09' AS Date), NULL, CAST(N'2024-08-12T21:16:15.497' AS DateTime), NULL, NULL, 32, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (79, 68, 1, 19, 2, 41226.8400, 0.57, 22, CAST(N'2024-02-12' AS Date), NULL, CAST(N'2023-03-22T21:16:15.500' AS DateTime), NULL, NULL, 24, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (80, 98, 16, 4, 3, 90794.8000, 0.86, 18, CAST(N'2024-10-08' AS Date), NULL, CAST(N'2023-07-26T21:16:15.503' AS DateTime), NULL, NULL, 13, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (81, 69, 7, 31, 2, 83717.3800, 0.41, 29, CAST(N'2023-10-08' AS Date), NULL, CAST(N'2024-10-03T21:16:15.507' AS DateTime), NULL, NULL, 37, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (82, 129, 2, 18, 1, 3090.4500, 0.64, 36, CAST(N'2023-05-01' AS Date), NULL, CAST(N'2024-05-07T21:16:15.510' AS DateTime), NULL, NULL, 17, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (83, 106, 9, 21, 2, 35946.7900, 0.76, 25, CAST(N'2023-09-10' AS Date), NULL, CAST(N'2024-03-28T21:16:15.513' AS DateTime), NULL, NULL, 10, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (84, 81, 7, 21, 1, 81276.1800, 0.09, 30, CAST(N'2024-02-01' AS Date), NULL, CAST(N'2022-11-23T21:16:15.517' AS DateTime), NULL, NULL, 12, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (85, 141, 16, 8, 1, 11911.8200, 0.77, 22, CAST(N'2024-02-16' AS Date), NULL, CAST(N'2024-05-28T21:16:15.520' AS DateTime), NULL, NULL, 35, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (86, 67, 1, 13, 2, 67519.0700, 0.16, 22, CAST(N'2024-06-23' AS Date), NULL, CAST(N'2023-08-04T21:16:15.523' AS DateTime), NULL, NULL, 38, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (87, 98, 9, 27, 3, 46489.5000, 0.21, 23, CAST(N'2024-10-17' AS Date), NULL, CAST(N'2023-10-17T21:16:15.527' AS DateTime), NULL, NULL, 8, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (88, 101, 9, 29, 3, 8716.0400, 0.97, 21, CAST(N'2024-04-02' AS Date), NULL, CAST(N'2023-12-05T21:16:15.530' AS DateTime), NULL, NULL, 36, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (89, 118, 4, 23, 1, 94955.3300, 0.29, 16, CAST(N'2024-08-07' AS Date), NULL, CAST(N'2024-09-09T21:16:15.533' AS DateTime), NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (90, 125, 7, 20, 3, 30487.2100, 0.72, 24, CAST(N'2023-02-05' AS Date), NULL, CAST(N'2023-04-06T21:16:15.540' AS DateTime), NULL, NULL, 6, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (91, 135, 12, 21, 1, 50813.7200, 0.28, 13, CAST(N'2023-12-14' AS Date), NULL, CAST(N'2024-05-12T21:16:15.540' AS DateTime), NULL, NULL, 39, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (92, 94, 13, 11, 3, 32257.4000, 0.46, 24, CAST(N'2024-09-13' AS Date), NULL, CAST(N'2023-11-01T21:16:15.547' AS DateTime), NULL, NULL, 12, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (93, 136, 16, 23, 3, 14685.5500, 0.9, 28, CAST(N'2022-12-17' AS Date), NULL, CAST(N'2024-12-02T21:16:15.550' AS DateTime), NULL, NULL, 16, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (94, 96, 4, 33, 1, 63877.5900, 0.83, 34, CAST(N'2023-01-16' AS Date), NULL, CAST(N'2023-07-11T21:16:15.550' AS DateTime), NULL, NULL, 0, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (95, 85, 14, 35, 3, 14974.2600, 0.01, 18, CAST(N'2024-11-14' AS Date), NULL, CAST(N'2024-11-06T21:16:15.553' AS DateTime), NULL, NULL, 28, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (96, 98, 13, 4, 2, 7801.2600, 0.68, 17, CAST(N'2023-07-12' AS Date), NULL, CAST(N'2024-06-30T21:16:15.557' AS DateTime), NULL, NULL, 31, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (97, 130, 7, 22, 3, 20797.3900, 0.35, 26, CAST(N'2023-02-17' AS Date), NULL, CAST(N'2024-10-03T21:16:15.560' AS DateTime), NULL, NULL, 6, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (98, 118, 5, 13, 3, 53064.6100, 0.23, 27, CAST(N'2023-04-08' AS Date), NULL, CAST(N'2023-07-06T21:16:15.560' AS DateTime), NULL, NULL, 26, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (99, 93, 3, 33, 3, 24262.6300, 0.65, 13, CAST(N'2024-04-24' AS Date), NULL, CAST(N'2024-08-15T21:16:15.567' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[prestamos] ([id], [cliente_id], [sucursal_id], [empleado_id], [tipo_prestamo_id], [monto_otorgado], [tasa_interes], [plazo], [fecha_inicio], [fecha_vencimiento], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (100, 76, 13, 37, 3, 73387.7100, 0.21, 21, CAST(N'2023-03-24' AS Date), NULL, CAST(N'2023-08-27T21:16:15.567' AS DateTime), NULL, NULL, 6, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[prestamos] OFF
GO
SET IDENTITY_INSERT [dbo].[sucursales] ON 

INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (1, N'654789123', N'La molina', N'Av. la molina')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (2, N'654789124', N'Lima-Cercado', N'Av. Alfonso Ugarte')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (3, N'654789125', N'Banco Central - Lima', N'Av. Principal 123, Lima')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (4, N'654789126', N'AndesBank - Cusco', N'Plaza de Armas 456, Cusco')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (5, N'654789127', N'SolFinanciero - Arequipa', N'Calle Comercio 789, Arequipa')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (6, N'654789128', N'AmazonBank - Iquitos', N'Jirón Amazonas 321, Iquitos')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (7, N'654789129', N'CóndorBanco - Trujillo', N'Av. Libertad 567, Trujillo')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (8, N'654789130', N'PacificoBank - Piura', N'Calle Piura 890, Piura')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (9, N'654789131', N'IncaCredit - Chiclayo', N'Av. Balta 432, Chiclayo')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (10, N'654789132', N'CostaSur - Tacna', N'Av. Bolognesi 765, Tacna')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (11, N'654789133', N'MontañaBank - Huaraz', N'Jirón Huascarán 543, Huaraz')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (12, N'654789134', N'Sucursal Principal Lima', N'Av. Principal 123, Lima')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (13, N'654789135', N'Sucursal Cusco', N'Plaza de Armas 456, Cusco')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (14, N'654789136', N'Sucursal Arequipa', N'Calle Comercio 789, Arequipa')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (15, N'654789137', N'Sucursal Iquitos', N'Jirón Amazonas 321, Iquitos')
INSERT [dbo].[sucursales] ([id], [codigo], [nombres], [direccion]) VALUES (16, N'654789138', N'Sucursal Trujillo', N'Av. Libertad 567, Trujillo')
SET IDENTITY_INSERT [dbo].[sucursales] OFF
GO
SET IDENTITY_INSERT [dbo].[tipos_prestamo] ON 

INSERT [dbo].[tipos_prestamo] ([id], [nombre], [descripcion]) VALUES (1, N'Prestamo Personal', N'')
INSERT [dbo].[tipos_prestamo] ([id], [nombre], [descripcion]) VALUES (2, N'Prestamo Hipotecario', N'')
INSERT [dbo].[tipos_prestamo] ([id], [nombre], [descripcion]) VALUES (3, N'Prestamo Vehicular', N'')
SET IDENTITY_INSERT [dbo].[tipos_prestamo] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__personas__7B886A63BDF38245]    Script Date: 5/12/2024 19:11:10 ******/
ALTER TABLE [dbo].[personas_juridicas] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__personas__7B886A63F7F5B5B8]    Script Date: 5/12/2024 19:11:10 ******/
ALTER TABLE [dbo].[personas_naturales] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__sucursal__822604A2FF4A89B7]    Script Date: 5/12/2024 19:11:10 ******/
ALTER TABLE [dbo].[sucursales] ADD UNIQUE NONCLUSTERED 
(
	[nombres] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
USE [master]
GO
ALTER DATABASE [dsrp_prestamos_financieros_6] SET  READ_WRITE 
GO
