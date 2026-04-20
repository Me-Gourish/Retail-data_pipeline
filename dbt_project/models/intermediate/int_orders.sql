{{ config(materialized='view') }}

WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),

products AS (
    SELECT * FROM {{ ref('stg_products') }}
)

SELECT
    o.order_id,
    o.customer_id,
    c.customer_name,
    c.email,
    o.product_id,
    p.product_name,
    p.price,
    o.quantity,
    (o.quantity * p.price) AS total_amount,
    o.order_date
FROM orders o
LEFT JOIN customers c 
    ON o.customer_id = c.customer_id
LEFT JOIN products p 
    ON o.product_id = p.product_id
where o.quantity > 0