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
        CONCAT(SUBSTR(d.first_name, 1, 1), REPEAT('*', LENGTH(d.first_name) - 1)) AS masked_first_name,
        d.last_name,
        CONCAT(SUBSTR(d.last_name, 1, 1), REPEAT('*', LENGTH(d.last_name) - 1)) AS masked_last_name,
        CONCAT('https://www.credly.com', d.vanity_url) as vanity_url,
        d.role,
        d.location,
        users_badges.badge_template_name as badge_name,
        users_badges.issued_at_date,
        users_badges.extracted_issuer AS issuer


    from directory as d
    left join users_badges
        on d.vanity_url = users_badges.earner_path
)


select * from final