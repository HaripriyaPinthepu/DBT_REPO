	{% macro hub_model(
    source_model,
    business_key,
    hub_name,
    record_source="'manual_load'"
) %}
SELECT
    MD5(CONCAT_WS('|',{{ business_key }}))  AS {{ hub_name }}_hk,
    {{ business_key }},
    current_timestamp AS load_date,
    {{ record_source }} AS record_source
FROM {{ ref(source_model) }}
GROUP BY {{ business_key }}
{% endmacro %}
	{% macro link_model(
    source_model,
    link_name,
    business_keys,
    record_source="'manual_load'"
) %}
SELECT
    {{ dbt_utils.surrogate_key(business_keys) }} AS {{ link_name }}_hk,
    {% for key in business_keys %}
        {{ dbt_utils.surrogate_key([key]) }} AS {{ key }}_hk,
    {% endfor %}
    current_timestamp AS load_date,
    {{ record_source }} AS record_source
FROM {{ ref(source_model) }}
{% endmacro %}
