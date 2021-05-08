with selReason as (
  
    select
         salesorderid
       , salesreasonid 
       , reasontype 
       , name
       from {{ ref('stg_salesreason') }}


),

transformed as (

    select row_number() over (order by salesreasonid) as salesreasonSK
          , *
          from selReason

)

select * from transformed