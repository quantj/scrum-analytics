

with source as (

    select * from {{ source('credly', 'credly_scrum_summary_ontario') }}

),

renamed as (

    select
        most_recent_badge_name
        , role
        , last_name
        , full_vanity_url
        , middle_name
        , most_recent_badge_issuer
        , skills
        , highlighted_badge_id
        , _fivetran_synced
        , highlighted_badge_issuer
        , total_badge_count
        , _row
        , issuer_count
        , location
        , id
        , most_recent_badge_date
        , vanity_url
        , highlighted_badge_date
        , most_recent_badge_id
        , first_name
        , highlighted_badge_name
        , badge_count

    from source

)

select * from renamed