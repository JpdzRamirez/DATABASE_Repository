1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95	DROP DATABASE IF EXISTS DIM_JARDINERIA;
CREATE DATABASE DIM_JARDINERIA;
USE DIM_JARDINERIA;

-- DIMENSIÓN TIEMPO
CREATE TABLE DIM_JARDINERIA.DIM_tiempo (
    ID_tiempo INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    anio INT NOT NULL,
    trimestre INT NOT NULL,
    mes INT NOT NULL,
    dia INT NOT NULL,
    dia_semana VARCHAR(10) NOT NULL
);

-- DIMENSIÓN CLIENTE
CREATE TABLE DIM_JARDINERIA.DIM_cliente (
    ID_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    region VARCHAR(50),
    codigo_postal VARCHAR(15)  
);

-- DIMENSIÓN PRODUCTO
CREATE TABLE DIM_JARDINERIA.DIM_producto (
    ID_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    categoria VARCHAR(50),
    proveedor VARCHAR(50),
    precio_venta DECIMAL(10,2),
    cantidad_en_stock INT
);

-- DIMENSIÓN EMPLEADO (Vendedores)
CREATE TABLE DIM_JARDINERIA.DIM_empleado (
    ID_empleado INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    puesto VARCHAR(50),
    ID_jefe INT    
);

-- DIMENSIÓN OFICINA (Ubicación de vendedores)
CREATE TABLE DIM_JARDINERIA.DIM_oficina (
    ID_oficina INT PRIMARY KEY,
    descripcion VARCHAR(100),
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    region VARCHAR(50),
    telefono VARCHAR(20)    
);

-- DIMENSIÓN PAGO
CREATE TABLE DIM_JARDINERIA.DIM_pago (
    ID_pago INT PRIMARY KEY,
    ID_cliente INT,
    forma_pago VARCHAR(50),
    fecha_pago DATE,
    total DECIMAL(10,2)    
);
#-En la presente recomendación es necesario agregar método de envío y tipo de pedido, prioridad para poder obtener un análisis significativo en la dimensión de pedido.
CREATE TABLE DIM_JARDINERIA.DIM_pedido (
    ID_pedido INT PRIMARY KEY,
    estado VARCHAR(50),
    tipo_pedido VARCHAR(50), 
    metodo_envio VARCHAR(50),
    prioridad VARCHAR(50),   
    fecha_creacion DATE,
    fecha_envio DATE
);

-- TABLA DE HECHOS: Ventas
CREATE TABLE DIM_JARDINERIA.FACT_ventas (
    ID_venta INT AUTO_INCREMENT PRIMARY KEY,
    ID_pedido INT NOT NULL,
    ID_cliente INT NOT NULL,
    ID_producto INT NOT NULL,
    ID_empleado INT NOT NULL,
    ID_oficina INT NOT NULL,
    ID_tiempo INT NOT NULL,
    ID_pago INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    total DECIMAL(12,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    FOREIGN KEY (ID_pedido) REFERENCES DIM_pedido(ID_pedido),
    FOREIGN KEY (ID_cliente) REFERENCES DIM_cliente(ID_cliente),
    FOREIGN KEY (ID_producto) REFERENCES DIM_producto(ID_producto),
    FOREIGN KEY (ID_empleado) REFERENCES DIM_empleado(ID_empleado),
    FOREIGN KEY (ID_oficina) REFERENCES DIM_oficina(ID_oficina),
    FOREIGN KEY (ID_tiempo) REFERENCES DIM_tiempo(ID_tiempo),
    FOREIGN KEY (ID_pago) REFERENCES DIM_pago(ID_pago)
);
