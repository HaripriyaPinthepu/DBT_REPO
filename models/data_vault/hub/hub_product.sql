with src as (
    select
        {{ generate_hash(["product_id"]) }} as product_hk,
        product_id,
        current_timestamp as load_date,
        'orders_raw' as record_source
    from {{ ref('stg_orders_raw') }}
    group by product_id
)

select * from src