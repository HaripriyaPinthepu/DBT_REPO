select * 
  from {{ ref('stg_orders_raw') }}
