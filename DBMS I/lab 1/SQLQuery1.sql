create Database CSE_3A_246;

create table Deposit (
	actNo int,
	cName varchar(50),
	bName varchar(50),
	amount decimal(8,2),
	aDate datetime
);
insert into Deposit(actNo, cName, bName, amount, aDate) values(101,'ANIL','VRCE',1000,'1995-3-1');
insert into Deposit(actNo, cName, bName, amount, aDate) values(102,'SUNIL','AJNI',5000,'1996-1-4');
insert into Deposit(actNo, cName, bName, amount, aDate) values(103,'MEHUL','KAROLBAGH',3500,'1995-11-17');
insert into Deposit(actNo, cName, bName, amount, aDate) values(104,'MADHURI','CHANDI',1200,'1995-12-17');
insert into Deposit(actNo, cName, bName, amount, aDate) values(105,'PRAMOD','M.G.ROAD',3000,'1996-3-27');
insert into Deposit(actNo, cName, bName, amount, aDate) values(106,'SANDIP','ANDHERI',2000,'1996-3-31');
insert into Deposit(actNo, cName, bName, amount, aDate) values(107,'SHIVANI','VIRAR',1000,'1995-9-5');
insert into Deposit(actNo, cName, bName, amount, aDate) values(108,'KRANTI','NEHRU PLACE',5000,'1995-7-2');
insert into Deposit(actNo, cName, bName, amount, aDate) values(109,'MINU','POWAI',7000,'1995-8-10');
select * from Deposit;

create table Branch(
	bName varchar(50),
	city varchar(50)
)
insert into Branch values('VRCE', 'NAGPUR');
insert into Branch values('AJNI', 'NAGPUR');
insert into Branch values('KAROLBAGH', 'DELHI');
insert into Branch values('CHANDI', 'DELHI');
insert into Branch values('DHARAMPETH', 'NAGPUR');
insert into Branch values('M.G.ROAD', 'BANGLORE');
insert into Branch values('ANDHERI', 'BOMBAY');
insert into Branch values('VIRAR', 'BOMBAY');
insert into Branch values('NEHRU PLACE', 'DELHI');
insert into Branch values('POWAI', 'BOMBAY');
select * from Branch;


create table Customers(
	cName varchar(50),
	city varchar(50)	
)
insert into Customers(cName, city) values('ANIL', 'CALCUTTA');
insert into Customers(cName, city) values('SUNIL', 'DELHI');
insert into Customers(cName, city) values('MEHUL', 'BARODA');
insert into Customers(cName, city) values('MANDAR', 'PATNA');
insert into Customers(cName, city) values('MADHURI', 'NAGPUR');
insert into Customers(cName, city) values('PRAMOD', 'NAGPUR');
insert into Customers(cName, city) values('SANDIP', 'SURAT');
insert into Customers(cName, city) values('SHIVANI', 'BOMBAY');
insert into Customers(cName, city) values('KRANTI', 'BOMBAY');
insert into Customers(cName, city) values('NAREN', 'BOMBAY');									
select * from Customers;


create table Borrow(
	loanNo int,
	cName varchar(50),
	bName varchar(50),
	amount decimal(8,2),
)
insert into Borrow values(201, 'ANIL','VRCE', 1000);
insert into Borrow values(206, 'MUHUL','AJNI', 5000);
insert into Borrow values(311, 'SUNIL','DHARAMPETH', 3000);
insert into Borrow values(321, 'MADHURI','ANDHERI', 2000);
insert into Borrow values(375, 'PRAMOD','VIRAR', 8000);
insert into Borrow values(481, 'KRANTI','NEHRU PLACE', 3000);
SELECT * FROM Borrow




