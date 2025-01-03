SELECT
    id
    , start_date_time
    , summary
    , description
    , creator_email
    , organizer_email
    , created
    , updated
FROM {{ ref('stg_calendar__google_events') }}