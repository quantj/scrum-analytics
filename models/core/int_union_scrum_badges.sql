with final_scrum_badges as (
    {{ dbt_utils.union_relations(
        relations=[ref('stg_credly__credly_scrum_badges_quebec'), ref('stg_credly__credly_scrum_badges_quebec')]
    ) }}
),

final as 
(select
    *
from final_scrum_badges)

select * from final