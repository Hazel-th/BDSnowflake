INSERT INTO dw.dim_date (
    full_date,
    day_num,
    month_num,
    year_num,
    quarter_num
)
SELECT DISTINCT
    TO_DATE(sale_date, 'MM/DD/YYYY') AS full_date,
    EXTRACT(DAY FROM TO_DATE(sale_date, 'MM/DD/YYYY'))::INT AS day_num,
    EXTRACT(MONTH FROM TO_DATE(sale_date, 'MM/DD/YYYY'))::INT AS month_num,
    EXTRACT(YEAR FROM TO_DATE(sale_date, 'MM/DD/YYYY'))::INT AS year_num,
    EXTRACT(QUARTER FROM TO_DATE(sale_date, 'MM/DD/YYYY'))::INT AS quarter_num
FROM public.mock_data
WHERE sale_date IS NOT NULL;
