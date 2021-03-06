USE [master]
GO
/****** Object:  Database [EgoDB]    Script Date: 2020/6/28 0:07:51 ******/
CREATE DATABASE [EgoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EgoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EgoDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EgoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EgoDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EgoDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EgoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EgoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EgoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EgoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EgoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EgoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EgoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EgoDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EgoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EgoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EgoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EgoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EgoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EgoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EgoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EgoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EgoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EgoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EgoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EgoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EgoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EgoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EgoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EgoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EgoDB] SET RECOVERY FULL 
GO
ALTER DATABASE [EgoDB] SET  MULTI_USER 
GO
ALTER DATABASE [EgoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EgoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EgoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EgoDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EgoDB', N'ON'
GO
USE [EgoDB]
GO
/****** Object:  Table [dbo].[Advert]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advert](
	[AdvertID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Stor] [int] NULL,
	[Url] [nvarchar](50) NULL,
	[Images] [nvarchar](50) NOT NULL,
	[CreateTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvertID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[Articletitle] [nvarchar](50) NOT NULL,
	[ArticleContent] [nvarchar](50) NOT NULL,
	[UpdateTime] [date] NULL,
	[ACID] [int] NULL,
	[UserID] [int] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article_Category]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article_Category](
	[ACID] [int] IDENTITY(1,1) NOT NULL,
	[ACName] [nvarchar](50) NOT NULL,
	[UserID] [int] NULL,
	[UpdateTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ACID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[TextContent] [nvarchar](100) NULL,
	[Images] [nvarchar](50) NULL,
	[Stars] [int] NOT NULL,
	[Time] [date] NULL,
	[IsAudit] [int] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contect]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contect](
	[ContectID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ContencFlag] [int] NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactMoblie] [int] NOT NULL,
	[ContactAddress] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Costs]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costs](
	[CostsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CostMoney] [money] NOT NULL,
	[CostType] [nvarchar](50) NOT NULL,
	[CreateTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CostsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DynamicComment]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DynamicComment](
	[DCID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DynamicID] [int] NULL,
	[Content] [nvarchar](50) NOT NULL,
	[Times] [date] NULL,
	[IsAudit] [int] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dynamics]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dynamics](
	[DynamicID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DynamicContent] [nvarchar](200) NOT NULL,
	[IsAudit] [int] NULL,
	[CreateTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DynamicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footprint]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footprint](
	[FootprintID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[UserID] [int] NULL,
	[CreateTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FootprintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Integrals]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Integrals](
	[IntegralID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[IntegralValue] [int] NOT NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IntegralID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logistics]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logistics](
	[LogisticsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[LogisticsNum] [nvarchar](20) NOT NULL,
	[ConpanyName] [nvarchar](20) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactMoblie] [int] NOT NULL,
	[ContactAddress] [nvarchar](50) NOT NULL,
	[ContactNote] [nvarchar](50) NOT NULL,
	[LogisticsStatus] [int] NULL,
	[CreateTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogisticsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Moneys]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moneys](
	[MoneyID] [int] IDENTITY(1,1) NOT NULL,
	[Money] [money] NOT NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MoneyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Product]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Product](
	[OPID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderInfo]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInfo](
	[OrderID] [int] NOT NULL,
	[UserID] [int] NULL,
	[OrPrice] [money] NOT NULL,
	[ContacName] [nvarchar](50) NOT NULL,
	[ContacMoblie] [int] NOT NULL,
	[ContacAddress] [nvarchar](50) NOT NULL,
	[OrderStatus] [int] NULL,
	[CreateTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1000,1) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ProductName] [nvarchar](max) NULL,
	[ProDescription] [nvarchar](max) NULL,
	[ShortPrice] [money] NOT NULL,
	[Price] [money] NOT NULL,
	[ProQuantity] [int] NOT NULL,
	[SallQuantity] [int] NOT NULL,
	[ProImage] [nvarchar](50) NOT NULL,
	[UpdateTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductSku]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSku](
	[SkuID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[SkuName] [nvarchar](50) NOT NULL,
	[Skuquantity] [int] NOT NULL,
	[SkuPrice] [money] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SkuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](50) NOT NULL,
	[Images] [nvarchar](50) NULL,
	[Sort] [int] NULL,
	[ErciID] [int] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShopCar]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCar](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[UserID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[CreateTime] [date] NULL,
	[SkuID] [int] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserRole] [int] NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPwd] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[IsVip] [int] NULL,
	[Images] [nvarchar](50) NULL,
	[Integral] [int] NULL,
	[Money] [money] NULL,
	[RegistrationTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 2020/6/28 0:07:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[UserID] [int] NULL,
	[SkuID] [int] NULL,
	[WishTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1021, 33, N'佳能TS3380打印机家用小型复印一体机无线连接手机wifi彩色喷墨照片扫描黑白a4学生家庭办公室MG2580S打印机', N'佳能TS3380打印机家用小型复印一体机无线连接手机wifi彩色喷墨照片扫描黑白a4学生家庭办公室MG2580S打印机', 900.0000, 500.0000, 200, 10, N'img6.jpg', CAST(0x3C410B00 AS Date), N'不飞v吧')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1023, 33, N'打印机家用迷你小型A4学生手机便携式可连手机移动无线热敏蓝牙试卷整理神器照片写作业错题打印机', N'打印机家用迷你小型A4学生手机便携式可连手机移动无线热敏蓝牙试卷整理神器照片写作业错题打印机', 1000.0000, 400.0000, 400, 20, N'img6.jpg', CAST(0x3C410B00 AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1026, 33, N'Canon/佳能瞬彩 彩色专用相片纸日本原装进口ZP-2030', N'Canon/佳能瞬彩 彩色专用相片纸日本原装进口ZP-2030', 200.0000, 60.0000, 200, 10, N'img6.jpg', CAST(0x3C410B00 AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1028, NULL, N'阳澄湖大闸蟹', NULL, 200.0000, 196.0000, 10, 10, N'img3.jpg', NULL, N'买一送一
鲜活直达')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1029, NULL, N'保护儿童行车安全', NULL, 2000.0000, 1320.0000, 20, 5, N'img.jpg', NULL, N'儿童安全座椅')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1030, NULL, N'韩后919爱购节', NULL, 2000.0000, 1320.0000, 100, 2, N'img2.jpg', NULL, N'最IN进口面膜敷起来')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1031, NULL, N'阳澄湖大闸蟹', NULL, 200.0000, 196.0000, 10, 10, N'img3.jpg', NULL, N'买一送一')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1032, NULL, N'保护儿童行车安全', NULL, 2000.0000, 1320.0000, 20, 5, N'img.jpg', NULL, N'儿童安全座椅')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1033, NULL, N'韩后919爱购节', NULL, 2000.0000, 1320.0000, 100, 2, N'img2.jpg', NULL, N'最IN进口面膜敷起来')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1035, NULL, N'苹果WATCH手表 智能穿戴 智能手表 Apple Watch', NULL, 3000.0000, 2658.0000, 100, 2, N'img4.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1036, NULL, N'分期免息 苹果 ipad 2019新款 Air3 2平板电脑mini5 4 Pro 2018 7', NULL, 3000.0000, 2658.0000, 200, 4, N'img6.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1040, NULL, N'2019新款Apple/苹果10.2英寸iPad2018款mini5 4平板电脑2017Air3', NULL, 3000.0000, 2658.0000, 220, 5, N'img6.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1041, NULL, N'苹果WATCH手表 智能穿戴 智能手表 Apple Watch', NULL, 3000.0000, 2658.0000, 100, 2, N'img7.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1042, NULL, N'分期免息 苹果 ipad 2019新款 Air3 2平板电脑mini5 4 Pro 2018 7', NULL, 3000.0000, 2658.0000, 200, 4, N'img8.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1043, NULL, N'2019新款Apple/苹果10.2英寸iPad2018款mini5 4平板电脑2017Air3', NULL, 3000.0000, 2658.0000, 220, 5, N'img9.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1044, NULL, N'阳澄湖大闸蟹', NULL, 200.0000, 196.0000, 10, 10, N'img10.jpg', NULL, N'买一送一')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1045, NULL, N'保护儿童行车安全', NULL, 2000.0000, 1320.0000, 20, 5, N'img11.jpg', NULL, N'儿童安全座椅')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1046, NULL, N'韩后919爱购节', NULL, 2000.0000, 1320.0000, 100, 2, N'img12.jpg', NULL, N'最IN进口面膜敷起来')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1047, NULL, N'阳澄湖大闸蟹', NULL, 200.0000, 196.0000, 10, 10, N'img13.jpg', NULL, N'买一送一')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1048, NULL, N'保护儿童行车安全', NULL, 2000.0000, 1320.0000, 20, 5, N'img14.jpg', NULL, N'儿童安全座椅')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1049, NULL, N'韩后919爱购节', NULL, 2000.0000, 1320.0000, 100, 2, N'img15.jpg', NULL, N'最IN进口面膜敷起来')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1050, NULL, N'苹果WATCH手表 智能穿戴 智能手表 Apple Watch', NULL, 3000.0000, 2658.0000, 100, 2, N'img16.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1051, NULL, N'分期免息 苹果 ipad 2019新款 Air3 2平板电脑mini5 4 Pro 2018 7', NULL, 3000.0000, 2658.0000, 200, 4, N'img17.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1052, NULL, N'2019新款Apple/苹果10.2英寸iPad2018款mini5 4平板电脑2017Air3', NULL, 3000.0000, 2658.0000, 220, 5, N'img18.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1053, NULL, N'苹果WATCH手表 智能穿戴 智能手表 Apple Watch', NULL, 3000.0000, 2658.0000, 100, 2, N'img19.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1054, NULL, N'分期免息 苹果 ipad 2019新款 Air3 2平板电脑mini5 4 Pro 2018 7', NULL, 3000.0000, 2658.0000, 200, 4, N'img20.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1055, NULL, N'2019新款Apple/苹果10.2英寸iPad2018款mini5 4平板电脑2017Air3', NULL, 3000.0000, 2658.0000, 220, 5, N'img21.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1056, NULL, N'保护儿童行车安全', NULL, 2000.0000, 1320.0000, 20, 5, N'img22.jpg', NULL, N'儿童安全座椅')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1057, NULL, N'韩后919爱购节', NULL, 2000.0000, 1320.0000, 100, 2, N'img23.jpg', NULL, N'最IN进口面膜敷起来')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1058, NULL, N'阳澄湖大闸蟹', NULL, 200.0000, 196.0000, 10, 10, N'img24.jpg', NULL, N'买一送一')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1059, NULL, N'保护儿童行车安全', NULL, 2000.0000, 1320.0000, 20, 5, N'img25.jpg', NULL, N'儿童安全座椅')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1060, NULL, N'韩后919爱购节', NULL, 2000.0000, 1320.0000, 100, 2, N'img26.jpg', NULL, N'最IN进口面膜敷起来')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1061, NULL, N'苹果WATCH手表 智能穿戴 智能手表 Apple Watch', NULL, 3000.0000, 2658.0000, 100, 2, N'img27.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1062, NULL, N'分期免息 苹果 ipad 2019新款 Air3 2平板电脑mini5 4 Pro 2018 7', NULL, 3000.0000, 2658.0000, 200, 4, N'img28.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1063, NULL, N'2019新款Apple/苹果10.2英寸iPad2018款mini5 4平板电脑2017Air3', NULL, 3000.0000, 2658.0000, 220, 5, N'img29.jpg', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (1, N'功能商品', NULL, 0, NULL, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (19, N'服装箱包', NULL, 1, NULL, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (20, N'珠宝饰品', NULL, 2, NULL, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (21, N'数码家电', NULL, 3, NULL, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (22, N'食品茶酒', NULL, 4, NULL, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (23, N'运动体育', NULL, 5, NULL, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (24, N'家居家纺', NULL, 6, NULL, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (28, N'生活服务', NULL, 7, NULL, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (29, N'其他', NULL, 8, NULL, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (30, N'办公', NULL, 9, 1, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (31, N'五金电子', NULL, 10, 1, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (32, N'DIY', NULL, 11, 1, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (33, N'打印机', NULL, 12, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (35, N'一体机', NULL, 13, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (36, N'收银机', NULL, 14, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (37, N'保险箱', NULL, 15, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (38, N'办公椅', NULL, 16, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (39, N'文具', NULL, 17, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (40, N'碎纸机', NULL, 18, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (41, N'考勤门禁', NULL, 19, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (42, N'会议白板', NULL, 20, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (43, N'物联网市场', NULL, 21, 31, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (44, N'万用表', NULL, 22, 31, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (45, N'电动螺丝刀', NULL, 23, 31, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (46, N'管钳子', NULL, 24, 31, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (47, N'电钻', NULL, 25, 31, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (48, N'无尘锯', NULL, 26, 31, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (49, N'角磨机', NULL, 27, 31, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (50, N'切割机', NULL, 28, 31, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (51, N'定制T恤', NULL, 29, 32, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (52, N'文化衫', NULL, 30, 32, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (53, N'LOGO设计', NULL, 31, 32, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (54, N'VI设计', NULL, 32, 32, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (55, N'广告扇', NULL, 33, 32, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (57, N'奖杯', NULL, 34, 32, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (58, N'软陶人偶', NULL, 35, 32, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (59, N'二维码贴纸', NULL, 36, 32, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (60, N'男装', NULL, 37, 19, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (61, N'女装', NULL, 38, 19, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (62, N'内衣', NULL, 39, 19, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (63, N'箱包', NULL, 40, 19, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (64, N'夏秋新品', NULL, 41, 60, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (65, N'T恤', NULL, 42, 60, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (66, N'衬衫', NULL, 43, 60, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (67, N'休闲裤', NULL, 44, 60, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (68, N'牛仔裤', NULL, 45, 60, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (69, N'外套', NULL, 46, 60, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (70, N'夹克', NULL, 47, 60, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (71, N'卫衣', NULL, 48, 60, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (72, N'风衣', NULL, 49, 60, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (73, N'羽绒服', NULL, 50, 60, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (75, N'连衣裙', NULL, 51, 61, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (76, N'半身裙', NULL, 52, 61, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (77, N'毛针织杉', NULL, 53, 61, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (78, N'T恤', NULL, 54, 61, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (79, N'短外套', NULL, 55, 61, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (80, N'背心吊带', NULL, 56, 61, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (82, N'打底裤', NULL, 57, 61, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (83, N'珠宝', NULL, 58, 19, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (84, N'配件配饰', NULL, 59, 19, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (85, N'眼镜', NULL, 60, 19, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (86, N'高端定制', NULL, 61, 83, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (87, N'彩色宝石', NULL, 62, 83, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (88, N'情侣对戒', NULL, 63, 83, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (89, N'帽子', NULL, 64, 84, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (90, N'真丝围巾', NULL, 65, 84, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (91, N'耳环', NULL, 66, 84, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (92, N'3D眼镜', NULL, 67, 85, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (93, N'无框眼镜', NULL, 68, 85, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (94, N'护目镜', NULL, 69, 85, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (95, N'家电', NULL, 70, 21, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (96, N'数码', NULL, 71, 21, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (97, N'手机', NULL, 72, 21, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (98, N'生活电器', NULL, 73, 95, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (101, N'个人护理', NULL, 74, 95, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (102, N'取暖器', NULL, 75, 95, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (103, N'吹风机', NULL, 76, 95, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (104, N'游戏主机', NULL, 77, 96, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (105, N'数码精选', NULL, 78, 96, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (106, N'平板电脑', NULL, 79, 96, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (107, N'数码相机', NULL, 80, 96, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (108, N'苹果', NULL, 81, 97, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (109, N'华为', NULL, 82, 97, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (110, N'小米', NULL, 83, 97, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (111, N'荣耀', NULL, 84, 97, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (112, N'oppo', NULL, 85, 87, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (113, N'vivo', NULL, 86, 87, NULL)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (1, 1, N'admin', N'123', NULL, NULL, 0, NULL, 100, 10000.0000, CAST(0x40410B00 AS Date), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (2, 2, N'chyg', N'123', NULL, NULL, 1, NULL, 100, 10000.0000, CAST(0x40410B00 AS Date), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (5, 2, N'gly', N'123', NULL, NULL, 0, NULL, 100, 10000.0000, CAST(0x40410B00 AS Date), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (11, 2, N'df', N'123', NULL, NULL, 0, NULL, 100, 10000.0000, CAST(0x40410B00 AS Date), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (13, 2, N'dfd', N'123', NULL, NULL, 1, NULL, 100, 10000.0000, CAST(0x40410B00 AS Date), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (15, 2, N'rtr', N'123', NULL, NULL, 0, NULL, 100, 10000.0000, CAST(0x40410B00 AS Date), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (16, 2, N'er', N'123', NULL, NULL, 1, NULL, 100, 10000.0000, CAST(0x40410B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([id], [Name], [Note]) VALUES (1, N'管理员', NULL)
INSERT [dbo].[UserRole] ([id], [Name], [Note]) VALUES (2, N'用户', NULL)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
/****** Object:  Index [UQ__Advert__C33FBB354B3E070A]    Script Date: 2020/6/28 0:07:51 ******/
ALTER TABLE [dbo].[Advert] ADD UNIQUE NONCLUSTERED 
(
	[Stor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__ProductT__BFF85022C4BEF531]    Script Date: 2020/6/28 0:07:51 ******/
ALTER TABLE [dbo].[ProductType] ADD UNIQUE NONCLUSTERED 
(
	[Sort] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Advert] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Article] ADD  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Article_Category] ADD  DEFAULT (getdate()) FOR [UpdateTime]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [IsAudit]
GO
ALTER TABLE [dbo].[Costs] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[DynamicComment] ADD  DEFAULT (getdate()) FOR [Times]
GO
ALTER TABLE [dbo].[DynamicComment] ADD  DEFAULT ((0)) FOR [IsAudit]
GO
ALTER TABLE [dbo].[Dynamics] ADD  DEFAULT ((0)) FOR [IsAudit]
GO
ALTER TABLE [dbo].[Dynamics] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Footprint] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Logistics] ADD  DEFAULT ((0)) FOR [LogisticsStatus]
GO
ALTER TABLE [dbo].[Logistics] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[OrderInfo] ADD  DEFAULT ((0)) FOR [OrderStatus]
GO
ALTER TABLE [dbo].[Wishlist] ADD  DEFAULT (getdate()) FOR [WishTime]
GO
ALTER TABLE [dbo].[Advert]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([ACID])
REFERENCES [dbo].[Article_Category] ([ACID])
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Article_Category]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Contect]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Costs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[DynamicComment]  WITH CHECK ADD FOREIGN KEY([DynamicID])
REFERENCES [dbo].[Dynamics] ([DynamicID])
GO
ALTER TABLE [dbo].[DynamicComment]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Dynamics]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Footprint]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Footprint]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Integrals]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Logistics]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[OrderInfo] ([OrderID])
GO
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[OrderInfo] ([OrderID])
GO
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderInfo]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[ProductSku]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK__ProductTy__ErciI__164452B1] FOREIGN KEY([ErciID])
REFERENCES [dbo].[ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK__ProductTy__ErciI__164452B1]
GO
ALTER TABLE [dbo].[ShopCar]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ShopCar]  WITH CHECK ADD FOREIGN KEY([SkuID])
REFERENCES [dbo].[ProductSku] ([SkuID])
GO
ALTER TABLE [dbo].[ShopCar]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
ALTER TABLE [dbo].[UserInfo]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[UserRole] ([id])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([SkuID])
REFERENCES [dbo].[ProductSku] ([SkuID])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [EgoDB] SET  READ_WRITE 
GO
