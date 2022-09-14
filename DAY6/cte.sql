With sale_data AS (


?SELECT 

?OrderMonth, 
 TotalSales = SUM(TotalDue) 
?FROM ( 
??SELECT  
??   OrderDate 
??  ,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) 
??  ,TotalDue 
??  ,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC) 
??FROM AdventureWorks2019.Sales.SalesOrderHeader 
??) S 
	WHERE OrderRank > 10 
?   GROUP BY OrderMonth 
),
  purchase_data as (
	SELECT 
 ?	  OrderMonth, 
?	  TotalPurchases = SUM(TotalDue) 
?	 FROM ( 
??	  SELECT  
??		 OrderDate 
??		,OrderMonth = DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) 
??		,TotalDue 
??		,OrderRank = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(YEAR(OrderDate),MONTH(OrderDate),1) ORDER BY TotalDue DESC) 
??	  FROM AdventureWorks2019.Purchasing.PurchaseOrderHeader 

??	  ) P 
		WHERE OrderRank > 10 
?		GROUP BY OrderMonth 

)

select sale_data.OrderMonth , sale_data.TotalSales , purchase_data.totalpurchases
from sale_data
join purchase_data
on sale_data.ordermonth = purchase_data.ordermonth 
order by 1