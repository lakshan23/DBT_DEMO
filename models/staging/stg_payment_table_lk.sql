 /*
 Change order_id to id to create a unique key column
 */
 
 with source AS (
SELECT  *
FROM {{ source('DBT_DEMO', 'PAYMENTS_TABLE') }} 
),

 in_dollars AS (
SELECT  concat(id, ' ', payment_method) as unique_key
       ,payment_method
       ,amount/100 AS amount 
FROM source 
)

select * from in_dollars