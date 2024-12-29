with
summary as (
    select * from {{ ref('stg_calendar__google_events') }}
),


final as (
    select
        summary


    from summary
)

select * from final