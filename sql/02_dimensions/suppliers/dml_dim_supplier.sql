INSERT INTO dw.dim_supplier (
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    supplier_country
)
SELECT DISTINCT ON (
    m.supplier_name,
    COALESCE(m.supplier_contact, ''),
    COALESCE(m.supplier_city, ''),
    COALESCE(m.supplier_country, '')
)
    m.supplier_name AS supplier_name,
    COALESCE(m.supplier_contact, '') AS supplier_contact,
    m.supplier_email AS supplier_email,
    m.supplier_phone AS supplier_phone,
    m.supplier_address AS supplier_address,
    COALESCE(m.supplier_city, '') AS supplier_city,
    COALESCE(m.supplier_country, '') AS supplier_country
FROM public.mock_data m
WHERE m.supplier_name IS NOT NULL
ORDER BY
    m.supplier_name,
    COALESCE(m.supplier_contact, ''),
    COALESCE(m.supplier_city, ''),
    COALESCE(m.supplier_country, ''),
    m.id;
