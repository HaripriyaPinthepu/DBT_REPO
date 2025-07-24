	{{ config(
    materialized = 'incremental',
    unique_key = 'order_id'
) }}
	SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    price,
    updated_at,
    current_timestamp() load_Date
FROM {{ ref('stg_orders_raw') }}
	{% if is_incremental() %}
WHERE updated_at > (SELECT MAX(updated_at) FROM {{ this }})
{% endif %}
