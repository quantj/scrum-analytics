with 

source as (

    select * from {{ source('credly', 'credly_users_badges') }}

),

renamed as (

    select
        _row,
        _fivetran_synced,
        accepted_at,
        badge_template,
        badge_template_name,
        earner_path,
        earner_photo_url,
        evidence,
        expires_at,
        expires_at_date,
        id,
        image,
        image_url,
        issued_at,
        issued_at_date,
        issued_to,
        issuer,
        last_updated_at,
        locale,
        public,
        state,
        translate_metadata,
        updated_at

    from source

)

select * from renamed
