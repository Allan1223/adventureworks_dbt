with sel_creditcard as (

    select
        creditcardid		       
       , cardtype		
       , cardnumber	
       , expmonth	
       , expyear	      		
      -- , modifieddate	 
      -- , _sdc_received_at		
      -- , _sdc_sequence		 
      -- , _sdc_table_version		 
      -- , _sdc_batched_at		
      -- , _sdc_extracted_at		
        from {{ source('adventureworks_etl', 'creditcard') }}    

),  creditcard_with_person as (

    select 
           sel_creditcard.*
         , personcreditcard.businessentityid
          from sel_creditcard
          left join {{ source('adventureworks_etl', 'personcreditcard') }}  as personcreditcard
          on sel_creditcard.creditcardid = personcreditcard.creditcardid

)

select * from creditcard_with_person