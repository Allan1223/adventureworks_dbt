with source_address as (

    select
      addressid	
    , addressline1	
    , addressline2		
    , city		
    , stateprovinceid		
    , postalcode		
    , spatiallocation	
   -- , modifieddate		
   -- , rowguid	
   -- , _sdc_batched_at		
   -- , _sdc_extracted_at	
   -- , _sdc_table_version	
   -- , _sdc_received_at		
   -- , _sdc_sequence				
    

    from {{ source('adventureworks_etl', 'address') }} 	

), source_address_with_stateprovince as (

    select
        source_address.*
      --, sp.stateprovinceid
      , sp.stateprovincecode 
      , sp.countryregioncode 
      , sp.isonlystateprovinceflag 
      , sp.name as name_province
      , sp.territoryid
      from  source_address          
           left join  {{ source('adventureworks_etl', 'stateprovince') }} as sp
           on source_address.stateprovinceid = sp.stateprovinceid


), source_all as(

     select
        source_address_with_stateprovince.*
       , countryregion.name as name_country
       from source_address_with_stateprovince
         left join    {{ source('adventureworks_etl', 'countryregion') }} as countryregion
         on source_address_with_stateprovince.countryregioncode = countryregion.countryregioncode


)

select * from source_all
 