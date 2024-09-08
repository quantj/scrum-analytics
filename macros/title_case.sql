{% macro title_case(column_name) %}
    -- This macro converts a column's text data into Title Case
    initcap({{ column_name }})
{% endmacro %}