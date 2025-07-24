with src as (
    select
        {{ generate_hash(["order_id"]) }} as order_hk,
        quantity,
        price,
        order_date,
        {{ generate_hash(["quantity", "price", "order_date"]) }} as hash_diff,
        current_timestamp as load_date,
        'orders_raw' as record_source
    from {{ ref('stg_orders_raw') }}
)

select * from src