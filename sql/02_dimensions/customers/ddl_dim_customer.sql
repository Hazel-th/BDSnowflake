CREATE TABLE dw.dim_customer (
    customer_key BIGSERIAL PRIMARY KEY,
    customer_source_id BIGINT NOT NULL UNIQUE,
    first_name TEXT,
    last_name TEXT,
    age INT,
    email TEXT,
    country_key BIGINT REFERENCES dw.dim_country(country_key),
    postal_code TEXT,
    pet_name TEXT,
    pet_type_key BIGINT REFERENCES dw.dim_pet_type(pet_type_key),
    pet_breed_key BIGINT REFERENCES dw.dim_pet_breed(pet_breed_key)
);
