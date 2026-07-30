SELECT
    sale_id,
    sale_date::date AS sale_date,
    customer_id,
    product_id,
    quantity,
    unit_price,
    discount_percent,
    platform,
    city
FROM sales    