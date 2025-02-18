

---------- Exception Handling ----------

--------------------------------------------------PART-A------------------------------------------------


-- Create the Customers table 
CREATE TABLE Customers ( 
	Customer_id INT PRIMARY KEY,                 
	Customer_Name VARCHAR(250) NOT NULL,         
	Email VARCHAR(50) UNIQUE                     
); 

-- Create the Orders table 
CREATE TABLE Orders ( 
	Order_id INT PRIMARY KEY,                    
	Customer_id INT,                             
	Order_date DATE NOT NULL,                    
	FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)  
);


--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error. 
	BEGIN TRY
		DECLARE @NUM1 INT = 20, @NUM2 INT = 0, @ANS INT
		SET @ANS = @NUM1/@NUM2
		PRINT ('Division : ' + @ANS)
	END TRY
	BEGIN CATCH
		PRINT ('Error occurs that is - Divide by zero error.')
	END CATCH

--2. Try to convert string to integer and handle the error using try…catch block.
	BEGIN TRY
		DECLARE @N1 VARCHAR(10) = '20', @N2 INT = '10', @SUM INT
		SET @SUM = CAST(@N1 AS INT) + CAST(@N2 AS INT)
		PRINT(@SUM)
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE() 
	END CATCH

--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle 
--exception with all error functions if any one enters string value in numbers otherwise print result.
	CREATE OR ALTER PROC PR_HANDLE_INT_STRING
		@N1  VARCHAR(10),
		@N2  VARCHAR(10)
	AS
	BEGIN
		BEGIN TRY
			DECLARE @SUM INT
			SET @SUM = CAST(@N1 AS INT) + CAST(@N2 AS INT)
			PRINT (@SUM)
		END TRY
		BEGIN CATCH
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_STATE()
			PRINT ERROR_LINE()
			PRINT ERROR_PROCEDURE()
		END CATCH
	END;
			
	EXEC PR_HANDLE_INT_STRING '10', '15'
 
--4. Handle a Primary Key Violation while inserting data into customers table and print the error details 
--such as the error message, error number, severity, and state. 
	CREATE OR ALTER PROC PR_PRIMARY_KEY_VIOLATION
		@CID INT,
		@CNAME VARCHAR(250),
		@EMAIL VARCHAR(50)
	AS
	BEGIN
		BEGIN TRY
			INSERT INTO Customers(Customer_id, Customer_Name, Email)
			VALUES (@CID, @CNAME, @EMAIL)
		END TRY
		BEGIN CATCH
			PRINT ('Primary Key Violation')
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_STATE()
			PRINT ERROR_LINE()
			PRINT ERROR_PROCEDURE()
		END CATCH
	END;

	EXEC PR_PRIMARY_KEY_VIOLATION 1, 'Vatsal','v@gmail.com'
	EXEC PR_PRIMARY_KEY_VIOLATION 1, 'Virat','v@gmail.com'

--5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws 
--Error like no Customer_id is available in database.
	CREATE OR ALTER PROC PR_CUSTOM_EXCEPTION
		@CID INT
	AS
	BEGIN
		IF NOT EXISTS (SELECT Customer_id FROM Customers WHERE Customer_id = @CID )
		BEGIN TRY
			THROW 99000, 'no Customer_id is available in database.', 1;
		END TRY
		BEGIN CATCH
			PRINT ('Customer_ID Validation')
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_STATE()
			PRINT ERROR_LINE()
			PRINT ERROR_PROCEDURE()
		END CATCH	
	END;

	EXEC PR_CUSTOM_EXCEPTION 1  --- Valid
	EXEC PR_CUSTOM_EXCEPTION 5  --- InValid




--------------------------------------------------PART-B------------------------------------------------


--6. Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error 
--message. 
	CREATE OR ALTER PROC PR_FOREIGN_KEY_VIOLATION
		@CID INT,
		@OID INT,
		@ODATE DATETIME
	AS
	BEGIN
		BEGIN TRY
			INSERT INTO Orders(Order_id, Customer_id, Order_date)
			VALUES (@CID, @OID, @ODATE)
		END TRY
		BEGIN CATCH
			PRINT ('Foreign Key Violation')
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_STATE()
			PRINT ERROR_LINE()
			PRINT ERROR_PROCEDURE()
		END CATCH
	END; 

	EXEC PR_FOREIGN_KEY_VIOLATION 1, 1,'2025-02-17'  --- Valid
	EXEC PR_FOREIGN_KEY_VIOLATION 10,2,'2025-02-17'  --- InValid

--7. Throw custom exception that throws error if the data is invalid. 
	CREATE OR ALTER PROC PR_DATA_VALIDATION
		@STR VARCHAR(100)
	AS
	BEGIN
		BEGIN TRY
			IF LEN(@STR) < 3
				THROW 90000, 'Data Is InValid ... Input Length Must be Greater 
				then 3', 1;
			ELSE
				PRINT ('Input is : ' + @STR)
		END TRY
		BEGIN CATCH
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_STATE()
			PRINT ERROR_LINE()
			PRINT ERROR_PROCEDURE()
		END CATCH
	END;

	EXEC PR_DATA_VALIDATION 'Vatsal'  --- Valid
	EXEC PR_DATA_VALIDATION 'Ra'  --- InValid

--8. Create a Procedure to Update Customer’s Email with Error Handling
	CREATE OR ALTER PROC PR_UPDATE_EMAIL_HANDLE
		@CID INT,
		@EMAIL VARCHAR(50)
	AS 
	BEGIN
		BEGIN TRY
			UPDATE Customers
			SET Email = @EMAIL
			WHERE Customer_id = @CID
		END TRY
		BEGIN CATCH
			PRINT ERROR_MESSAGE()
		END CATCH
	END;

	EXEC PR_UPDATE_EMAIL_HANDLE 2, 'virat@gmail.com'


	--------------------------------------------------PART-C------------------------------------------------


--9. Create a procedure which prints the error message that “The Customer_id is already taken. Try another one”. 
	CREATE OR ALTER PROC PR_CUSTOMER_ID_CHECK
		@CID INT,
		@CNAME VARCHAR(250),
		@EMAIL VARCHAR(50)
	AS 
	BEGIN
		BEGIN TRY
			INSERT INTO Customers(Customer_id, Customer_Name, Email)
			VALUES (@CID, @CNAME, @EMAIL)
		END TRY
		BEGIN CATCH
			PRINT ('The Customer_id is already taken. Try another one')
		END CATCH
	END;

	SELECT * FROM Customers

	EXEC PR_CUSTOMER_ID_CHECK 2,'Virat','vi@gmailcom'  --- Valid
	EXEC PR_CUSTOMER_ID_CHECK 2,'Rohit','ro@gmailcom'  --- InValid

--10. Handle Duplicate Email Insertion in Customers Table. 
	CREATE OR ALTER PROC PR_CHECK_EMAIL_DUPLICATION
		@CID INT,
		@CNAME VARCHAR(250),
		@EMAIL VARCHAR(50)
	AS
	BEGIN
		BEGIN TRY
			INSERT INTO Customers
			VALUES (@CID, @CNAME, @EMAIL)
		END TRY
		BEGIN CATCH
			PRINT ERROR_MESSAGE()
		END CATCH
	END;

	EXEC PR_CHECK_EMAIL_DUPLICATION 10, 'Rohit', 'ro@gmail.com' 