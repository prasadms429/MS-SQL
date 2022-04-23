-- This is comment in MS SQL
CREATE DATABASE school  	-- This create new database called school
CREATE DATABASE school_test 	
DROP DATABASE school_test	--It deletes the database school_test

-- TO CREATE TABLE
use school;  -- This command is to use which database to create table, under that.
create table Students (
id int primary key not null identity(1,1), -- In this id is column name, int is datatype used for that, idetity to start the id from 1 and increment its next value with increment of 1.
lastname nvarchar(50) not null,     -- nvarchar datatype is to create variable that can include characters, numbers, and any letters.
firstname nvarchar(50) not null,
dateofbirth datetime not null,
dateofjoining datetime 
);

create table Courses (
CourseId int identity(1,1) primary key not null,
CourseName nvarchar(50) not null,
NumberOfCredits int,
CourseCode nvarchar(5) not null  --Example: CS201
);

-- TO INSERT DATA INTO TABLE
use school;
insert into Students ( firstname, lastname, dateofbirth, dateofjoining) values  --The Students table also includes id column but it is declared as auto increment by using identity key. so, there is no need to insert its values
('Prasad','M S', 2000-06-27, 2022-04-23),    --The datetime should be in format of yyyy-mm-dd
('Rohith', 'R', 2000-04-28, 2022-04-23),
('Nithin', 'N', 2000-03-05, 2022-04-23),
('Rajesh','k', 2000-06-13, null)              -- The dateofjoining can be null because, "not null" is not mentioned for this.
                                              -- Finally it insets 4 rows.

--SELECTING DATA FROM TABLE USING SQL SCRIPT
use school;
select * from Students;   -- It displays all rows and columms
select firstname as 'First Name',lastname [Last Name],dateofbirth [Date of Birth] from Students;    -- In this we specify which column to display and which column to not. we can change title of the column using 'as' and [].


-- ADVANCED SELECT QUERIES
SELECT * FROM school.dbo.Courses   -- Without using "use school" for selecting database, we can directly use this command.

SELECT lastname, firstname, dateofbirth
FROM school.dbo.Students
WHERE firstname like '%h%'          -- To display the above mentioned details for all first names including charcter 'h' in it in the table.

--Retrieve only Full Names of Students and their enrollment dates
select firstname+' '+lastname [Full name], dateofbirth [Date of birth]
from school.dbo.Students

-- Select Courses with the number of credits greater than 2
SELECT * FROM school.dbo.Courses
WHERE NumberOfCredits>2;

-- Select Courses with the number of credits 3 and less
SELECT * FROM school.dbo.Courses
WHERE NumberOfCredits<=3;


--UPDATING DATA IN TABLE
--Update all enrollment dates that are empty (null)
--Update specific records using a condition
select * from school.dbo.Students;
update Students set dateofjoining='2022-04-23'
where dateofjoining is null;

--Update all enrollment dates
--Update multiple records (be careful)
update Students set dateofjoining='2022-04-20'

--Update students with ids 2 & 3. Change first and last names
--Update multiple columns
update Students set firstname='Tajee', lastname='McDermott'
where id=2

update Students set firstname='Rhoddy', lastname='Shawn'
where id=3
