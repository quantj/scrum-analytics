

with source as (

    select * from {{ source('credly', 'credly_scrum_badges_quebec') }}

),

renamed as (

    select
        _row
        , _fivetran_synced
        , id

        , earner_photo_url
        , expires_at_date
        , badge_template_description
        , issued_at_date
        , INITCAP(issued_to) as issued_to
        , earner_path
        , locale
        , accepted_at
        , issued_at
        , issuer_summary
        , expires_at
        , public
        , updated_at
        , last_updated_at
        , state
        , badge_template_name
        , badge_url
        , cost
        , badge_image_url
        , earn_this_badge_url

    from source

)

select * from renamed