with selProduct as (

    select
         productid	
       , name  
       , productnumber	
       , color		
       , safetystocklevel
       , reorderpoint
       , standardcost
       , listprice
       , size		
       , sizeunitmeasurecode
       , weightunitmeasurecode
       , weight
       , daystomanufacture
       , productline
       , class	
       , sellenddate		
       , style	
       , productsubcategoryid	
       , productmodelid		
       , sellstartdate		
       	
      --  , makeflag	 
      -- , finishedgoodsflag	 
      --  , modifieddate		
      --  , rowguid	
      -- , _sdc_batched_at		
      -- , _sdc_extracted_at		
      -- , _sdc_received_at		
      -- , _sdc_sequence		
      -- , _sdc_table_version	



    from {{ source('adventureworks_etl' , 'product') }}

), selSubCategory as (

    select  
         productsubcategoryid	
       , productcategoryid	
       , name as name_subcategory		
       -- modifieddate		
       --  rowguid		
       -- _sdc_table_version		
       -- _sdc_received_at		
       -- _sdc_sequence		
       -- _sdc_batched_at		
       -- _sdc_extracted_at		

       from {{ source('adventureworks_etl' , 'productsubcategory') }}

), selProductCategory as (

    select
      productcategoryid		
    , name	as name_category	
   -- modifieddate		
   -- rowguid		
   -- _sdc_extracted_at		
   -- _sdc_received_at		
   -- _sdc_sequence		
   -- _sdc_batched_at		
   -- _sdc_table_version		
    from {{ source('adventureworks_etl' , 'productcategory') }}

), source as (

    select
         selProduct.productid	
       , selProduct.name  
       , selProduct.productnumber	
       , selProduct.color		
       , selProduct.safetystocklevel
       , selProduct.reorderpoint
       , selProduct.standardcost
       , selProduct.listprice
       , selProduct.size		
       , selProduct.sizeunitmeasurecode
       , selProduct.weightunitmeasurecode
       , selProduct.weight
       , selProduct.daystomanufacture
       , selProduct.productline
       , selProduct.class	
       , selProduct.sellenddate		
       , selProduct.style	
       , selProduct.productsubcategoryid	
       , selProduct.productmodelid		
       , selProduct.sellstartdate
       , selSubCategory.productcategoryid	
       , selSubCategory.name_subcategory
       , selProductCategory.name_category	

       from selProduct	
        left join selSubCategory
        on selSubCategory.productsubcategoryid = selProduct.productsubcategoryid
        left join selProductCategory
        on selProductCategory.productcategoryid = selSubCategory.productcategoryid



)


select * from source