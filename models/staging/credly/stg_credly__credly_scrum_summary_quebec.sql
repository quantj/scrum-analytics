

with source as (

    select * from {{ source('credly', 'credly_scrum_summary_quebec') }}

),

renamed as (

    select
        _row
        , _fivetran_synced

        , id
        , INITCAP(first_name) as first_name
        , INITCAP(middle_name) as middle_name
        , INITCAP(last_name) as last_name
        , INITCAP(role) as role
        , INITCAP(skills) as skills

        , INITCAP(location) as location

        , INITCAP(most_recent_badge_name) as most_recent_badge_name
        , most_recent_badge_id
        , INITCAP(most_recent_badge_issuer) as most_recent_badge_issuer
        , most_recent_badge_date

        , INITCAP(highlighted_badge_name) as highlighted_badge_name
        , highlighted_badge_id
        , INITCAP(highlighted_badge_issuer) as highlighted_badge_issuer
        , highlighted_badge_date

        , issuer_count
        , badge_count

        , total_badge_count
        
        , vanity_url
        , full_vanity_url


    from source

)

select * from renamed