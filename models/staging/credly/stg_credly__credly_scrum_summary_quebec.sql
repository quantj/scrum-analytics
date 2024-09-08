

with source as (

    select * from {{ source('credly', 'credly_scrum_summary_quebec') }}

),

renamed as (

    select
        _row
        , _fivetran_synced

        , id
        , {{ title_case('first_name') }} as first_name
        , {{ title_case('middle_name') }} as middle_name
        , {{ title_case('last_name') }} as last_name
        , {{ title_case('role') }} as role
        , {{ title_case('skills') }} as skills

        , {{ title_case('location') }} as location

        , most_recent_badge_name
        , most_recent_badge_id
        , {{ title_case('most_recent_badge_issuer') }} as most_recent_badge_issuer
        , most_recent_badge_date

        , highlighted_badge_name
        , highlighted_badge_id
        , {{ title_case('highlighted_badge_issuer') }} as highlighted_badge_issuer
        , highlighted_badge_date

        , issuer_count
        , badge_count

        , total_badge_count
        
        , vanity_url
        , full_vanity_url


    from source

)

select * from renamed