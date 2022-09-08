SELECT YEAR(SellStartDate) as SellStartYear , productID , Name
FROM salesLT.product
order by SellStartYear;


SELECT YEAR(SellStartDate) as SellStartYear,
	DATENAME(mm,SellStartDate) as sellstartmonth,
	DAY(SellStartDate) as SellStartDay,
	DATENAME(dw , SellStartDate) as SellStartWeekday,
	DATEDIFF(yy, SellStartDate , GETDATE()) AS yearssold,
	ProductID,
	Name
	FROM salesLT.Product
	ORDER BY SellStartYear;

SELECT CONCAT(FirstName + ' ' , LastName) AS FullName
FROM salesLT.Customer;


SELECT UPPER(name) as productName,
	productnumber,
	ROUND(Weight , 0) as ApproxWeight,
	LEFT(ProductNumber , 2 ) as ProductType,
	SUBSTRING(ProductNumber , CHARINDEX('-' , ProductNumber) + 1 , 4 ) AS ModelCode,
	SUBSTRING(ProductNumber , LEN(ProductNumber) - CHARINDEX('-' , REVERSE(RIGHT(ProductNumber , 3))) +2 , 2) AS SizeCode
FROM salesLT.Product;

SELECT Name , Size AS numericsize
FROM salesLT.Product
WHERE ISNUMERIC(Size) = 1;

SELECT Name , IIF(ISNUMERIC(Size) = 1 , 'Numeric' , 'NonNumeric')AS NumericSize
FROM salesLT.product;

SELECT prd.name AS ProductName,
	cat.Name as Category,
	CHOOSE(cat.ParentProductCategoryID , 'bikes' , 'components' , 'clothing' , 'accessorries' ) AS ProductType
	FROM salesLT.Product AS prd
	JOIN SalesLT.ProductCategory as Cat
		ON prd.ProductCategoryID = Cat.ProductCategoryID;


SELECT COUNT(*) AS Products,
		COUNT(DISTINCT ProductCategoryID) AS Categories,
		AVG(ListPrice) as AveragePrice
	FROM SalesLT.Product;

SELECT COUNT(p.productID) as BikeModels , AVG(p.ListPrice) as AveragePrice
FROM salesLT.Product AS p
JOIN SalesLT.ProductCategory as c 
	ON p.ProductCategoryID = c.ProductCategoryID
WHERE c.Name LIKE '%Bikes';

select * from SalesLT.Product;

SELECT Salesperson , COUNT(CustomerID) AS Customers
FROM salesLT.Customer
GROUP BY  SalesPerson
ORDER BY Salesperson;

SELECT c.Salesperson , SUM(oh.SubTotal) AS SalesRevenue
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader oh
	ON c.CustomerID = oh.CustomerID
	GROUP BY c.SalesPerson
	ORDER BY SalesRevenue DESC;

	SELECT * FROM SalesLT.SalesOrderHeader;

SELECT c.salesperson , ISNULL(SUM(oh.SubTotal) , 0.00)AS SalesRevenue
FROM salesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader oh
	ON c.CustomerID = oh.CustomerID
  GROUP BY c.salesperson
  ORDER BY SalesRevenue DESC;

SELECT Salesperson , COUNT(CustomerID) AS Customers
FROM salesLT.Customer
WHERE COUNT(CustomerID) > 100
GROUP BY Salesperson
ORDER BY Salesperson;
 

SELECT Salesperson , COUNT(CustomerID) AS Customers
FROM salesLT.Customer
GROUP BY Salesperson
HAVING COUNT(CustomerID) > 100
ORDER BY Salesperson;

/*CHALLANGES*/

SELECT salesorderID ,
ROUND(Freight , 2) AS Freightcost
FROM SalesLT.SalesOrderHeader

SELECT salesorderID,
	ROUND(Freight , 2) as FreightCost,
	LOWER(ShipMethod) as shippingmethod
FROM SalesLT.SalesOrderHeader;

SELECT salesorderID,
	ROUND(Freight , 2) as FreightCost,
	LOWER(ShipMethod) as shippingmethod,
	YEAR(shipDate) as shipyear,
	DATENAME(mm , shipdate) as shipmonth,
	DAY(shipdate) as shipday
from SalesLT.SalesOrderHeader;





