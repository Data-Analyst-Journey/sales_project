WITH discounted_products AS (
    SELECT
        product_id,
        CASE 
            WHEN discount_percent > 0  THEN 'With Discount'
            WHEN discount_percent = 0  THEN 'Without Discount'
            ELSE 'Without Discount' 
        END AS discount_status,
        COUNT(*) AS total_sales,
        SUM(quantity) AS total_quantity_sold,
        SUM(unit_price * quantity) AS total_revenue,
        AVG(unit_price) AS avg_price
    FROM {{ ref('stg_sales') }}
    GROUP BY product_id, discount_percent    
)

SELECT
    discount_status,
    COUNT(product_id) AS number_of_products,
    SUM(total_sales) AS total_invoices,
    SUM(total_quantity_sold) AS total_quantity,
    SUM(total_revenue) AS total_revenue,
    ROUND(AVG(total_revenue), 2) AS avg_revenue_per_product
FROM discounted_products
GROUP BY discount_status
ORDER BY total_revenue DESC    