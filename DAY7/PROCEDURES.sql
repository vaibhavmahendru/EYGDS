CREATE TABLE Product
(ProductID INT, ProductName VARCHAR(100) )
GO
 
CREATE TABLE ProductDescription
(ProductID INT, ProductDescription VARCHAR(800) )
GO
 
INSERT INTO Product VALUES (680,'HL Road Frame - Black, 58')
,(706,'HL Road Frame - Red, 58')
,(707,'Sport-100 Helmet, Red')
GO
 
INSERT INTO ProductDescription VALUES (680,'Replacement mountain wheel for entry-level rider.')
,(706,'Sturdy alloy features a quick-release hub.')
,(707,'Aerodynamic rims for smooth riding.')


select * from ProductDescription; 


/* PROCEDURE */
create PROCEDURE proddesc AS
BEGIN
SET NOCOUNT ON

SELECT p.ProductName , p.ProductID , d.ProductDescription
FROM product as p
join ProductDescription d
ON p.ProductID = d.ProductID

END 

 EXEC proddesc 

/* PROCEDURE WITH ENCRYPTION */ 
create PROCEDURE proddescription
WITH ENCRYPTION 
AS
BEGIN
SET NOCOUNT ON

SELECT p.ProductName , p.ProductID , d.ProductDescription
FROM product as p
join ProductDescription d
ON p.ProductID = d.ProductID

END 

EXEC proddescription 

/* PROCEDURE WITH PARAMETER */
Create Procedure GetProdDescription_withparam
(@PID INT)
AS
BEGIN
SET NOCOUNT OFF

Select p.ProductID, p.ProductName,PD.ProductDescription
From Product as p
Inner Join ProductDescription PD
On p.ProductID = PD.ProductID
Where p.ProductID = @PID

END

EXEC GetProdDescription_withparam 680

/*PROCEDURE WITH DEFAULT PARAMETR*/

Create Procedure GetProdDescription_withDefaultparam
(@PID INT = 706 )
AS
Begin
SET NOCOUNT ON

Select p.ProductID, p.ProductName,PD.ProductDescription
From Product as p
Inner Join ProductDescription PD
On p.ProductID = PD.ProductID
Where p.ProductID = @PID

End

EXEC GetProdDescription_withDefaultparam

Create Table Employee (EmpID INT Identity(1,1), EmpName varchar(500))

Select *  From Employee

/* PROCEDURE WITH O/P*/

Create Procedure ins_NewEmp_withoutputparameters
(@Ename varchar(50),
@EId INT output)
AS
Begin
Set NOCOUNT ON

Insert into Employee (EmpName) Values (@Ename)

Select @EId = SCOPE_IDENTITY()
End

declare @EmpID INT
Exec ins_NewEmp_withoutputparameters 'Mountain', @EmpID output



/* GLOBAL AND LOCAL PROCEDURES */

CREATE PROCEDURE #temp100
AS BEGIN

print('Local temp procedures')
END

EXEC #temp100

CREATE PROCEDURE ##temp102
AS BEGIN

print('global temp procedures')
END

EXEC ##temp102