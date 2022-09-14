/*Create a query that displays all rows and the following columns from the AdventureWorks2019.HumanResources.Employee table: 
BusinessEntityID 
JobTitle 
VacationHours 
Also include a derived column called "MaxVacationHours" that returns the maximum amount of vacation hours for any one employee, in any given row. 
*/

--select * from HumanResources.Employee

select 
BusinessEntityID , JobTitle , VacationHours , 
(select MaxVacationHours = max(VacationHours) from HumanResources.Employee ) as M_V
			from HumanResources.Employee


/*Add a new derived field to your query from Exercise 1, which returns the percent an individual employees'
vacation hours are, of the maximum vacation hours for any employee.
For example, the record for the employee with the most vacation hours should have a value of 1.00, or 100%, in this column. */

Select 
BusinessEntityID,JobTitle,VacationHours ,(
select max(vacationHours) from HumanResources.Employee )as MaxVacationHours ,(
cast(
VacationHours as float)
/ cast(
(select max(vacationHours) from HumanResources.Employee )as float )) *100
as VacationPercentage
from HumanResources.Employee 






/**
Refine your output with a criterion in the WHERE clause that filters out any employees
whose vacation hours are less then 80% of the maximum amount of vacation hours for any one employee.
In other words, return only employees who have at least 80% as much vacation time as the employee
with the most vacation time. 
Hint: The query should return 60 rows. **/
select * from (
Select 
BusinessEntityID,JobTitle,VacationHours ,(
select max(vacationHours) from HumanResources.Employee )as MaxVacationHours ,
(cast(VacationHours as float)/ cast((select max(vacationHours) from HumanResources.Employee )as float )) *100
as VacationPercentage
from HumanResources.Employee 
) A
where VacationPercentage > 80
