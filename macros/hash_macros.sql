{% macro generate_hash(fields) %}
    MD5(CONCAT_WS('|', {{ fields | join(', ') }}))
{% endmacro %}