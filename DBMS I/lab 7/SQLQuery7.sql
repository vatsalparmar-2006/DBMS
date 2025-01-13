
----------Aggerate function and group by (without having)----------

					-----PART-A-----
create table EMP(
	eid int,
	eName varchar(25),
	department varchar(25),
	salary int,
	joiningDate datetime,
	city varchar(25),
 )
insert into EMP(eid,eName,department,salary,joiningDate,city) values 
				(101, 'Rahul', 'Admin', 56000, '1990-1-1','Rajkot'),
				(102,'Hardik','IT', 18000, '1990-9-25', 'Ahmedabad'),
				(103, 'Bhavin', 'HR', 25000, '1991-5-14', 'Baroda'),
				(104, 'Bhoomi', 'Admin', 39000, '1991-2-8', 'Rajkot'),
				(105, 'Rohit', 'IT', 17000, '1990-7-23', 'Jamnagar'),
				(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad'),
				(107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot')

select * from EMP

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
	select max(salary) as Highest_Salary,min(salary) as Lowest_Salary
	from EMP
	 
--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,
--respectively.
	select sum(salary) as Total_Sal, avg(salary) as Average_Sal
	from EMP

--3. Find total number of employees of EMPLOYEE table.
	select count(eid) as Total_No_Of_Employee
	from EMP

--4. Find highest salary from Rajkot city.
	select max(salary) as Highest_Salary
	from EMP
	where city='Rajkot'

--5. Give maximum salary from IT department.
	select max(salary) as Maximum_Salary
	from EMP
	where department='IT'

--6. Count employee whose joining date is after 8-feb-91.
	 select count(eid)
	 from EMP
	 where joiningDate > '1991-2-8'

--7. Display average salary of Admin department.
	select avg(salary) as Average_Salary
	from EMP
	where department='Admin'

--8. Display total salary of HR department.
	select sum(salary) as Total_Salary
	from EMP
	where department='HR'

--9. Count total number of cities of employee without duplication.
	select count(distinct city) as TotalNumberOfCities
	from EMP

--10. Count unique departments.
	select count(distinct department) as DistinctDepartments
	from EMP

--11. Give minimum salary of employee who belongs to Ahmedabad.
	select min(salary) as Minimum_Salary
	from EMP
	where city='Ahmedabad'

--12. Find city wise highest salary.
	select City,max(Salary) as MaxSalary
	from EMP
	group by city

--13. Find department wise lowest salary.
	select Department,min(salary) as LowestSalary
	from EMP
	group by department

--14. Display city with the total number of employees belonging to each city.
	select city,count(eId) as TotalNumberOfEmployee
	from EMP
	group by city

--15. Give total salary of each department of EMP table.
	select department,sum(salary) as Total_Salary
	from EMP
	group by department

--16. Give average salary of each department of EMP table without displaying the respective department
--name.
	select avg(salary) as Average_Salary
	from EMP
	group by department




					-----PART-B-----
--1. Count the number of employees living in Rajkot.
	select count(eId) as "Rajkot's_Employee" 
	from EMP
	where city='Rajkot'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
	select max(salary)-min(salary) as Difference
	from EMP
	
--3. Display the total number of employees hired before 1st January, 1991.
	select count(eid) as Hired_Before_1_1_1991
	from EMP
	where joiningDate < '1991-1-1'




					-----PART-C-----
--1. Count the number of employees living in Rajkot or Baroda.
	select city,count(eid) as NumberOfEmployee
	from EMP
	where city='Rajkot' or city='Baroda'
	group by city

--2. Display the total number of employees hired before 1st January, 1991 in IT department.
	select department,count(eid) as Hired_Before_1_1_1991
	from EMP
	where joiningDate<'1991-1-1' and department='IT'
	group by department

--3. Find the Joining Date wise Total Salaries.
	select joiningDate,sum(salary) as Total_Salaries
	from EMP
	group by joiningDate

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
	select department,city,max(salary)
	from EMP
	where city like 'R%'
	group by department,city