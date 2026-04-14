INSERT INTO dw.dim_product_category (product_category_name, pet_category_name)
SELECT DISTINCT
    COALESCE(product_category, 'Unknown') AS product_category_name,
    COALESCE(pet_category, 'Unknown') AS pet_category_name
FROM public.mock_data;
