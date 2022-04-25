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


-- To getCourseTileById
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

