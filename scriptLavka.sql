USE [LavkaBase]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[MasterID] [int] NOT NULL,
	[AppointmentDate] [datetime] NOT NULL,
	[QueueNumber] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Balances]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Balances](
	[BalanceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[BalanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collections]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collections](
	[CollectionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CollectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Masters]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masters](
	[MasterID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LevelID] [int] NOT NULL,
	[Bio] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MasterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterServices]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterServices](
	[MasterID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MasterID] ASC,
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QualificationLevels]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QualificationLevels](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QualificationRequests]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QualificationRequests](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[MasterID] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[RequestDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ServiceID] [int] NULL,
	[MasterID] [int] NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[CollectionID] [int] NOT NULL,
	[LastModified] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[TransactionDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19.04.2025 15:56:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[RoleID] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ServiceID], [MasterID], [AppointmentDate], [QueueNumber], [Status]) VALUES (1, 5, 1, 1, CAST(N'2025-03-04T14:00:00.000' AS DateTime), N'A-1001', N'Сделан')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ServiceID], [MasterID], [AppointmentDate], [QueueNumber], [Status]) VALUES (2, 6, 2, 2, CAST(N'2025-03-04T15:00:00.000' AS DateTime), N'A-1002', N'Сделан')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ServiceID], [MasterID], [AppointmentDate], [QueueNumber], [Status]) VALUES (3, 7, 3, 1, CAST(N'2025-04-04T10:00:00.000' AS DateTime), N'A-1003', N'Сделан')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ServiceID], [MasterID], [AppointmentDate], [QueueNumber], [Status]) VALUES (4, 8, 4, 2, CAST(N'2025-04-04T11:00:00.000' AS DateTime), N'A-1004', N'Сделан')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ServiceID], [MasterID], [AppointmentDate], [QueueNumber], [Status]) VALUES (5, 9, 5, 1, CAST(N'2025-05-04T12:00:00.000' AS DateTime), N'A-1005', N'Подтвержден')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ServiceID], [MasterID], [AppointmentDate], [QueueNumber], [Status]) VALUES (6, 10, 6, 2, CAST(N'2025-05-04T13:00:00.000' AS DateTime), N'A-1006', N'Подтвержден')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ServiceID], [MasterID], [AppointmentDate], [QueueNumber], [Status]) VALUES (7, 5, 7, 1, CAST(N'2025-06-04T14:00:00.000' AS DateTime), N'A-1007', N'Подтвержден')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ServiceID], [MasterID], [AppointmentDate], [QueueNumber], [Status]) VALUES (8, 6, 8, 2, CAST(N'2025-06-04T15:00:00.000' AS DateTime), N'A-1008', N'В рассмотрении')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ServiceID], [MasterID], [AppointmentDate], [QueueNumber], [Status]) VALUES (9, 7, 9, 1, CAST(N'2025-07-04T16:00:00.000' AS DateTime), N'A-1009', N'В рассмотрении')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ServiceID], [MasterID], [AppointmentDate], [QueueNumber], [Status]) VALUES (10, 8, 10, 2, CAST(N'2025-07-04T17:00:00.000' AS DateTime), N'A-1010', N'В рассмотрении')
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Balances] ON 

INSERT [dbo].[Balances] ([BalanceID], [UserID], [Amount]) VALUES (1, 5, CAST(10000.00 AS Decimal(10, 2)))
INSERT [dbo].[Balances] ([BalanceID], [UserID], [Amount]) VALUES (2, 6, CAST(7500.00 AS Decimal(10, 2)))
INSERT [dbo].[Balances] ([BalanceID], [UserID], [Amount]) VALUES (3, 7, CAST(5000.00 AS Decimal(10, 2)))
INSERT [dbo].[Balances] ([BalanceID], [UserID], [Amount]) VALUES (4, 8, CAST(3000.00 AS Decimal(10, 2)))
INSERT [dbo].[Balances] ([BalanceID], [UserID], [Amount]) VALUES (5, 9, CAST(15000.00 AS Decimal(10, 2)))
INSERT [dbo].[Balances] ([BalanceID], [UserID], [Amount]) VALUES (6, 10, CAST(2000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Balances] OFF
GO
SET IDENTITY_INSERT [dbo].[Collections] ON 

INSERT [dbo].[Collections] ([CollectionID], [Name]) VALUES (1, N'Аниме')
INSERT [dbo].[Collections] ([CollectionID], [Name]) VALUES (4, N'Киберпанк')
INSERT [dbo].[Collections] ([CollectionID], [Name]) VALUES (2, N'Новый год')
INSERT [dbo].[Collections] ([CollectionID], [Name]) VALUES (5, N'Нуар')
INSERT [dbo].[Collections] ([CollectionID], [Name]) VALUES (3, N'Хэллоуин')
SET IDENTITY_INSERT [dbo].[Collections] OFF
GO
SET IDENTITY_INSERT [dbo].[Masters] ON 

INSERT [dbo].[Masters] ([MasterID], [UserID], [LevelID], [Bio]) VALUES (1, 3, 2, N'Опыт: 5 лет, специалист по аниме')
INSERT [dbo].[Masters] ([MasterID], [UserID], [LevelID], [Bio]) VALUES (2, 4, 1, N'Новичок в киберпанк-стиле')
SET IDENTITY_INSERT [dbo].[Masters] OFF
GO
INSERT [dbo].[MasterServices] ([MasterID], [ServiceID]) VALUES (1, 1)
INSERT [dbo].[MasterServices] ([MasterID], [ServiceID]) VALUES (1, 2)
INSERT [dbo].[MasterServices] ([MasterID], [ServiceID]) VALUES (1, 3)
INSERT [dbo].[MasterServices] ([MasterID], [ServiceID]) VALUES (1, 4)
INSERT [dbo].[MasterServices] ([MasterID], [ServiceID]) VALUES (1, 5)
INSERT [dbo].[MasterServices] ([MasterID], [ServiceID]) VALUES (2, 1)
INSERT [dbo].[MasterServices] ([MasterID], [ServiceID]) VALUES (2, 2)
INSERT [dbo].[MasterServices] ([MasterID], [ServiceID]) VALUES (2, 3)
INSERT [dbo].[MasterServices] ([MasterID], [ServiceID]) VALUES (2, 4)
INSERT [dbo].[MasterServices] ([MasterID], [ServiceID]) VALUES (2, 5)
GO
SET IDENTITY_INSERT [dbo].[QualificationLevels] ON 

INSERT [dbo].[QualificationLevels] ([LevelID], [Name]) VALUES (1, N'Junior')
INSERT [dbo].[QualificationLevels] ([LevelID], [Name]) VALUES (2, N'Middle')
INSERT [dbo].[QualificationLevels] ([LevelID], [Name]) VALUES (3, N'Senior')
SET IDENTITY_INSERT [dbo].[QualificationLevels] OFF
GO
SET IDENTITY_INSERT [dbo].[QualificationRequests] ON 

INSERT [dbo].[QualificationRequests] ([RequestID], [MasterID], [Status], [RequestDate]) VALUES (1, 1, N'В рассмотрении', CAST(N'2025-02-04T11:00:00.000' AS DateTime))
INSERT [dbo].[QualificationRequests] ([RequestID], [MasterID], [Status], [RequestDate]) VALUES (2, 2, N'Одобрен', CAST(N'2025-02-04T11:05:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[QualificationRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([ReviewID], [UserID], [ServiceID], [MasterID], [Rating], [Comment], [CreatedAt]) VALUES (1, 5, 1, NULL, 5, N'Идеальный костюм!', CAST(N'2025-03-04T16:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [UserID], [ServiceID], [MasterID], [Rating], [Comment], [CreatedAt]) VALUES (2, 6, NULL, 2, 4, N'Мастер аккуратный', CAST(N'2025-03-04T17:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [UserID], [ServiceID], [MasterID], [Rating], [Comment], [CreatedAt]) VALUES (3, 7, 3, NULL, 5, N'Грим как в кино!', CAST(N'2025-03-04T12:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [UserID], [ServiceID], [MasterID], [Rating], [Comment], [CreatedAt]) VALUES (4, 8, NULL, 1, 3, N'Могло быть лучше', CAST(N'2025-04-04T13:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [UserID], [ServiceID], [MasterID], [Rating], [Comment], [CreatedAt]) VALUES (5, 9, 5, NULL, 5, N'Стильно и удобно', CAST(N'2025-04-04T14:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [UserID], [ServiceID], [MasterID], [Rating], [Comment], [CreatedAt]) VALUES (6, 10, NULL, 1, 2, N'Не понравилось', CAST(N'2025-04-04T15:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [UserID], [ServiceID], [MasterID], [Rating], [Comment], [CreatedAt]) VALUES (7, 5, 7, NULL, 4, N'Яркие цвета', CAST(N'2025-04-04T16:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [UserID], [ServiceID], [MasterID], [Rating], [Comment], [CreatedAt]) VALUES (8, 6, NULL, 2, 5, N'Профессионал!', CAST(N'2025-04-04T17:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [UserID], [ServiceID], [MasterID], [Rating], [Comment], [CreatedAt]) VALUES (9, 7, 9, NULL, 3, N'Дорого, но качественно', CAST(N'2025-04-04T18:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [UserID], [ServiceID], [MasterID], [Rating], [Comment], [CreatedAt]) VALUES (10, 8, NULL, 1, 4, N'Хороший сервис', CAST(N'2025-04-04T19:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [Name]) VALUES (1, N'Админ')
INSERT [dbo].[Roles] ([RoleID], [Name]) VALUES (3, N'Мастер')
INSERT [dbo].[Roles] ([RoleID], [Name]) VALUES (2, N'Модератор')
INSERT [dbo].[Roles] ([RoleID], [Name]) VALUES (4, N'Пользователь')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceID], [Name], [Description], [Price], [CollectionID], [LastModified]) VALUES (1, N'Косплей «Наруто»', N'Аниме-костюм', CAST(5000.00 AS Decimal(10, 2)), 1, CAST(N'2025-02-04T10:00:00.000' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [Name], [Description], [Price], [CollectionID], [LastModified]) VALUES (2, N'Новогодняя маска', N'Роспись масок', CAST(1500.00 AS Decimal(10, 2)), 2, CAST(N'2025-02-04T10:05:00.000' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [Name], [Description], [Price], [CollectionID], [LastModified]) VALUES (3, N'Грим «Зомби»', N'Хэллоуинский грим', CAST(2000.00 AS Decimal(10, 2)), 3, CAST(N'2025-02-04T10:10:00.000' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [Name], [Description], [Price], [CollectionID], [LastModified]) VALUES (4, N'Киберпанк-очки', N'LED-очки', CAST(3000.00 AS Decimal(10, 2)), 4, CAST(N'2025-02-04T10:15:00.000' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [Name], [Description], [Price], [CollectionID], [LastModified]) VALUES (5, N'Нуар-костюм', N'Стиль 1920-х', CAST(4500.00 AS Decimal(10, 2)), 5, CAST(N'2025-02-04T10:20:00.000' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [Name], [Description], [Price], [CollectionID], [LastModified]) VALUES (6, N'Аниме-парик', N'Парик из шерсти', CAST(2500.00 AS Decimal(10, 2)), 1, CAST(N'2025-02-04T10:25:00.000' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [Name], [Description], [Price], [CollectionID], [LastModified]) VALUES (7, N'Светящийся пояс', N'Для киберпанка', CAST(1800.00 AS Decimal(10, 2)), 4, CAST(N'2025-02-04T10:30:00.000' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [Name], [Description], [Price], [CollectionID], [LastModified]) VALUES (8, N'Ведьминский плащ', N'Хэллоуин', CAST(3200.00 AS Decimal(10, 2)), 3, CAST(N'2025-02-04T10:35:00.000' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [Name], [Description], [Price], [CollectionID], [LastModified]) VALUES (9, N'Новогодний костюм', N'Дед Мороз', CAST(4000.00 AS Decimal(10, 2)), 2, CAST(N'2025-02-04T10:40:00.000' AS DateTime))
INSERT [dbo].[Services] ([ServiceID], [Name], [Description], [Price], [CollectionID], [LastModified]) VALUES (10, N'Нуар-шляпа', N'Фетровая шляпа', CAST(1200.00 AS Decimal(10, 2)), 5, CAST(N'2025-02-04T10:45:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionID], [UserID], [Amount], [Type], [TransactionDate]) VALUES (1, 5, CAST(10000.00 AS Decimal(10, 2)), N'Депозит', CAST(N'2025-01-04T10:00:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [Amount], [Type], [TransactionDate]) VALUES (2, 6, CAST(7500.00 AS Decimal(10, 2)), N'Депозит', CAST(N'2025-01-04T10:05:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [Amount], [Type], [TransactionDate]) VALUES (3, 7, CAST(5000.00 AS Decimal(10, 2)), N'Депозит', CAST(N'2025-01-04T10:10:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [Amount], [Type], [TransactionDate]) VALUES (4, 8, CAST(3000.00 AS Decimal(10, 2)), N'Депозит', CAST(N'2025-01-04T10:15:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [Amount], [Type], [TransactionDate]) VALUES (5, 9, CAST(15000.00 AS Decimal(10, 2)), N'Депозит', CAST(N'2025-01-04T10:20:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [Amount], [Type], [TransactionDate]) VALUES (6, 10, CAST(2000.00 AS Decimal(10, 2)), N'Депозит', CAST(N'2025-01-04T10:25:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [Amount], [Type], [TransactionDate]) VALUES (7, 5, CAST(-5000.00 AS Decimal(10, 2)), N'Вывод', CAST(N'2025-03-04T16:30:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [Amount], [Type], [TransactionDate]) VALUES (8, 6, CAST(-1500.00 AS Decimal(10, 2)), N'Вывод', CAST(N'2025-03-04T17:30:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [Amount], [Type], [TransactionDate]) VALUES (9, 7, CAST(-2000.00 AS Decimal(10, 2)), N'Вывод', CAST(N'2025-04-04T12:30:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [Amount], [Type], [TransactionDate]) VALUES (10, 8, CAST(-3000.00 AS Decimal(10, 2)), N'Вывод', CAST(N'2025-04-04T13:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [RoleID], [CreatedAt]) VALUES (1, N'admin@mail.ru', N'0001', N'Иван Петров', 1, CAST(N'2025-01-04T09:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [RoleID], [CreatedAt]) VALUES (2, N'moderator@mail.ru', N'0002', N'Анна Сидорова', 2, CAST(N'2025-01-04T09:05:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [RoleID], [CreatedAt]) VALUES (3, N'master1@mail.ru', N'0003', N'Ольга Ковалёва', 3, CAST(N'2025-01-04T09:10:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [RoleID], [CreatedAt]) VALUES (4, N'master2@mail.ru', N'0004', N'Дмитрий Волков', 3, CAST(N'2025-01-04T09:15:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [RoleID], [CreatedAt]) VALUES (5, N'user1@mail.ru', N'0005', N'Мария Иванова', 4, CAST(N'2025-01-04T09:20:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [RoleID], [CreatedAt]) VALUES (6, N'user2@mail.ru', N'0006', N'Алексей Новиков', 4, CAST(N'2025-01-04T09:25:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [RoleID], [CreatedAt]) VALUES (7, N'user3@mail.ru', N'0007', N'Елена Смирнова', 4, CAST(N'2025-01-04T09:30:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [RoleID], [CreatedAt]) VALUES (8, N'user4@mail.ru', N'0008', N'Павел Кузнецов', 4, CAST(N'2025-01-04T09:35:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [RoleID], [CreatedAt]) VALUES (9, N'user5@mail.ru', N'0009', N'Антон Белов', 4, CAST(N'2025-01-04T09:40:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [RoleID], [CreatedAt]) VALUES (10, N'user6@mail.ru', N'00010', N'София Романова', 4, CAST(N'2025-01-04T09:45:00.000' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Email], [PasswordHash], [FullName], [RoleID], [CreatedAt]) VALUES (13, N'fhusn', N'0011', N'Хуснутдинов Фаниль', 4, CAST(N'2025-04-19T15:34:29.907' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [UQ__Balances__1788CCAD150DBAF1]    Script Date: 19.04.2025 15:56:27 ******/
ALTER TABLE [dbo].[Balances] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Collecti__737584F66E102494]    Script Date: 19.04.2025 15:56:27 ******/
ALTER TABLE [dbo].[Collections] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Masters__1788CCAD1AE8AA6A]    Script Date: 19.04.2025 15:56:27 ******/
ALTER TABLE [dbo].[Masters] ADD UNIQUE NONCLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Qualific__737584F623E2B776]    Script Date: 19.04.2025 15:56:27 ******/
ALTER TABLE [dbo].[QualificationLevels] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__737584F619D5E9D1]    Script Date: 19.04.2025 15:56:27 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534F138CA11]    Script Date: 19.04.2025 15:56:27 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Balances] ADD  DEFAULT ((0.00)) FOR [Amount]
GO
ALTER TABLE [dbo].[QualificationRequests] ADD  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[QualificationRequests] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (getdate()) FOR [LastModified]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [TransactionDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([MasterID])
REFERENCES [dbo].[Masters] ([MasterID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Balances]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Masters]  WITH CHECK ADD FOREIGN KEY([LevelID])
REFERENCES [dbo].[QualificationLevels] ([LevelID])
GO
ALTER TABLE [dbo].[Masters]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[MasterServices]  WITH CHECK ADD FOREIGN KEY([MasterID])
REFERENCES [dbo].[Masters] ([MasterID])
GO
ALTER TABLE [dbo].[MasterServices]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[QualificationRequests]  WITH CHECK ADD FOREIGN KEY([MasterID])
REFERENCES [dbo].[Masters] ([MasterID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([MasterID])
REFERENCES [dbo].[Masters] ([MasterID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD FOREIGN KEY([CollectionID])
REFERENCES [dbo].[Collections] ([CollectionID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
