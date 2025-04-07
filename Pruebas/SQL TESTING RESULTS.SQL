USE [DBO_DATAMART_Jardineria];
GO

-------------------------------
-- 1. COMPROBAR NULOS
-------------------------------

-- Clientes sin nombre
SELECT * FROM dim_cliente
WHERE nombre_cliente IS NULL;

-- Pagos sin total
SELECT * FROM dim_pago
WHERE total_pago IS NULL;

-- Productos sin precio
SELECT * FROM dim_producto
WHERE precio_venta IS NULL;

-- Fechas nulas en pedidos
SELECT * FROM dim_pedido
WHERE fecha_creacion IS NULL OR fecha_entrega IS NULL;

-- Empleados sin nombre o puesto
SELECT * FROM dim_empleado
WHERE nombre_completo IS NULL OR puesto IS NULL;

-------------------------------
-- 2. DETECCIÓN DE DUPLICADOS
-------------------------------

-- Clientes duplicados por ID
SELECT ID_cliente, COUNT(*) AS duplicados
FROM dim_cliente
GROUP BY ID_cliente
HAVING COUNT(*) > 1;

-- Productos duplicados por ID
SELECT ID_producto, COUNT(*) AS duplicados
FROM dim_producto
GROUP BY ID_producto
HAVING COUNT(*) > 1;

-------------------------------
-- 3. INTEGRIDAD REFERENCIAL
-------------------------------

-- Ventas con ID_cliente inexistente
SELECT fv.*
FROM fact_ventas fv
LEFT JOIN dim_cliente c ON fv.ID_cliente = c.ID_cliente
WHERE c.ID_cliente IS NULL;

-- Ventas con ID_producto inexistente
SELECT fv.*
FROM fact_ventas fv
LEFT JOIN dim_producto p ON fv.ID_producto = p.ID_producto
WHERE p.ID_producto IS NULL;

-- Ventas con ID_empleado inexistente
SELECT fv.*
FROM fact_ventas fv
LEFT JOIN dim_empleado e ON fv.ID_empleado = e.ID_empleado
WHERE e.ID_empleado IS NULL;

-- Ventas con ID_tiempo inexistente
SELECT fv.*
FROM fact_ventas fv
LEFT JOIN dim_tiempo t ON fv.ID_tiempo = t.ID_tiempo
WHERE t.ID_tiempo IS NULL;

-------------------------------
-- 4. VALORES FUERA DE RANGO
-------------------------------

-- Precios de venta negativos o nulos
SELECT * FROM dim_producto
WHERE precio_venta < 0;

-- Cantidades negativas en stock
SELECT * FROM dim_producto
WHERE cantidad_en_stock < 0;

-- Total de pagos negativo o cero
SELECT * FROM dim_pago
WHERE total_pago <= 0;

-- Total de ventas no coincide con cálculo
SELECT *
FROM fact_ventas
WHERE total != cantidad * precio_unitario;

-------------------------------
-- 5. FORMATOS INVÁLIDOS (ejemplo con teléfono)
-------------------------------

-- Clientes con teléfonos inválidos (muy cortos)
SELECT * FROM dim_cliente
WHERE LEN(telefono) < 7;
