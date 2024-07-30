with final_scrape as (
    {{ dbt_utils.union_relations(
    relations=[ref('stg_credly__credly_scrape'), ref('stg_credly__credly_ontario_scrape')]
) }}
)

select * from final_scrape