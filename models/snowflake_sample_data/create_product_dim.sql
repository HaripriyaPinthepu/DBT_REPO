{{ config(materialized="table", schema="staging") }}
with
    source_product as (
        select * from {{ source("CORTEX_ANALYST_DEMO", "PRODUCT_DIM") }}
    ),
    final as (select * from source_product)
select *
from final
