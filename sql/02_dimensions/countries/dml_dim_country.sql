INSERT INTO dw.dim_country (country_name)
SELECT DISTINCT customer_country
FROM public.mock_data
WHERE customer_country IS NOT NULL

UNION

SELECT DISTINCT seller_country
FROM public.mock_data
WHERE seller_country IS NOT NULL

UNION

SELECT DISTINCT COALESCE(store_country, '')
FROM public.mock_data

UNION

SELECT DISTINCT COALESCE(supplier_country, '')
FROM public.mock_data;
