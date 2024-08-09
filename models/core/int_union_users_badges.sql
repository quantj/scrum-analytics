with final_users_badges as (
    {{ dbt_utils.union_relations(
        relations=[ref('stg_credly__credly_users_badges'), ref('stg_credly__credly_ontario_users_badges')]
    ) }}
),

final as 
(select
    *,
    regexp_extract(badge_template, r'id=([a-zA-Z0-9-]+)') as badge_id,
    regexp_extract(badge_template, r'name=([^,}]+)') as name,
    regexp_replace(regexp_extract(badge_template, r'issuer=\{[^}]*summary=([^,}]+)'), r'issued by ', '') as issued_by,
    regexp_extract(badge_template, r'level=([^,}]+)') as level,
    regexp_extract(badge_template, r'earn_this_badge_url=([^,}]+)') as earn_this_badge_url,
    regexp_extract(badge_template, r'url=([^,}]+)') as url,
    regexp_extract(badge_template, r'description=([^,}]+)') as description,
    regexp_extract(badge_template, r'cost=([^,}]+)') as cost,
    regexp_extract(badge_template, r'type_category=([^,}]+)') as type_category,
    regexp_extract(badge_template, r'global_activity_url=([^,}]+)') as global_activity_url,
    regexp_extract(badge_template, r'owner_vanity_slug=([^,}]+)') as owner_vanity_slug,
    regexp_extract(badge_template, r'\bvanity_slug=([^,}]+)') as vanity_slug
from final_users_badges)

select * from final

