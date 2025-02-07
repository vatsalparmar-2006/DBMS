
---------- Extra Trigger   ----------


-- Creating EMPLOYEEDETAILS Table 
CREATE TABLE EMPLOYEEDETAILS
(
	EmployeeID Int Primary Key,
	EmployeeName Varchar(100) Not Null,
	ContactNo Varchar(100) Not Null,
	Department Varchar(100) Not Null,
	Salary Decimal(10,2) Not Null,
	JoiningDate DateTime Null
)

-- Creating EmployeeLogs Table 
CREATE TABLE EmployeeLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    ActionPerformed VARCHAR(100) NOT NULL,
    ActionDate DATETIME NOT NULL
);

			---------- AFTER ----------

--1) Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to display the message "Employee record inserted", "Employee record updated", "Employee record deleted"
	
	-- INSERT_MSG -- 
	CREATE TRIGGER TR_INSERT_MSG
	ON EMPLOYEEDETAILS
	AFTER INSERT
	AS 
	BEGIN
		PRINT('Employee record inserted.')
	END;

	INSERT INTO EMPLOYEEDETAILS VALUES(1, 'Vatsal', 1234567890, 'CSE', 99000, '2027-06-01')

	-- UPDATE_MSG -- 
	CREATE TRIGGER TR_UPDATE_MSG
	ON EMPLOYEEDETAILS
	AFTER UPDATE
	AS 
	BEGIN
		PRINT('Employee record updtaed.')
	END;

	UPDATE EMPLOYEEDETAILS
	SET Department = 'ce'
	WHERE EmployeeID = 1

	-- DELETE_MSG -- 
	CREATE TRIGGER TR_DELETE_MSG
	ON EMPLOYEEDETAILS
	AFTER DELETE
	AS 
	BEGIN
		PRINT('Employee record deleted.')
	END;

	DELETE FROM EMPLOYEEDETAILS
	WHERE EmployeeID = 1

	DROP TRIGGER TR_INSERT_MSG
	DROP TRIGGER TR_UPDATE_MSG
	DROP TRIGGER TR_DELETE_MSG

--2) Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to log all operations into the EmployeeLog table.
	
	-----INSERT-----

	CREATE TRIGGER TR_AFTER_INSERT_LOG_MSG
	ON EMPLOYEEDETAILS
	AFTER INSERT
	AS 
	BEGIN
		DECLARE @EID INT,  @ENAME VARCHAR(100)
		SELECT @EID = EmployeeID FROM inserted
		SELECT @ENAME = EmployeeName FROM inserted

		INSERT INTO EmployeeLogs
		VALUES(@EID, @ENAME, 'INSERT', GETDATE())
	END;

	INSERT INTO EMPLOYEEDETAILS VALUES(3, 'Vatsal', 99000, '2027-06-01', 'Rajkot', 22, '2006-03-06')
	SELECT * FROM EmployeeLogs

	-----UPDATE-----

	CREATE TRIGGER TR_AFTER_UPDATE_LOG_MSG
	ON EMPLOYEEDETAILS
	AFTER UPDATE
	AS 
	BEGIN
		DECLARE @EID INT,  @ENAME VARCHAR(100)
		SELECT @EID = EmployeeID FROM inserted
		SELECT @ENAME = EmployeeName FROM inserted

		INSERT INTO EmployeeLogs
		VALUES(@EID, @ENAME, 'UPDATE', GETDATE())
	END;

	UPDATE EMPLOYEEDETAILS
	SET EmployeeName = 'Rohit'
	WHERE EmployeeID = 2

	SELECT * FROM EmployeeLogs

	-----DELETE-----

	CREATE TRIGGER TR_AFTER_DELETE_LOG_MSG
	ON EMPLOYEEDETAILS
	AFTER DELETE
	AS 
	BEGIN
		DECLARE @EID INT,  @ENAME VARCHAR(100)
		SELECT @EID = EmployeeID FROM deleted
		SELECT @ENAME = EmployeeName FROM deleted

		INSERT INTO EmployeeLogs
		VALUES(@EID, @ENAME, 'DELETE', GETDATE())
	END;

	DELETE FROM EMPLOYEEDETAILS
	WHERE EmployeeID = 3

	SELECT * FROM EmployeeLogs
	SELECT * FROM PersonInfo

	DROP TRIGGER TR_AFTER_INSERT_LOG_MSG
	DROP TRIGGER TR_AFTER_UPDATE_LOG_MSG
	DROP TRIGGER TR_AFTER_DELETE_LOG_MSG

--3) Create a trigger that fires AFTER INSERT to automatically calculate the joining bonus (10% of the salary) for new employees and update a bonus column in the EmployeeDetails table.
	CREATE OR ALTER TRIGGER TR_UPDATE_SALARY
	ON EMPLOYEEDETAILS
	AFTER INSERT
	AS
	BEGIN
		DECLARE @EId INT,@Salary DECIMAL(10,2)
		SELECT @EId = EmployeeID, @Salary = Salary
		FROM inserted

		UPDATE EMPLOYEEDETAILS
		SET Salary = @Salary + @Salary*0.1
		WHERE EmployeeID = @EId
	END;

	INSERT INTO EMPLOYEEDETAILS VALUES(31, 'ROY', 1234567890, 'CSE', 1000, '2006-03-06')
	SELECT * FROM EMPLOYEEDETAILS 

	DROP TRIGGER TR_UPDATE_SALARY

--4) Create a trigger to ensure that the JoiningDate is automatically set to the current date if it is NULL during an INSERT operation.
	CREATE TRIGGER TR_UPDATE_DATE
	ON EMPLOYEEDETAILS
	AFTER INSERT
	AS
	BEGIN
		DECLARE @JDate DATETIME, @EId INT
		SELECT @JDate = JoiningDate, @EId = EmployeeID 
		FROM inserted

		IF @JDate IS NULL
			BEGIN
				UPDATE EMPLOYEEDETAILS
				SET JoiningDate = GETDATE()
				WHERE EmployeeID = @EId
			END
	END;

	INSERT INTO EMPLOYEEDETAILS VALUES(21, 'ROY', 1234567890, 'CSE', 99000, NULL)
	SELECT * FROM EMPLOYEEDETAILS

	DROP TRIGGER TR_UPDATE_DATE

--5) Create a trigger that ensure that ContactNo is valid during insert and update (Like ContactNo length is 10)
	CREATE TRIGGER TR_CONTACT_VALIDATION
	ON EMPLOYEEDETAILS
	AFTER INSERT, UPDATE
	AS
	BEGIN
		DECLARE @CNo Varchar(100), @EId INT
		SELECT @CNo = ContactNo, @EId = EmployeeID 
		FROM inserted
		
		IF LEN(@CNo) != 10
			BEGIN
				PRINT('Invalid !!! ContactNo must be exactly 10 digits long.')
			END	
	END;

	INSERT INTO EMPLOYEEDETAILS VALUES(16, 'ROHIT', 12345, 'CSE', 99000, '2006-03-06')
	SELECT * FROM EMPLOYEEDETAILS

	DROP TRIGGER TR_CONTACT_VALIDATION





			---------- INSTEAD OF ----------


CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Duration INT NOT NULL
);


CREATE TABLE MoviesLog
(
	LogID INT PRIMARY KEY IDENTITY(1,1),
	MovieID INT NOT NULL,
	MovieTitle VARCHAR(255) NOT NULL,
	ActionPerformed VARCHAR(100) NOT NULL,
	ActionDate	DATETIME  NOT NULL
);


--1. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Movies table. For that, log all operations performed on the Movies table into MoviesLog.
	
		----- INSERT -----
	CREATE TRIGGER TR_INSTEAD_OF_INSERT
	ON Movies
	INSTEAD OF INSERT
	AS 
	BEGIN
		DECLARE @MID INT,  @MTITLE VARCHAR(255)
		SELECT @MID = MovieID FROM inserted
		SELECT @MTITLE = MovieTitle FROM inserted

		INSERT INTO MoviesLog
		VALUES(@MID, @MTITLE, 'INSERT', GETDATE())
	END;

	INSERT INTO Movies VALUES(1, 'KGF', 2019, 'ABC', 9.9, 180)
	SELECT * FROM MoviesLog

	DROP TRIGGER TR_INSTEAD_OF_INSERT

		----- UPDATE -----
	CREATE TRIGGER TR_INSTEAD_OF_UPDATE
	ON Movies
	INSTEAD OF UPDATE
	AS 
	BEGIN
		DECLARE @MID INT,  @MTITLE VARCHAR(255)
		SELECT @MID = MovieID FROM inserted
		SELECT @MTITLE = MovieTitle FROM inserted

		INSERT INTO MoviesLog
		VALUES(@MID, @MTITLE, 'UPDATE', GETDATE())
	END;

	UPDATE Movies
	SET MovieTitle = 'KGF-2'
	WHERE MovieID = 1

	SELECT * FROM Movies
	SELECT * FROM MoviesLog

	DROP TRIGGER TR_INSTEAD_OF_UPDATE


		----- DELETE -----
	CREATE TRIGGER TR_INSTEAD_OF_DELETE
	ON Movies
	INSTEAD OF DELETE
	AS 
	BEGIN
		DECLARE @MID INT,  @MTITLE VARCHAR(255)
		SELECT @MID = MovieID FROM inserted
		SELECT @MTITLE = MovieTitle FROM inserted

		INSERT INTO MoviesLog
		VALUES(@MID, @MTITLE, 'DELETE', GETDATE())
	END;

	INSERT INTO Movies VALUES(2, 'PUSHPA', 2019, 'ABC', 9.9, 180)
	DELETE FROM Movies
	WHERE MovieTitle = 'PUSHPA'

	SELECT * FROM Movies
	SELECT * FROM MoviesLog

	DROP TRIGGER TR_INSTEAD_OF_DELETE

--2. Create a trigger that only allows to insert movies for which Rating is greater than 5.5 .
	CREATE TRIGGER TR_VALIDATE_RATINGS
	ON Movies
	INSTEAD OF INSERT
	AS 
	BEGIN
		DECLARE @MRATINGS VARCHAR(255)
		SELECT @MRATINGS = Rating FROM inserted
		
		IF @MRATINGS >= 5.5
		BEGIN 
			INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
			SELECT MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration FROM inserted
		END
		ELSE 
		BEGIN
			DECLARE @MID INT,  @MTITLE VARCHAR(255)
			SELECT @MID = MovieID FROM inserted
			SELECT @MTITLE = MovieTitle FROM inserted

			INSERT INTO MoviesLog
			VALUES(@MID, @MTITLE, 'INSERT', GETDATE())

			PRINT 'Rating must be greater than or eqaul to 5.5'
		END
	END;

	INSERT INTO Movies VALUES(10, 'URI', 2016, 'ABC', 8.8, 180)
	INSERT INTO Movies VALUES(11, 'KESARI', 2016, 'ABC', 4.3, 180)

	SELECT * FROM Movies
	SELECT * FROM MoviesLog

	DROP TRIGGER TR_VALIDATE_RATINGS

--3. Create trigger that prevent duplicate 'MovieTitle' of Movies table and log details of it in MoviesLog table.
	CREATE OR ALTER TRIGGER TR_CHECK_DUPLICATE
	ON Movies
	INSTEAD OF INSERT
	AS 
	BEGIN
		INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
		SELECT MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration 
		FROM inserted
		WHERE MovieTitle NOT IN ( SELECT MovieTitle FROM Movies )
	END;

	INSERT INTO Movies VALUES(12, 'URI', 2016, 'ABC', 8.8, 180)

	SELECT * FROM Movies

	DROP TRIGGER TR_CHECK_DUPLICATE

--4. Create trigger that prevents to insert pre-release movies.
	CREATE TRIGGER TR_CHECK_PRE_RELEASE
	ON Movies
	INSTEAD OF INSERT
	AS 
	BEGIN
		DECLARE @RELEASEYEAR INT
		SELECT @RELEASEYEAR = ReleaseYear FROM inserted
		
		IF @RELEASEYEAR <= DATEPART(YEAR, GETDATE())
		BEGIN 
			INSERT INTO Movies (MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration)
			SELECT MovieID, MovieTitle, ReleaseYear, Genre, Rating, Duration FROM inserted
		END
		ELSE 
			PRINT 'Release Year must be less than current year.'
	END;

	
	INSERT INTO Movies VALUES(13, 'URI', 2026, 'ABC', 8.8, 180)

	SELECT * FROM Movies

	DROP TRIGGER TR_CHECK_PRE_RELEASE

--5. Develop a trigger to ensure that the Duration of a movie cannot be updated to a value greater than 120 minutes (2 hours) to prevent unrealistic entries.
	CREATE TRIGGER TR_MOVIE_DURATION
	ON Movies
	INSTEAD OF UPDATE
	AS 
	BEGIN
		DECLARE @MID INT, @DURATION INT
		SELECT @MID = MovieID, @DURATION = Duration FROM inserted
		
		IF @DURATION < 120
			PRINT 'Duration must be gretear than 120 mins.	'
		ELSE
		BEGIN
			UPDATE Movies
			SET Duration = @Duration
			WHERE MovieID = @MID
		END
	END;

	UPDATE Movies
	SET Duration = 100
	WHERE MovieID = 12

	SELECT * FROM Movies

	DROP TRIGGER TR_MOVIE_DURATION