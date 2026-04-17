INSERT INTO dw.dim_supplier (
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    country_key
)
SELECT DISTINCT ON (
    m.supplier_name,
    COALESCE(m.supplier_contact, ''),
    COALESCE(m.supplier_city, ''),
    dc.country_key
)
    m.supplier_name AS supplier_name,
    COALESCE(m.supplier_contact, '') AS supplier_contact,
    m.supplier_email AS supplier_email,
    m.supplier_phone AS supplier_phone,
    m.supplier_address AS supplier_address,
    COALESCE(m.supplier_city, '') AS supplier_city,
    dc.country_key
FROM public.mock_data m
LEFT JOIN dw.dim_country dc
    ON dc.country_name = COALESCE(m.supplier_country, '')
WHERE m.supplier_name IS NOT NULL
ORDER BY
    m.supplier_name,
    COALESCE(m.supplier_contact, ''),
    COALESCE(m.supplier_city, ''),
    dc.country_key,
    m.id;
