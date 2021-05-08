with selCustomer as (

    select
        customerid
       , personid		
    -- , rowguid
    -- , storeid
    -- , territoryid
    -- , modifieddate      
    from {{ ref('stg_customer') }} 
    where personid != 0
 
),

selPerson as (
select 
        businessentityid	-- PK, FK1
    --  , rowguid	        -- FK Customer
      , firstname	
    --  , middlename	
      , lastname	
      , title	
      , persontype		
      , namestyle	
     -- , suffix		
     -- , modifieddate		
     -- , emailpromotion
      from {{ ref('stg_person') }} 

), customer_with_person as (
    
    select
        selCustomer.customerid
      , selCustomer.personid		
     -- , selCustomer.rowguid
     -- , selCustomer.storeid
     -- , selCustomer.territoryid
     -- , selCustomer.modifieddate   
      , selPerson.businessentityid	-- PK, FK1
     -- , selPerson.rowguid	        -- FK Customer
      , selPerson.firstname	
     -- , selPerson.middlename	
      , selPerson.lastname	
      , selPerson.title	
      , selPerson.persontype		
      , selPerson.namestyle	
     -- , selPerson.suffix		
     -- , selPerson.modifieddate		
     -- , selPerson.emailpromotion
    from selCustomer
      left join selPerson on selPerson.businessentityid= selCustomer.personid
   

), transformed as (

        select
          row_number() over (order by customerID) as customer_SK
          , *
          from customer_with_person

)

select  * from transformed
