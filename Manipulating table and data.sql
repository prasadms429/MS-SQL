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
