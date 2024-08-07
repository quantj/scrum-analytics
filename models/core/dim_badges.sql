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
        MIN(level) AS min_level,
        MIN(issued_by) AS min_issued_by,
        MIN(earn_this_badge_url) AS min_earn_this_badge_url,
        MIN(image_url) AS min_image_url,
        MIN(description) AS min_description,
        MIN(cost) AS min_cost,
        MIN(type_category) AS min_type_category,
        MIN(global_activity_url) AS min_global_activity_url,
        min(url) as URL,
        min(final_url) as final_url,
        min(owner_vanity_slug) as owner_vanity_slug,
        min(vanity_slug) as vanity_slug
        
    from users_badges
    group by name

)

select * from final