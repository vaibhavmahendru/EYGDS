SELECT 
p.Name as productname ,
p. ListPrice , 
s.Name as ProductSubcategory ,
c.Name as ProductCategory ,
PriceRank = rank() over(order by ListPrice desc) ,
CategoryPriceRank = rank() over(Partition by c.Name order by ListPrice desc) ,
CategoryPriceRankWithRank  = rank() over(Partition by c.Name order by ListPrice desc) 
from Production.Product p
INNER JOIN Production.ProductSubcategory s
ON  p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory c
ON s.ProductCategoryID = c.ProductCategoryID;


SELECT 
p.Name as productname ,
p. ListPrice , 
s.Name as ProductSubcategory ,
c.Name as ProductCategory ,
PriceRank = rank() over(order by ListPrice desc) ,
CategoryPriceRankWithRank = rank() over(Partition by c.Name order by ListPrice desc) , 
CategoryPriceRankWithDenseRank = dense_rank() over(Partition by c.Name order by ListPrice desc)
from Production.Product p
INNER JOIN Production.ProductSubcategory s
ON  p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory c
ON s.ProductCategoryID = c.ProductCategoryID;


SELECT 
p.Name as productname ,
p. ListPrice , 
s.Name as ProductSubcategory ,
c.Name as ProductCategory ,
PriceRank = rank() over(order by ListPrice desc) ,
CategoryPriceRank = row_number() over(Partition by c.Name order by ListPrice desc) ,
CategoryPriceRank = rank() over(Partition by c.Name order by ListPrice desc) ,
CategoryPriceRank = dense_rank() over(Partition by c.Name order by ListPrice desc) ,
	

		CASE 
			WHEN  dense_rank() over(Partition by c.Name order by ListPrice desc) > 5 THEN 'NO'
			ELSE 'YES'
			END AS Top5PriceInCategory

from Production.Product p
INNER JOIN Production.ProductSubcategory s
ON  p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory c
ON s.ProductCategoryID = c.ProductCategoryID;