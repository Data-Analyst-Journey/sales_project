WITH product_pairs AS (
    SELECT DISTINCT
        a.sale_id AS invoice_id,
        a.product_id AS product_a,
        b.product_id AS product_b
    FROM {{ ref('stg_sales') }} a  
    JOIN {{ ref('stg_sales') }} b 
        ON a.sale_id = b.sale_id
        AND a.product_id <> b.product_id  
),

pair_counts AS (
    SELECT
        product_a,
        product_b,
        COUNT(*) AS pair_frequency
    FROM product_pairs
    GROUP BY product_a, product_b    
),

product_counts AS (
    SELECT
        product_id,
        COUNT(DISTINCT sale_id) AS product_frequency
    FROM {{ ref('stg_sales') }}
    GROUP BY product_id    
),

total_invoices AS (
    SELECT COUNT(DISTINCT sale_id) AS total_count
    FROM {{ ref('stg_sales') }}
)

SELECT
    pc.product_a,
    pc.product_b,
    pc.pair_frequency,
    ti.total_count,
    ROUND(pc.pair_frequency * 1.0 /ti.total_count, 3) AS support,
    ROUND(pc.pair_frequency * 1.0 /pa.product_frequency, 3) AS confidence,
    ROUND(
        (pc.pair_frequency * 1.0 / pa.product_frequency) / 
        (pb.product_frequency *1.0 / ti.total_count), 3
    ) AS lift
FROM pair_counts pc 
JOIN product_counts pa ON pc.product_a = pa.product_id
JOIN product_counts pb ON pc.product_b = pb.product_id
CROSS JOIN total_invoices ti 
ORDER BY lift DESC, support DESC    
