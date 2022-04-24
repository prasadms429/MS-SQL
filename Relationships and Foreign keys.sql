-- What are Relationships, Foreign keys and Normalization
--Relationship is relating one table to another using primary and foreign keys
--A Table id that is included in another table is foriegn key to that table.
--Reducing redundancy and repeatation of data by using foriegn keys is Normalization.

-- Table which is not dependent on any other table then it consist atomicity property. If it includes any forieng key in it then it is not consist atomicity.

--Running queries on related table ( Inner join )
--Joins
select
t.Firstname [Teacher First Name],               -- To display Firstname of teacher table as 'Teacher First Name' we use '[]'.
t.Lastname [Teacher Last Name],
s.Firstname [Student First Name],
s.Lastname [Student Last Name],
c.CourseName [Course Title],
c.CourseCode [Course Code]
from enrollments e
inner join Teacher t on t.id= e.TeacherId       -- We denote Teacher as 't' because, by using this we dont have to write full word every time.
inner join Students s on s.id= e.StudentId      -- In this, 'Students' is a table in that it contains 'id' and that information is completly joined to 'StudentId' in 'Enrollment table'.
inner join Courses c on c.CourseId= e.CourseId
where t.Id=2                                    -- It displays above selected information for teacher id 2, in enrollment table.
