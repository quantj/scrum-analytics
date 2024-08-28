with
summary as (
    select * from {{ ref('int_union_scrum_summary') }}
),


final as (
    select
        distinct REPLACE(vanity_url, '/users/', '') as user_id,
        first_name,
        CONCAT(SUBSTR(first_name, 1, 1), REPEAT('*', LENGTH(first_name) - 1)) AS masked_first_name,
        last_name,
        CONCAT(SUBSTR(last_name, 1, 1), REPEAT('*', LENGTH(last_name) - 1)) AS masked_last_name,
        role,
        location,
        CONCAT('https://www.credly.com', vanity_url) as vanity_url


    from summary
)

select * from final