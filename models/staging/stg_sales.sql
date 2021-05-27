with source as (

    select 
         salesorderid -- primary key    
       , salespersonid     
       , taxamt		
       , shiptoaddressid		
      -- , onlineorderflag
       , territoryid		
       , status		
      -- , currencyrateid		
       , orderdate	
      -- , creditcardapprovalcode		
       , subtotal		
       , creditcardid		
      -- , revisionnumber		
       , freight		
      -- , duedate	
      -- , totaldue		
       , customerid		
      -- , shipdate	
       --, accountnumber		
    from {{ source('adventureworks_etl', 'salesorderheader') }}

)

select * from source