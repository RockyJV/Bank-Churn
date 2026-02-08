select
    customer_id,

    complain::boolean                  as complain,
    satisfaction_score::integer        as satisfaction_score,

    'bank_churn.complaints'             as record_source,
    current_timestamp()                as dbt_loaded_at_utc,
    current_timestamp()                as row_last_modified_at_utc

from {{ source('bank_churn_raw', 'COMPLAINTS') }}
where customer_id is not null
