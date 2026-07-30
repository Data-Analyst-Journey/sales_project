WITH first_purchase AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', MIN(sale_date)) AS cohort_month
    FROM {{ ref('stg_sales') }}
    GROUP BY customer_id    
),
customer_activity AS (
    SELECT
        s.customer_id,
        DATE_TRUNC('month', s.sale_date) AS activity_month,
        f.cohort_month,
        EXTRACT(YEAR FROM s.sale_date) * 12 + EXTRACT(MONTH FROM s.sale_date) -
        (EXTRACT(YEAR FROM f.cohort_month) * 12 + EXTRACT(MONTH FROM f.cohort_month)) AS month_number
    FROM {{ ref('stg_sales') }} s 
    LEFT JOIN first_purchase f ON s.customer_id = f.customer_id
),
cohort_data AS (
    SELECT
        cohort_month,
        month_number,
        COUNT(DISTINCT customer_id) AS customers
    FROM customer_activity
    GROUP BY cohort_month, month_number    
),
cohort_size AS (
    SELECT
        cohort_month,
        customers AS cohort_size
    FROM cohort_data
    WHERE month_number = 0    
)
SELECT
    c.cohort_month,
    c.month_number,
    c.customers,
    cs.cohort_size,
    ROUND(100.0 * c.customers / NULLIF(cs.cohort_size, 0), 2) AS retention_rate
FROM cohort_data c 
LEFT JOIN cohort_size cs ON c.cohort_month = cs.cohort_month
ORDER BY c.cohort_month, c.month_number    