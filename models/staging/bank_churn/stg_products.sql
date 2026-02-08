select
    customer_id,
    cast(num_of_products as integer)        as num_of_products,
    cast(has_credit_card as boolean)        as has_credit_card,
    initcap(card_type)                      as card_type,
    cast(points_earned as integer)          as points_earned,

    -- staging metadata
    'bank_churn_products'                   as record_source,
    current_timestamp()                     as dbt_loaded_at_utc,
    current_timestamp()                     as row_last_modified_utc

from {{ source('bank_churn_raw', 'PRODUCTS') }}
where customer_id is not null
