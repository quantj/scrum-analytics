with users_badges as (
    select 
    *,
    CASE
        WHEN earn_this_badge_url IS NULL OR earn_this_badge_url = 'null' THEN 
        url
        ELSE
        earn_this_badge_url
    END AS final_url
    from {{ ref("int_union_users_badges") }}
),


final as (
    select
        --id,
        name,
        MIN(level) AS level,
        MIN(issued_by) AS issued_by,
        MIN(earn_this_badge_url) AS earn_this_badge_url,
        MIN(image_url) AS image_url,
        MIN(description) AS description,
        MIN(cost) AS cost,
        MIN(type_category) AS type_category,
        MIN(global_activity_url) AS global_activity_url,
        min(url) as URL,
        min(final_url) as final_url,
        min(owner_vanity_slug) as owner_vanity_slug,
        min(vanity_slug) as vanity_slug
        
    from users_badges
    group by name

)

select * from final