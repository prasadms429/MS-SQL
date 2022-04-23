-- This is comment in MS SQL
CREATE DATABASE school  	-- This create new database called school
CREATE DATABASE school_test 	
DROP DATABASE school_test	--It deletes the database school_test

-- TO CREATE TABLE
use school;  -- This command is to use which database to create table, under that.
create table Students (
id int primary key not null identity(1,1), -- In this id is column name, int is datatype used for that, idetity to start the id from 1 and increment its next value with increment of 1.
lastname nvarchar(50) not null,
firstname nvarchar(50) not null,
dateofbirth datetime not null,
dateofjoining datetime 
);
