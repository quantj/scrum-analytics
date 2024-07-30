with final_users_badges as (
    {{ dbt_utils.union_relations(
    relations=[ref('stg_credly__credly_users_badges'), ref('stg_credly__credly_ontario_users_badges')]
) }}
)

select * from final_users_badges