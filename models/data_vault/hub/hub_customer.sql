with
    src as (
        select
            {{ generate_hash(["customer_id"]) }} as customer_hk,
            customer_id,
            current_timestamp as load_date,
            'orders_raw' as record_source
        from {{ ref("stg_orders_raw") }}
        group by customer_id
    )

select *
from src
