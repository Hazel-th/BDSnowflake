CREATE TABLE dw.dim_pet_breed (
    pet_breed_key BIGSERIAL PRIMARY KEY,
    pet_breed_name TEXT NOT NULL,
    pet_type_key BIGINT REFERENCES dw.dim_pet_type(pet_type_key),
    UNIQUE (pet_breed_name, pet_type_key)
);
