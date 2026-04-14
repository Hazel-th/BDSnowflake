CREATE TABLE dw.dim_date (
    date_key BIGSERIAL PRIMARY KEY,
    full_date DATE NOT NULL UNIQUE,
    day_num INT NOT NULL,
    month_num INT NOT NULL,
    year_num INT NOT NULL,
    quarter_num INT NOT NULL
);
