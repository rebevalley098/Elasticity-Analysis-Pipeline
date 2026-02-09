WITH ventas_mensuales AS (
    -- 1. Agrupamos ventas por mes y categoría usando tus nombres reales de tabla
    SELECT 
        p.product_category_name,
        DATE_FORMAT(oi.shipping_limit_date, '%Y-%m') AS mes, -- Usamos la fecha disponible
        AVG(oi.price) AS precio_promedio,
        COUNT(oi.order_id) AS cantidad_vendida
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    WHERE p.product_category_name IS NOT NULL
    GROUP BY 1, 2
),
cambios AS (
    -- 2. Calculamos los valores del mes anterior (M-1)
    SELECT 
        *,
        LAG(precio_promedio) OVER (PARTITION BY product_category_name ORDER BY mes) AS precio_anterior,
        LAG(cantidad_vendida) OVER (PARTITION BY product_category_name ORDER BY mes) AS cantidad_anterior
    FROM ventas_mensuales
)
-- 3. Cálculo final de la Elasticidad Precio de la Demanda
SELECT 
    product_category_name,
    mes,
    precio_promedio,
    cantidad_vendida,
    -- Fórmula: ((Q2-Q1)/Q1) / ((P2-P1)/P1)
    ROUND(
        ((cantidad_vendida - cantidad_anterior) / cantidad_anterior) / 
        ((precio_promedio - precio_anterior) / precio_anterior), 
    2) AS elasticidad_sql
FROM cambios
WHERE precio_anterior IS NOT NULL 
  AND cantidad_anterior > 0
  AND (precio_promedio - precio_anterior) <> 0 -- Evitamos división por cero si el precio no cambió
ORDER BY product_category_name, mes;