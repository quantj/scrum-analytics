select
    , id
    , first_name
    , middle_name
    , last_name
    , role
    , location
    , badge_count
    , total_badge_count
    , issuer_count
    , highlighted_badge_id
    , highlighted_badge_name
    , highlighted_badge_date
    , highlighted_badge_issuer
    , most_recent_badge_id
    , most_recent_badge_name
    , most_recent_badge_date
    , most_recent_badge_issuer
    , vanity_url
    , skills
    , _fivetran_synced




from {{source('scrum_community', 'credly_scrap')}}
