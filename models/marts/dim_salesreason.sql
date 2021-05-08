with selReason as (
  
    select
         salesorderid
       , salesreasonid 
       , reasontype 
       , name
       from {{ ref('stg_salesreason') }}


),

transformed as (

    select row_number() over (order by salesreasonid) as salesreason_SK
          , *
          from selReason

)

select * from transformed