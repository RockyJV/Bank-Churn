{% snapshot snap_c_customer_behavior %}

{{
  config(
    target_schema = 'SNAPSHOTS',
    unique_key = 'customer_id',
    strategy = 'check',
    check_cols = [
      'credit_score',
      'tenure_years',
      'balance',
      'is_active_member',
      'num_of_products',
      'has_credit_card',
      'card_type',
      'points_earned',
      'complain',
      'satisfaction_score'
    ],
    invalidate_hard_deletes = true
  )
}}

select
  customer_id,
  credit_score,
  tenure_years,
  balance,
  is_active_member,
  num_of_products,
  has_credit_card,
  card_type,
  points_earned,
  complain,
  satisfaction_score
from {{ ref('c_customer_behavior') }}

{% endsnapshot %}
