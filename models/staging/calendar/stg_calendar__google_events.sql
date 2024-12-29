

with source as (

    select * from {{ source('google_calendar', 'event') }}

),

renamed as (

    select
        id
        , updated
        , _fivetran_deleted
        , calendar_list_id
        , recurring_event_id
        , _fivetran_synced
        , conference_solution_type
        , type
        , end_date_time
        , private_copy
        , event_type
        , creator_email
        , hangout_link
        , html_link
        , visibility
        , start_time_zone
        , organizer_display_name
        , created
        , kind
        , organizer_email
        , use_default
        , icon_uri
        , sequence
        , guests_can_invite_others
        , end_time_zone
        , transparency
        , name
        , creator_self
        , etag
        , guests_can_modify
        , organizer_self
        , status
        , end_date
        , i_cal_uid
        , description
        , start_date
        , summary
        , guests_can_see_other_guests
        , original_start_time_zone
        , location
        , start_date_time
        , request_id
        , original_start_time_date

    from source

)

select * from renamed
