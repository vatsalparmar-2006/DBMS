
----------Subqueries and Set operator----------

-----Sub Queries-----
					-----PART-A-----

CREATE TABLE Stu_Detail(
	Rno INT,
	Name VARCHAR(50),
    City VARCHAR(50),
    DID INT,
);
INSERT INTO Stu_Detail(Rno,Name, City, DID)VALUES
(101,'Raju','Rajkot', 10),
(102,'Amit','Ahmedabad', 20),
(103,'Sanjay','Baroda', 40),
(104,'Neha','Rajkot', 20),
(105,'Meera','Ahmedabad', 30),
(106,'Mahesh','Baroda', 10);

CREATE TABLE Academic(
	Rno INT,
    SPI DECIMAL(3, 1),
	Bklog INT
);
INSERT INTO Academic(Rno, SPI,Bklog)VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

CREATE TABLE Department(
    DID INT,
	DName VARCHAR(50)
);
INSERT INTO Department(DID,DName)VALUES
(10,'Computer'),
(20,'Electrical'),
(30,'Mechanical'),
(40,'Civil');


--1. Display details of students who are from computer department.
	select * from Stu_Detail
	where DID = (select DID from Department				 where DNAME = 'COMPUTER')

--2. Displays name of students whose SPI is more than 8.
	select Name from Stu_Detail
	where Rno IN (select Rno from Academic				 where SPI > 8)

--3. Display details of students of computer department who belongs to Rajkot city.
	select * from Stu_Detail
	where City = 'Rajkot' and DID = (select DID from Department									where DNAME = 'COMPUTER')

--4. Find total number of students of electrical department.
	select COUNT(Rno) "No Of Stu In Ele." from Stu_Detail
	where DID = (select DID from Department				where DNAME = 'ELECTRICAL')

--5. Display name of student who is having maximum SPI.
	select Name from Stu_Detail
	where Rno = (select Rno from Academic				where SPI = (select max(SPI) from Academic))

--6. Display details of students having more than 1 backlog.
	select * from Stu_Detail
	where Rno IN (select Rno from Academic				where Bklog > 1)					-----PART-B-------1. Display name of students who are either from computer department or from mechanical department.
	select Name "Stu_Name" from Stu_Detail
	where DID IN (select DID from Department
				where DName in('Computer','Mechanical'));
	
--2. Display name of students who are in same department as 102 studying in.	select Name "Stu_Name" from Stu_Detail	where DID IN (select DID from Department				where Rno = 102);					-----PART-C-------1. Display name of students whose SPI is more than 9 and who is from electrical department.
	select Name "Stu_Name" from Stu_Detail
	where Rno IN (select Rno from Academic
				 where SPI>9)
	AND
		 DID IN (select DID from Department
				 where DName = 'Electrical')

--2. Display name of student who is having second highest SPI.
	select Name "SecondHighestSPI" from Stu_Detail 
	where Rno = (select Rno from Academic
				where SPI = (select max(SPI) from Academic
							where SPI < (select max(SPI) from Academic)))


	SELECT NAME FROM Stu_Detail
	WHERE RNO=(SELECT RNO FROM ACADEMIC			  WHERE SPI=( SELECT TOP 1 SPI
						FROM (SELECT DISTINCT TOP 2 SPI							FROM ACADEMIC
						ORDER BY SPI DESC) AS TEMP				ORDER BY SPI ASC)
			);

--3. Display city names whose students branch wise SPI is 9.2	select City from Stu_Detail	where Rno = (select Rno from Academic				where SPI=9.2)-----Set Operators-----
					-----PART-A-----CREATE TABLE Computer(
	RollNo INT,
	Name VARCHAR(50)
);
INSERT INTO Computer(RollNo,Name)VALUES
(101,'Ajay'),
(109,'Haresh'),
(115,'Manish');

CREATE TABLE Electrical(
	RollNo INT PRIMARY KEY,
	Name VARCHAR(50)
);
INSERT INTO Electrical(RollNo,Name)VALUES
(105,'Ajay'),
(107,'Mahesh'),
(115,'Manish');

--1. Display name of students who is either in Computer or in Electrical.
	select name as Stu_Name from Computer
	union
	select name from Electrical

--2. Display name of students who is either in Computer or in Electrical including duplicate data.
	select name as Stu_Name from Computer
	union all
	select name from Electrical

--3. Display name of students who is in both Computer and Electrical.
	select RollNo,Name as Stu_Name from Computer
	intersect
	select RollNo,Name from Electrical

--4. Display name of students who are in Computer but not in Electrical.
	select Name as Stu_Name from Computer
	except
	select Name from Electrical

--5. Display name of students who are in Electrical but not in Computer.
	select Name as Stu_Name from Electrical
	except
	select Name from Computer

--6. Display all the details of students who are either in Computer or in Electrical.
	select * from Computer
	union
	select * from Electrical

--7. Display all the details of students who are in both Computer and Electrical.
	select * from Computer
	intersect
	select * from Electrical


					-----PART-B-----

CREATE TABLE Emp_DATA(
    EID INT,
	Name VARCHAR(50)
);
INSERT INTO Emp_DATA(EID,Name)VALUES
(1,'Ajay'),
(9,'Haresh'),
(5,'Manish');


CREATE TABLE Customer(
    CID INT,
	Name VARCHAR(50)
);
INSERT INTO Customer(CID,Name)VALUES
(5,'Ajay'),
(7,'Mahesh'),
(5,'Manish');

--1. Display name of persons who is either Employee or Customer.
	select Name from Emp_DATA
	union
	select Name from Customer

--2. Display name of persons who is either Employee or Customer including duplicate data.
	select Name from Emp_DATA
	union all
	select Name from Customer

--3. Display name of persons who is both Employee as well as Customer.
	select Name from Emp_DATA
	intersect
	select Name from Customer
	
--4. Display name of persons who are Employee but not Customer.
	select Name from Emp_DATA
	except
	select Name from Customer

--5. Display name of persons who are Customer but not Employee.
	select Name from Customer
	except
	select Name from Emp_DATA


						-----PART-C-----

--1. Perform all the queries of Part-B but display ID and Name columns instead of Name only.
	
	--1.
		select EID,Name from Emp_DATA
		union
		select CID,Name from Customer

	--2. 
		select EID,Name from Emp_DATA
		union all
		select CID,Name from Customer

	--3. 
		select EID,Name from Emp_DATA
		intersect
		select CID,Name from Customer
	
	--4. 
		select EID,Name from Emp_DATA
		except
		select CID,Name from Customer

	--5.
		select CID,Name from Customer
		except
		select EID,Name from Emp_DATA