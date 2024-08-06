with
directory as (
    select * from {{ ref('int_union_scrape') }}
),
users_badges as (
    select 
    *,
    REGEXP_EXTRACT(issuer, r'issued by\s+([^},]+)') AS extracted_issuer,
    REGEXP_EXTRACT(badge_template, r'earn_this_badge_url=([^,}]+)') AS extracted_earn_url,
    REGEXP_EXTRACT(badge_template, r'url=([^,}]+)') AS extracted_url,
    CASE
        WHEN REGEXP_EXTRACT(badge_template, r'earn_this_badge_url=([^,}]+)') IS NULL OR REGEXP_EXTRACT(badge_template, r'earn_this_badge_url=([^,}]+)') = 'null' THEN 
        REGEXP_EXTRACT(badge_template, r'url=([^,}]+)')
        ELSE 
        REGEXP_EXTRACT(badge_template, r'earn_this_badge_url=([^,}]+)')
    END AS final_url
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
        users_badges.extracted_issuer AS issuer,
        users_badges.extracted_earn_url as earned_url,
        users_badges.extracted_url as url,
        users_badges.final_url as final_url


    from directory as d
    left join users_badges
        on d.vanity_url = users_badges.earner_path
)


select * from final