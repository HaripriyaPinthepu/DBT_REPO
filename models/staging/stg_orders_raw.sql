with source as (
    select * from {{ source('raw', 'orders_raw') }}
),

renamed as (
    select
        order_id as order_id,
        customer_id as customer_id,
        product_id as product_id,
        order_date as order_date,
        quantity,
        price,
        updated_at as updated_at
    from source
)

select * from renamed