with final_scrum_summary as (
    {{ dbt_utils.union_relations(
    relations=[ref('stg_credly__credly_scrum_summary_quebec'), ref('stg_credly__credly_scrum_summary_ontario')]
) }}
),

final as 
(select
    *
from final_scrum_summary)

select * from final