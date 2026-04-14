CREATE TABLE dw.fact_sales (
    sale_key BIGSERIAL PRIMARY KEY,
    source_row_id BIGINT NOT NULL UNIQUE,
    date_key BIGINT NOT NULL REFERENCES dw.dim_date(date_key),
    customer_key BIGINT NOT NULL REFERENCES dw.dim_customer(customer_key),
    seller_key BIGINT NOT NULL REFERENCES dw.dim_seller(seller_key),
    product_key BIGINT NOT NULL REFERENCES dw.dim_product(product_key),
    store_key BIGINT NOT NULL REFERENCES dw.dim_store(store_key),
    supplier_key BIGINT NOT NULL REFERENCES dw.dim_supplier(supplier_key),
    sale_quantity INT NOT NULL,
    unit_price NUMERIC(12,2) NOT NULL,
    total_price NUMERIC(12,2) NOT NULL
);
