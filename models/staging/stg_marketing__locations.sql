select
    cast(location_id as integer) as location_id,
    trim(location_name) as location_name,
    trim(city) as city,
    upper(trim(state)) as state,
    trim(region) as region
from {{ source('raw_marketing', 'locations') }}
