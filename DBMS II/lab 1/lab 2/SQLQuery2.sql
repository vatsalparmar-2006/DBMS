 
---------- Stored Procedure  ----------

--------------------------------------------------PART-A------------------------------------------------

-- Create Department Table 
CREATE TABLE Department ( 
	DepartmentID INT PRIMARY KEY, 
	DepartmentName VARCHAR(100) NOT NULL UNIQUE 
); 

-- Create Designation Table 
CREATE TABLE Designation ( 
	DesignationID INT PRIMARY KEY, 
	DesignationName VARCHAR(100) NOT NULL UNIQUE 
); 

-- Create Person Table 
CREATE TABLE Person ( 
	PersonID INT PRIMARY KEY IDENTITY(101,1), 
	FirstName VARCHAR(100) NOT NULL, 
	LastName VARCHAR(100) NOT NULL, 
	Salary DECIMAL(8, 2) NOT NULL, 
	JoiningDate DATETIME NOT NULL, 
	DepartmentID INT NULL, 
	DesignationID INT NULL, 
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID), 
	FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID) 
);


--1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures.

------------------------------------ Departrment insert--------------------------------------------

	CREATE PROCEDURE PR_Department_Insert
		@DepartmentID int,
		@DepartmentName varchar(100)
	AS
	BEGIN
		INSERT INTO Department
		VALUES(@DepartmentID,@DepartmentName)
	END

	EXEC PR_Department_Insert 1,'Admin'
	EXEC PR_Department_Insert 2,'IT'
	EXEC PR_Department_Insert 3,'HR'
	EXEC PR_Department_Insert 4,'Account'


------------------------------------ Designation insert--------------------------------------------

	CREATE PROCEDURE PR_Designation_Insert
		@DesignationID int,
		@DesignationName varchar(100)
	AS
	BEGIN
		INSERT INTO Designation 
		VALUES(@DesignationID,@DesignationName)
	END

	EXEC PR_Designation_Insert 11,'Jobber'
	EXEC PR_Designation_Insert 12,'Welder'
	EXEC PR_Designation_Insert 13,'Clerk'
	EXEC PR_Designation_Insert 14,'Manager'
	EXEC PR_Designation_Insert 15,'CEO'

	
------------------------------------ Person insert--------------------------------------------

	CREATE or ALTER PROCEDURE PR_Person_Insert
		@FirstName varchar(100),
		@LastName VARCHAR(100),
		@Salary DECIMAL(8,2),
		@JoiningDate Datetime,
		@DepartmentID INT,
		@DesignationID INT
	AS
	BEGIN
		INSERT INTO Person
		VALUES(@FirstName,@LastName,@Salary,@JoiningDate,@DepartmentID,@DesignationID)
	END

	EXEC PR_Person_Insert 'Rahul','Anshu', 56000, '01-01-1990', 1, 12
	EXEC PR_Person_Insert 'Hardik','Hinsu', 18000, '1990-09-25', 2, 11
	EXEC PR_Person_Insert 'Bhavin','Kamani', 25000, '1991-05-14', NULL, 11
	EXEC PR_Person_Insert 'Bhoomi','Patel', 39000, '2014-02-20 ', 1, 13
	EXEC PR_Person_Insert 'Rohit','Rajgor',17000, '1990-07-23', 2, 15
	EXEC PR_Person_Insert 'Priya','Mehta',25000, '1990-10-18', 2, NULL
	EXEC PR_Person_Insert 'Neha','Trivedi',18000, '2014-02-20', 3, 15


	----------------------------------------Delete-------------------------------------------------
------------------------------------ Departrment delete--------------------------------------------

	CREATE or ALTER PROCEDURE PR_Department_Delete
		@DepartmentID int
	AS
	BEGIN
		DELETE FROM Department
		WHERE DepartmentID = @DepartmentID
	END

	EXEC PR_Department_Delete 3


------------------------------------ Designation delete--------------------------------------------

	CREATE or ALTER PROCEDURE PR_Designation_Delete
		@DesignationID int
	AS
	BEGIN
		DELETE FROM Designation
		WHERE DesignationID = @DesignationID
	END

------------------------------------ Person delete--------------------------------------------

	CREATE or ALTER PROCEDURE PR_Person_Delete
		@PersonID int
	AS
	BEGIN
		DELETE FROM Person
		WHERE PersonID = @PersonID
	END


	---------------------------------------Update---------------------------------------------
------------------------------------ Departrment update --------------------------------------------

	CREATE or ALTER PROCEDURE PR_Departrment_Update
		@DepartmentID int,
		@DepartmentName varchar(100)
	AS
	BEGIN
		UPDATE Department
		SET DepartmentName = @DepartmentName		
		WHERE DepartmentID = @DepartmentID
	END


------------------------------------ Designation update--------------------------------------------

	CREATE or ALTER PROCEDURE PR_Designation_Update
		@DesignationID int,
		@DesignationName varchar(100)
	AS
	BEGIN
		UPDATE Designation
		SET DesignationName = @DesignationName		
		WHERE DesignationID = @DesignationID
	END


------------------------------------ Person update--------------------------------------------

	CREATE or ALTER PROCEDURE PR_Person_Update
		@PersonID int,
		@PersonnName varchar(100)
	AS
	BEGIN
		UPDATE Designation
		SET DesignationName = @DesignationName		
		WHERE DesignationID = @DesignationID
	END


--2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY

------------------------------------ Departrment Selection--------------------------------------------

	CREATE or ALTER PROC PR_Departrment_Details
		@DepartrmentID int
	AS
	BEGIN
		SELECT * FROM Department
		WHERE DepartmentID = @DepartrmentID
	END

------------------------------------ Designation Selection--------------------------------------------

	CREATE or ALTER PROC PR_Designation_Details
		@DesignationID int
	AS
	BEGIN
		SELECT * FROM Designation
		WHERE DesignationID = @DesignationID
	END

------------------------------------ Person Selection--------------------------------------------

	CREATE or ALTER PROC PR_Person_Details
		@PersonID int
	AS
	BEGIN
		SELECT * FROM Person
		WHERE PersonID = @PersonID
	END


--3. Department, Designation & Person Table’s (If foreign key is available then do write join and take 
--columns on select list) 

	CREATE OR ALTER PROC PR_All_Details
	AS
	BEGIN 
		SELECT * FROM Person P
		JOIN Department DEPT
		ON P.DepartmentID = DEPT.DepartmentID
		JOIN Designation DESI
		ON P.DesignationID = DESI.DesignationID
	END


--4. Create a Procedure that shows details of the first 3 persons.
	
	CREATE OR ALTER PROC PR_Top3PersonDetails
	AS
	BEGIN 
		SELECT TOP 3 * FROM Person P
		JOIN Department DEPT
		ON P.DepartmentID = DEPT.DepartmentID
		JOIN Designation DESI
		ON P.DesignationID = DESI.DesignationID
	END


------------------------------------------- PART-B -----------------------------------------------

--5. Create a Procedure that takes the department name as input and returns a table with all workers 
--working in that department. 
	create or alter Proc PR_Details1
		@dName varchar(100)
	as
	begin 
		select * from Person p
		join Department D
		on P.DepartmentID = D.DepartmentID
		where DepartmentName = @dName
	end

--6. Create Procedure that takes department name & designation name as input and returns a table with 
--worker’s first name, salary, joining date & department name.
	create or alter Proc PR_Details2
		@dName varchar(100),
		@desiName varchar(100)
	as
	begin 
		select FirstName,Salary,JoiningDate,DepartmentName from Person p
		join Department D
		on P.DepartmentID = D.DepartmentID
		join Designation De
		on P.DesignationID = De.DesignationID
		where DepartmentName = @dName and DesignationName = @desiName
	end

--7. Create a Procedure that takes the first name as an input parameter and display all the details of the 
--worker with their department & designation name.
	create or alter Proc PR_Details3
		@fName varchar(100)
	as
	begin 
		select *,DepartmentName,DesignationName from Person P
		join Department D
		on P.DepartmentID = D.DepartmentID
		join Designation De
		on P.DesignationID = De.DesignationID
		where FirstName = @fName
	end

--8. Create Procedure which displays department wise maximum, minimum & total salaries.
	create or alter Proc PR_Details4
	as
	begin
		select DepartmentName,max(Salary) as MaxSal,min(Salary) as MinSal,sum(Salary) as TotalSal from Person P
		join Department D
		on P.DepartmentID = D.DepartmentID
		group by DepartmentName
	end
   

--9. Create Procedure which displays designation wise average & total salaries.
	create or alter Proc PR_Details5
	as
	begin
		select DesignationName,avg(Salary) as AvgSal,sum(Salary) as TotalSal from Person P
		join Designation D
		on P.DesignationID = D.DesignationID
		group by DesignationName
	end


------------------------------------------- PART-C -----------------------------------------------

--10. Create Procedure that Accepts Department Name and Returns Person Count. 
	create or alter Proc PR_Details6
		@deptName varchar(100),
		@personCnt int out
	as
	begin
		select @personCnt = COUNT(PersonID) from Person P
		join Department D
		on P.DepartmentID = D.DepartmentID
		where DepartmentName = @deptName
	end

	declare @personCount int
	exec PR_Details6 'IT', @personCount output 
	select @personCount

--11. Create a procedure that takes a salary value as input and returns all workers with a salary greater than 
--input salary value along with their department and designation details.
	create or alter Proc PR_Details7
		@Salary decimal(8,2)
	as
	begin
		select *,DepartmentName,DesignationNAme from Person P
		join Department Dept
		on P.DepartmentID = Dept.DepartmentID
		join Designation Desi
		on p.DesignationID = desi.DesignationID
		where Salary > @Salary
	end

--12. Create a procedure to find the department(s) with the highest total salary among all departments. 
	create or alter Proc PR_Details8
	as
	begin
		select DepartmentName,sum(Salary) as TotalSalary from Department d
		join Person p
		on d.DepartmentID = p.DepartmentID
		group by DepartmentName
		having sum(Salary) = (select max(TotalSalary) from (select d.DepartmentID,sum(Salary) as TotalSalary
															from Department D
															join Person p
															on d.DepartmentID = p.DepartmentID
															group by d.DepartmentID) as SubQuery)
	end

--13. Create a procedure that takes a designation name as input and returns a list of all workers under that 
--designation who joined within the last 10 years, along with their department.
	create or alter Proc PR_Details9
		@desiName varchar(100)
	as
	begin
		select *,DepartmentName,DesignationName from Person P
		join Department Dept
		on P.DepartmentID = Dept.DepartmentID
		join Designation Desi
		on p.DesignationID = desi.DesignationID
		where DesignationName = @desiName and 
			  datediff(YEAR,JoiningDate,GETDATE()) > 10
	end

--14. Create a procedure to list the number of workers in each department who do not have a designation 
--assigned. 
	create or alter Proc PR_Details10
	as
	begin
		select DepartmentName,count(PersonID) as PersonWithoutDesignation from Department Dept
		join Person P
		on Dept.DepartmentID = P.DepartmentID
		join Designation Desi
		on p.DesignationID = desi.DesignationID
		where p.DesignationID is null
		group by DepartmentName
	end

--15. Create a procedure to retrieve the details of workers in departments where the average salary is above 
--12000.
	create or alter Proc PR_Details11
	as
	begin
		select DepartmentName from Person P
		join Department d
		on p.DepartmentID = d.DepartmentID
		group by DepartmentName
		having avg(Salary) > 12000
	end