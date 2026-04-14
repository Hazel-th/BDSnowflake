CREATE TABLE dw.dim_pet_type (
    pet_type_key BIGSERIAL PRIMARY KEY,
    pet_type_name TEXT NOT NULL UNIQUE
);
