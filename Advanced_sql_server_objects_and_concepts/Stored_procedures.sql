-- Stored procedures is to perform some intelligent tasks. and it  is used to write repeated code under one procedure for some operation. Whereas Functions perform Airthmatic or mathamatical operations on data in SQL.

-- To select all students using stored procedure
use school;
exec [dbo].[SelectAllStudents]

-- Description of the stored procedure
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
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
CREATE PROCEDURE SelectAllStudents 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from students;
END
GO


-- SELECT STUDENT BY ID
use school;
exec [dbo].[SelectStudentById] @id=1    -- To select id, we have to reference id by using @id.

-- Description of procedure SelectStudentById
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SelectStudentById 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Students where id=@id
END
GO


-- INSERT INTO TABLE
use school;
exec [dbo].[InsertStudent] @lastname='O D', @firstname='Kaju', @dateofbirth='1999-05-18'

-- Description of InsetStudent procedure
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertStudent 
	-- Add the parameters for the stored procedure here
	@lastname nvarchar(50),
	@firstname nvarchar(50),
	@dateofbirth datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Students(lastname,firstname,dateofbirth,enrollmentdate)
	values 
	(@lastname,@firstname,@dateofbirth,getdate())     -- Without entering manual date time, we can use getdate() function to enter enrollment as when code is executed.
END
GO


--TO DISPLAY STUDENT ID BY USING GIVEN INFORMATION
use school;
DECLARE @StudentId int
exec [dbo].[InsertStudent] 'O D','Kaju','1999-05-18', @StudentId OUTPUT
select @StudentId

--Description of InserStudent procedure
USE [school]
GO
/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 26-04-2022 16:58:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[InsertStudent] 
	-- Add the parameters for the stored procedure here
	@lastname nvarchar(50),
	@firstname nvarchar(50),
	@dateofbirth datetime,
	@StudentId int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Students(lastname,firstname,dateofbirth,enrollmentdate)
	values 
	(@lastname,@firstname,@dateofbirth,getdate())

	select @StudentId=SCOPE_IDENTITY()      -- SCOPE_IDENTITY() function display last count or id based on operation
END

-- To display information of outputed id, we use this query for above procedure
use school;
DECLARE @StudentId int
exec [dbo].[InsertStudent] 'O D','Kaju','1999-05-18', @StudentId OUTPUT

exec [dbo].[SelectStudentById] @id = @StudentId
