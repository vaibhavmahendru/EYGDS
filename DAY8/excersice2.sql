WITH M_E AS
(SELECT PurchaseOrderID , VendorID , OrderDate , TaxAmt , Freight , TotalDue,
MOST_EXPENSIVE_RANK =  DENSE_RANK () OVER(PARTITION BY VendorID ORDER BY TotalDue desc)
FROM Purchasing.PurchaseOrderHeader)

SELECT PurchaseOrderID , VendorID , OrderDate , TaxAmt , Freight , TotalDue , MOST_EXPENSIVE_RANK  
FROM M_E 
WHERE MOST_EXPENSIVE_RANK <=3
