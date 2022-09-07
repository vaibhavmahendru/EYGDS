SELECT MAX(UnitPrice)
FROM SalesLT.SalesOrderDetail;

SELECT Name , ListPrice
FROM salesLT.product
	WHERE ListPrice >
	(SELECT MAX(UnitPrice)
	FROM SalesLT.SalesOrderDetail);

SELECT DISTINCT ProductID 
FROM SalesLT.SalesOrderDetail
WHERE OrderQty >= 20;

SELECT name 
FROM SalesLT.Product
WHERE ProductID IN 
	(SELECT DISTINCT ProductID 
	FROM SalesLT.SalesOrderDetail
	WHERE OrderQty >= 20);

SELECT DISTINCT Name 
FROM SalesLT.Product as p
JOIN SalesLT.SalesOrderDetail as o
	ON p.ProductID = o.ProductID
WHERE OrderQty >= 20; 


SELECT od.salesOrderID , od.ProductID , od.OrderQty
FROM SalesLT.SalesOrderDetail as od
ORDER BY od.ProductID;

SELECT od.salesOrderID , od.ProductID , od.OrderQty
FROM SalesLT.SalesOrderDetail as od
where od.OrderQty  = 
	(SELECT MAX(OrderQty)
	FROM SalesLT.SalesOrderDetail as d
	WHERE od.productID = d.ProductID)
ORDER BY od.ProductID;


SELECT o.salesOrderID , o.OrderDate,
	(SELECT companyName 
	 FROM SalesLT.Customer AS c 
	 WHERE c.CustomerID = o.customerID) AS CompanyName
FROM SalesLT.SalesOrderHeader as o

ORDER BY o.SalesOrderID;

/* CHALLANGES*/

SELECT ProductID , Name , ListPrice
FROM SalesLT.Product
WHERE ListPrice > 
	(SELECT AVG(UnitPrice)
	FROM SalesLT.SalesOrderDetail)
ORDER BY ProductID;

SELECT ProductID , Name , ListPrice 
FROM SalesLT.Product
WHERE ProductID IN
	(SELECT ProductID 
	 FROM SalesLT.SalesOrderDetail
	 where UnitPrice < 100.00)
	AND ListPrice > 100.00
	ORDER BY ProductID ;

SELECT ProductID , Name , cost , ListPrice
FROM SalesLT.Product
	(SELECT




	