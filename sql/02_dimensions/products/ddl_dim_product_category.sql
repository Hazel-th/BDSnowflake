CREATE TABLE dw.dim_product_category (
    category_key BIGSERIAL PRIMARY KEY,
    product_category_name TEXT NOT NULL,
    pet_category_name TEXT NOT NULL,
    UNIQUE (product_category_name, pet_category_name)
);
