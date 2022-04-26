-- A trigger is a special type of stored procedure that automatically runs when an event occurs in the database server. 
--DML triggers run when a user tries to modify data through a data manipulation language (DML) event. 
--DML events are INSERT, UPDATE, or DELETE statements on a table or view.

Declare @StudentId int
exec [dbo].[InsertStudent] 'Willis', 'Brian', '2001-08-12', @StudentId OUTPUT


-- To insert into Enrollments table we use this trigger.
-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
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
CREATE TRIGGER dbo.Enrollment 
   ON  dbo.Students 
   AFTER Insert
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @studentid int
	select @studentid=id from inserted

	insert into Enrollments(CourseId,Grade,StudentId,TeacherId)
	values (1,NULL,@studentid,2)

END
GO


-- To trigger delete from all table, if we delete specific studentid from student table then all rows assosiated with that id from all table like enrollemts table, gets deleted.
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER dbo.DeleteStudentRecords 
   ON  dbo.Students 
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @stuid int
	select @stuid=id from deleted;

	DELETE from Enrollments where StudentId=@stuid
	
END
GO
