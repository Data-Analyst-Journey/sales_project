SELECT
    EXTRACT(dow FROM sale_date) AS day_number,
    TO_CHAR(sale_date, 'Day') AS day_name,
    COUNT(DISTINCT sale_id) AS total_invoices,
    SUM(unit_price * quantity) AS total_revenue
FROM {{ ref('stg_sales') }}
GROUP BY day_number, day_name
ORDER BY day_number     