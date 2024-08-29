with final_scrum_badges as (
    {{ dbt_utils.union_relations(
        relations=[ref('stg_credly__credly_scrum_badges_quebec'), ref('stg_credly__credly_scrum_badges_ontario')]
    ) }}
),

final as 
(select
    *,
    CASE 
    WHEN earn_this_badge_url IS NULL THEN badge_url
    ELSE earn_this_badge_url
END AS cert_url,
    REGEXP_REPLACE(issuer_summary, r'^issued by ', '') AS issued_by
from final_scrum_badges)

select * from final