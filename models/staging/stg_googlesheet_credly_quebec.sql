with
source as (
    select * from {{source('credly', 'credly_scrape')}}
),

final as (

    select
        -- primary key
        _row as primary_key

        , cast(id as int) as id
        , first_name
        , middle_name
        , last_name
        , role
        , location
        , badge_count
        , total_badge_count
        --, issuer_count
        --, highlighted_badge_id
        , highlighted_badge_name
        , highlighted_badge_date
        , highlighted_badge_issuer
        --, most_recent_badge_id
        , most_recent_badge_name
        , most_recent_badge_date
        , most_recent_badge_issuer
        , vanity_url
        --, skills
        
        -- metadata
        , _fivetran_synced

    from source

)

select * from final
 