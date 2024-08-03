with
directory as (
    select * from {{ ref('int_union_scrape') }}
),
users_badges as (
    select 
    *,
    REGEXP_EXTRACT(issuer, r'issued by\s+([^},]+)') AS extracted_issuer
    from {{ ref("int_union_users_badges") }}
),


final as (
    select
        distinct REPLACE(d.vanity_url, '/users/', '') as user_id,
        d.first_name,
        d.last_name,
        d.role,
        d.location,
        CONCAT('https://www.credly.com', d.vanity_url) as vanity_url


    from directory as d
    left join users_badges
        on d.vanity_url = users_badges.earner_path
)


select * from final