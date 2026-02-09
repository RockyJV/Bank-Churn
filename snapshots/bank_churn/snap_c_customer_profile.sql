{% snapshot snap_c_customer_profile %}

{{
  config(
    target_schema = 'SNAPSHOTS',
    unique_key = 'customer_id',
    strategy = 'check',
    check_cols = [
      'surname',
      'geography',
      'age',
      'estimated_salary'
    ],
    invalidate_hard_deletes = true
  )
}}

select
  customer_id,
  surname,
  geography,
  age,
  estimated_salary
from {{ ref('c_customer_profile') }}

{% endsnapshot %}
