select
    campaign_id,
    campaign_name,
    channel,
    start_date,
    end_date,
    status
from {{ ref('stg_marketing__campaigns') }}
