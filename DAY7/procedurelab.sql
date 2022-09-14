 CREATE PROCEDURE SalesLT.TopOrder AS
 SELECT TOP(10) name, listprice
     		FROM SalesLT.Product
     		GROUP BY name, listprice
     		ORDER BY listprice DESC;


EXEC SalesLT.TopOrder;


 ALTER PROCEDURE SalesLT.TopOrder @ProductCategoryID int
 AS
 SELECT TOP(10) name, listprice
     	FROM SalesLT.Product
         WHERE ProductCategoryID = @ProductCategoryID 
     	GROUP BY name, listprice
     	ORDER BY listprice DESC; 


	EXECUTE SalesLT.TopOrder @ProductCategoryID = 18;