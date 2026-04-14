INSERT INTO dw.dim_pet_type (pet_type_name)
SELECT DISTINCT customer_pet_type
FROM public.mock_data
WHERE customer_pet_type IS NOT NULL;
