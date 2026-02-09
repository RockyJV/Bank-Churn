{{ config(materialized='table') }}

select
    a.customer_id,
    a.credit_score,
    a.tenure_years,
    a.balance,
    a.is_active_member,
    p.num_of_products,
    p.has_credit_card,
    p.card_type,
    p.points_earned,
    c.complain,
    c.satisfaction_score,
    'stg_accounts|stg_products|stg_complaints' as record_source,
    convert_timezone('UTC', current_timestamp()) as dw_loaded_at_utc,
    convert_timezone('UTC', current_timestamp()) as row_last_modified_utc
from {{ ref('stg_accounts') }} a
left join {{ ref('stg_products') }} p
    on a.customer_id = p.customer_id
left join {{ ref('stg_complaints') }} c
    on a.customer_id = c.customer_id