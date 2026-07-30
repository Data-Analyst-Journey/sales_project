SELECT
    p.product_name,
    p.category,
    COUNT(DISTINCT s.sale_id) AS total_orders,
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.unit_price * s.quantity) AS total_revenue,
    ROUND(AVG(s.unit_price), 2) AS avg_price
FROM {{ ref('stg_sales') }} s 
LEFT JOIN {{ ref('stg_products') }} p USING (product_id)
GROUP BY p.product_name, p.category
ORDER BY total_revenue DESC    