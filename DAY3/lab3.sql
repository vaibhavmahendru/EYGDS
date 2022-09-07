SELECT SalesLT.Product.Name AS ProductName , SalesLT.ProductCategory.Name AS Category
FROM SalesLT.Product
INNER JOIN SalesLT.ProductCategory
ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID;

SELECT SalesLT.Product.Name AS ProductName , SalesLT.ProductCategory.Name AS Category
FROM SalesLT.Product
JOIN SalesLT.ProductCategory
ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID;

SELECT p.name as ProductName , c.Name AS Category
FROM salesLT.Product AS p
JOIN SalesLT.ProductCategory as c 
 ON p.ProductCategoryID = c.ProductCategoryID;

 SELECT oh.orderDate , oh.SalesOrderNumber , p.Name as ProductName , od.OrderQty , od.UnitPrice , od.LineTotal
 FROM SalesLT.SalesOrderHeader AS oh
 JOIN SalesLT.SalesOrderDetail as od
	ON od.SalesOrderID = oh.SalesOrderID
 JOIN SalesLT.Product as p
	ON od.ProductID =p.ProductID
ORDER BY oh.OrderDate , oh.SalesOrderID , od.SalesOrderDetailID;

SELECT c.FirstName , c.LastName , oh.SalesOrderNumber
FROM SalesLT.Customer AS c 
LEFT OUTER JOIN SalesLT.SalesOrderHeader as oh
	ON c.CustomerID = oh.CustomerID
ORDER BY c.CustomerID;

SELECT c.FirstName , c.LastName , oh.SalesOrderNumber
FROM SalesLT.Customer AS c 
 LEFT JOIN SalesLT.SalesOrderHeader as oh
	ON c.CustomerID = oh.CustomerID
ORDER BY c.CustomerID;


SELECT c.FirstName , c.LastName , oh.SalesOrderNumber
FROM SalesLT.Customer AS c 
 LEFT JOIN SalesLT.SalesOrderHeader as oh
	ON c.CustomerID = oh.CustomerID
  WHERE oh.SalesOrderNumber IS NULL
ORDER BY c.CustomerID;

SELECT p.name as productname , c.name as category , oh.SalesOrderNumber
FROM SalesLT.Product AS p
LEFT JOIN SalesLT.SalesOrderDetail as od
	ON p.ProductID = od.ProductID
LEFT JOIN SalesLT.SalesOrderHeader AS oh
	ON od.SalesOrderID = oh.SalesOrderID
INNER JOIN SalesLT.ProductCategory AS c
	ON p.ProductCategoryID = c.ProductCategoryID

	ORDER BY p.ProductID


SELECT p.name , c.FirstName , c.LastName , c.EmailAddress
FROM SalesLT.Product AS p
CROSS JOIN SalesLT.Customer AS c;

SELECT pcat.name as parentcategory , cat.name as SubCategory
FROM SalesLT.ProductCategory AS cat
JOIN SalesLT.ProductCategory AS pcat
	ON cat.ParentProductCategoryID = pcat.ProductCategoryID

	ORDER BY parentCategory , subCategory;







