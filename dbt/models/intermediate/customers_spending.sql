SELECT
    customer_id,
    COUNT(sale_id) AS total_orders,
    SUM(unit_price * quantity) AS total_spent
FROM {{ ref('stg_sales') }}
GROUP BY customer_id    