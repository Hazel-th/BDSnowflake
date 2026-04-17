INSERT INTO dw.dim_seller (
    seller_source_id,
    first_name,
    last_name,
    email,
    country_key,
    postal_code
)
SELECT DISTINCT ON (m.sale_seller_id)
    m.sale_seller_id::BIGINT AS seller_source_id,
    m.seller_first_name AS first_name,
    m.seller_last_name AS last_name,
    m.seller_email AS email,
    dc.country_key,
    m.seller_postal_code AS postal_code
FROM public.mock_data m
LEFT JOIN dw.dim_country dc
    ON dc.country_name = m.seller_country
WHERE m.sale_seller_id IS NOT NULL
ORDER BY m.sale_seller_id, m.id;
