with
summary as (
    select * from {{ ref('int_union_scrum_summary') }}
),
scrum_badges as (
    select * from {{ ref("int_union_scrum_badges") }}
),


final as (
    select
        distinct summary.id as user_id,
        summary.first_name,
        CONCAT(SUBSTR(summary.first_name, 1, 1), REPEAT('*', LENGTH(summary.first_name) - 1)) AS masked_first_name,
        summary.last_name,
        CONCAT(SUBSTR(summary.last_name, 1, 1), REPEAT('*', LENGTH(summary.last_name) - 1)) AS masked_last_name,
        CONCAT('https://www.credly.com', summary.vanity_url) as vanity_url,
        summary.role,
        summary.location,
        scrum_badges.badge_template_name as badge_name,
        scrum_badges.issued_at_date,
        scrum_badges.issued_by,
        scrum_badges.cert_url


    from summary
    left join scrum_badges
        on summary.vanity_url = scrum_badges.earner_path
    order by issued_at_date desc
)

select * from final
