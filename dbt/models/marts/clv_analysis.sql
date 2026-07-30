WITH customer_clv AS (
    SELECT
        customer_id,
        COUNT(DISTINCT sale_id) AS frequency,
        AVG(unit_price * quantity) AS avg_order_value,
        COUNT(DISTINCT DATE_TRUNC('month', sale_date)) AS active_months,
        (COUNT(DISTINCT DATE_TRUNC('month', sale_date)) * AVG(unit_price * quantity)) AS clv
    FROM {{ ref('stg_sales') }}
    GROUP BY customer_id    
)
SELECT
    customer_id,
    frequency,
    avg_order_value,
    active_months,
    clv,
    CASE 
        WHEN clv >= PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY clv) OVER () 
        THEN 'High CLV'
        WHEN clv >= PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY clv) OVER ()
        THEN 'Medium CLV'  
        ELSE 'Low CLV' 
    END AS clv_segment
FROM customer_clv    