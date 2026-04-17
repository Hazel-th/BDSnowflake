INSERT INTO dw.dim_store (
    store_name,
    store_location,
    store_city,
    store_state,
    country_key,
    store_phone,
    store_email
)
SELECT DISTINCT ON (
    m.store_name,
    COALESCE(m.store_location, ''),
    COALESCE(m.store_city, ''),
    COALESCE(m.store_state, ''),
    dc.country_key
)
    m.store_name AS store_name,
    COALESCE(m.store_location, '') AS store_location,
    COALESCE(m.store_city, '') AS store_city,
    COALESCE(m.store_state, '') AS store_state,
    dc.country_key,
    m.store_phone AS store_phone,
    m.store_email AS store_email
FROM public.mock_data m
LEFT JOIN dw.dim_country dc
    ON dc.country_name = COALESCE(m.store_country, '')
WHERE m.store_name IS NOT NULL
ORDER BY
    m.store_name,
    COALESCE(m.store_location, ''),
    COALESCE(m.store_city, ''),
    COALESCE(m.store_state, ''),
    dc.country_key,
    m.id;
