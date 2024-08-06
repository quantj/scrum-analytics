
with 

source as (

    select * from {{ source('credly', 'credly_ontario_scrape') }}

),

renamed as (

    select
        _row,
        _fivetran_synced,
        badge_count,
        first_name,
        highlighted_badge_date,
        highlighted_badge_id,
        highlighted_badge_issuer,
        highlighted_badge_name,
        id,
        issuer_count,
        last_name,
        location,
        middle_name,
        most_recent_badge_date,
        most_recent_badge_id,
        most_recent_badge_issuer,
        most_recent_badge_name,
        role,
        skills,
        total_badge_count,
        vanity_url

    from source

)

select * from renamed
