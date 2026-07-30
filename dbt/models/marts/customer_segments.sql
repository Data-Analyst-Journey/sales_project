WITH customer_spending AS (
    SELECT *
    FROM {{ ('customers_spending') }}
)
SELECT
    c.customer_id,
    COALESCE(cs.total_orders,0) AS total_orders,
    COALESCE(cs.total_spent,0) AS total_spent,
    CASE 
        WHEN COALESCE(cs.total_spent,0) > 100000000 THEN 'High Value'
        WHEN COALESCE(cs.total_spent,0) > 50000000 THEN 'Medium Value'  
        ELSE 'Low Value' 
    END AS customer_segment
FROM {{ ref('stg_customers') }} c 
LEFT JOIN {{ ref('customers_spending') }} cs USING (customer_id)    