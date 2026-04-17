CREATE TABLE dw.dim_country (
    country_key BIGSERIAL PRIMARY KEY,
    country_name TEXT NOT NULL UNIQUE
);
