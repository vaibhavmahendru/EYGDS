CREATE table firsttab
(EMP_IDNO INT NOT NULL ,
 EMP_FNAME VARCHAR(30) NOT NULL ,
 EMP_LNAME VARCHAR(30) NOT NULL ,
 EMP_DEPT INT NOT NULL ,
 PRIMARY KEY (EMP_IDNO) ,
 UNIQUE (EMP_FNAME)
 );

INSERT INTO firsttab
	(EMP_IDNO,EMP_FNAME,EMP_LNAME,EMP_DEPT)
VALUES
	(127323,'Michale' ,'Robbin' , 57) ,
	(526689,'Carlos' , 'Snares' , 63) , 
	(843795 , 'Enric' , 'Dosio' , 57) ,
	(328717 , 'Jhon' , 'Snares' , 63) ,
	(444527 , 'Joseph' , 'Dosni' , 47) ,
	(659831 , 'Zanifer' , 'Emily' , 47) ,
	(847647 , 'Kuleswar' , 'Sitaram' , 57) ,
	(748681 , 'Henery' , 'Gabriel' , 47) ,
	(555935 , 'Alex' , 'Manuel' , 57);


	SELECT * FROM firsttab
	WHERE EMP_DEPT = 57;
