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

/*QUESTION 2*/

SELECT 
p.Name as producrname ,
p. ListPrice , 
s.Name as ProductSubcategory , 
c.Name as ProductCategory,
AvgPriceByCategory = AVG(p.ListPrice) over() ,
AvgPriceByCategoryAndSubcategory = AVG(p.ListPrice) over(partition by c.Name)
from Production.Product p
INNER JOIN Production.ProductSubcategory s
ON  p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory c
ON s.ProductCategoryID = c.ProductCategoryID;

/*QUESTION 3*/

SELECT 
p.Name as producrname ,
p. ListPrice , 
s.Name as ProductSubcategory , 
c.Name as ProductCategory,
AvgPriceByCategory = AVG(p.ListPrice) over() ,
AvgPriceByCategoryAndSubcategory = AVG(p.ListPrice) over(partition by c.Name, s.Name)
from Production.Product p
INNER JOIN Production.ProductSubcategory s
ON  p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory c
ON s.ProductCategoryID = c.ProductCategoryID;


/*QUESTION 4*/

SELECT 
p.Name as producrname ,
p. ListPrice , 
s.Name as ProductSubcategory , 
c.Name as ProductCategory,
AvgPriceByCategory = AVG(p.ListPrice) over() ,
AvgPriceByCategoryAndSubcategory = AVG(p.ListPrice) over(partition by c.Name , s.Name),
ProductVsCategoryDelta = p.ListPrice - AVG(p.ListPrice) over(partition by c.Name)
from Production.Product p
INNER JOIN Production.ProductSubcategory s
ON  p.ProductSubcategoryID = s.ProductSubcategoryID
INNER JOIN Production.ProductCategory c
ON s.ProductCategoryID = c.ProductCategoryID;