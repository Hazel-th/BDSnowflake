INSERT INTO dw.dim_customer (
    customer_source_id,
    first_name,
    last_name,
    age,
    email,
    country,
    postal_code,
    pet_name,
    pet_type_key,
    pet_breed_key
)
SELECT DISTINCT ON (m.sale_customer_id)
    m.sale_customer_id::BIGINT AS customer_source_id,
    m.customer_first_name AS first_name,
    m.customer_last_name AS last_name,
    m.customer_age::INT AS age,
    m.customer_email AS email,
    m.customer_country AS country,
    m.customer_postal_code AS postal_code,
    m.customer_pet_name AS pet_name,
    pt.pet_type_key,
    pb.pet_breed_key
FROM public.mock_data m
LEFT JOIN dw.dim_pet_type pt
    ON pt.pet_type_name = m.customer_pet_type
LEFT JOIN dw.dim_pet_breed pb
    ON pb.pet_breed_name = m.customer_pet_breed
   AND pb.pet_type_key IS NOT DISTINCT FROM pt.pet_type_key
WHERE m.sale_customer_id IS NOT NULL
ORDER BY m.sale_customer_id, m.id;
