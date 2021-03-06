USE [master]
GO
/****** Object:  Database [FACTURACION]    Script Date: 29/8/2020 3:52:17 AM ******/
CREATE DATABASE [FACTURACION]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FACTURACION', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\FACTURACION.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FACTURACION_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\FACTURACION_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FACTURACION] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FACTURACION].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FACTURACION] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FACTURACION] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FACTURACION] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FACTURACION] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FACTURACION] SET ARITHABORT OFF 
GO
ALTER DATABASE [FACTURACION] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FACTURACION] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FACTURACION] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FACTURACION] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FACTURACION] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FACTURACION] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FACTURACION] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FACTURACION] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FACTURACION] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FACTURACION] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FACTURACION] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FACTURACION] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FACTURACION] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FACTURACION] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FACTURACION] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FACTURACION] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FACTURACION] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FACTURACION] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FACTURACION] SET  MULTI_USER 
GO
ALTER DATABASE [FACTURACION] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FACTURACION] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FACTURACION] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FACTURACION] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FACTURACION] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FACTURACION] SET QUERY_STORE = OFF
GO
USE [FACTURACION]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 29/8/2020 3:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[ID_Categoria] [int] NOT NULL,
	[ID_Departamento] [int] NULL,
	[Nombre] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 29/8/2020 3:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID_Cliente] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Empresa] [nvarchar](50) NULL,
	[Telefono] [nvarchar](20) NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](50) NULL,
	[Ciudad] [nvarchar](30) NULL,
	[Pais] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 29/8/2020 3:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[ID_Departamento] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Ventas]    Script Date: 29/8/2020 3:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Ventas](
	[ID_Detalle] [int] NOT NULL,
	[ID_Venta] [int] NULL,
	[ID_Producto] [int] NULL,
	[Precio] [money] NOT NULL,
	[Costo] [money] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[Fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 29/8/2020 3:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[ID_Empleado] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](20) NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Contraseña] [nvarchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 29/8/2020 3:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[ID_Producto] [int] NOT NULL,
	[Descripcion] [nvarchar](40) NOT NULL,
	[ID_Departamento] [int] NULL,
	[ID_Categoria] [int] NULL,
	[Precio] [money] NOT NULL,
	[Costo] [money] NOT NULL,
	[Cantidad] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 29/8/2020 3:52:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[ID_Venta] [int] NOT NULL,
	[ID_Cliente] [int] NULL,
	[ID_Empleado] [int] NULL,
	[Total] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categoria] ([ID_Categoria], [ID_Departamento], [Nombre]) VALUES (1, 1, N'Terminal')
INSERT [dbo].[Categoria] ([ID_Categoria], [ID_Departamento], [Nombre]) VALUES (2, 1, N'En linea')
INSERT [dbo].[Categoria] ([ID_Categoria], [ID_Departamento], [Nombre]) VALUES (3, 1, N'Kiosko')
INSERT [dbo].[Categoria] ([ID_Categoria], [ID_Departamento], [Nombre]) VALUES (4, 2, N'Movil')
INSERT [dbo].[Categoria] ([ID_Categoria], [ID_Departamento], [Nombre]) VALUES (5, 2, N'Terminal')
INSERT [dbo].[Categoria] ([ID_Categoria], [ID_Departamento], [Nombre]) VALUES (6, 2, N'En linea')
INSERT [dbo].[Categoria] ([ID_Categoria], [ID_Departamento], [Nombre]) VALUES (7, 3, N'Terminal')
INSERT [dbo].[Categoria] ([ID_Categoria], [ID_Departamento], [Nombre]) VALUES (8, 3, N'En Linea')
INSERT [dbo].[Categoria] ([ID_Categoria], [ID_Departamento], [Nombre]) VALUES (9, 4, N'Movil')
INSERT [dbo].[Categoria] ([ID_Categoria], [ID_Departamento], [Nombre]) VALUES (10, 4, N'Terminal')
GO
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Empresa], [Telefono], [Correo], [Direccion], [Ciudad], [Pais]) VALUES (1, N'Jorge Grabriel', N'Taveras Santana', NULL, N'809-481-8562', N'jtaveras@gmail.com', N'Calle Primera Residencial Carmen Maria', N'Santo Domingo', N'República Dominicana')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Empresa], [Telefono], [Correo], [Direccion], [Ciudad], [Pais]) VALUES (2, N'Claire', N'Roder', NULL, N'49-162-9875587', N'c.easy@outlook.com', N'Herdweg 36-48 70174', N'Stuttgart', N'Alemania')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Empresa], [Telefono], [Correo], [Direccion], [Ciudad], [Pais]) VALUES (3, N'Alberto', N'Alonso Rodríguez', N'Agilisa Tecnologies', N'809-880-9874', N'aalonso@bcpos.com.do', N'Calle Gala #13', N'Santo Domingo', N'República Dominicana')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Empresa], [Telefono], [Correo], [Direccion], [Ciudad], [Pais]) VALUES (4, N'Ameer', N'Ali', N'EZ Software', N'347-495-8521', N'ameer.ali@ezsoftware.com', N'947 Brinsmade Av Bronx', N'Nueva York', N'Estados Unidos')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Empresa], [Telefono], [Correo], [Direccion], [Ciudad], [Pais]) VALUES (5, N'Pedro', N'Gonzalez', N'Cerámicas FG', N'809-875-8965', N'recepcion@cfg.com', N'Av. John F. Kennedy 57', N'Santo Domingo', N'República Dominicana')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Empresa], [Telefono], [Correo], [Direccion], [Ciudad], [Pais]) VALUES (6, N'Luis Marino', N'Tejada García', N'Business Computer POS', N'809-567-8752', N'ltejada@bcpos.com', N'Plaza Castellana local 456', N'Santo Domingo', N'República Dominicana')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Empresa], [Telefono], [Correo], [Direccion], [Ciudad], [Pais]) VALUES (7, N'Joel Florentino', N'Pérez Bueno', NULL, N'809-856-2541', N'f.joel@gmail.com', N'Calle Federizo Gomez #47', N'Satiago', N'República Dominicana')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Empresa], [Telefono], [Correo], [Direccion], [Ciudad], [Pais]) VALUES (8, N'Camila', N'Grullón', N'Alpha Group', N'829-354-8988', N'camila@alpha.com', N'Plaza Central local 101', N'Santo Domingo', N'República Dominicana')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Empresa], [Telefono], [Correo], [Direccion], [Ciudad], [Pais]) VALUES (9, N'Nicole', N'Cortines', N'Grupo Marti', N'809-564-5469', N'ncortines@marti.com.do', N'Avenida Winston Churchill', N'Santo Domingo', N'República Dominicana')
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Empresa], [Telefono], [Correo], [Direccion], [Ciudad], [Pais]) VALUES (10, N'Marcos Rafael', N'De La Cruz', N'Repuestos Pepín', N'809-380-9633', N'mrcruz@gmail.com', N'Marginal Gonzalez esquina Calle 21', N'Bani', N'República Dominicana')
GO
INSERT [dbo].[Departamento] ([ID_Departamento], [Nombre]) VALUES (1, N'Retail')
INSERT [dbo].[Departamento] ([ID_Departamento], [Nombre]) VALUES (2, N'Hospitalidad')
INSERT [dbo].[Departamento] ([ID_Departamento], [Nombre]) VALUES (3, N'Contabilidad')
INSERT [dbo].[Departamento] ([ID_Departamento], [Nombre]) VALUES (4, N'Produccion')
GO
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (1, 1, 3, 35000.0000, 28000.0000, 2, CAST(N'2020-08-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (2, 2, 1, 48000.0000, 23000.0000, 1, CAST(N'2020-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (3, 2, 2, 38000.0000, 17000.0000, 1, CAST(N'2020-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (4, 3, 5, 80000.0000, 41000.0000, 1, CAST(N'2020-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (5, 4, 9, 28000.0000, 11800.0000, 6, CAST(N'2020-08-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (6, 5, 11, 55000.0000, 23600.0000, 2, CAST(N'2020-08-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (7, 5, 12, 27000.0000, 11200.0000, 1, CAST(N'2020-08-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (8, 6, 10, 41000.0000, 29500.0000, 1, CAST(N'2020-08-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (9, 7, 7, 90000.0000, 43000.0000, 1, CAST(N'2020-08-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (10, 8, 9, 28000.0000, 11800.0000, 1, CAST(N'2020-08-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (11, 8, 10, 41000.0000, 29500.0000, 1, CAST(N'2020-08-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (12, 9, 1, 48000.0000, 23000.0000, 2, CAST(N'2020-08-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (13, 10, 6, 80000.0000, 45000.0000, 1, CAST(N'2020-08-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Detalle_Ventas] ([ID_Detalle], [ID_Venta], [ID_Producto], [Precio], [Costo], [Cantidad], [Fecha]) VALUES (14, 10, 7, 90000.0000, 43000.0000, 1, CAST(N'2020-08-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Telefono], [Correo], [Contraseña]) VALUES (1, N'Rey Adonis', N'De La Paz Montaño', N'829-974-9174', N'reyadonisdelapaz@hotmail.com', NULL)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Telefono], [Correo], [Contraseña]) VALUES (2, N'Gilbert', N'Duarte', N'809-875-8654', N'gilbert.duarte@hotmail.com', NULL)
GO
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (1, N'Dynamic POS', 1, 1, 48000.0000, 23000.0000, 25)
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (2, N'Retail Square', 1, 2, 38000.0000, 17000.0000, 20)
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (3, N'Axana Retail', 1, 2, 35000.0000, 28000.0000, 30)
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (4, N'Axana Retail Movil', 1, 4, 28000.0000, 15000.0000, 55)
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (5, N'NRC Ohana POS', 2, 4, 80000.0000, 41000.0000, 30)
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (6, N'FastFood POS', 2, 5, 80000.0000, 45000.0000, 25)
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (7, N'MicroFast POS', 2, 5, 90000.0000, 43000.0000, 31)
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (8, N'Food Movil POS', 2, 6, 75000.0000, 31800.0000, 10)
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (9, N'Asistente contable', 3, 7, 28000.0000, 11800.0000, 18)
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (10, N'Bongo virtual', 3, 8, 41000.0000, 29500.0000, 20)
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (11, N'Deliver Dash', 4, 9, 55000.0000, 23600.0000, 25)
INSERT [dbo].[Inventario] ([ID_Producto], [Descripcion], [ID_Departamento], [ID_Categoria], [Precio], [Costo], [Cantidad]) VALUES (12, N'POST Produccion', 4, 10, 27000.0000, 11200.0000, 20)
GO
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [ID_Empleado], [Total]) VALUES (1, 2, 1, 70000.0000)
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [ID_Empleado], [Total]) VALUES (2, 1, 2, 86000.0000)
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [ID_Empleado], [Total]) VALUES (3, 8, 2, 80000.0000)
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [ID_Empleado], [Total]) VALUES (4, 10, 2, 168000.0000)
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [ID_Empleado], [Total]) VALUES (5, 5, 1, 137000.0000)
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [ID_Empleado], [Total]) VALUES (6, 3, 1, 41000.0000)
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [ID_Empleado], [Total]) VALUES (7, 1, 1, 90000.0000)
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [ID_Empleado], [Total]) VALUES (8, 6, 2, 69000.0000)
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [ID_Empleado], [Total]) VALUES (9, 4, 2, 96000.0000)
INSERT [dbo].[Ventas] ([ID_Venta], [ID_Cliente], [ID_Empleado], [Total]) VALUES (10, 5, 1, 170000.0000)
GO
ALTER TABLE [dbo].[Categoria]  WITH CHECK ADD FOREIGN KEY([ID_Departamento])
REFERENCES [dbo].[Departamento] ([ID_Departamento])
GO
ALTER TABLE [dbo].[Detalle_Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Inventario] ([ID_Producto])
GO
ALTER TABLE [dbo].[Detalle_Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Venta])
REFERENCES [dbo].[Ventas] ([ID_Venta])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([ID_Categoria])
REFERENCES [dbo].[Categoria] ([ID_Categoria])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([ID_Departamento])
REFERENCES [dbo].[Departamento] ([ID_Departamento])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
USE [master]
GO
ALTER DATABASE [FACTURACION] SET  READ_WRITE 
GO
