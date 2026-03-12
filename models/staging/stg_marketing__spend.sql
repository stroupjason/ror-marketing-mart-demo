select
    cast(date as date) as spend_date,
    cast(campaign_id as integer) as campaign_id,
    cast(location_id as integer) as location_id,
    cast(spend_amount as decimal(12,2)) as spend_amount
from {{ source('raw_marketing', 'spend') }}
