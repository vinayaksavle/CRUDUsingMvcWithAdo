USE [CRUDUsingMVCWithAdoDotNet]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/23/2018 10:36:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [City], [Address]) VALUES (4, N'Vinayak', N'Pune', N'Hinjewadi, Pune')
SET IDENTITY_INSERT [dbo].[Employee] OFF
/****** Object:  StoredProcedure [dbo].[AddNewEmpDetails]    Script Date: 10/23/2018 10:36:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddNewEmpDetails]
(
@Name varchar(50),
@City varchar(50),
@Address varchar(50)
)
as 
begin
insert into Employee values(@Name,@City,@Address)
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmpById]    Script Date: 10/23/2018 10:36:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteEmpById]
(@EmpId int)
as
begin
delete from Employee where Id=@EmpId
end
GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 10/23/2018 10:36:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetEmployees]
as
begin
select * from Employee
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmpDetails]    Script Date: 10/23/2018 10:36:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateEmpDetails]
(
@EmpId int,
@Name varchar(50),
@City varchar(50),
@Address varchar(50)
)
as
begin
update Employee
set 
Name=@Name,
City=@City,
Address=@Address
where Id=@EmpId
end
GO
