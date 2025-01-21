
---------- Cursor   ----------

--------------------------------------------------PART-A------------------------------------------------

--  Create the Products table 
CREATE TABLE Products ( 
	Product_id INT PRIMARY KEY, 
	Product_Name VARCHAR(250) NOT NULL, 
	Price DECIMAL(10, 2) NOT NULL 
); 

--  Insert data into the Products table 
INSERT INTO Products (Product_id, Product_Name, Price) VALUES 
(21, 'Smartphone', 35000), 
(22, 'Laptop', 65000), 
(23, 'Headphones', 5500), 
(24, 'Television', 85000), 
(25, 'Gaming Console', 32000);

--  Create the NewProducts table 
CREATE TABLE NewProducts ( 
	Product_id INT PRIMARY KEY, 
	Product_Name VARCHAR(250) NOT NULL, 
	Price DECIMAL(10, 2) NOT NULL 
); 

--  Create the ArchivedProducts table 
CREATE TABLE ArchivedProducts ( 
	Product_id INT PRIMARY KEY, 
	Product_Name VARCHAR(250) NOT NULL, 
	Price DECIMAL(10, 2) NOT NULL 
); 



--1. Create a cursor Product_Cursor to fetch all the rows from a products table. 
	Declare @id int, @name varchar(100), @price decimal(10,2)

	Declare cursor_Details CURSOR
	FOR 
		SELECT Product_id, Product_Name, Price FROM Products

	OPEN cursor_Details

	FETCH NEXT FROM cursor_Details
	INTO @id, @name, @price

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		PRINT(CAST(@id AS VARCHAR(100)) + '. ' +  @name + ' ' + CAST(@price as VARCHAR(100)))

		FETCH NEXT FROM cursor_Details
		INTO @id, @name, @price
	END

	CLOSE cursor_Details

	DEALLOCATE cursor_Details

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName. 
	Declare @Pid int, @Pname varchar(100)

	Declare Product_Cursor_Fetch CURSOR
	FOR 
		SELECT Product_id, Product_Name FROM Products

	OPEN Product_Cursor_Fetch

	FETCH NEXT FROM Product_Cursor_Fetch
	INTO @Pid, @Pname

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		PRINT(CAST(@Pid AS VARCHAR(100)) + '_' +  @Pname )

		FETCH NEXT FROM Product_Cursor_Fetch
		INTO @Pid, @Pname
	END

	CLOSE Product_Cursor_Fetch

	DEALLOCATE Product_Cursor_Fetch

--3. Create a Cursor to Find and Display Products Above Price 30,000.
	Declare @id int, @name varchar(100), @price decimal(10,2)

	Declare cursor_Find_Display CURSOR
	FOR 
		SELECT Product_id, Product_Name, Price FROM Products

	OPEN cursor_Find_Display

	FETCH NEXT FROM cursor_Find_Display
	INTO @id, @name, @price

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		IF @price > 30000
			PRINT(CAST(@id AS VARCHAR(100)) + '. ' +  @name + ' ' + CAST(@price as VARCHAR(100)))

		FETCH NEXT FROM cursor_Find_Display
		INTO @id, @name, @price
	END

	CLOSE cursor_Find_Display

	DEALLOCATE cursor_Find_Display

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
	Declare @id int

	Declare cursor_Delete_Data CURSOR
	FOR 
		SELECT Product_id FROM Products

	OPEN cursor_Delete_Data

	FETCH NEXT FROM cursor_Delete_Data
	INTO @id

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		DELETE FROM  Products
		WHERE Product_id = @id

		FETCH NEXT FROM cursor_Delete_Data
		INTO @id
	END

	CLOSE cursor_Delete_Data

	DEALLOCATE cursor_Delete_Data



--------------------------------------------------PART-B------------------------------------------------

--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases 
--the price by 10%. 
	Declare @id int, @name varchar(100), @price decimal(10,2)

	Declare Product_CursorUpdate CURSOR
	FOR 
		SELECT * FROM Products

	OPEN Product_CursorUpdate

	FETCH NEXT FROM Product_CursorUpdate
	INTO @id, @name, @price

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		UPDATE Products
		SET Price = Price + Price*0.1
		WHERE Product_id = @id

		FETCH NEXT FROM Product_CursorUpdate
		INTO @id,@name, @price
	END

	CLOSE Product_CursorUpdate

	DEALLOCATE Product_CursorUpdate

	SELECT * FROM Products

--6. Create a Cursor to Rounds the price of each product to the nearest whole number.
	Declare @id int, @name varchar(100), @price decimal(10,2)

	Declare Cursor_Round_Off CURSOR
	FOR 
		SELECT * FROM Products

	OPEN Cursor_Round_Off

	FETCH NEXT FROM Cursor_Round_Off
	INTO @id, @name, @price

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		UPDATE Products
		SET Price = ROUND(Price, 0)
		WHERE Product_id = @id

		FETCH NEXT FROM Cursor_Round_Off
		INTO @id,@name, @price
	END

	CLOSE Cursor_Round_Off

	DEALLOCATE Cursor_Round_Off

	SELECT * FROM Products


--------------------------------------------------PART-C------------------------------------------------

--7. Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” 
--(Note: Create NewProducts table first with same fields as Products table) 
	Declare @id int, @name varchar(100), @price decimal(10,2)

	Declare Cursor_Table_To CURSOR
	FOR 
		SELECT * FROM Products

	OPEN Cursor_Table_To

	FETCH NEXT FROM Cursor_Table_To
	INTO @id, @name, @price

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		IF @name = 'Laptop'
			INSERT INTO NewProducts (Product_id, Product_Name, Price) VALUES(@id, @name, @price)

		FETCH NEXT FROM Cursor_Table_To
		INTO @id,@name, @price
	END

	CLOSE Cursor_Table_To

	DEALLOCATE Cursor_Table_To

	SELECT * FROM NewProducts

--8. Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products 
--with a price above 50000 to an archive table, removing them from the original Products table.
	Declare @id int, @name varchar(100), @price decimal(10,2)

	Declare Cursor_High_Price CURSOR
	FOR 
		SELECT Product_id,Product_Name, Price FROM Products
		WHERE Price > 50000

	OPEN Cursor_High_Price

	FETCH NEXT FROM Cursor_High_Price
	INTO @id, @name, @price

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		INSERT INTO ArchivedProducts (Product_id, Product_Name, Price) VALUES(@id, @name, @price);
		DELETE FROM Products
		WHERE Product_id = @id

		FETCH NEXT FROM Cursor_High_Price
		INTO @id,@name, @price
	END

	CLOSE Cursor_High_Price

	DEALLOCATE Cursor_High_Price

	SELECT * FROM Products
	SELECT * FROM ArchivedProducts

