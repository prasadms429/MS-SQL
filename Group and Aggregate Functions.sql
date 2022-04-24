-- GROUPING DATA USING THE SQL GROUP BY CLAUSE
 select TeacherId, CourseId from Enrollments            -- To select two columns and display it from Enrollments table.
 select distinct TeacherId, CourseId from Enrollments   -- To select reduce repeated rows that contains same value in rows in a selected columns, we use this.
 
 SELECT TOP (1000) 
	   [TeacherId]
      ,[StudentId],
	  s.firstname+' '+s.lastname [Student Name],
	  t.firstname+' '+t.lastname [Teacher Name]
  FROM [school].[dbo].[Enrollments]
  inner join Teachers t on t.id=TeacherId
  inner join Students s on s.id=StudentId
  where TeacherId=2
  group by [TeacherId],[StudentId],s.firstname,s.lastname,t.firstname,t.lastname    -- Group by is used to do some mathematical operations.
