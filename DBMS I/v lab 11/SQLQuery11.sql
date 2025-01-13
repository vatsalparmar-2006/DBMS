
----------Implement SQL Joins----------

					-----PART-A-----
create table STU_INFO(
	rno int,
	name varchar(50),
	branch varchar(50)
)
insert into STU_INFO(Rno, Name, Branch) values
											(101, 'Raju', 'CE'),
											(102, 'Amit', 'CE'),
											(103, 'Sanjay', 'ME'),
											(104, 'Neha', 'EC'),
											(105, 'Meera', 'EE'),
											(106, 'Mahesh', 'ME');
select * from STU_INFO


create table RESULT(
	rno int,
	spi decimal(8,2)
)
insert into RESULT(rno, spi) values
								(101, 8.8),
								(102, 9.2),
								(103, 7.6),
								(104, 8.2),
								(105, 7.0),
								(107, 8.9);
select * from RESULT


create table EMPLOYEE_MASTER(
	employeeNo varchar(50),
	name varchar(50),
	managerNo varchar(50)
)
insert into EMPLOYEE_MASTER(employeeNo, name, managerNo) values
															('E01','Tarun',NULL),
															('E02','Rohan','E02'),
															('E03','Priya','E01'),
															('E04','Milan','E03'),
															('E05','Jay','E01'),
															('E06','Anjana','E04');
select * from EMPLOYEE_MASTER


					-----PART-A-----

--1. Combine information from student and result table using cross join or Cartesian product.
	select *
	from STU_INFO, RESULT

	select *
	from STU_INFO cross join RESULT

--2. Perform inner join on Student and Result tables.
	select * from STU_INFO
	inner join RESULT
	on STU_INFO.rno = RESULT.rno

--3. Perform the left outer join on Student and Result tables.
	select * from STU_INFO sinfo
	left outer join RESULT res
	on sinfo.rno = res.rno
	
--4. Perform the right outer join on Student and Result tables.
	select * from STU_INFO sinfo
	right outer join RESULT res
	on sinfo.rno = res.rno
	
--5. Perform the full outer join on Student and Result tables.
	select * from STU_INFO sinfo
	full outer join RESULT res
	on sinfo.rno = res.rno

--6. Display Rno, Name, Branch and SPI of all students.
	select sinfo.rno, sinfo.name, sinfo.branch, res.spi from STU_INFO sinfo
	left outer join RESULT res
	on sinfo.rno = res.rno

--7. Display Rno, Name, Branch and SPI of CE branch’s student only.
	select sinfo.rno, sinfo.name, sinfo.branch, res.spi from STU_INFO sinfo
	left outer join RESULT res
	on sinfo.rno = res.rno
	where sinfo.branch = 'CE'

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only.
	select sinfo.rno, sinfo.name, sinfo.branch, res.spi from STU_INFO sinfo
	left outer join RESULT res
	on sinfo.rno = res.rno
	where sinfo.branch != 'EC'

--9. Display average result of each branch.
	select sinfo.branch,avg(res.spi) from STU_INFO sinfo
	join RESULT res
	on sinfo.rno = res.rno
	group by sinfo.branch

--10. Display average result of CE and ME branch.
	select sinfo.branch,avg(res.spi) as Avg_SPI from STU_INFO sinfo
	join RESULT res
	on sinfo.rno = res.rno
	where sinfo.branch = 'CE' or sinfo.branch = 'ME'
	group by sinfo.branch
	



					-----PART-B-----

--1. Display average result of each branch and sort them in ascending order by SPI.
	select sinfo.branch,avg(res.spi) as Avg_SPI from STU_INFO sinfo
	join RESULT res
	on sinfo.rno = res.rno
	group by sinfo.branch
	order by res.spi

--2. Display highest SPI from each branch and sort them in descending order.
	select sinfo.branch,max(res.spi) as Max_SPI from STU_INFO sinfo
	join RESULT res
	on sinfo.rno = res.rno
	group by sinfo.branch
	order by max(res.spi) DESC



					-----PART-C (SELF JOIN)-----

--1. Retrieve the names of employee along with their manager’s name from the Employee table.
	select e1.name as empNo,e2.name as managerName from EMPLOYEE_MASTER e1
	join EMPLOYEE_MASTER e2
	on e1.employeeNo = e2.managerNo
