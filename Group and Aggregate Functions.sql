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
  
  
 -- SQL AVERAGE AGGREGATE FUNCTION
 use school;
select CourseId,avg(Grade) from Enrollments
--where CourseId=2 		-- If use this then it prints for specific id, otherwise it prints for all ids
group by CourseId		-- By using group by CourseId it calculates average values by grouping common ids. For all different course ids.
having avg(Grade)>=70		-- If we want to apply aggregate function for specific condition then we use 'having' keyword.
order by avg(grade)		-- To print average values of grade in asending order we use this.


-- SQL COUNT AGGREGATE FUNCTION

-- Bring back the number of student enrolled per course
select CourseId, count(StudentId) from Enrollments
group by CourseId

--or

select c.CourseId [Course Id],c.CourseName [Course Name], count(StudentId) from Enrollments e	-- To display in more detailed way with modified column names
inner join Courses c on c.CourseId = e.CourseId
group by c.CourseId, c.CourseName
