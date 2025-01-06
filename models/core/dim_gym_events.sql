SELECT
    id
    ,start_date_time
    ,FORMAT_TIMESTAMP('%A', start_date_time) AS weekday
    ,EXTRACT(WEEK FROM start_date_time) AS week_of_year
    ,summary
    ,description
    ,creator_email
    ,organizer_email
    ,created
    ,updated
FROM {{ ref('stg_calendar__google_events') }}
