SELECT
    sale_date,
    COUNT(DISTINCT sale_id) AS total_invoices,
    SUM(unit_price * quantity) AS daily_revenue
FROM {{ ref('stg_sales') }}
GROUP BY sale_date
ORDER BY sale_date DESC    