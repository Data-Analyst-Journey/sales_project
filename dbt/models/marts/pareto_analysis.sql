WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(unit_price * quantity) AS total_spent
    FROM {{ ref('stg_sales') }}
    GROUP BY customer_id    
),
ranked AS (
    SELECT
        customer_id,
        total_spent,
        SUM(total_spent) OVER (ORDER BY total_spent DESC) AS cumulative_revenue,
        SUM(total_spent) OVER() AS total_revenue,
        ROW_NUMBER() OVER(ORDER BY total_spent DESC) AS rank,
        COUNT(*) OVER() AS total_customers
    FROM customer_revenue    
)
SELECT
    customer_id,
    total_spent,
    ROUND(100.0 * rank / total_customers , 2) AS customer_percentile,
    ROUND(100.0 * cumulative_revenue / total_revenue, 2) AS revenue_percentage
FROM ranked
ORDER BY rank