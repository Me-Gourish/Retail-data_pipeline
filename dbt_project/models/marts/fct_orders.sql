{{ config(materialized='table') }}

SELECT
    order_id,
    customer_id,
    product_id,
    quantity,
    price,
    total_amount,
    order_date
FROM {{ ref('int_orders') }}