
----------Implement SQL View----------


					-----PART-A-----
create table Student_Info (
	rno int,
	name varchar(30),
	branch varchar(20),
	spi decimal(8,2),
	bklog int,
)
insert into Student_Info(rno,name,branch,spi,bklog) values
														(101,'Raju', 'CE', 8.80, 0),
														(102,'Amit', 'CE', 2.20, 3),
														(103,'Sanjay', 'ME', 1.50, 6),
														(104,'Neha', 'EC', 7.65, 1),
														(105,'Meera', 'EE', 5.52, 2),
														(106,'Mahesh', 'EC', 4.50, 3)

--1. Create a view Personal with all columns.
	create view Personal
	as
	select * 
	from Student_Info

--2. Create a view Student_Details having columns Name, Branch & SPI.
	create view Student_Details
	as 
	select name,branch,spi
	from Student_Info

--3. Create a view AcademicData having columns RNo, Name, Branch.
	create view AcademicData
	as 
	select rno,name,branch
	from Student_Info

--4. Create a view Student_ bklog having all columns but students whose bklog more than 2.
	create view Student_bklog
	as 
	select *
	from Student_Info
	where bklog>2

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four--letters.
	create view Student_Pattern
	as 
	select rno,name,branch
	from Student_Info
	where name like '____'

--6. Insert a new record to AcademicData view. (107, Meet, ME)
	insert into AcademicData values(107,'Meet','ME')

--7. Update the branch of Amit from CE to ME in Student_Details view.
	update Student_Details
	set branch = 'ME'
	where name = 'Amit'

--8. Delete a student whose roll number is 104 from AcademicData view.
	delete from AcademicData
	where rno = 104

	select * from Personal
	select * from Student_Details
	select * from AcademicData
	select * from Student_bklog
	select * from Student_Pattern



					-----PART-B-----

--1. Create a view that displays information of all students whose SPI is above 8.5
	create view Student_spi
	as 
	select *
	from Student_Info
	where spi > 8.5

--2. Create a view that displays 0 backlog students.
	create view Student_Bklog_Zero
	as 
	select *
	from Student_Info
	where bklog=0

--3. Create a view Computerview that displays CE branch data only.
	create view ComputerView
	as 
	select *
	from Student_Info
	where branch = 'CE'


	 select * from Student_spi
	 select * from Student_Bklog_Zero
	 select * from ComputerView



					-----PART-C-----

--1. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.
	create view Result_EC
	as
	select name,spi
	from Student_Info
	where spi<5 and Branch = 'EC'

--2. Update the result of student MAHESH to 4.90 in Result_EC view.
	update Result_EC
	set spi=4.9
	where name='Mahesh'

--3. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having--bklogs more than 5.
	create view Stu_Bklog
	as
	select rno,name,bklog
	from Student_Info
	where name like 'M%' and bklog>5

--4. Drop Computerview form the database.
	drop view ComputerView


	select * from Result_EC
	select * from Stu_Bklog
	select * from ComputerView