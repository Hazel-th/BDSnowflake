CREATE TABLE dw.dim_product (
    product_key BIGSERIAL PRIMARY KEY,
    product_source_id BIGINT NOT NULL UNIQUE,
    product_name TEXT,
    category_key BIGINT REFERENCES dw.dim_product_category(category_key),
    price NUMERIC(12,2),
    stock_quantity INT,
    weight NUMERIC(10,2),
    color TEXT,
    size TEXT,
    brand TEXT,
    material TEXT,
    description TEXT,
    rating NUMERIC(3,1),
    reviews_count INT,
    release_date DATE,
    expiry_date DATE
);
