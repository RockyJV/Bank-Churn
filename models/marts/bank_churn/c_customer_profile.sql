{{ config(materialized='table') }}

select
    customer_id,
    surname,
    geography,
    gender,
    age,
    estimated_salary,
    'stg_customers' as record_source,
    convert_timezone('UTC', current_timestamp()) as dw_loaded_at_utc,
    convert_timezone('UTC', current_timestamp()) as row_last_modified_utc
from {{ ref('stg_customers') }}