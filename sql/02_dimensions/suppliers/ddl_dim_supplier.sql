CREATE TABLE dw.dim_supplier (
    supplier_key BIGSERIAL PRIMARY KEY,
    supplier_name TEXT NOT NULL,
    supplier_contact TEXT NOT NULL DEFAULT '',
    supplier_email TEXT,
    supplier_phone TEXT,
    supplier_address TEXT,
    supplier_city TEXT NOT NULL DEFAULT '',
    country_key BIGINT NOT NULL REFERENCES dw.dim_country(country_key),
    UNIQUE (supplier_name, supplier_contact, supplier_city, country_key)
);
