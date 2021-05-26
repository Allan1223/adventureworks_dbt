with selSalesPerson as (

    select
     businessentityid	
   , salesquota
  -- , salesytd	
  -- , saleslastyear		
   , commissionpct	   	
  -- , territoryid		
   , bonus		

   from {{ ref('stg_salesperson') }} 

), salesPerson_with_employee as (

    select 

      selSalesPerson.*
      /*businessentityid	
   , selSalesPerson.salesquota
   , selSalesPerson.salesytd	
   , selSalesPerson.saleslastyear		
   , selSalesPerson.commissionpct	   	
   , selSalesPerson.territoryid		
   , selSalesPerson.bonus	*/
   , employee.jobtitle	  
  -- , employee.nationalidnumber		
  -- , employee.sickleavehours		
  -- , employee.loginid		
  -- , employee.currentflag		
 --  , employee.modifieddate		
 --  , employee.gender		
   , employee.hiredate		
   , employee.salariedflag		
  -- , employee.birthdate		
  -- , employee.maritalstatus		
  -- , employee.organizationnode
  -- , employee.vacationhours	
   from  selSalesPerson   
     left join {{ ref('stg_employee') }} as employee
     on selSalesPerson.businessentityid = employee.businessentityid
    
), salesPerson_with_employee_and_person as (

    select
         swe.*
    --   rowguid	        -- FK Customer
        , firstname	
    --    , middlename	
        , lastname	
        , title	
        , persontype		
    --    , namestyle	
    --    , suffix		
      --  , modifieddate		
        , emailpromotion	 
       from salesPerson_with_employee as swe
       left join {{ ref('stg_person') }} as person 
       on person.businessentityid = swe.businessentityid       

), transformed as (

    select row_number() over (order by businessentityid) as employee_sk
           ,  salesPerson_with_employee_and_person.*
           from  salesPerson_with_employee_and_person

)

select * from transformed