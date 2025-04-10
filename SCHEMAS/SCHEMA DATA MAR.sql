USE [DBO_DATAMART_Jardineria]
GO
/****** Object:  Table [dbo].[dim_cliente]    Script Date: 6/4/2025 21:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_cliente](
	[ID_cliente] [int] NOT NULL,
	[nombre_cliente] [varchar](100) NULL,
	[nombre_completo_contacto] [varchar](100) NULL,
	[ciudad] [varchar](50) NULL,
	[pais] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[codigo_postal] [varchar](15) NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[cliente_vip] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_empleado]    Script Date: 6/4/2025 21:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_empleado](
	[ID_empleado] [int] NOT NULL,
	[nombre_completo] [varchar](100) NULL,
	[puesto] [varchar](50) NULL,
	[ID_jefe] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_oficina]    Script Date: 6/4/2025 21:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_oficina](
	[ID_oficina] [int] NOT NULL,
	[direccion_completa] [varchar](50) NULL,
	[ciudad] [varchar](50) NULL,
	[pais] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_oficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_pago]    Script Date: 6/4/2025 21:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_pago](
	[ID_pago] [int] NOT NULL,
	[ID_cliente] [int] NULL,
	[forma_pago] [varchar](50) NULL,
	[fecha_pago] [date] NULL,
	[total_pago] [decimal](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_pedido]    Script Date: 6/4/2025 21:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_pedido](
	[ID_pedido] [int] NOT NULL,
	[estado] [varchar](50) NULL,
	[tipo_pedido] [varchar](50) NULL,
	[metodo_envio] [varchar](50) NULL,
	[prioridad] [varchar](50) NULL,
	[fecha_creacion] [date] NULL,
	[fecha_entrega] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_producto]    Script Date: 6/4/2025 21:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_producto](
	[ID_producto] [int] NOT NULL,
	[nombre_producto] [varchar](100) NULL,
	[categoria] [varchar](50) NULL,
	[proveedor] [varchar](50) NULL,
	[precio_venta] [decimal](15, 2) NULL,
	[cantidad_en_stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_tiempo]    Script Date: 6/4/2025 21:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_tiempo](
	[ID_tiempo] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[anio] [int] NOT NULL,
	[trimestre] [int] NOT NULL,
	[mes] [int] NOT NULL,
	[dia] [int] NOT NULL,
	[dia_semana] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_tiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact_ventas]    Script Date: 6/4/2025 21:07:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact_ventas](
	[ID_venta] [int] IDENTITY(1,1) NOT NULL,
	[ID_pedido] [int] NOT NULL,
	[ID_cliente] [int] NOT NULL,
	[ID_producto] [int] NOT NULL,
	[ID_empleado] [int] NOT NULL,
	[ID_oficina] [int] NOT NULL,
	[ID_tiempo] [int] NOT NULL,
	[ID_pago] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_unitario] [decimal](15, 2) NOT NULL,
	[total] [decimal](15, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[fact_ventas]  WITH CHECK ADD FOREIGN KEY([ID_cliente])
REFERENCES [dbo].[dim_cliente] ([ID_cliente])
GO
ALTER TABLE [dbo].[fact_ventas]  WITH CHECK ADD FOREIGN KEY([ID_empleado])
REFERENCES [dbo].[dim_empleado] ([ID_empleado])
GO
ALTER TABLE [dbo].[fact_ventas]  WITH CHECK ADD FOREIGN KEY([ID_oficina])
REFERENCES [dbo].[dim_oficina] ([ID_oficina])
GO
ALTER TABLE [dbo].[fact_ventas]  WITH CHECK ADD FOREIGN KEY([ID_pago])
REFERENCES [dbo].[dim_pago] ([ID_pago])
GO
ALTER TABLE [dbo].[fact_ventas]  WITH CHECK ADD FOREIGN KEY([ID_pedido])
REFERENCES [dbo].[dim_pedido] ([ID_pedido])
GO
ALTER TABLE [dbo].[fact_ventas]  WITH CHECK ADD FOREIGN KEY([ID_producto])
REFERENCES [dbo].[dim_producto] ([ID_producto])
GO
ALTER TABLE [dbo].[fact_ventas]  WITH CHECK ADD FOREIGN KEY([ID_tiempo])
REFERENCES [dbo].[dim_tiempo] ([ID_tiempo])
GO
