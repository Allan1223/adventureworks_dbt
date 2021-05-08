with source as (

   select
     businessentityid	
   , salesquota
   , salesytd	
   , saleslastyear		
   , commissionpct	   	
   , territoryid		
   , bonus		
  -- , modifieddate	
  -- , rowguid	 
  -- , _sdc_table_version	
  -- , _sdc_received_at	
  -- , _sdc_sequence	   	
  -- , _sdc_batched_at	
  -- , _sdc_extracted_at
   from {{ source('adventureworks_etl', 'salesperson') }} 
)

select * from source