
----------Implement SQL In-built functions (Math, String, and Date Functions)----------


-----Math Functions-----
					-----PART-A-----

--1. Display the result of 5 multiply by 30.
	select 5*30 as Five_multiply_by_Thirty

--2. Find out the absolute value of -25, 25, -50 and 50.
	select abs(-25) as Absolute_Value
	select abs(25) as Absolute_Value
	select abs(50) as Absolute_Value
	select abs(-50) as Absolute_Value

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
	select ceiling(25.2) as ceiling,
	ceiling(25.7) as ceiling,
	ceiling(-25.2) as ceiling

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
	select floor(25.2) as floor,
	floor(25.7) as floor,
	floor(-25.2) as floor

--5. Find out remainder of 5 divided 2 and 5 divided by 3.
	select 5%2 as reminder,
	5%3 as reminder

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power.
	select power(3,2) as power,
	power(4,3) as power

--7. Find out the square root of 25, 30 and 50.
	select sqrt(25) as square_Root,
	sqrt(30) as square_Root,
	sqrt(50) as square_Root

--8. Find out the square of 5, 15, and 25.
	select square(5) as square,
	square(15) as square,
	square(25) as square

--9. Find out the value of PI.
	select pi() as PI_Value

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
	select round(157.732,2) as round_Value
	select round(157.732,0) as round_Value
	select round(157.732,-2) as round_Value

--11. Find out exponential value of 2 and 3.
	select exp(2) as exponential
	select exp(3) as exponential

--12. Find out logarithm having base e of 10 and 2.
	select log(10) as logarithm
	select log(2) as logarithm

--13. Find out logarithm having base b having value 10 of 5 and 100.
	select log10(5) as logarithm
	select log10(100) as logarithm

--14. Find sine, cosine and tangent of 3.1415.
	select sin(3.1415) as sin
	select cos(3.1415) as cosine
	select tan(3.1415) as tangent

--15. Find sign of -25, 0 and 25.
	select sign(-25) as sign_Value
	select sign(0) as sign_Value
	select sign(25) as sign_Value

--16. Generate random number using function.
	select rand() as random_Number



						-----PART-B-----
CREATE TABLE EMP_MASTER(
	empNo INT,
	empName VARCHAR(25),
	joiningDate DATETIME,
	salary INT,
	commission INT,
	city VARCHAR(25),
	deptCode VARCHAR(25),
);
INSERT INTO EMP_MASTER(empNo,empName,joiningDate,salary,commission,city,deptCode) VALUES
	(101,'KEYUR','2002-1-5',12000,4500,'RAJKOT','3@G'),
	(102,'HARDIK','2004-2-15',14000,2500,'AHMEDABAD','3@'),
	(103,'KAJAL','2006-3-14',15000,3000,'BARODA','3-GD'),
	(104,'BHOOMI','2005-6-25',12500,1000,'AHMEDABAD','1A3D'),
	(105,'HARMIT','2004-2-15',14000,2000,'RAJKOT','312A')
SELECT * FROM EMP_MASTER
truncate table EMP_MASTER

--1. Display the result of Salary plus Commission.
	select (salary+commission) as Result
	from EMP_MASTER

--2. Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
	select CEILING(55.2) as ceiling,
	CEILING(35.7) as ceiling,
	CEILING(-55.2) as ceiling

--3. Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.
	select FLOOR(55.2) as floor,
	FLOOR(35.7) as floor,
	FLOOR(-55.2) as floor

--4. Find out remainder of 55 divided 2 and 55 divided by 3.
	select 55%2 as reminder,
	55%3 as reminder

--5. Find out value of 23 raised to 2nd power and 14 raised 3rd power.
	select power(23,2) as power,
	power(14,3) as power



							-----PART-C-----

--1. Find out the square root of 36, 49 and 81.
	select sqrt(36) as square_root,
	sqrt(49) as square_root,
	sqrt(81) as square_root

--2. Find out the square of 3, 9, and 12.
	select SQUARE(3) as square,
	SQUARE(9) as square,
	SQUARE(12) as square

--3. Find out round value of 280.8952 for 2, 0 and -2 decimal points.
	select ROUND(280.8952,2) as round,
	ROUND(280.8952,0) as round,
	ROUND(280.8952,-2) as round

--4. Find sine, cosine and tangent of 4.2014.
	select sin(4.2014) as sine,
	cos(4.2014) as cosine,
	TAN(4.2014) as tangent

--5. Find sign of -55, 0 and 95.
	select sign(-55) as sign,
	sign(0) as sign,
	sign(95) as sign





-----String Functions-----
				-----PART-A-----

--1. Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank
	select LEN(null) as length,
	LEN('hello') as length,
	LEN('') as length

--2. Display your name in lower & upper case.
	select LOWER('Vatsal Parmar') as lowerCase,
	UPPER('Vatsal Parmar') as upperCase

--3. Display first three characters of your name.
	select LEFT('Vatsal Parmar',3) as FirstThree

--4. Display 3rd to 10th character of your name.
	select SUBSTRING('Vatsal Parmar',3,10) as SubString

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
	select REPLACE('abc123efg','123','XYZ') as replaced,
	REPLACE('abcabcabc','c','5') as replaced

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.
	select ASCII('a') as ascii,
	ASCII('A') as ascii,
	ASCII('z') as ascii,
	ASCII('Z') as ascii,
	ASCII('0') as ascii,
	ASCII('9') as ascii

--7. Write a query to display character based on number 97, 65,122,90,48,57.
	select char(97) as  character_based_on_number,
	char(65) as  character_based_on_number,
	char(122) as  character_based_on_number,
	char(90) as  character_based_on_number,
	char(48) as  character_based_on_number,
	char(57) as  character_based_on_number

--8. Write a query to remove spaces from left of a given string ‘hello world ‘.
	select LTRIM('hello world ') as ltrim

--9. Write a query to remove spaces from right of a given string ‘ hello world ‘.
	select RTRIM(' hello world ') as rtrim

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
	select LEFT('SQL Server',4), RIGHT('SQL Server',5)

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).
	select CAST('1234.56' as decimal(8,2)) as cast,
	convert(decimal(10,2),'1234.56') as converted

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function).
	select CAST(10.58 as int) as cast,
	convert(int,10.58) as converted

--13. Put 10 space before your name using function.
	select SPACE(10) + 'Vatsal'

--14. Combine two strings using + sign as well as CONCAT ().
	select CONCAT('Vatsal',' Parmar') as concat
	select 'Vatsal' + ' Parmar' as plusOperator

--15. Find reverse of “Darshan”.
	select REVERSE('Darshan') as reverse

--16. Repeat your name 3 times.
	select REPLICATE('Vatsal ',3) as repeat



					-----PART-B----- (Using Student Table From Query-5)

--1. Find the length of FirstName and LastName columns.
	select LEN(firstName) as FirstNameLength ,
	len(lastName) as LastNameLength from Student

--2. Display FirstName and LastName columns in lower & upper case.
	select LOWER(firstName) as LowerFirstName,
	LOWER(lastName) as LowerLastName,
	UPPER(firstName) as UpperFirstName,
	UPPER(lastName) as UpperLastName from Student

--3. Display first three characters of FirstName column.
	select LEFT(firstName,3) as FirstThreeChar from Student

--4. Display 3rd to 10th character of Website column.
	select SUBSTRING(webSite,3,10) as ThirdTo10th from Student

--5. Write a query to display first 4 & Last 5 characters of Website column.
	select LEFT(webSite,4) as First4, 
	RIGHT(webSite,5) as Last5 from Student



					-----PART-C------ (Using Student Table From Query-5)

--1. Put 10 space before FirstName using function.
	select SPACE(10) + firstName as BeforeSpace  from Student

--2. Combine FirstName and LastName columns using + sign as well as CONCAT ().
	select firstName + lastName as plusOperator from Student

	select CONCAT(firstName,lastName) as concatOperator from Student

--3. Combine all columns using + sign as well as CONCAT ().
	select firstName + lastName + webSite + city + address as plusOperator from Student

	select CONCAT(stuId,firstName,lastName,webSite,city,address) as concat from Student
	
--4. Find reverse of FirstName column.
	select REVERSE(firstName) as reverse from Student

--5. Repeat FirstName column 3 times
	select replicate(firstName ,3) as repeat from Student

--6. Give the Names which contains 5 characters.
	select firstName as contains5Char
	from Student
	where LEN(firstName) = 5

--7. Combine the result as <FirstName> Lives in <City>.	
	select firstName + ' Lives in ' + city as result
	from Student
    
--8. Combine the result as Student_ID of < FirstName > is <StuID> .
	select 'Student_ID of ' + FirstName + ' is ' + CAST(stuId AS VARCHAR) AS Result
    FROM Student;






-----Date Functions-----
				-----PART-A-----
--1. Write a query to display the current date & time. Label the column Today_Date.
	select GETDATE() as Today_Date

--2. Write a query to find new date after 365 day with reference to today.
	SELECT GETDATE()+365 AS DATE_AFTER_365 

--3. Display the current date in a format that appears as may 5 1994 12:00AM.
	SELECT FORMAT(GETDATE(),'MMM dd yyyy HH:MM tt') AS GIVEN_FROMAT

--4. Display the current date in a format that appears as 03 Jan 1995.
	SELECT FORMAT(GETDATE(),'dd MMM yyyy') AS GIVEN_FROMAT

--5. Display the current date in a format that appears as Jan 04, 96.
	SELECT FORMAT(GETDATE(),'MMM dd, yy') AS GIVEN_FROMAT

--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
	SELECT DATEDIFF(MONTH,'2008-12-31','2009-3-31') AS MONTH_DIFF 

--7. Write a query to find out total number of years between 25-Jan-12 and 14-Sep-10.
	SELECT DATEDIFF(YEAR,'2012-1-25','2010-9-10') AS YEAR_DIFF 

--8. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
	select DATEDIFF(HOUR,'2012-01-25','2012-01-26') as HOUR_DIFF

--9. Write a query to extract Day, Month, Year from given date 12-May-16.
	select DAY('12-May-16'),MONTH('12-May-16'),YEAR('12-May-16')

--10. Write a query that adds 5 years to current date.
	select DATEADD(YEAR,5,GETDATE())  as Add5Years

--11. Write a query to subtract 2 months from current date.
	select DATEADD(YEAR,-2,GETDATE()) as Sub2Months

--12. Extract month from current date using datename () and datepart () function.
	select DATENAME(MONTH,GETDATE()) as month,
	DATEPART(MONTH,GETDATE()) as month

--13. Write a query to find out last date of current month.
	select EOMONTH(GETDATE()) as LastDate

--14. Calculate your age in years and months.
	select DATEDIFF(YEAR,'2006-3-6',GETDATE()) as Age



				-----PART-B-----
CREATE TABLE EMP_DETAIL(
	EMPNO INT,
	EMPNAME VARCHAR(25),
	JOINGDATE DATETIME,
	SALARY INT,
	CITY VARCHAR(25),		
);
INSERT INTO EMP_DETAIL VALUES
		(101,'KEYUR','2002-1-15',12000,'RAJKOT'),
		(102,'HARDIK','2004-4-15',14000,'AHMEDABAD'),
		(103,'KAJAL','2006-3-14',15000,'BARODA'),
		(104,'BHOOMI','2005-6-23',12500,'AHMEDABAD'),
		(105,'HARMIT','2004-2-15',14000,'RAJKOT'),
		(106,'JAY','2007-3-12',12000,'SURAT')

--1. Write a query to find new date after 365 day with reference to JoiningDate.
	select DATEADD(YEAR,1,JOINGDATE) from EMP_DETAIL
	alter table EMP_DETAIL
	alter column JOINGDATE Date

--2. Display the JoiningDate in a format that appears as may 5 1994 12:00AM.
	select FORMAT(JOINGDATE,'MMM dd yyyy') from EMP_DETAIL

--3. Display the JoiningDate in a format that appears as 03 Jan 1995.
	select FORMAT(JOINGDATE,'dd MMM yyyy') from EMP_DETAIL

--4. Display the JoiningDate in a format that appears as Jan 04, 96.
	select FORMAT(JOINGDATE,'MMM dd, yy') from EMP_DETAIL

--5. Write a query to find out total number of months between JoiningDate and 31-Mar-09.
	SELECT DATEDIFF(MONTH,JOINGDATE,'31-Mar-09') AS MONTH_DIFF from EMP_DETAIL

--6. Write a query to find out total number of years between JoiningDate and 14-Sep-10.
	SELECT DATEDIFF(YEAR,JOINGDATE,'14-Sep-10') AS YEAR_DIFF from EMP_DETAIL


					-----PART-C-----
--1. Write a query to extract Day, Month, Year from JoiningDate.
	select DAY(JOINGDATE) ,
	MONTH(JOINGDATE) ,
	YEAR(JOINGDATE) from EMP_DETAIL

--2. Write a query that adds 5 years to JoiningDate.
	select DATEADD(YEAR,5,JOINGDATE) as Add_5_Years from EMP_DETAIL 

--3. Write a query to subtract 2 months from JoiningDate.
	select DATEADD(MONTH,-2,JOINGDATE) as Substract_2_Months from EMP_DETAIL 

--4. Extract month from JoiningDate using datename () and datepart () function.
	select DATENAME(MONTH,JOINGDATE) as datenamemonth,
	DATEPART(MONTH,JOINGDATE) as datepartmonth from EMP_DETAIL

--5. Calculate your age in years and months.
	select DATEDIFF(YEAR,'2006-3-6',GETDATE()) as Age
	select DATEDIFF(MONTH,'2006-3-6',GETDATE()) as Age