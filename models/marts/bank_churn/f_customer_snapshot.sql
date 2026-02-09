{{ config(materialized='table') }}

select
    c.customer_id,
    current_date() as snapshot_date,
    ch.is_churned,
    ch.churn_date,
    'stg_churn_events' as record_source,
    convert_timezone('UTC', current_timestamp()) as dw_loaded_at_utc,
    convert_timezone('UTC', current_timestamp()) as row_last_modified_utc
from {{ ref('stg_customers') }} c
left join {{ ref('stg_churn_events') }} ch
    on c.customer_id = ch.customer_id