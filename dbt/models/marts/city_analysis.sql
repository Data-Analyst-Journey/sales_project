WITH city_fixed AS (
    SELECT
        CASE 
            WHEN city IS NULL OR city = '' THEN 'Unknown'  
            ELSE city  
        END AS city_clean,
        customer_id,
        sale_id,
        quantity,
        unit_price,
        (unit_price * quantity) AS total_amount
    FROM {{ ref('stg_sales') }}    
),
city_stats AS (
    SELECT
        city_clean AS city,
        COUNT(DISTINCT customer_id) AS total_customers,
        COUNT(DISTINCT sale_id) AS total_invoices,
        SUM(quantity) AS total_quantity_sold,
        SUM(unit_price * quantity) AS total_revenue,
        ROUND(AVG(unit_price * quantity), 2) AS avg_order_value
    FROM city_fixed
    GROUP BY city_clean 
)

SELECT
    city,
    total_customers,
    total_invoices,
    total_quantity_sold,
    total_revenue,
    avg_order_value,
    ROUND(100.0 * total_revenue / SUM(total_revenue) OVER(), 2) AS revenue_percentage
FROM city_stats
WHERE city != 'Unknown'
ORDER BY total_revenue DESC    