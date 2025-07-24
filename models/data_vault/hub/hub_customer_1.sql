	{{ config(materialized='view') }}
	{{ hub_model(
    source_model='stg_orders_raw',
    business_key='customer_id',
    hub_name='customer',
    record_source="'orders_raw'"
) }}
