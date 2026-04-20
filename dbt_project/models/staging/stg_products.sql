{{ config( materialized='view') }}

SELECT
    product_id,
    LOWER(product_name) AS product_name,
    price
FROM retail_db.raw.products