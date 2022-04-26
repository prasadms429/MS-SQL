-- CREATING AND MANAGING VIEWS
-- By creating views we can give database picture to user without giving direct access to him. That reduces modification data in database.

use school;
SELECT dbo.Students.firstname, dbo.Students.lastname, dbo.Courses.CourseId, dbo.Courses.CourseName
FROM     dbo.Courses 
                  INNER JOIN dbo.Enrollments ON dbo.Courses.CourseId = dbo.Enrollments.CourseId 
                  INNER JOIN dbo.Students ON dbo.Enrollments.StudentId = dbo.Students.id                -- We can create view using tools or display it using this code.

select * from Student_Courses           -- This is the simpler way of displaying view using its view name, without using above 4 line code.


Use school
go                                          -- We must use 'go' in between, if we specifiy database before 'create view'
create view Student_Subject_Lectureres as		-- To create view without using tools of MS sql, we can use this.  or -- To alter the view we can use 'alter view Student_Subject_Lectureres as'.
select
t.Firstname [Teacher First Name],               
t.Lastname [Teacher Last Name],
s.Firstname [Student First Name],
s.Lastname [Student Last Name],
c.CourseName [Course Title],
c.CourseCode [Course Code]
from enrollments e
inner join Teachers t on t.id= e.TeacherId       
inner join Students s on s.id= e.StudentId      
inner join Courses c on c.CourseId= e.CourseId


select * from Student_Subject_Lectureres    -- This is the simpler way of displaying view using its view name, without using above 13 line code.
where [Course Code]='CS202'                 -- We are using some condition to display code
order by [Course Title]                      -- We cannot use 'order by' in above query of create view, but we can use in this. We should use '[]' this, because Course Title contain space.

exec sp_rename 'Student_Subject_Lectureres','Student Enrollements'   -- To rename the view file we use this. In this 'exec' means execute, 'sp_rename' means stored procedure rename.


-- SCALAR VALUED FUNCTIONS

use school;
select max(grade) from Enrollments    -- In this we use built in function to do get maximum grade.

select GETDATE()                      -- It gives specific year, month, date and time at this moment. In this we use built in function

select Year(GETDATE())                -- It gives only year. In this we use built in function.

-- This is user defined function.
select dbo.getHighestGrade()

select dbo.getLowestGrade()

select dbo.getCourseTitleById(5)

-- The description of user defined functions as follows
-- For getHighestGrade
USE [school]
GO
/****** Object:  UserDefinedFunction [dbo].[getHighestGrade]    Script Date: 25-04-2022 17:13:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
Create FUNCTION getHighestGrade 
(
	-- Add the parameters for the function here
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @grade float

	-- Add the T-SQL statements to compute the return value here
	SELECT @grade=max(grade) from Enrollments

	-- Return the result of the function
	RETURN @grade

END


-- Function description for getCourseTileById
USE [school]
GO
/****** Object:  UserDefinedFunction [dbo].[getCourseTitleById]    Script Date: 25-04-2022 17:16:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION getCourseTitleById 
(
	-- Add the parameters for the function here
	@courseid int
)
RETURNS nvarchar(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @name nvarchar(50)

	-- Add the T-SQL statements to compute the return value here
	SELECT @name=CourseName from Courses where CourseId=@courseid

	-- Return the result of the function
	RETURN @name

END


-- INLINE TABLE-VALUED FUNCTIONS
use school;

-- find all failing students- Pass mark 50
select * from GradeRange(1,49)

-- find all passing students- Pass mark 50
select * from GradeRange(50,100)


-- Function description for GradeRange Table-valued function

-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Function to return grade betweeen two values
-- =============================================
CREATE FUNCTION GradeRange 
(	
	-- Add the parameters for the function here
	@firstGrade float, 
	@secondGrade float
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT Grade from Enrollments
	-- whre Grade>=@firstGrade AND Grade<=@secondGrade
	where Grade between @firstGrade AND @secondGrade
)
GO



-- MULTI STATEMENT TABLE-VALUED FUNCTIONS  ( It writes the all values of multiple table in one table by row by row, not by column by column. Column by column is usually performed using join.
use school;

select * from [dbo].[allPersons]()

--Function description for multi-table valued function 'allPerson()'
-- ================================================
-- Template generated from Template Explorer using:
-- Create Multi-Statement Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION allPersons 
(
	-- Add the parameters for the function here
	
)
RETURNS 
@Persons TABLE 
(
	-- Add the column definitions for the TABLE variable here
	firstName nvarchar(50), 
	LastName nvarchar(50),
	dateOfJoined datetime,
	personnel_type nvarchar(50)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	insert into @Persons
	select
	[firstname],
	[lastname],
	[enrollmentdate],
	'Student'
	from Students

	insert into @Persons
	select
	[firstname],
	[lastname],
	[DateJoined],
	'Teacher'
	from Teachers

	
	RETURN 
END
GO


