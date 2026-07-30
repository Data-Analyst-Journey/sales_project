WITH discount_stats AS (
    SELECT
        product_id,
        discount_percent,
        COUNT(*) AS total_sales,
        SUM(quantity) AS total_quantity_sold,
        SUM(unit_price * quantity) AS total_revenue
    FROM {{ ref('stg_sales') }}
    GROUP BY product_id, discount_percent   
)

SELECT
    p.product_name,
    p.category,
    ds.discount_percent,
    ds.total_sales,
    ds.total_quantity_sold,
    ds.total_revenue,
    CASE 
        WHEN ds.discount_percent > 15 THEN 'High Discount'
        WHEN ds.discount_percent > 5 THEN 'Medium Discount'  
        ELSE 'Low Discount' 
    END AS discount_category
FROM discount_stats ds 
LEFT JOIN {{ ref('stg_products') }} p USING (product_id)
ORDER BY ds.discount_percent DESC    