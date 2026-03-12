select
    cast(campaign_id as integer) as campaign_id,
    trim(campaign_name) as campaign_name,
    lower(trim(channel)) as channel,
    cast(start_date as date) as start_date,
    cast(end_date as date) as end_date,
    lower(trim(status)) as status
from {{ source('raw_marketing', 'campaigns') }}
