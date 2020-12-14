 /*
 Lets get the amount in dollars, currently in cents, and create a new
 column that we think is unique for now....
 */
 
 with source AS (
SELECT  *
FROM {{ source('DBT_DEMO', 'PAYMENTS_TABLE') }} 
),

 in_dollars AS (
SELECT  concat(order_id, '', payment_method) as unique_key
       ,payment_method
       ,amount/100 AS amount 
FROM source 
)

select * from in_dollars