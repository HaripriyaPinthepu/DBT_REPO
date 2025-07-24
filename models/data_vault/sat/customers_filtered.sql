select * from {{ ref('countries') }}
where country_code='{{ var("country_filter") }}'