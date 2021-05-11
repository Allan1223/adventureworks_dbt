with SelSalesReasonHead as (

   select
          salesorderid
        , salesreasonid 
          from {{ source('adventureworks_etl', 'salesorderheadersalesreason') }}

), SelSalesReason as (

    select salesreasonid
           , reasontype 
           , name
           from {{ source('adventureworks_etl', 'salesreason') }} 

), source as (

    select
         SelSalesReasonHead.salesorderid
       , SelSalesReasonHead.salesreasonid 
       , SelSalesReason.reasontype 
       , SelSalesReason.name
    from  SelSalesReasonHead
      left join  SelSalesReason
      on SelSalesReason.salesreasonid = SelSalesReasonHead.salesreasonid
)

select * from source