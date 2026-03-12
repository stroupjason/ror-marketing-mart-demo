with ranked as (
    select
        cast(lead_id as integer) as lead_id,
        cast(lead_created_at as timestamp) as lead_created_at,
        cast(campaign_id as integer) as campaign_id,
        cast(location_id as integer) as location_id,
        lower(trim(email)) as email,
        lower(trim(lead_status)) as lead_status,
        row_number() over (
            partition by lead_id
            order by cast(lead_created_at as timestamp) desc
        ) as rn
    from {{ source('raw_marketing', 'leads') }}
)

select
    lead_id,
    cast(lead_created_at as date) as lead_date,
    campaign_id,
    location_id,
    email,
    lead_status
from ranked
where rn = 1
