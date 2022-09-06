/* SELECT QUERY */  

/*SELECT * FROM salesLT.Product;*/

/*SELECT Name , StandardCost , ListPrice 
FROM salesLT.Product;*/

/*SELECT Name , ListPrice - StandardCost
FROM salesLT.product;*/


/*SELECT Name as ProductName , ListPrice - StandardCost as markup
from salesLT.product;*/

/*SELECT ProductNumber , color , size , color + '/ '  + size as ProductDetails
FROM salesLT.product;*/


/*SELECT ProductID + ': ' + Name AS productName 
from salesLT.product;*/

/*SELECT CAST(ProductID as varchar(5)) + ':' + Name as productName 
from salesLT.product;*/

/*SELECT CONVERT(varchar(5) , productID) + ':' + Name as productDetails
from salesLT.product;*/

/*SELECT SellStartDate,
   CONVERT(nvarchar(30), SellStartDate) as convertedDate , 
   CONVERT(nvarchar(30), SellStartDate , 126) as ISOformatDate
   from salesLT.product;*/


   /*SELECT Name, TRY_CAST(Size as integer) as numericSize 
   from salesLT.product;*/

   /*SELECT Name , ISNULL(TRY_CAST(size as integer),0) as numericSize 
   from salesLT.product;*/

   /*SELECT ProductNumber , ISNULL(color , '') + ',' + ISNULL(size, '') as ProductDetails 
   from salesLT.product;*/


  /* SELECT Name , NULLIF(color , 'multi') as Singlecolor
   from salesLT.product;*/

/*SELECT Name, COALESCE(SellEndDate , SellStartDate) as StatusLastUpdated 
from salesLT.product;*/

/*SELECT Name, 
	CASE	
		
		WHEN SellEndDate IS NULL THEN 'Currently for sale'
		ELSE 'NO longer available'

	END AS salesStatus
	FROM salesLT.product;*/

	/*SELECT Name,
		CASE size	
			WHEN 'S' THEN 'small'
			WHEN 'M' THEN 'meduim'
			WHEN 'L' THEN 'large'
			WHEN 'XL' THEN 'x-large'

			ELSE ISNULL(size , 'n/a')

		END AS ProductSize
	FROM salesLT.product;
	*/
