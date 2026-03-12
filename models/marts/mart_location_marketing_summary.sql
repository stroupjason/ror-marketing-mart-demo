select
    f.activity_date,
    f.campaign_id,
    c.campaign_name,
    c.channel,
    f.location_id,
    l.location_name,
    l.city,
    l.state,
    l.region,
    f.total_spend,
    f.total_leads,
    f.total_conversions,
    f.total_revenue,
    case
        when f.total_leads = 0 then null
        else round(f.total_spend / f.total_leads, 2)
    end as cost_per_lead,
    case
        when f.total_conversions = 0 then null
        else round(f.total_spend / f.total_conversions, 2)
    end as cost_per_conversion,
    case
        when f.total_leads = 0 then null
        else round(cast(f.total_conversions as double) / f.total_leads, 4)
    end as lead_to_conversion_rate
from {{ ref('fct_daily_campaign_location') }} f
left join {{ ref('dim_campaign') }} c
  on f.campaign_id = c.campaign_id
left join {{ ref('dim_location') }} l
  on f.location_id = l.location_id
