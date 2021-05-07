with source as (
select
      businessentityid	-- PK, FK1
    , rowguid	        -- FK Customer
    , firstname	
    , middlename	
    , lastname	
    , title	
    , persontype		
    , namestyle	
    , suffix		
    , modifieddate		
    , emailpromotion	    			
    -- , _sdc_table_version	   	
    -- , _sdc_received_at		
    -- , _sdc_sequence		
    -- , _sdc_batched_at		
    -- , _sdc_extracted_at		
from {{ source('adventureworks_etl', 'person') }}



)

select * from source