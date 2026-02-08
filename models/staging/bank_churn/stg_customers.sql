with source as (

    select
        customer_id,
        surname,
        geography,
        gender,
        age,
        estimated_salary
    from {{ source('bank_churn_raw', 'CUSTOMERS') }}

),

cleaned as (

    select
        -- business columns
        cast(customer_id as varchar)              as customer_id,
        trim(initcap(surname))                    as surname,
        trim(initcap(geography))                  as geography,
        upper(trim(gender))                       as gender,
        cast(age as integer)                      as age,
        cast(estimated_salary as numeric(18,2))   as estimated_salary,

        -- staging-level metadata
        'bank_churn_customers'                    as record_source,
        current_timestamp()                       as dbt_loaded_at_utc,
        current_timestamp()                       as row_last_modified_utc

    from source
    where customer_id is not null

)

select * from cleaned
