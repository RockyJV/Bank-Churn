select
    customer_id,
    credit_score,
    tenure_years,
    balance,
    is_active_member,

    -- staging-level metadata
    'bank_accounts_csv'      as record_source,
    current_timestamp()      as dbt_loaded_at_utc,
    current_timestamp()      as row_last_modified_utc

from {{ source('bank_churn_raw', 'ACCOUNTS') }}
where customer_id is not null
