raiserror('Creating PetStore database....',0,1)
GO
USE [master]
GO
/****** Object:  Database [PetStore]    Script Date: 6/3/2019 10:55:30 PM ******/
CREATE DATABASE [OneBoutique]
GO
USE [OneBoutique]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/3/2019 10:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/3/2019 10:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[phone] [varchar](12) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[userName] [varchar](100) NOT NULL unique,
	--password: default = 1
	[password] [char](64) NOT NULL default('123'),
	[enabled] [bit] NOT NULL default(1),
	[role] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/3/2019 10:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] NOT NULL,
	[rank] varchar(50) NOT NULL CHECK([rank] IN ('Normal','Membership','VIP')),
	[shipToAddress] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6/3/2019 10:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderHeader]    Script Date: 6/3/2019 10:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderHeader](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [varchar](30) NULL,
	[customer_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/3/2019 10:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/3/2019 10:55:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL,
	[category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Trousers')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Shirts')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Jackets')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (1, N'Trouser 1', 204.99, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (2, N'Trouser 2', 73.94, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (3, N'Trouser 3', 74.11, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (4, N'Trouser 4', 52.73, 0, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (5, N'Trouser 5', 171.13, 0.15, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (6, N'Trouser 6', 140.55, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (7, N'Trouser 7', 56.01, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (8, N'Trouser 8', 48.17, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (9, N'Trouser 9', 62.03, 0, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (10, N'Trouser 10', 88.19, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (11, N'Trouser 11', 20.31, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (12, N'Trouser 12', 96.47, 0.15, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (13, N'Trouser 13', 155.58, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (14, N'Shirt 14', 204.26, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (15, N'Shirt 15', 148.25, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (16, N'Shirt 16', 209.9, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (17, N'Shirt 17', 104.29, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (18, N'Shirt 18', 146.36, 0, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (19, N'Shirt 19', 154.76, 0.15, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (20, N'Shirt 20', 135.82, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (21, N'Shirt 21', 158.46, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (22, N'Shirt 22', 165.89, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (23, N'Shirt 23', 95.7, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (24, N'Shirt 24', 80.16, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (25, N'Shirt 25', 19.25, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (26, N'Shirt 26', 171.36, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (27, N'Jacket 27', 35.08, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (28, N'Jacket 28', 57.92, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (29, N'Jacket 29', 157.81, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (30, N'Jacket 30', 151, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (31, N'Jacket 31', 126.34, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (32, N'Jacket 32', 170.23, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (33, N'Jacket 33', 136.5, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (34, N'Jacket 34', 24.68, 0.1, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (35, N'Jacket 35', 88.71, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (36, N'Jacket 36', 190.43, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (37, N'Jacket 37', 14, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (38, N'Jacket 38', 206.57, 0.1, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (39, N'Jacket 39', 163.48, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (40, N'Jacket 40', 92.3, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (41, N'Jacket 41', 168.69, 0.1, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (42, N'Jacket 42', 117.89, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (43, N'Jacket 43', 56.34, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (44, N'Jacket 44', 158.61, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (45, N'Jacket 45', 209.96, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (46, N'Jacket 46', 176.24, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (47, N'Jacket 47', 174.28, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [category_id]) VALUES (48, N'Jacket 48', 70.65, 0, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF

SET IDENTITY_INSERT [dbo].[Account] ON 
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [userName],[role]) VALUES
(1, N'Customer1', N'1873 Lion Circle', N'5678901234', N'c1@gmail.com', 'c1','ROLE_CUSTOMER'),
(2, N'Customer2', N'5747 Shirley Drive', N'6789872314', N'c2@gmail.com', 'c2', 'ROLE_CUSTOMER'),
(3, N'Customer3', N'1234 Shirley ABCXYZ', N'0123456789', N'c3@gmail.com', 'c3', 'ROLE_CUSTOMER')
SET IDENTITY_INSERT [dbo].[Account] OFF

INSERT [dbo].[Customer] ([id], [rank], [shipToAddress]) VALUES (1, 'Normal', N'1873 Lion Circle')
INSERT [dbo].[Customer] ([id], [rank], [shipToAddress]) VALUES (2, 'Membership', N'5747 Shirley Drive')
INSERT [dbo].[Customer] ([id], [rank], [shipToAddress]) VALUES (3, 'VIP', N'1234 Shirley ABCXYZ')

SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__66DCF95C57BB9BE7]    Script Date: 6/3/2019 10:55:31 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[OrderHeader]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[OrderHeader] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
GO
USE [master]
GO
ALTER DATABASE [OneBoutique] SET  READ_WRITE 
GO
raiserror('The OneBoutique database in now ready for use....',0,1)
GO