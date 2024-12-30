{{ config(materialized='view') }}

WITH cte AS (
    SELECT
        summary,
        REGEXP_EXTRACT(summary, r'^\d+') AS id, 
        REGEXP_REPLACE(summary, r'^\d+\s*-', '') AS name_and_service
    FROM {{ ref('stg_calendar__google_events') }}
),

cte2 AS (
    SELECT
        id,
        REGEXP_EXTRACT(name_and_service, r'^[^-]*') AS name,
        REGEXP_REPLACE(name_and_service, r'^[^-]*\s*-', '') AS service,
        name_and_service 
    FROM cte
)

SELECT
    id,
    name,
    service,
    CASE
        WHEN name_and_service LIKE '%cancelled%' THEN 'Cancelled'
        WHEN name_and_service LIKE '%开单看Notes%' THEN 'Open Order & Notes'
        ELSE NULL 
    END AS notes 
FROM cte2