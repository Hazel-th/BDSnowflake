INSERT INTO dw.dim_store (
    store_name,
    store_location,
    store_city,
    store_state,
    store_country,
    store_phone,
    store_email
)
SELECT DISTINCT ON (
    m.store_name,
    COALESCE(m.store_location, ''),
    COALESCE(m.store_city, ''),
    COALESCE(m.store_state, ''),
    COALESCE(m.store_country, '')
)
    m.store_name AS store_name,
    COALESCE(m.store_location, '') AS store_location,
    COALESCE(m.store_city, '') AS store_city,
    COALESCE(m.store_state, '') AS store_state,
    COALESCE(m.store_country, '') AS store_country,
    m.store_phone AS store_phone,
    m.store_email AS store_email
FROM public.mock_data m
WHERE m.store_name IS NOT NULL
ORDER BY
    m.store_name,
    COALESCE(m.store_location, ''),
    COALESCE(m.store_city, ''),
    COALESCE(m.store_state, ''),
    COALESCE(m.store_country, ''),
    m.id;
