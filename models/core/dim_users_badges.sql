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
        distinct d.id as user_id,
        d.first_name,
        d.last_name,
        d.location,
        users_badges.badge_template_name as badge_name,
        users_badges.issued_at_date,
        users_badges.extracted_issuer AS issuer


    from directory as d
    left join users_badges
        on d.vanity_url = users_badges.earner_path
)


select * from final