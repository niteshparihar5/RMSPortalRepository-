USE [master]
GO
/****** Object:  Database [RMS_DB]    Script Date: 5/25/2020 8:26:40 PM ******/
CREATE DATABASE [RMS_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RMS_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RMS_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RMS_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\RMS_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RMS_DB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RMS_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RMS_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RMS_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RMS_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RMS_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RMS_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RMS_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RMS_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RMS_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RMS_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RMS_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RMS_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RMS_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RMS_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RMS_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RMS_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RMS_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RMS_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RMS_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RMS_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RMS_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RMS_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RMS_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RMS_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [RMS_DB] SET  MULTI_USER 
GO
ALTER DATABASE [RMS_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RMS_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RMS_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RMS_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RMS_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RMS_DB', N'ON'
GO
ALTER DATABASE [RMS_DB] SET QUERY_STORE = OFF
GO
USE [RMS_DB]
GO
/****** Object:  Table [dbo].[Candidates]    Script Date: 5/25/2020 8:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidates](
	[CandidateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Mobile] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[KeySkill] [varchar](200) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [date] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Candidates] PRIMARY KEY CLUSTERED 
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/25/2020 8:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [date] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rounds]    Script Date: 5/25/2020 8:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rounds](
	[RoundId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[FeedBack] [varchar](200) NULL,
	[UserId_FK] [int] NULL,
	[CandidateId_FK] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Rounds] PRIMARY KEY CLUSTERED 
(
	[RoundId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Mappings]    Script Date: 5/25/2020 8:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Mappings](
	[UserMappingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId_FK] [int] NOT NULL,
	[RoleId_FK] [int] NOT NULL,
 CONSTRAINT [PK_User_Mappings] PRIMARY KEY CLUSTERED 
(
	[UserMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/25/2020 8:26:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[MobileNo] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [date] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Candidates] ON 
GO
INSERT [dbo].[Candidates] ([CandidateId], [Name], [Email], [Mobile], [Address], [KeySkill], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (1, N'Nitesh', N'ernitesh2016@gmail.com', 12345, N'new delhi', N'.net', 1, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Candidates] ([CandidateId], [Name], [Email], [Mobile], [Address], [KeySkill], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (3, N'Aman', N'aman@gmail.com', 12345, N'Mumbai', N'Java', 1, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Candidates] ([CandidateId], [Name], [Email], [Mobile], [Address], [KeySkill], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (4, N'Ritesh Kumar Singh', N'niteshsinghbscit@gmail.com', 1234567890, N'Kolkata', N'JAVA', 1, CAST(N'2020-05-25' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Candidates] ([CandidateId], [Name], [Email], [Mobile], [Address], [KeySkill], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (5, N'Sonu', N'niteshsinghbscit@gmail.com', 1234567890, N'Mumbai', N'Oracale', 1, CAST(N'2020-05-25' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Candidates] ([CandidateId], [Name], [Email], [Mobile], [Address], [KeySkill], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (6, N'Praveen', N'niteshsinghbscit@gmail.com', 1234567890, N'Mumbai', N'SQLDBA', 1, CAST(N'2020-05-25' AS Date), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Candidates] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([RoleId], [Name], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (1, N'HR', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Roles] ([RoleId], [Name], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (2, N'Interviewer', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Roles] ([RoleId], [Name], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (3, N'Manager', NULL, NULL, NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Rounds] ON 
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (1, N'First round', N'Good', 1, NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (11, N'Round Name', N'FeedBack', 1, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (12, N'Round Name1', N'feedback1', 1, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (13, N'R1', N'f1', 1, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (14, N'r4', N'f4', 1, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (15, N'Invite candidate', N'interview begin', 1, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (16, N'aa', N'interview begin1', 1, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (17, N'aa', N'feedback', 2, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (18, N'qq', N'ff', 1, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (19, N'aa', NULL, 1, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (20, N'final round', NULL, 3, 1, NULL, NULL, 1, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (21, N'testround', NULL, 1, 1, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (22, N'test01pss', NULL, 3, 1, NULL, NULL, 1, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (23, N'test02', N'pass5..........2', 2, 1, NULL, NULL, 2, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (24, N'test04', N'Pass............', 2, 1, NULL, NULL, 3, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (25, N'wwwwwwwww', N'Selected for this round.', 2, 1, NULL, NULL, 2, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (26, N'wwwwwwwww11', N'fail............', 2, 1, NULL, NULL, 2, NULL, 0)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (27, N'wwwwwwwww11', N'Select.', 2, 1, NULL, NULL, 2, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (28, N'zzzzzzzz', NULL, 4, 1, NULL, NULL, 1, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (29, N'ssssssssss11', NULL, 4, 1, NULL, NULL, 1, NULL, 0)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (30, N'R1', NULL, 2, 1, NULL, NULL, 1, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (31, N'Testround11', N'selected.1111111111111111', 2, 1, NULL, NULL, 2, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (32, N'Round15555555555555555555', N'pass111111', 2, 3, NULL, NULL, 2, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (33, N'Ritesh Kumar Singh', NULL, NULL, NULL, 1, CAST(N'2020-05-25' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (34, N'Ritesh Kumar Singh', NULL, NULL, NULL, 1, CAST(N'2020-05-25' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (35, N'Ritesh Kumar Singh', NULL, NULL, NULL, 1, CAST(N'2020-05-25' AS Date), NULL, NULL, NULL)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (36, N'First round of Ritesh.', NULL, 2, 4, NULL, NULL, 1, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (37, N'Sonu has sort listed for this role.', N'Sonu second round interview clear.Good lick for next round...............', 3, 5, NULL, NULL, 1, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (38, N'Praveen first round interview.', NULL, 3, 6, NULL, NULL, 1, NULL, 1)
GO
INSERT [dbo].[Rounds] ([RoundId], [Name], [FeedBack], [UserId_FK], [CandidateId_FK], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (39, N'second round', NULL, 1, 6, 1, CAST(N'2020-05-25' AS Date), NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Rounds] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Mappings] ON 
GO
INSERT [dbo].[User_Mappings] ([UserMappingId], [UserId_FK], [RoleId_FK]) VALUES (1, 1, 1)
GO
INSERT [dbo].[User_Mappings] ([UserMappingId], [UserId_FK], [RoleId_FK]) VALUES (2, 2, 2)
GO
INSERT [dbo].[User_Mappings] ([UserMappingId], [UserId_FK], [RoleId_FK]) VALUES (4, 3, 3)
GO
INSERT [dbo].[User_Mappings] ([UserMappingId], [UserId_FK], [RoleId_FK]) VALUES (5, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[User_Mappings] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [MobileNo], [Address], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (1, N'HR', N'hr@gmail.com', N'12345', 1234567890, N'New Delhi', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [MobileNo], [Address], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (2, N'Interviewer', N'interviewer@gmail.com', N'12345', 1234567890, N'New Delhi', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [MobileNo], [Address], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (3, N'Manager', N'cbretest2019@gmail.com', N'12345', 1234567890, N'New Delhi', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Users] ([UserId], [Name], [Email], [Password], [MobileNo], [Address], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [IsActive]) VALUES (4, N'Test', N'test@gmail.com', N'12345', 1234567890, N'New Delhi', NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Rounds]  WITH CHECK ADD FOREIGN KEY([CandidateId_FK])
REFERENCES [dbo].[Candidates] ([CandidateId])
GO
ALTER TABLE [dbo].[Rounds]  WITH CHECK ADD FOREIGN KEY([UserId_FK])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[User_Mappings]  WITH CHECK ADD  CONSTRAINT [FK__User_Mapp__RoleI__4222D4EF] FOREIGN KEY([RoleId_FK])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[User_Mappings] CHECK CONSTRAINT [FK__User_Mapp__RoleI__4222D4EF]
GO
ALTER TABLE [dbo].[User_Mappings]  WITH CHECK ADD  CONSTRAINT [FK__User_Mapp__UserI__412EB0B6] FOREIGN KEY([UserId_FK])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[User_Mappings] CHECK CONSTRAINT [FK__User_Mapp__UserI__412EB0B6]
GO
USE [master]
GO
ALTER DATABASE [RMS_DB] SET  READ_WRITE 
GO
