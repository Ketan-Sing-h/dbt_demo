-- select * from 
-- {{ref('src_hosts')}}
-- -- STG.AIRBNB_airbnb.src_hosts


SELECT
    host_id,
    NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    {{ ref('src_hosts') }}