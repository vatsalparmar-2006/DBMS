
---------- Advanced Stored Procedure  ----------

--------------------------------------------------PART-A------------------------------------------------

-- Create Departments Table 
CREATE TABLE Departments ( 
	DepartmentID INT PRIMARY KEY, 
	DepartmentName VARCHAR(100) NOT NULL UNIQUE, 
	ManagerID INT NOT NULL, 
	Location VARCHAR(100) NOT NULL 
); 

-- Create Employee Table 
CREATE TABLE Employee ( 
	EmployeeID INT PRIMARY KEY, 
	FirstName VARCHAR(100) NOT NULL, 
	LastName VARCHAR(100) NOT NULL, 
	DoB DATETIME NOT NULL, 
	Gender VARCHAR(50) NOT NULL, 
	HireDate DATETIME NOT NULL, 
	DepartmentID INT NOT NULL, 
	Salary DECIMAL(10, 2) NOT NULL, 
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
);

-- Create Projects Table 
CREATE TABLE Projects ( 
	ProjectID INT PRIMARY KEY, 
	ProjectName VARCHAR(100) NOT NULL, 
	StartDate DATETIME NOT NULL, 
	EndDate DATETIME NOT NULL, 
	DepartmentID INT NOT NULL, 
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
);


--insert in Departments
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location) 
VALUES  (1, 'IT', 101, 'New York'), 
		(2, 'HR', 102, 'San Francisco'), 
		(3, 'Finance', 103, 'Los Angeles'), 
		(4, 'Admin', 104, 'Chicago'), 
		(5, 'Marketing', 105, 'Miami');


--insert in Employee
INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID, Salary) 
VALUES  (101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00), 
		(102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00), 
		(103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00), 
		(104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00), 
		(105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00);


--insert in Projects
INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID) 
VALUES  (201, 'Project Alpha', '2022-01-01', '2022-12-31', 1), 
		(202, 'Project Beta', '2023-03-15', '2024-03-14', 2), 
		(203, 'Project Gamma', '2021-06-01', '2022-05-31', 3), 
		(204, 'Project Delta', '2020-10-10', '2021-10-09', 4), 
		(205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5);


--1. Create Stored Procedure for Employee table As User enters either First Name or Last Name and based 
--on this you must give EmployeeID, DOB, Gender & Hiredate.
	create or alter Proc Emp_Detalis_1
		@FirstName varchar(100) = null,
		@LastName varchar(100) = null
	as
	begin
		select EmployeeID,DoB,Gender,HireDate from Employee
		where FirstName = @FirstName or LastName = @LastName
	end

--2. Create a Procedure that will accept Department Name and based on that gives employees list who 
--belongs to that department.  
	create or alter Proc Emp_Detalis_2
		@DepartmentName varchar(100)
	as
	begin
		select * from Employee e
		join Departments d
		on e.DepartmentID = d.DepartmentID
		where DepartmentName = @DepartmentName
	end

--3.  Create a Procedure that accepts Project Name & Department Name and based on that you must give 
--all the project related details.  
	create or alter Proc Emp_Detalis_3
		@ProjectName varchar(100),
		@DepartmentName varchar(100)
	as
	begin
		select * from Projects p
		join Departments d
		on p.DepartmentID = d.DepartmentID
		where DepartmentName = @DepartmentName
	end

--4. Create a procedure that will accepts any integer and if salary is between provided integer, then those 
--employee list comes in output. 
	create or alter Proc Emp_Detalis_4
		@salary int,
		@intvalue int
	as
	begin
		select * from Employee e
		where Salary between @salary and @intvalue
	end

--5. Create a Procedure that will accepts a date and gives all the employees who all are hired on that date. 
	create or alter Proc Emp_Detalis_5
		@HireDate Date
	as
	begin
		select * from Employee e
		where HireDate = @HireDate 
	end


--------------------------------------------------PART-B------------------------------------------------

--6. Create a Procedure that accepts Gender’s first letter only and based on that employee details will be 
--served.  
	create or alter Proc Emp_Details_6
		@firstLetterOfGender char(1)
	as
	begin
		select * from Employee e
		where Gender like @firstLetterOfGender + '%'
	end

--7. Create a Procedure that accepts First Name or Department Name as input and based on that employee 
--data will come.
	create or alter Proc Emp_Details_7
		@FirstName varchar(100) = null ,
		@DepartmentName varchar(100) = null
	as
	begin
		select * from Employee e
		join Departments d
		on e.DepartmentID = d.DepartmentID
		where FirstName = @FirstName or DepartmentName = @DepartmentName
	end
	
--8. Create a procedure that will accepts location, if user enters a location any characters, then he/she will 
--get all the departments with all data. 
	create or alter Proc Emp_Details_8
		@Location varchar(100) 
	as
	begin
		select *,DepartmentName from Employee e
		join Departments d
		on e.DepartmentID = d.DepartmentID
		where Location like '%' + @Location + '%'
	end



------------------------------------------------- PART-C -----------------------------------------------

--9. Create a procedure that will accepts From Date & To Date and based on that he/she will retrieve Project 
--related data. 
	create or alter Proc Emp_Details_9
		@StartDate Date,
		@EndDate Date
	as
	begin
		select * from Projects p
		where StartDate = @StartDate and EndDate = @EndDate
	end

--10. Create a procedure in which user will enter project name & location and based on that you must 
--provide all data with Department Name, Manager Name with Project Name & Starting Ending Dates. 
	create or alter Proc Emp_Details_10
		@ProjectName varchar(100),
		@Location varchar(100)
	as
	begin
		select DepartmentName,FirstName,ProjectName,StartDate,EndDate from Departments d
		join Employee e
		on d.DepartmentID = e.DepartmentID
		join Projects p
		on p.DepartmentID = d.DepartmentID
		where ProjectName = @ProjectName and Location = @Location
	end