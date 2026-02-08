select
    cast(customer_id as varchar)        as customer_id,
    cast(exited_flag as boolean)        as is_churned,
    cast(churn_date as date)            as churn_date,

    -- staging metadata
    'bank_churn.raw.churn'              as record_source,
    current_timestamp()                 as dbt_loaded_at_utc,
    current_timestamp()                 as row_last_modified_utc

from {{ source('bank_churn_raw', 'CHURN') }}
where customer_id is not null
