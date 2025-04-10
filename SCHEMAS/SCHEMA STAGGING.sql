USE [DBO_Stagging_Jardineria]
GO
/****** Object:  Table [dbo].[DB Staggin Oficina]    Script Date: 6/4/2025 21:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB Staggin Oficina](
	[ID_oficina] [int] NULL,
	[Descripcion] [varchar](10) NULL,
	[ciudad] [varchar](30) NULL,
	[pais] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[codigo_postal] [varchar](10) NULL,
	[telefono] [varchar](20) NULL,
	[linea_direccion1] [varchar](50) NULL,
	[linea_direccion2] [varchar](50) NULL,
	[fecha_carga] [datetime] NULL,
	[estado_carga] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB Stagging Categoria_Producto]    Script Date: 6/4/2025 21:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB Stagging Categoria_Producto](
	[Id_Categoria] [int] NULL,
	[Desc_Categoria] [varchar](50) NULL,
	[descripcion_texto] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB Stagging Cliente]    Script Date: 6/4/2025 21:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB Stagging Cliente](
	[ID_cliente] [int] NULL,
	[nombre_cliente] [varchar](50) NULL,
	[nombre_contacto] [varchar](30) NULL,
	[apellido_contacto] [varchar](30) NULL,
	[telefono] [varchar](15) NULL,
	[fax] [varchar](15) NULL,
	[linea_direccion1] [varchar](50) NULL,
	[linea_direccion2] [varchar](50) NULL,
	[ciudad] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[pais] [varchar](50) NULL,
	[codigo_postal] [varchar](10) NULL,
	[ID_empleado_rep_ventas] [int] NULL,
	[limite_credito] [numeric](15, 2) NULL,
	[Id_Categoria] [int] NULL,
	[Desc_Categoria] [varchar](50) NULL,
	[descripcion_texto] [varchar](max) NULL,
	[fecha_carga] [datetime] NULL,
	[estado_carga] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB Stagging Detalle Pedido]    Script Date: 6/4/2025 21:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB Stagging Detalle Pedido](
	[ID_pedido] [int] NULL,
	[ID_producto] [varchar](15) NULL,
	[cantidad] [int] NULL,
	[precio_unidad] [numeric](15, 2) NULL,
	[numero_linea] [smallint] NULL,
	[fecha_carga] [datetime] NULL,
	[estado_carga] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB Stagging Empleado]    Script Date: 6/4/2025 21:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB Stagging Empleado](
	[ID_empleado] [int] NULL,
	[nombre] [varchar](50) NULL,
	[apellido1] [varchar](50) NULL,
	[apellido2] [varchar](50) NULL,
	[extension] [varchar](10) NULL,
	[email] [varchar](100) NULL,
	[ID_oficina] [int] NULL,
	[ID_jefe] [int] NULL,
	[puesto] [varchar](50) NULL,
	[fecha_carga] [datetime] NULL,
	[estado_carga] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB Stagging Pago]    Script Date: 6/4/2025 21:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB Stagging Pago](
	[ID_cliente] [int] NULL,
	[forma_pago] [varchar](40) NULL,
	[id_transaccion] [varchar](50) NULL,
	[fecha_pago] [nvarchar](10) NULL,
	[total] [numeric](15, 2) NULL,
	[fecha_carga] [datetime] NULL,
	[estado_carga] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB Stagging Pedido]    Script Date: 6/4/2025 21:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB Stagging Pedido](
	[ID_pedido] [int] NULL,
	[fecha_pedido] [nvarchar](10) NULL,
	[fecha_esperada] [nvarchar](10) NULL,
	[fecha_entrega] [nvarchar](10) NULL,
	[estado] [varchar](15) NULL,
	[ID_cliente] [int] NULL,
	[fecha_carga] [datetime] NULL,
	[estado_carga] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DB Stagging Producto]    Script Date: 6/4/2025 21:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB Stagging Producto](
	[ID_producto] [varchar](15) NULL,
	[nombre] [varchar](70) NULL,
	[Categoria] [int] NULL,
	[dimensiones] [varchar](25) NULL,
	[proveedor] [varchar](50) NULL,
	[cantidad_en_stock] [smallint] NULL,
	[precio_venta] [numeric](15, 2) NULL,
	[precio_proveedor] [numeric](15, 2) NULL,
	[fecha_carga] [datetime] NULL,
	[estado_carga] [varchar](20) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DB Staggin Oficina] ADD  DEFAULT (getdate()) FOR [fecha_carga]
GO
ALTER TABLE [dbo].[DB Stagging Cliente] ADD  DEFAULT (getdate()) FOR [fecha_carga]
GO
ALTER TABLE [dbo].[DB Stagging Detalle Pedido] ADD  DEFAULT (getdate()) FOR [fecha_carga]
GO
ALTER TABLE [dbo].[DB Stagging Empleado] ADD  DEFAULT (getdate()) FOR [fecha_carga]
GO
ALTER TABLE [dbo].[DB Stagging Pago] ADD  DEFAULT (getdate()) FOR [fecha_carga]
GO
ALTER TABLE [dbo].[DB Stagging Pedido] ADD  DEFAULT (getdate()) FOR [fecha_carga]
GO
ALTER TABLE [dbo].[DB Stagging Producto] ADD  DEFAULT (getdate()) FOR [fecha_carga]
GO
