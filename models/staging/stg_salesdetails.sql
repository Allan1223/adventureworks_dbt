with source as (

    select       	
         salesorderid		
       , salesorderdetailid	
       , productid
       , orderqty		
       , unitprice	
      -- , specialofferid	   
      -- , carriertrackingnumber	
       , unitpricediscount	
       -- , _sdc_received_at	 
      --  , modifieddate	
       --, rowguid	  
      -- , _sdc_sequence		
      -- , _sdc_table_version		
      -- , _sdc_batched_at	
      -- , _sdc_extracted_at	
      from {{ source('adventureworks_etl', 'salesorderdetail') }}

)

select * from source