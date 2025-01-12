
				--PART A--

--1. Retrieve all data from table DEPOSIT.
	select * from Deposit

--2. Retrieve all data from table BORROW.
	select * from Borrow

--3. Retrieve all data from table CUSTOMERS.
	select * from Customers

--4. Display Account No, Customer Name & Amount from DEPOSIT.
	select actNo,cName,amount from Deposit

--5. Display Loan No, Amount from BORROW.
	select loanNo,amount from Borrow

--6. Display loan details of all customers who belongs to ‘ANDHERI’ branch from borrow table.
	select * from Borrow where bName='ANDHERI'

--7. Give account no and amount of depositor, whose account no is equals to 106 from deposit table.
	select actNo,amount from Deposit where actNo=106

--8. Give name of borrowers having amount greater than 5000 from borrow table.
	select cName from Borrow where amount>5000

--9. Give name of customers who opened account after date '1-12-96' from deposit table.
	select cName from Deposit where aDate > 1996-12-1

--10. Display name of customers whose account no is less than 105 from deposit table.
	select cName from Deposit where actNo<105

--11. Display name of customer who belongs to either ‘NAGPUR’ or ‘DELHI’ from customer table. (OR & IN)
	select cName from Customers where city='Nagpur' or city='Delhi'

	select cName from Customers where city in('Nagpur','Delhi')

--12. Display name of customers with branch whose amount is greater than 4000 and account no is less than
--105 from deposit table.
	select cName,bName from Deposit where amount>4000 and actNo<105

--13. Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow
--table. (AND & BETWEEN)
	select * from Borrow where amount >= 3000 and amount <= 8000

	select * from Borrow where amount between 3000 and 8000

--14. Find all depositors who do not belongs to ‘ANDHERI’ branch from deposit table.
	select * from Deposit where bName<> 'Andheri'

--15. Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’
--Or ‘M.G.ROAD’ and Account No is less than 104 from deposit table
	select actNo,cName,amount from Deposit where bName in('AJNI','KAROLBAGH','M.G.ROAD') and actNo<104

		

			--PART B--

--1. Display all the details of first five customers from deposit table.
	select top 5 * from Deposit

--2. Display all the details of first three depositors whose amount is greater than 1000.
	select top 3 * from Deposit where amount>1000

--3. Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to
--‘ANDHERI’ from borrow table.
	select top 5 loanNo,cName from Borrow where bName<>'Andheri'

--4. Retrieve all unique cities using DISTINCT. (Use Customers Table)
	select distinct cName from Customers

--5. Retrieve all unique branches using DISTINCT. (Use Branch Table)
	select distinct bName from Branch


				--PART C--

--1. Retrieve top 50% record from table BORROW.
	select top 50 percent * from Borrow

--2. Display top 10% amount from table DEPOSIT.
	select top 10 percent amount from Deposit

--3. Display top 25% customer who deposited more than 5000.
	select top 25 percent * from Deposit
	where amount>5000

--4. Retrieve first 10% Loan Amounts.
	select top 10 percent amount from Borrow

--5. Retrieve all unique customer names with city.
	select distinct * from Customers

--6. Retrieve all Loan records with one more column in Loan Amount as 10% extra amount.
	select *, (amount + amount*0.1) as Extra_Amount from Borrow 

--7. Retrieve all odd/even value loan number from Borrow table
	select loanNo from Borrow where loanNo%2=1  --Retrive all Odd data