SELECT Name , ListPrice 
FROM salesLT.product;

SELECT Name , ListPrice 
FROM salesLT.product
ORDER BY Name;

SELECT Name , ListPrice 
FROM salesLT.product
ORDER BY ListPrice;

SELECT Name , ListPrice 
FROM salesLT.product
ORDER BY ListPrice DESC;

SELECT Name , ListPrice 
FROM salesLT.product
ORDER BY ListPrice DESC ,Name ;

SELECT TOP(20) Name , ListPrice 
FROM salesLT.product
ORDER BY ListPrice DESC;


SELECT TOP(20) WITH TIES Name , ListPrice 
FROM salesLT.product
ORDER BY ListPrice DESC; 


SELECT TOP(20) PERCENT WITH TIES Name , ListPrice
FROM salesLT.product
ORDER BY ListPrice DESC;

SELECT Name , ListPrice
FROM salesLT.product
ORDER BY Name OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY; 

SELECT Name , ListPrice
FROM salesLT.product
ORDER BY Name OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY; 

SELECT COLOR
FROM salesLT.product;

SELECT ALL COLOR 
FROM salesLT.product;

SELECT DISTINCT COLOR
FROM salesLT.product;

SELECT DISTINCT COLOR , SIZE 
FROM salesLT.product;

SELECT Name , Color , Size
FROM salesLT.product
WHERE ProductModelID = 6
ORDER BY Name;

SELECT Name , Color , Size
FROM salesLT.product 
WHERE ProductModelID <> 6
ORDER BY Name;

SELECT Name , ListPrice
FROM salesLT.product
WHERE ListPrice > 1000.00
ORDER BY ListPrice;

SELECT Name , ListPrice
FROM salesLT.product
where Name LIKE 'HL Road Frame %';

SELECT Name , ListPrice , ProductNumber
FROM salesLT.product
WHERE ProductNumber LIKE 'FR-_[0-9][0-9]_-[0-9][0-9]'; 

SELECT Name , ListPrice
FROM salesLT.product
WHERE SellEndDate IS NOT NULL;

SELECT Name 
FROM salesLT.product
WHERE SellEndDate BETWEEN '2006/1/1' AND '2006/12/31';

SELECT ProductCategoryID , Name , ListPrice
FROM salesLT.product 
WHERE  ProductCategoryID IN (5,6,7);

SELECT ProductCategoryID , Name , ListPrice , SellEndDate
FROM SalesLT.Product
WHERE ProductCategoryID IN (5,6,7) AND SellEndDate IS NULL;

SELECT ProductCategoryID , Name , ProductNumber
FROM salesLT.product 
WHERE ProductNumber LIKE 'FR%' OR  ProductCategoryID IN (5,6,7);

/* CHALLANGES*/
SELECT DISTINCT City , StateProvince
FROM salesLT.Address
ORDER BY City;

SELECT TOP(10) PERCENT WITH TIES Name
FROM SalesLT.Product
ORDER BY weight DESC

SELECT name , color , size 
FROM SalesLT.Product
WHERE ProductModelID = 1;

SELECT productNumber , name 
FROM SalesLT.Product
WHERE COLOR IN ('black' ,'red' ,'white') AND size IN ('s' ,'m')

SELECT productNumber , name ,ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%';

SELECT productNumber , name ,ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';




