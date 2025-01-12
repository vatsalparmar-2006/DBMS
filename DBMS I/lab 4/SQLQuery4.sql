
----------ALTER OPERATION----------

					-----PART-A-----
--1. Add two more columns City VARCHAR (20) and Pincode INT.
	alter table Deposit
	add City varchar(20), Pincode int

--2. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).
	alter table Deposit
	alter column cName varchar(35)

--3. Change the data type DECIMAL to INT in amount Column.
	alter table Deposit
	alter column amount int

--4. Rename Column ActNo to ANO.
	sp_rename'Deposit.actNo','aNo'

--5. Delete Column City from the DEPOSIT table.
	alter table Deposit
	drop column City

--6. Change name of table DEPOSIT to DEPOSIT_DETAIL.
	sp_rename Deposit,Deposit_Detail


					-----PART-B-----
--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
	sp_rename 'Deposit_Detail.aDate','aOpenDate'

--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table.
	alter table Deposit_Detail
	drop column aOpenDate

--3. Rename Column CNAME to CustomerName.
	sp_rename 'Deposit_Detail.cName','CustomerName'


					-----PART-C-----

 create table Student_Detail(
	enrollmentNo varchar(20),
	name varchar(25),
	cpi decimal(5,2),
	birthDate datetime
)

--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null).
	alter table Student_Detail
	add City varchar(20), Backlog int

--2. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35).
	alter table Student_Detail
	alter column name varchar(35)

--3. Change the data type DECIMAL to INT in CPI Column.
	alter table Student_Detail
	alter column cpi int

--4. Rename Column Enrollment_No to ENO.
	sp_rename 'Student_Detail.enrollmentNo','eNo'

--5. Delete Column City from the student_detail table.
	alter table Student_Detail
	drop column City

--6. Change name of table student_detail to STUDENT_MASTER.
	sp_rename Student_Detail,Student_Master





----------DELETE, Truncate, Drop Operation----------
					
					-----PART-A-----
--1. Delete all the records of DEPOSIT_DETAIL table having amount greater than and equals to 4000.
	delete from Deposit_Detail
	where amount >= 4000

--2. Delete all the accounts CHANDI BRANCH.
	delete from Deposit_Detail
	where bName = 'Chandi'

--3. Delete all the accounts having account number (ANO) is greater than 105.
	delete from Deposit_Detail
	where aNo >= 105

--4. Delete all the records of Deposit_Detail table. (Use Truncate)
	truncate table Deposit_Detail

--5. Remove Deposit_Detail table. (Use Drop)
	drop table Deposit_Detail


					-----PART-B-----
 create table Employee_Master(
	empNo int,
	empName varchar(25),
	joiningDate datetime,
	salary decimal(8,2),
	city varchar(20),
 )
 insert into Employee_Master(empNo,empName,joiningDate,salary,city) values (101,'Keyur','2002-1-5',12000,'Rajkot')
 insert into Employee_Master(empNo,empName,joiningDate,salary,city) values (102,'Hardik','2004-2-15',14000,'Ahmedabad')
 insert into Employee_Master(empNo,empName,joiningDate,salary,city) values (103,'Kajal','2006-3-14',15000,'Baroda')
 insert into Employee_Master(empNo,empName,joiningDate,salary,city) values (104,'Bhoomi','2005-6-23',12500,'Ahmedabad')
 insert into Employee_Master(empNo,empName,joiningDate,salary,city) values (105,'Harmit','2004-2-15',14000,'Rajkot')
 insert into Employee_Master(empNo,empName,joiningDate,salary,city) values (106,'Mitesh','2001-9-25',5000,'Jamnagar')
 insert into Employee_Master(empNo,empName,joiningDate,salary,city) values (107,'Meera',null,7000,'Morbi')
 insert into Employee_Master(empNo,empName,joiningDate,salary,city) values (108,'Kishan','2003-2-6',10000,NULL)
 
 SELECT * FROM Employee_Master

--1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.
	delete from Employee_Master
	where salary >= 14000

--2. Delete all the Employees who belongs to ‘RAJKOT’ city.
	delete from Employee_Master
	where city = 'Rajkot'

--3. Delete all the Employees who joined after 1-1-2007.
	delete from Employee_Master
	where joiningDate > '2007-1-1'

--4. Delete the records of Employees whose joining date is null and Name is not null.
	delete from Employee_Master
	where joiningDate is null  name is not null

--5. Delete the records of Employees whose salary is 50% of 20000.
	delete from Employee_Master
	where salary = 20000*0.5

--6. Delete the records of Employees whose City Name is not empty.
	delete from Employee_Master
	where city is not null

--7. Delete all the records of Employee_MASTER table. (Use Truncate)
	truncate table Employee_Master

--8. Remove Employee_MASTER table. (Use Drop)
	drop table Employee_Master



					-----PART-C-----
					--Summarize--
--1. Delete --> Data can be recover.
--2. Truncate --> Data can't recover
--3. Drop --> Whole table include structure also delete