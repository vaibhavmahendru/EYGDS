CREATE TABLE SalesLT.CallingLog
(
	callID int IDENTITY PRIMARY KEY NOT NULL,
	CallTime datetime NOT NULL DEFAULT GETDATE(),
	salesperson nvarchar(256) NOT NULL,
	CustomerID int NOT NULL REFERENCES salesLT.Customer(CustomerID),
	PhoneNumber nvarchar(25) NOT NULL,
	Notes nvarchar(max) NULL);

	select * from SalesLT.CallingLog;


INSERT INTO SalesLT.CallingLog
VALUES
('2015-01-01T12:30:30' , 'adventureworks\pamela0',1,'154-658' , 'enquiry call');


INSERT INTO SalesLT.CallingLog
VALUES
(DEFAULT , 'adventureworks\DAVID8' , 2 , '170-5898' , NULL);

INSERT INTO SalesLT.CallingLog (salesperson , customerID , PhoneNumber)
VALUES
('adventureworks\becham88' , 3 , '457-9687');


INSERT INTO SalesLT.CallingLog
VALUES
(DATEADD(mi , -2 , GETDATE()) , 'adventureworks\BRADY01' , 5 , '141-9875' , 'DELIVERY CALL');

INSERT INTO SalesLT.CallingLog (salesperson , customerID , PhoneNumber , Notes)
select salesperson , customerID , phone ,'ales promotion call'
FROM SalesLT.Customer
WHERE CompanyName = 'Big-Time Bike Store';

INSERT INTO SalesLT.CallingLog (salesperson , customerID , PhoneNumber)
VALUES
('adventureworks\bob03' , 10 , '458-9875');
SELECT SCOPE_IDENTITY() AS Latestidentity,
	IDENT_CURRENT('SalesLT.CallingLog') AS latestcallID;


SET IDENTITY_INSERT SalesLT.CallingLog ON;
INSERT INTO SalesLT.CallingLog(callID , salesperson , customerID , PhoneNumber)
VALUES
(20 , 'adventureworks\LKI98' , 11 , '7895-857');

SET IDENTITY_INSERT SalesLT.CallingLog OFF;

UPDATE SalesLT.CallingLog
set Notes = 'NO NOTES' 
WHERE Notes IS NULL;

select * from SalesLT.CallingLog;

UPDATE SalesLT.CallingLog
SET salesperson = '' , phoneNumber = '' ;

UPDATE SalesLT.CallingLog
SET salesperson = c.salesperson , phonenumber = c.phone
FROM SalesLT.Customer c
WHERE c.CustomerID = SalesLT.CallingLog.CustomerID;


DELETE FROM SalesLT.CallingLog
WHERE CallTime < DATEADD(dd , -7 , GETDATE());

TRUNCATE TABLE SalesLT.CallingLog;


/* challanges*/

INSERT INTO SalesLT.Product(name , productnumber , standardcost , listprice , productcategoryid , sellstartdate)
VALUES
('LED Light' , '125' , 2.56 , 12.99 , 37 , GETDATE())

SELECT SCOPE_IDENTITY();

SELECT * FROM SalesLT.Product
WHERE ProductID = SCOPE_IDENTITY();


	

