WITH city_platform_stats AS (
    SELECT
        CASE 
            WHEN city IN ('Malard','Tehran','Karaj','Fardis','malard','tehran','karaj','fardis') THEN city  
            ELSE 'other' 
        END AS city_group,
        platform,
        COUNT(DISTINCT sale_id) AS total_invoices,
        SUM(unit_price * quantity) AS total_revenue
    FROM {{ ref('stg_sales') }}
    GROUP BY city_group, platform    
)
SELECT
    city_group,
    platform,
    total_invoices,
    total_revenue
FROM city_platform_stats
ORDER BY city_group, total_revenue DESC    