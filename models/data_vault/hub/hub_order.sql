with src as (
    select
        {{ generate_hash(["order_id"]) }} as order_hk,
        order_id,
        current_timestamp as load_date,
        'orders_raw' as record_source
    from {{ ref('stg_orders_raw') }}
    group by order_id
)

select * from src