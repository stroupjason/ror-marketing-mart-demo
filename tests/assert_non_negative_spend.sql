select *
from {{ ref('fct_daily_campaign_location') }}
where total_spend < 0
