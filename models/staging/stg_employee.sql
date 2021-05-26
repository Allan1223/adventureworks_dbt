with source as (

    select
     businessentityid
   , jobtitle	  
  -- , nationalidnumber		
  -- , sickleavehours		
  -- , loginid		
  -- , currentflag		
  -- , modifieddate		
  -- , gender		
   , hiredate		
   , salariedflag		
  -- , birthdate		
  -- , maritalstatus		
  -- , organizationnode
  -- , vacationhours	
  /* , rowguid		
   , _sdc_extracted_at		
   , _sdc_table_version		
   , _sdc_received_at	
    , _sdc_batched_at	
    , _sdc_sequence			*/

    from {{ source('adventureworks_etl', 'employee') }} 

)

select * from source