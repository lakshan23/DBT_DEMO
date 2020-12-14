with staged as (
    select *
    from {{ref('stg_payment_table_lk')}}
)

select sum(amount) as total_for_method, payment_method
from staged
group by payment_method