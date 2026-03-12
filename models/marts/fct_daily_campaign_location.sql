with spend as (
    select
        spend_date as activity_date,
        campaign_id,
        location_id,
        sum(spend_amount) as total_spend
    from {{ ref('stg_marketing__spend') }}
    group by 1, 2, 3
),

leads as (
    select
        lead_date as activity_date,
        campaign_id,
        location_id,
        count(*) as total_leads
    from {{ ref('stg_marketing__leads') }}
    group by 1, 2, 3
),

conversions as (
    select
        c.conversion_date as activity_date,
        l.campaign_id,
        l.location_id,
        count(*) as total_conversions,
        sum(c.revenue_amount) as total_revenue
    from {{ ref('stg_marketing__conversions') }} c
    join {{ ref('stg_marketing__leads') }} l
      on c.lead_id = l.lead_id
    group by 1, 2, 3
),

keys as (
    select activity_date, campaign_id, location_id from spend
    union
    select activity_date, campaign_id, location_id from leads
    union
    select activity_date, campaign_id, location_id from conversions
)

select
    k.activity_date,
    k.campaign_id,
    k.location_id,
    coalesce(s.total_spend, 0) as total_spend,
    coalesce(l.total_leads, 0) as total_leads,
    coalesce(c.total_conversions, 0) as total_conversions,
    coalesce(c.total_revenue, 0) as total_revenue
from keys k
left join spend s
  on k.activity_date = s.activity_date
 and k.campaign_id = s.campaign_id
 and k.location_id = s.location_id
left join leads l
  on k.activity_date = l.activity_date
 and k.campaign_id = l.campaign_id
 and k.location_id = l.location_id
left join conversions c
  on k.activity_date = c.activity_date
 and k.campaign_id = c.campaign_id
 and k.location_id = c.location_id
