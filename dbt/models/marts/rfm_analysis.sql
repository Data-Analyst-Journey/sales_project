WITH max_date AS (
    SELECT MAX(sale_date) AS last_date FROM {{ ref('stg_sales') }}
),
rfm AS (
    SELECT
        customer_id,
        (SELECT last_date FROM max_date) - MAX(sale_date) AS recency,
        COUNT(DISTINCT sale_id) AS frequency,
        SUM(unit_price * quantity) AS monetary
    FROM {{ ref('stg_sales') }}
    GROUP BY customer_id    
)
SELECT
    customer_id,
    recency,
    frequency,
    monetary,
    NTILE(5) OVER (ORDER BY recency ASC) AS r_score,
    NTILE(5) OVER (ORDER BY frequency DESC) AS f_score,
    NTILE(5) OVER (ORDER BY monetary DESC) AS m_score,
    CONCAT(
        NTILE(5) OVER (ORDER BY recency ASC),
        NTILE(5) OVER (ORDER BY frequency DESC),
        NTILE(5) OVER (ORDER BY monetary DESC)
    ) AS rfm_score
FROM rfm    