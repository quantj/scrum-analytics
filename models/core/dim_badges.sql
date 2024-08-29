with final as (
    select
        --id,
        badge_template_name AS name,
        MIN(issued_by) AS issued_by,
        MIN(cert_url) AS cert_url,
        MIN(badge_image_url) AS badge_image_url,
        MIN(badge_template_description) AS description,
        MIN(cost) AS cost
    from {{ ref('int_union_scrum_badges') }}
    group by badge_template_name
    order by 1
)

select * from final
