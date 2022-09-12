
/* question 1 */

SELECT P.PurchaseOrderID , P.OrderDate , P.TotalDue ,  v.Name 
FROM Purchasing.PurchaseOrderHeader p
JOIN Purchasing.Vendor v
ON v. BusinessEntityID = p.VendorID 
WHERE TotalDue > 500 and OrderDate > '2012-12-31';

/* question 2 */

SELECT P.PurchaseOrderID , P.OrderDate , P.TotalDue ,  v.Name,
PrevOrderFromVendorAmt = lag(TotalDue) over(partition by VendorID order by OrderDate)
FROM Purchasing.PurchaseOrderHeader p
JOIN Purchasing.Vendor v
ON v. BusinessEntityID = p.VendorID 
WHERE TotalDue > 500 and OrderDate > '2012-12-31';

/* question 3 */

SELECT P.PurchaseOrderID , P.OrderDate , P.TotalDue ,  v.Name,
PrevOrderFromVendorAmt = lag(TotalDue) over(partition by VendorID order by OrderDate),
NextOrderByEmployeeVendor = lead(v.Name) over(partition by p.EmployeeID order by OrderDate) 
FROM Purchasing.PurchaseOrderHeader p
JOIN Purchasing.Vendor v
ON v. BusinessEntityID = p.VendorID 
WHERE TotalDue > 500 and OrderDate > '2012-12-31';

/* question 4 */

SELECT P.PurchaseOrderID , P.OrderDate , P.TotalDue ,  v.Name,
PrevOrderFromVendorAmt = lag(TotalDue) over(partition by VendorID order by OrderDate),
NextOrderByEmployeeVendor = lead(v.Name) over(partition by p.EmployeeID order by OrderDate) ,
Next2OrderByEmployeeVendor = lead(v.Name , 2) over(partition by p.EmployeeID order by OrderDate) 
FROM Purchasing.PurchaseOrderHeader p
JOIN Purchasing.Vendor v
ON v. BusinessEntityID = p.VendorID 
WHERE TotalDue > 500 and OrderDate > '2012-12-31';











 
