
----------Implement Advanced level Joins----------

CREATE TABLE City(
	CityID INT PRIMARY KEY,
	Name VARCHAR(100) UNIQUE,
	Pincode INT NOT NULL,
	Remarks VARCHAR(255)
);

CREATE TABLE Village(
    VID INT PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	CityID INT,
	FOREIGN KEY (CityID) REFERENCES City(CityID)
);

INSERT INTO City(CityID,Name,Pincode, Remarks)VALUES
(1,'Rajkot', 360005,'Good'),
(2,'Surat', 335009,'Very Good'),
(3,'Baroda', 390001,'Awesome'),
(4,'Jamnagar', 361003,'Smart'),
(5,'Junagadh', 362229,'Historic'),
(6,'Morvi', 363641,'Ceramic');

INSERT INTO Village(VID,Name,CityID)VALUES
(101,'Raiya', 1),
(102,'Madhapar', 1),
(103,'Dodka', 3),
(104,'Falla', 4),
(105,'Bhesan', 5),
(106,'Dhoraji', 5);

--1. Display all the villages of Rajkot city.
	select City.Name "City",Village.Name "Village" from Village
	join City
	on Village.CityID = City.CityID
	where City.Name = 'Rajkot'

--2. Display city along with their villages & pin code.
	select City.Name "City",Village.Name "Village",City.Pincode "PinCode" from Village
	join City
	on Village.CityID = City.CityID

--3. Display the city having more than one village.
	select City.Name "City",COUNT(Village.CityID) "No Of Village" from Village
	join City
	on Village.CityID = City.CityID
	group by City.Name
	having COUNT(Village.CityID) > 1

--4. Display the city having no village.
	select City.Name "City" from City
	left join Village
	on Village.CityID = City.CityID
	where Village.CityID is null

--5. Count the total number of villages in each city.
	select C.Name as CityName, COUNT(V.VID) as TotalVillages from City C
	INNER JOIN Village V ON C.CityID = V.CityID
	group by C.Name;

--6. Count the number of cities having more than one village.
	select COUNT(*) "NO Of Cities With More Then One Village"
	from (
		select CityID from Village
		group by CityID
		having COUNT(VID) > 1
	) as CitiesWithMultipleVillages;



-----Constraints-----

--1. Do not allow SPI more than 10
--2. Do not allow Bklog less than 0.
--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified.

CREATE TABLE Stu_Master(
	Rno INT PRIMARY KEY,
	Name VARCHAR(100),
	Branch VARCHAR(100) default 'General',
	SPI decimal(8,2) check (SPI<=10),
	Bklog INT check (Bklog>=0)
);
INSERT INTO Stu_Master(Rno,Name,Branch, SPI,Bklog)VALUES
(101,'Raju','CE',8.80,0),
(102,'Amit','CE',2.20,3),
(103,'Sanjay','ME',1.50,6),
(104,'Neha','EC',7.65,0),
(105,'Meera','EE',5.52,2),
(106,'Mahesh',default,4.50,3);

Select * from Stu_Master

--4. Try to update SPI of Raju from 8.80 to 12.
	update Stu_Master
	set SPI = 12
	where Name = 'Raju'

--5. Try to update Bklog of Neha from 0 to -1.
	update Stu_Master
	set Bklog = -1
	where Name = 'Neha'




