/*		QUESTION 1 */
SELECT 
p.Name as productname ,
p. ListPrice , 
s.Name as ProductSubcategory ,
c.Name as ProductCategory
from Production.Product p
INNER JOIN Production.ProductSubcategory s
ON  p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory c
ON s.ProductCategoryID = c.ProductCategoryID;

/*		QUESTION 2 */


SELECT 
p.Name as productname ,
p. ListPrice , 
s.Name as ProductSubcategory ,
c.Name as ProductCategory ,
rank() over(order by ListPrice desc) as PriceRank
from Production.Product p
INNER JOIN Production.ProductSubcategory s
ON  p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory c
ON s.ProductCategoryID = c.ProductCategoryID;

/*		QUESTION 3 */

SELECT 
p.Name as productname ,
p. ListPrice , 
s.Name as ProductSubcategory ,
c.Name as ProductCategory ,
rank() over(order by ListPrice desc) as PriceRank,
rank() over(Partition by c.Name order by ListPrice desc) as CategoryPriceRank
from Production.Product p
INNER JOIN Production.ProductSubcategory s
ON  p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory c
ON s.ProductCategoryID = c.ProductCategoryID;

/*		QUESTION 4 */

SELECT 
p.Name as productname ,
p. ListPrice , 
s.Name as ProductSubcategory ,
c.Name as ProductCategory ,
PriceRank = rank() over(order by ListPrice desc) ,
rank() over(Partition by c.Name order by ListPrice desc) as CategoryPriceRank,
		CASE 
			WHEN  rank() over(Partition by c.Name order by ListPrice desc) > 5 THEN 'NO'
			ELSE 'YES'
			END AS Top5PriceInCategory
from Production.Product p
INNER JOIN Production.ProductSubcategory s
ON  p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory c
ON s.ProductCategoryID = c.ProductCategoryID;













