{{ config(materialized='view') }}

SELECT
    customer_id,
    LOWER(name) AS customer_name,
    LOWER(email) AS email,
    city,
    country
FROM retail_db.raw.customers