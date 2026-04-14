INSERT INTO dw.dim_product (
    product_source_id,
    product_name,
    category_key,
    price,
    stock_quantity,
    weight,
    color,
    size,
    brand,
    material,
    description,
    rating,
    reviews_count,
    release_date,
    expiry_date
)
SELECT DISTINCT ON (m.sale_product_id)
    m.sale_product_id::BIGINT AS product_source_id,
    m.product_name AS product_name,
    pc.category_key,
    m.product_price::NUMERIC(12,2) AS price,
    m.product_quantity::INT AS stock_quantity,
    m.product_weight::NUMERIC(10,2) AS weight,
    m.product_color AS color,
    m.product_size AS size,
    m.product_brand AS brand,
    m.product_material AS material,
    m.product_description AS description,
    m.product_rating::NUMERIC(3,1) AS rating,
    m.product_reviews::INT AS reviews_count,
    TO_DATE(m.product_release_date, 'MM/DD/YYYY') AS release_date,
    TO_DATE(m.product_expiry_date, 'MM/DD/YYYY') AS expiry_date
FROM public.mock_data m
LEFT JOIN dw.dim_product_category pc
    ON pc.product_category_name = COALESCE(m.product_category, 'Unknown')
   AND pc.pet_category_name = COALESCE(m.pet_category, 'Unknown')
WHERE m.sale_product_id IS NOT NULL
ORDER BY m.sale_product_id, m.id;
