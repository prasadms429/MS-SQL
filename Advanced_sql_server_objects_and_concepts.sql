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
