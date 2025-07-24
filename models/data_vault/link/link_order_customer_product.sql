with src as (
    select
        {{ generate_hash(["order_id", "customer_id", "product_id"]) }} as link_hk,
        {{ generate_hash(["order_id"]) }} as order_hk,
        {{ generate_hash(["customer_id"]) }} as customer_hk,
        {{ generate_hash(["product_id"]) }} as product_hk,
        current_timestamp as load_date,
        'orders_raw' as record_source
    from {{ ref('stg_orders_raw') }}
)

select * from src