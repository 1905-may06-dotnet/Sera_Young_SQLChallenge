CREATE DATABASE CodingChallenge;
go

--Create the Department table with 3 fields
--Created the department table first becuase it does not have any foreign keys
CREATE TABLE [Department](
    ID int PRIMARY KEY IDENTITY,
    [Name] VARCHAR(20) not null,
    [Location] VARCHAR(100) not null
)
go


--Create the Employee table with 4 fields. Added a check constraint to SSN
--Employee created second because it has a foreign key requirement of Department
CREATE TABLE [Employee](
    ID int PRIMARY KEY IDENTITY,
    FirstName VARCHAR(20) not null,
    LastName VARCHAR(20) not null,
    SSN VARCHAR(9) not null
        CONSTRAINT [CH_PCDigit]
        CHECK(SSN like  replicate('[0-9]', 9)),
    DeptID int not null,
    FOREIGN KEY (DeptID) REFERENCES [Department](ID)
)
GO


--Create the EmpDetails table with 8 fields.
--Created this table last since it has a foreign key to Employee.
CREATE table [EmpDetails](
    ID int PRIMARY KEY IDENTITY,
    EmployeeID int not null,
    Salary DECIMAL not null,
    Address1 varchar(100) not null,
    Address2 varchar(100),
    City varchar(20) not null,
    [State] varchar(20) not null,
    Country varchar(20) not null,
    FOREIGN KEY (EmployeeID) REFERENCES [Employee](ID)
)
GO

--Inserts 3 rows into department. One of them is marketing.
INSERT INTO [Department]([Name],[Location]) values ('Marketing', 'A5'), ('IT','B7'), ('Space Exploration', 'V9')
GO

--Insert 3 rows into employee. One of them includes Tina Smiith
INSERT INTO [Employee] values ('Tina', 'Smith', '028384727', 1), ('Robin', 'Tran', '123456789', 3), ('Favil', 'Obidelo', '563727171', 2)
GO

--Insert 3 rows into EmpDetails. One for each row in employee because the relationship is 1 to 1
INSERT INTO [EmpDetails] VALUES (2, 15000, '413 IWorkInMarketing Drive','', 'Cityville', 'Florida', 'US'), (3, 140000, '511 Astronaught Avenue', 'Apt 2000', 'Cityville', 'Florida', 'US'), (4, 100000, 'IT Department', 'I Literally Live Here', 'Cityville', 'Florida', 'US')
GO

--Select query to retrieve all employees where DeptID = 1, DeptID 1 correlates to marketing
SELECT * FROM [Employee] where DeptID = 1;

--use the agregate function count to count the total salary of marketing
Select COUNT([Employee].salary) where DeptID = 1;

--use the agregate function count and group by keyword to display the count of each department.
Select Count(*) from [Employee] GROUP BY DeptID;

