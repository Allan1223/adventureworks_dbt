with source as (

select
     t1.territoryid	
   , t1.name  	
   , t1.countryregioncode
   , t1.group 	
   , t1.salesytd			
   , t1.saleslastyear	
   , t1.costytd	  	
   , t1.costlastyear	  	
   	
  -- , modifieddate	
  -- , rowguid		 	
  -- , _sdc_received_at	
  -- , _sdc_sequence		
  -- , _sdc_batched_at	
  -- , _sdc_extracted_at	
  -- , _sdc_table_version			
   
   from {{ source('adventureworks_etl', 'salesterritory') }} as t1


)

select * from source