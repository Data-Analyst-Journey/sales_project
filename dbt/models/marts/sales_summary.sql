SELECT
    DATE_TRUNC('month', sale_date) AS month,
    COUNT(DISTINCT sale_id) AS total_invoices,
    SUM(unit_price * quantity) AS total_revenue
FROM {{ ref('stg_sales') }}
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month DESC    