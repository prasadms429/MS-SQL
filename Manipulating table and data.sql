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
