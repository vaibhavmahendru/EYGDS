INSERT INTO  SALES
	(salesman_id , name , city , commission)
VALUES
	(5001, 'James Hoog' , 'new york' , 0.15),
	(5002 , 'nail knite' , 'paris' , 0.13),
	(5005 , 'pit alex' , 'london' , 0.11),
	(5006 , 'mc lyon' , 'paris' , 0.14),
	(5003 , 'lauson hen' , 'delhi' , 0.13);

select distinct name , city from sales where city = 'paris';

INSERT INTO xyz 
	(ord_no , purch_amt , ord_date , customer_id , salesman_id)
VALUES
	(70001 , 150.5 , '2012-10-05' , 3005 , 5002),
	(70009 , 270.65 , '2012-09-10' , 3001 , 5005),
	(70002 , 65.26 , '2012-10-05' , 3002 , 5001),
	(70004 , 110.5 , '2012-08-17' , 3009 ,  5003),
	(70007 , 984.5 , '2012-09-10' , 3005 , 5002),
	(70005 , 2400.6 ,'2012-07-27' , 3007 , 5001),
	(70008 , 5760 , '2012-09-10' , 3002 , 5001),
	(70010 , 1983.43 , '2012-10-10' , 3004 , 5006),
	(70003 , 2480.4 , '2012-10-10' , 3009 , 5003),
	(70012 , 250.45 , '2012-06-27' , 3008 , 5002),
	(70011 , 75.29 , '2012-08-17' , 3002 , 5001);

	select * from xyz;

	INSERT INTO xxx
		(customer_id , cust_name , city , grade , salesman_id)
	VALUES
		(3002 , 'nick ramando' , 'new york' , 100 , 5001),
		(3005 , 'graham zusi' , 'california' , 200 , 5002),
		(3001 ,'brad guzzan', 'london' , 55 , 5005),
		(3004 , 'fabian jhons' , 'paris' ,300 , 5006),
		(3007 , 'brad davis' , 'new york' , 200 , 5001),
		(3009 , 'geoff camero' , 'berlin' , 100 , 5003),
		(3008 , 'juilian green' , 'london' , 300 , 5002),
		(3003 , 'jozy altidor' , 'moscow' , 200 , 5007);

		select * from xxx;

		/*QUERIES*/

select distinct name , city from sales where city = 'paris';


SELECT b.* ,a.cust_name
FROM xyz as b , xxx as a
WHERE a.customer_id = b.customer_id
AND b.ord_date = '2012-08-17';

SELECT DISTINCT salesman_id , name
from sales as a
where 1 < 
	(select count(*)
	from xxx
	where salesman_id = a.salesman_id);


SELECT * 
FROM xyz as a
WHERE purch_amt >= 
	(SELECT AVG(purch_amt) from xyz as b
	where b.customer_id = a.customer_id);


SELECT DISTINCT *
 FROM sales 
 where salesman_id IN (
	select distinct salesman_id
	from xxx as a
	where not exists(
	select * from xxx as b
	where a.salesman_id = b.salesman_id
	AND a.cust_name <> b.cust_name));

SELECT DISTINCT * from sales
where city = ANY
	(select city from xxx);

SELECT DISTINCT * FROM sales as a
where 1 < 
	(select count(customer_id)
	from xyz 
	where a.salesman_id= salesman_id);
