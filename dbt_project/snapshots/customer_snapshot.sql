{% snapshot customer_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='customer_id',
      strategy='check',
      check_cols=['customer_name', 'email', 'city']
    )
}}

SELECT * FROM {{ ref('stg_customers') }}

{% endsnapshot %}