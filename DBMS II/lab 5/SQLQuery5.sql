
---------- Trigger   ----------

--------------------------------------------------PART-A------------------------------------------------

-- Creating PersonInfo Table 
CREATE TABLE PersonInfo ( 
	PersonID INT PRIMARY KEY, 
	PersonName VARCHAR(100) NOT NULL, 
	Salary DECIMAL(8,2) NOT NULL, 
	JoiningDate DATETIME NULL, 
	City VARCHAR(100) NOT NULL, 
	Age INT NULL, 
	BirthDate DATETIME NOT NULL 
); 

-- Creating PersonLog Table 
CREATE TABLE PersonLog ( 
	PLogID INT PRIMARY KEY IDENTITY(1,1), 
	PersonID INT NOT NULL, 
	PersonName VARCHAR(250) NOT NULL, 
	Operation VARCHAR(50) NOT NULL, 
	UpdateDate DATETIME NOT NULL,  
); 

--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display 
--a message “Record is Affected.” 
	CREATE TRIGGER TR_Display_Msg
	ON PersonInfo
	AFTER INSERT, UPDATE, DELETE
	AS 
	BEGIN
		PRINT('Record is Affected')
	END;

	INSERT INTO PersonInfo VALUES(1, 'Vatsal', 99000, '2027-06-01', 'Rajkot', 22, '2006-03-06')

--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, 
--log all operations performed on the person table into PersonLog.

	-----INSERT-----

	CREATE TRIGGER TR_AFTER_INSERT_LOG_MSG
	ON PersonInfo
	FOR INSERT
	AS 
	BEGIN
		DECLARE @PID INT,  @PNAME VARCHAR(100)
		SELECT @PID = PersonID FROM inserted
		SELECT @PNAME = PersonName FROM inserted

		INSERT INTO PersonLog
		VALUES(@PID, @PNAME, 'INSERT', GETDATE())
	END;

	INSERT INTO PersonInfo VALUES(3, 'Vatsal', 99000, '2027-06-01', 'Rajkot', 22, '2006-03-06')
	SELECT * FROM PersonLog

	-----UPDATE-----

	CREATE TRIGGER TR_AFTER_UPDATE_LOG_MSG
	ON PersonInfo
	FOR UPDATE
	AS 
	BEGIN
		DECLARE @PID INT,  @PNAME VARCHAR(100)
		SELECT @PID = PersonID FROM inserted
		SELECT @PNAME = PersonName FROM inserted

		INSERT INTO PersonLog
		VALUES(@PID, @PNAME, 'UPDATE', GETDATE())
	END;

	UPDATE PersonInfo
	SET PersonName = 'Rohit'
	WHERE PersonID = 2

	SELECT * FROM PersonLog

	-----DELETE-----

	CREATE TRIGGER TR_AFTER_DELETE_LOG_MSG
	ON PersonInfo
	AFTER DELETE
	AS 
	BEGIN
		DECLARE @PID INT,  @PNAME VARCHAR(100)
		SELECT @PID = PersonID FROM deleted
		SELECT @PNAME = PersonName FROM deleted

		INSERT INTO PersonLog
		VALUES(@PID, @PNAME, 'DELETE', GETDATE())
	END;

	DELETE FROM PersonInfo
	WHERE PersonID = 3

	SELECT * FROM PersonLog
	SELECT * FROM PersonInfo

	DROP TRIGGER TR_AFTER_DELETE_LOG_MSG

--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo 
--table. For that, log all operations performed on the person table into PersonLog. 
	
	-----INSERT-----

	CREATE TRIGGER TR_INSTEAD_OF_INSERT_LOG_MSG
	ON PersonInfo
	INSTEAD OF INSERT
	AS 
	BEGIN
		DECLARE @PID INT,  @PNAME VARCHAR(100)
		SELECT @PID = PersonID FROM inserted
		SELECT @PNAME = PersonName FROM inserted

		INSERT INTO PersonLog
		VALUES(@PID, @PNAME, 'INSERT', GETDATE())
	END;

	INSERT INTO PersonInfo VALUES(12, 'VatsalParmar', 99000, '2027-06-01', 'Rajkot', 22, '2006-03-06')
	SELECT * FROM PersonInfo
	SELECT * FROM PersonLog

	DROP TRIGGER TR_INSTEAD_OF_INSERT_LOG_MSG

	-----UPDATE-----

	CREATE TRIGGER TR_INSTEAD_OF_UPDATE_LOG_MSG
	ON PersonInfo
	INSTEAD OF UPDATE
	AS 
	BEGIN
		DECLARE @PID INT,  @PNAME VARCHAR(100)
		SELECT @PID = PersonID FROM inserted
		SELECT @PNAME = PersonName FROM inserted

		INSERT INTO PersonLog
		VALUES(@PID, @PNAME, 'UPDATE', GETDATE())
	END;

	UPDATE PersonInfo
	SET PersonName = 'ROHITTTT'
	WHERE PersonID = 2

	SELECT * FROM PersonInfo
	SELECT * FROM PersonLog

	DROP TRIGGER TR_INSTEAD_OF_UPDATE_LOG_MSG

	-----DELETE-----

	CREATE TRIGGER TR_INSTEAD_OF_DELETE_LOG_MSG
	ON PersonInfo
	INSTEAD OF DELETE
	AS 
	BEGIN
		DECLARE @PID INT,  @PNAME VARCHAR(100)
		SELECT @PID = PersonID FROM deleted
		SELECT @PNAME = PersonName FROM deleted

		INSERT INTO PersonLog
		VALUES(@PID, @PNAME, 'DELETE', GETDATE())
	END;

	DELETE FROM PersonInfo
	WHERE PersonID = 5

	SELECT * FROM PersonLog
	SELECT * FROM PersonInfo

	DROP TRIGGER TR_INSTEAD_OF_DELETE_LOG_MSG

--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into 
--uppercase whenever the record is inserted. 
	CREATE TRIGGER TR_AFTER_INSERT_CONVERT_UPPERCASE
	ON PersonInfo
	FOR INSERT
	AS 
	BEGIN
		DECLARE @PID INT,  @PNAME VARCHAR(100)
		SELECT @PID = PersonID FROM inserted
		SELECT @PNAME = PersonName FROM inserted

		UPDATE PersonInfo
		SET PersonName = UPPER(@PNAME)
		WHERE PersonID = @PID
	END;

	INSERT INTO PersonInfo VALUES(5, 'rahul', 80000, '2027-06-01', 'Rajkot', 22, '2006-03-06')
	SELECT * FROM PersonInfo
	
	DROP TRIGGER TR_AFTER_INSERT_CONVERT_UPPERCASE

--5. Create trigger that prevent duplicate entries of person name on PersonInfo table.
	CREATE TRIGGER TR_DUPLICATE_NAME_PREVENT
	ON PersonInfo
	INSTEAD OF INSERT
	AS
	BEGIN
		INSERT INTO PersonInfo(PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)

		SELECT PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate 
		FROM inserted
		WHERE PersonName NOT IN ( SELECT PersonName 
								  FROM PersonInfo );
	END;

	INSERT INTO PersonInfo VALUES(15, 'RAHUL', 99000, '2027-06-01', 'Rajkot', 22, '2006-03-06')
	SELECT * FROM PersonInfo

	DROP TRIGGER TR_DUPLICATE_NAME_PREVENT

--6. Create trigger that prevent Age below 18 years.
	CREATE TRIGGER TR_AGE_LIMIT
	ON PersonInfo
	INSTEAD OF INSERT
	AS
	BEGIN
		INSERT INTO PersonInfo(PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate)

		SELECT PersonID, PersonName, Salary, JoiningDate, City, Age, BirthDate 
		FROM inserted
		WHERE Age > 18
	END;

	INSERT INTO PersonInfo VALUES(15, 'RAHUL', 99000, '2027-06-01', 'Rajkot', 50, '2006-03-06')
	SELECT * FROM PersonInfo

	DROP TRIGGER TR_AGE_LIMIT



--------------------------------------------------PART-B------------------------------------------------

--7. Create a trigger that fires on INSERT operation on person table, which calculates the age and update 
--that age in Person table. 
	CREATE TRIGGER TR_AGE_UPDATE
	ON PersonInfo
	AFTER INSERT
	AS
	BEGIN
		DECLARE @BDate DATETIME, @PId INT
		SELECT @BDate = BirthDate, @PId = PersonID 
		FROM inserted

		UPDATE PersonInfo
		SET BirthDate = DATEDIFF(YEAR, @BDate, GETDATE())
		WHERE PersonID = @PId
	END;

	INSERT INTO PersonInfo VALUES(20, 'RONIT', 99000, '2027-06-01', 'Rajkot', 26, '2006-03-06')
	SELECT * FROM PersonInfo

	DROP TRIGGER TR_AGE_UPDATE

--8. Create a Trigger to Limit Salary Decrease by a 10%.
	CREATE TRIGGER TR_SALARY_LIMIT
	ON PersonInfo
	AFTER UPDATE
	AS
	BEGIN
		DECLARE @OldSalary DECIMAL(8,2), @NewSalary DECIMAL(8,2), @PId INT
		SELECT @OldSalary = Salary, @PId = PersonID 
		FROM deleted
		SELECT @NewSalary = Salary
		FROM inserted WHERE PersonID = @PId

		IF @NewSalary < @OldSalary*0.9
			BEGIN
				UPDATE PersonInfo
				SET Salary = @OldSalary
				WHERE PersonID = @PId
			END
	END;

	--- UPDATE NEW SALARY ---
	UPDATE PersonInfo
	SET Salary = 100000
	WHERE PersonID = 21

	--- CAN NOT BE UPDATE, OLD SALARY ---
	UPDATE PersonInfo
	SET Salary = 5000
	WHERE PersonID = 21

	SELECT * FROM PersonInfo

	DROP TRIGGER TR_SALARY_LIMIT



--------------------------------------------------PART-C------------------------------------------------

--9. Create Trigger to Automatically Update JoiningDate to Current Date on INSERT if JoiningDate is NULL 
--during an INSERT. 
	CREATE TRIGGER TR_UPDATE_DATE
	ON PersonInfo
	AFTER INSERT
	AS
	BEGIN
		DECLARE @JDate DATETIME, @PId INT
		SELECT @JDate = JoiningDate, @PId = PersonID 
		FROM inserted

		IF @JDate IS NULL
			BEGIN
				UPDATE PersonInfo
				SET JoiningDate = GETDATE()
				WHERE PersonID = @PId
			END
	END;

	INSERT INTO PersonInfo VALUES(21, 'ROY', 99000, NULL, 'Rajkot', 26, '2006-03-06')
	SELECT * FROM PersonInfo

	DROP TRIGGER TR_UPDATE_DATE

--10. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints 
--‘Record deleted successfully from PersonLog’.
	CREATE TRIGGER TR_DELETE 
	ON PersonLog
	AFTER DELETE
	AS
	BEGIN
		PRINT('Record deleted successfully from PersonLog')
	END;


	DELETE FROM PersonLog
	WHERE PersonID = 12

	SELECT * FROM PersonLog

	DROP TRIGGER TR_DELETE