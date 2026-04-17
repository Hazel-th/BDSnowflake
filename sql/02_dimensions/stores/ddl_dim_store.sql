CREATE TABLE dw.dim_store (
    store_key BIGSERIAL PRIMARY KEY,
    store_name TEXT NOT NULL,
    store_location TEXT NOT NULL DEFAULT '',
    store_city TEXT NOT NULL DEFAULT '',
    store_state TEXT NOT NULL DEFAULT '',
    country_key BIGINT NOT NULL REFERENCES dw.dim_country(country_key),
    store_phone TEXT,
    store_email TEXT,
    UNIQUE (store_name, store_location, store_city, store_state, country_key)
);
