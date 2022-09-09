/*QUESTION1*/
SELECT
p.FirstName , 
p.LastName , 
h.JobTitle , 
AverageRate = AVG(r.Rate) over()
FROM Person.Person p
INNER JOIN HumanResources.Employee h
ON p.BusinessEntityID = h.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory r
ON h.BusinessEntityID = r.BusinessEntityID


/*QUESTION2*/
SELECT
p.FirstName , 
p.LastName , 
h.JobTitle , 
AverageRate = AVG(r.Rate) over()  ,
MaximumRate = MAX(r.Rate) over()  
FROM Person.Person p
INNER JOIN HumanResources.Employee h
ON p.BusinessEntityID = h.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory r
ON h.BusinessEntityID = r.BusinessEntityID


/*QUESTION3*/
SELECT
p.FirstName , 
p.LastName , 
h.JobTitle , 
AverageRate = AVG(r.Rate) over()  ,
MaximumRate = MAX(r.Rate) over()  , 
DiffFromAvgRate = r.Rate - AVG(r.Rate) over() 
FROM Person.Person p
INNER JOIN HumanResources.Employee h
ON p.BusinessEntityID = h.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory r
ON h.BusinessEntityID = r.BusinessEntityID


/*QUESTION4*/
SELECT
p.FirstName , 
p.LastName , 
h.JobTitle , 
AverageRate = AVG(r.Rate) over()  ,
MaximumRate = MAX(r.Rate) over()  , 
DiffFromAvgRate = r.Rate - AVG(r.Rate) over() ,
PercentofMaxRate = r.Rate/MAX(r.Rate)*100 over()
FROM Person.Person p
INNER JOIN HumanResources.Employee h
ON p.BusinessEntityID = h.BusinessEntityID
INNER JOIN HumanResources.EmployeePayHistory r
ON h.BusinessEntityID = r.BusinessEntityID

