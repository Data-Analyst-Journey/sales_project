SELECT
    platform,
    AVG(discount_percent) AS avg_discount,
    COUNT(*) AS total_sales,
    SUM(unit_price * quantity) AS total_revenue
FROM {{ ref('stg_sales') }} 
GROUP BY platform
ORDER BY avg_discount DESC   