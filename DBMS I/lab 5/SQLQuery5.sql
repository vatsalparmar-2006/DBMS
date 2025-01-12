
----------Like operator----------

					-----PART-A-----
 create table Student(
	stuId int,
	firstName varchar(25),
	lastName varchar(25),
	webSite varchar(50),
	city varchar(25),
	address varchar(100),
 )
 insert into Student(stuId,firstName,lastName,webSite,city,address) values (1011,'Keyur','Patel','techonthenet.com','Rajkot','A-303 ''Vasant Kunj'', Rajkot')
 insert into Student(stuId,firstName,lastName,webSite,city,address) values (1022,'Hardik','Shah','digminecraft.com','Ahmedabad','"Ram Krupa", Raiya Road')
 insert into Student(stuId,firstName,lastName,webSite,city,address) values(1033,'Kajal','Trivedi','bigactivities.com','Baroda','Raj bhavan plot, near
garden')
 insert into Student(stuId,firstName,lastName,webSite,city,address) values(1044,'Bhoomi','Gajera','checkyourmath.com','Ahmedabad','"Jig''s Home", Narol')
 insert into Student(stuId,firstName,lastName,webSite,city,address) values(1055,'Harmit','Mitel','@me.darshan.com','Rajkot','B-55, Raj Residency')
 insert into Student(stuId,firstName,lastName,webSite,city,address) values(1066,'Ashok','Jani',null,'Baroda','A502, Club House Building')
 select * from Student

-- 1. Display the name of students whose name starts with ‘k’.
	select firstName from Student
	where firstName like 'k%'

--2. Display the name of students whose name consists of five characters.
	select firstName from Student
	where firstName like '_____'

--3. Retrieve the first name & last name of students whose city name ends with a & contains six characters.
	select firstName,lastName from Student
	where city like '_____a'

--4. Display all the students whose last name ends with ‘tel’.
	select * from Student
	where lastName like'%tel'

--5. Display all the students whose first name starts with ‘ha’ & ends with‘t’.
	select * from Student
	where firstName like 'ha%t'

--6. Display all the students whose first name starts with ‘k’ and third character is ‘y’.
	select * from Student
	where firstName like 'k_y%'

--7. Display the name of students having no website and name consists of five characters.
	select firstName from Student
	where webSite is null and firstName like '_____'
	
--8. Display all the students whose last name consist of ‘jer’.
	select * from Student
	where lastName like '%jer%'

--9. Display all the students whose city name starts with either ‘r’ or ‘b’.
	select * from Student
	where city like '[rb]%'

--10. Display all the name students having websites.
	select * from Student
	where webSite is not null

--11. Display all the students whose name starts from alphabet A to H.
	select * from Student
	where firstName like '[a-h]%'

--12. Display all the students whose name’s second character is vowel.
	select * from Student
	where firstName like '_[aeiou]%'

--13. Display the name of students having no website and name consists of minimum five characters.
	select firstName from Student
	where webSite is null and firstName like '_____%'

--14. Display all the students whose last name starts with ‘Pat’.
	select * from Student
	where lastName like 'pat%'

--15. Display all the students whose city name does not starts with ‘b’.
	select * from Student
	where city not like 'b%'


					-----PART-B-----
--1. Display all the students whose name starts from alphabet A or H.
	select * from Student
	where firstName like '[ah]%'

--2. Display all the students whose name’s second character is vowel and of and start with H.
	select * from Student
	where firstName like 'h[aeiou]%'

--3. Display all the students whose last name does not ends with ‘a’.
	select * from Student
	where lastName not like '%a'

--4. Display all the students whose first name starts with consonant.
	select * from Student
	where firstName not like '[aeiou]%'

--5. Display all the students whose website contains .net
	select * from Student
	where webSite like '%.net%'
 

					-----PART-C-----
--1. Display all the students whose address consist of -.
	select * from Student
	where address like '%-%'

--2. Display all the students whose address contains single quote or double quote.
	select * from Student
	where address like '%''%' or address like '%"%'

	select * from Student
	where address like '%''%''%' 

--3. Display all the students whose website contains @.
	select * from Student
	where webSite like '%@%'

--4. Display all the names those are either four or five characters.
	select firstName from Student
	where firstName like '_____' or firstName like '____'
