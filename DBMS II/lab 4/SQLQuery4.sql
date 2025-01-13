
---------- UDF   ----------

--------------------------------------------------PART-A------------------------------------------------

--1. Write a function to print "hello world". 
	CREATE or ALTER FUNCTION FN_HelloWorld()
	RETURNS VARCHAR(100)
	AS
	BEGIN
		RETURN 'Hello World from UDF in SQL.'
	END

	select dbo.FN_HelloWorld() as UDF1

--2. Write a function which returns addition of two numbers. 
	CREATE or ALTER FUNCTION FN_AdditionOfTwoNum
	(
		@num1  int,
		@num2 int
	)
	RETURNS int
	AS
	BEGIN
		DECLARE @ANS INT
		SET @ANS = @num1 + @num2
		RETURN @ANS
	END

	select dbo.FN_AdditionOfTwoNum(5, 6) as UDF_Of_Sum

--3. Write a function to check whether the given number is ODD or EVEN. 
	CREATE or ALTER FUNCTION FN_CheckOddEven
	(
		@num  int
	)
	RETURNS VARCHAR(100)
	AS
	BEGIN
		DECLARE @ANS VARCHAR(100)
		IF(@num%2 = 0)
			SET @ANS = 'Number is Even'
		ELSE
			SET @ANS = 'Number is Odd'
		RETURN @ANS
	END

	select dbo.FN_CheckOddEven(18) as UDF_Of_Odd_Even

--4. Write a function which returns a table with details of a person whose first name starts with B. 
	CREATE or ALTER FUNCTION FN_Person_Details1()
	RETURNS TABLE
	AS
		RETURN (SELECT * FROM Person
				WHERE FirstName like 'B%')

	select * FROM dbo.FN_Person_Details1() 

--5. Write a function which returns a table with unique first names from the person table. 
	CREATE or ALTER FUNCTION FN_Person_Details2()
	RETURNS TABLE
	AS
		RETURN (SELECT DISTINCT FirstName FROM Person)

	select * FROM dbo.FN_Person_Details2() 

--6. Write a function to print number from 1 to N. (Using while loop) 
	CREATE or ALTER FUNCTION FN_1_TO_N_NUM_PRINT
	(
		@N INT
	)
	RETURNS VARCHAR(100)
	AS
	BEGIN
		DECLARE @i INT, @ans VARCHAR(100)
		SET @i = 1
		SET @ans = ''

		WHILE(@i<=@N) 
		BEGIN
			SET @ans = @ans + CAST(@i AS varchar(1)) + ' '
			SET @i = @i + 1
		END
		RETURN @ans
	END

	select dbo.FN_1_TO_N_NUM_PRINT(5) 

--7. Write a function to find the factorial of a given integer.
	CREATE or ALTER FUNCTION FN_FACTORIAL
	(
		@N INT
	)
	RETURNS INT
	AS
	BEGIN
		DECLARE @i INT, @ans INT
		SET @i = 1
		SET @ans = 1

		WHILE(@i<=@N) 
		BEGIN
			SET @ans = @ans*@i
			SET @i = @i + 1
		END
		RETURN @ans
	END

	select dbo.FN_FACTORIAL(5) AS Factorial



--------------------------------------------------PART-B------------------------------------------------

--8. Write a function to compare two integers and return the comparison result. (Using Case statement) 
	CREATE or ALTER FUNCTION FN_CompareNumbers
	(
		@NUM1 INT,
		@NUM2 INT
	)
	RETURNS VARCHAR(100)
	AS
	BEGIN
		DECLARE @ans VARCHAR(100)
		RETURN CASE
			WHEN @NUM1>@NUM2 THEN 'FIRST NUMBER IS GREATER THEN SECOND NUMBER'
			WHEN @NUM1<@NUM2 THEN 'SECOND NUMBER IS GREATER THEN FIRST NUMBER'
			ELSE 'Invalid Input'
		END
	END

	select dbo.FN_CompareNumbers(99, 9) AS CompareTwoNum

--9. Write a function to print the sum of even numbers between 1 to 20. 
	CREATE or ALTER FUNCTION FN_SumOfEven()
	RETURNS INT
	AS
	BEGIN
		DECLARE @ans INT, @i INT
		SET @i = 1
		SET @ans = 0
		WHILE(@i <= 20)
		BEGIN 
			IF(@i%2 = 0)
				SET @ans = @ans + @i
			SET @i = @i + 1
		END
		RETURN @ans
	END

	select dbo.FN_SumOfEven() AS SumOfEven

--10. Write a function that checks if a given string is a palindrome
	CREATE or ALTER FUNCTION FN_PALINDROM
	(
		@str VARCHAR(100)
	)
	RETURNS VARCHAR(100)
	AS
	BEGIN
		DECLARE	@ans VARCHAR(100)
		IF(@str = REVERSE(@str))
			SET @ans = @str + ' is Palindrom'
		ELSE
			SET @ans = @str + ' is not Palindrom'
		RETURN @ans
	END

	select dbo.FN_PALINDROM('ABCBA') AS Palindrom



--------------------------------------------------PART-C------------------------------------------------

--11. Write a function to check whether a given number is prime or not. 
	CREATE or ALTER FUNCTION FN_PRIME
	(
		@num INT
	)
	RETURNS VARCHAR(100)
	AS
	BEGIN
		DECLARE	@ans VARCHAR(100) = ''
		DECLARE @i INT = 2
		DECLARE @flag INT = 0
		WHILE(@i <= @num/2)
		BEGIN 
			IF @num%@i = 0
				SET @flag = 1
				SET @i = @i +1
		END
		IF @flag = 0 
			SET @ans = CAST(@num AS varchar(1)) + ' is Prime Number.'
		ELSE
			SET @ans = CAST(@num AS varchar(1)) + ' is Not Prime Number.'
		RETURN @ans
	END

	select dbo.FN_PRIME(5) AS Prime

--12. Write a function which accepts two parameters start date & end date, and returns a difference in days.
	CREATE or ALTER FUNCTION FN_Difference_In_Days
	(
		@date1 DATE,
		@date2 DATE
	)
	RETURNS VARCHAR(100)
	AS
	BEGIN
		RETURN CAST((SELECT DATEDIFF(DAY, @date1, @date2) AS DAY_DIFFERENCE) AS varchar(100)) + ' DAYS'
	END

	select dbo.FN_Difference_In_Days('2024-02-04','2024-02-09') AS Difference_In_Days

--13. Write a function which accepts two parameters year & month in integer and returns total days in given month of given year. 
	
	-----METHOD-1 -------------------

	CREATE FUNCTION dbo.Days_In_Month
	(
		@year INT,
		@month INT
	)
	RETURNS INT
	AS
	BEGIN
		RETURN CASE 
			WHEN @month IN (1, 3, 5, 7, 8, 10, 12) THEN 31
			WHEN @month IN (4, 6, 9, 11) THEN 30
			WHEN @month = 2 THEN 
				CASE 
					WHEN (@year % 400 = 0 OR (@year % 100 <> 0 AND @year % 4 = 0)) THEN 29 
					ELSE 28 
				END
			ELSE NULL
		END
	END
	
	-----METHOD-2 -------------------

	CREATE or ALTER FUNCTION FN_Days_In_Month
	(
		@year int,
		@month int
	)
	RETURNS VARCHAR(100)
	AS
	BEGIN
		RETURN CAST((SELECT Day(EOMONTH(DATEFROMPARTS(@year, @month, 1))) AS DAY_DIFFERENCE) AS varchar(100)) + ' DAYS'
	END

	select dbo.FN_Days_In_Month(2023,2) AS Days_In_Month
	

--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons.
	CREATE or ALTER FUNCTION FN_Person_Details
	(
		@deptID int
	)
	RETURNS TABLE
	AS
		RETURN (SELECT * FROM Person
				WHERE DepartmentID = @deptID)

	select * FROM dbo.FN_Person_Details(1) 

--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.
	CREATE or ALTER FUNCTION FN_Person_Detail()
	RETURNS TABLE
	AS
		RETURN (SELECT * FROM Person
				WHERE JoiningDate > '1991-01-01')

	select * FROM dbo.FN_Person_Detail() 