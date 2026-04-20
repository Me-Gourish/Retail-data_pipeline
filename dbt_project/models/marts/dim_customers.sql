{{ config(materialized='table') }}

SELECT
    customer_id,
    customer_name,
    email,
    city,
    country
FROM {{ ref('stg_customers') }}