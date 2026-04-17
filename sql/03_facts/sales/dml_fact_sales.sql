INSERT INTO dw.fact_sales (
    source_row_id,
    sale_date,
    customer_key,
    seller_key,
    product_key,
    store_key,
    supplier_key,
    sale_quantity,
    total_price
)
SELECT
    m.id::BIGINT AS source_row_id,
    TO_DATE(m.sale_date, 'MM/DD/YYYY') AS sale_date,
    c.customer_key,
    s.seller_key,
    p.product_key,
    st.store_key,
    sup.supplier_key,
    m.sale_quantity::INT AS sale_quantity,
    m.sale_total_price::NUMERIC(12,2) AS total_price
FROM public.mock_data m
JOIN dw.dim_customer c
    ON c.customer_source_id = m.sale_customer_id::BIGINT
JOIN dw.dim_seller s
    ON s.seller_source_id = m.sale_seller_id::BIGINT
JOIN dw.dim_product p
    ON p.product_source_id = m.sale_product_id::BIGINT
JOIN dw.dim_store st
    ON st.store_name = m.store_name
   AND st.store_location = COALESCE(m.store_location, '')
   AND st.store_city = COALESCE(m.store_city, '')
   AND st.store_state = COALESCE(m.store_state, '')
   AND st.country_key = (
       SELECT country_key
       FROM dw.dim_country
       WHERE country_name = COALESCE(m.store_country, '')
   )
JOIN dw.dim_supplier sup
    ON sup.supplier_name = m.supplier_name
   AND sup.supplier_contact = COALESCE(m.supplier_contact, '')
   AND sup.supplier_city = COALESCE(m.supplier_city, '')
   AND sup.country_key = (
       SELECT country_key
       FROM dw.dim_country
       WHERE country_name = COALESCE(m.supplier_country, '')
   );
