INSERT INTO dw.dim_pet_breed (pet_breed_name, pet_type_key)
SELECT DISTINCT
    m.customer_pet_breed AS pet_breed_name,
    pt.pet_type_key
FROM public.mock_data m
LEFT JOIN dw.dim_pet_type pt
    ON pt.pet_type_name = m.customer_pet_type
WHERE m.customer_pet_breed IS NOT NULL;
