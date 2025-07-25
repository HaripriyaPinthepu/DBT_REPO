	{% snapshot orders_snapshot %}
	{{
    config(
        target_schema='snapshots',         
        unique_key='order_id',           
        strategy='check',                 
        check_cols=['price', 'quantity'],     
        invalidate_hard_deletes=True       
    )
}}
	select * from {{  source('raw', 'orders_raw') }}
	{% endsnapshot %}
