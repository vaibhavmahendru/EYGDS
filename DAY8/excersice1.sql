/*Sub Queries 
Exercise-1 
Write a query that displays the three most expensive orders, per vendor ID, from the Purchasing.PurchaseOrderHeader table. 
There should ONLY be three records per Vendor ID, even if some of the total amounts due are identical. 
"Most expensive" is defined by the amount in the "TotalDue" field. 
Include the following fields in your output: 
PurchaseOrderID 
VendorID 
OrderDate 
TaxAmt 
Freight 
TotalDue */

select * from Purchasing.PurchaseOrderHeader;

WITH M_E AS
(SELECT PurchaseOrderID , VendorID , OrderDate , TaxAmt , Freight , TotalDue,
MOST_EXPENSIVE_RANK =  ROW_NUMBER () OVER(PARTITION BY VendorID ORDER BY TotalDue desc)
FROM Purchasing.PurchaseOrderHeader)

SELECT PurchaseOrderID , VendorID , OrderDate , TaxAmt , Freight , MOST_EXPENSIVE_RANK  , TotalDue
FROM M_E 
WHERE MOST_EXPENSIVE_RANK <=3


						


