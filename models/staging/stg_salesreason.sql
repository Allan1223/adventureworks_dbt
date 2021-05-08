with source as (

    select
         s1.salesorderid
       , s1.salesreasonid 
       , s2.reasontype 
       , s2.name
    from {{ source('adventureworks_etl', 'salesorderheadersalesreason') }} as s1
      left join {{ source('adventureworks_etl', 'salesreason') }} as s2
      on s2.salesreasonid = s1.salesreasonid
)

select * from source