CREATE TABLE dw.dim_seller (
    seller_key BIGSERIAL PRIMARY KEY,
    seller_source_id BIGINT NOT NULL UNIQUE,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    country TEXT,
    postal_code TEXT
);
