
create table Cricket (
	name varchar(50),
	cName varchar(50),
	age int
)
insert into Cricket(name,cName,age) values ('Sachin Tendulkar','Mumbai',30)
insert into Cricket(name,cName,age) values ('Rahul Dravid','Bombay',35)
insert into Cricket(name,cName,age) values ('M.S. Dhoni','Jharkhand',31)
insert into Cricket(name,cName,age) values ('Suresh Raina','Gujarat',30)

create table Employee(
	name varchar(50),
	cName varchar(50),
	age int
)
insert into Cricket(name,cName,age) values ('Jay Patel','Rajkot',30)
insert into Cricket(name,cName,age) values ('Rahul Dave','Baroda',35)
insert into Cricket(name,cName,age) values ('Jeet Patel','Surat',31)
insert into Cricket(name,cName,age) values ('Vijay Raval','Rajkot',30)


					--PART-A--
--1. Create table Worldcup from cricket with all the columns and data.
	select * into Worldcup from Cricket
	drop table Employee_info

	select * from Worldcup  -- For WorldCup table data --

--2. Create table T20 from cricket with first two columns with no data.
	select name,cName into T20 from Cricket where 1=2 

--3. Create table IPL From Cricket with No Data
	select * into IPL from Cricket where 1=2

					--PART-B--
--1. Create table Employee_detail from Employee with all the columns and data.
	select * into Employee_detail from Employee

--2. Create table Employee_data from Employee with first two columns with no data.
	select name,cName into Employee_data from Employee where 1=2

--3. Create table Employee_info from Employee with no Data
	select * into Employee_info from Employee where 1=2

					--PART-C--
--1. Insert the Data into Employee_info from Employee whose CITY is Rajkot
	 insert into Employee_info
	 select * from Employee
	 where cName = 'Rajkot'

--2. Insert the Data into Employee_info from Employee whose age is more than 32.
	insert into Employee_info
	select * from Employee
	where age>32



--Update Operation--

--1. Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table)
	update Deposit 
	set amount = 5000
	where amount = 3000

--2. Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)
	update Borrow 
	set bName = 'C.G.ROAD'
	where bName = 'VRCE' AND cName = 'ANIL'

--3. Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table)
	update Deposit 
	set actNo = 111, amount = 5000
	where cName = 'SANDIP'

--4. Update amount of KRANTI to 7000. (Use Deposit Table)
	update Deposit 
	set amount = 7000
	where cName = 'KRANTI'

--5. Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table)
	update Branch 
	set bName = 'ANDHERI WEST'
	where bName = 'ANDHERI'

--6. Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table)
	update Deposit 
	set bName = 'NEHRU PALACE'
	where cName = 'MEHUL'

--7. Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit
--Table)
	update Deposit 
	set amount = 5000
	where actNo BETWEEN 103 and 107

--8. Update ADATE of ANIL to 1-4-95. (Use Deposit Table)
	update Deposit 
	set aDate = 1995-4-1
	where cName = 'ANIL'

--9. Update the amount of MINU to 10000. (Use Deposit Table)
	update Deposit 
	set amount = 10000
	where cName = 'MINU'

--10. Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table)
	update Deposit 
	set amount = 5000, aDate = 1996-4-1
	where cName = 'PRAMOD'

						--PART-B--
--1. Give 10% Increment in Loan Amount. (Use Borrow Table)
	update Borrow
	set amount=amount*0.1
	select * from Borrow
	
--2. Customer deposits additional 20% amount to their account, update the same. (Use Deposit Table)
	update Deposit
	set amount=amount*0.2
	select * from Deposit 


						--PART-C--
--1. Update amount of loan no 321 to NULL. (Use Borrow Table)
	update Borrow
	set amount = null
	where loanNo = 321

--2. Update branch name of KRANTI to NULL (Use Borrow Table)
	update Borrow
	set bName = null
	where bName = 'KRANTI'

--3. Display the name of borrowers whose amount is NULL. (Use Borrow Table)
	update Borrow
	set bName = null
	where amount is null

--4. Display the Borrowers whose having branch. (Use Borrow Table)
	select * from Borrow
	where bName != null
	
--5. Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481.
--(Use Borrow Table)
	update Borrow
	set amount=5000, bName='VRCE',cName='Darshan'
	where loanNo=481
	
--6. Update the Deposit table and set the date to 01-01-2021 for all the depositor whose amount is less
--than 2000.
	update Deposit
	set aDate = '2021-01-01'
	where amount<2000

--7. Update the Deposit table and set the date to NULL & Branch name to ‘ANDHERI whose Account No is
--110.
	update Deposit
	set aDate = null,bName='ANDHERI'
	where actNo<110
