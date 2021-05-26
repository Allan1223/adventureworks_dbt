with source as (

    select 
         customerid
      ,  personid		
    --  ,  rowguid
      ,  storeid
      ,  territoryid
    --  ,  modifieddate      	
    -- ,  _sdc_table_version	  
    --  ,  _sdc_batched_at		
    --  ,  _sdc_extracted_at
    -- ,  _sdc_received_at		
    -- ,  _sdc_sequence				

        from {{ source('adventureworks_etl', 'customer') }}


)

select * from source