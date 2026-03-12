select
    cast(conversion_id as integer) as conversion_id,
    cast(lead_id as integer) as lead_id,
    cast(conversion_date as date) as conversion_date,
    cast(revenue_amount as decimal(12,2)) as revenue_amount
from {{ source('raw_marketing', 'conversions') }}
