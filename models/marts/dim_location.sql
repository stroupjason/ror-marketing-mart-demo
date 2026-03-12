select
    location_id,
    location_name,
    city,
    state,
    region
from {{ ref('stg_marketing__locations') }}
