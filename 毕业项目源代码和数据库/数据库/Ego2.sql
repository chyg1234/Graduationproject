USE [master]
GO
/****** Object:  Database [EgoDB]    Script Date: 2020/7/22 20:00:52 ******/
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
/****** Object:  Table [dbo].[Advert]    Script Date: 2020/7/22 20:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advert](
	[AdvertID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Stor] [int] NULL,
	[Url] [nvarchar](100) NULL,
	[Images] [nvarchar](50) NOT NULL,
	[CreateTime] [datetime] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdvertID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article]    Script Date: 2020/7/22 20:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[Articletitle] [nvarchar](50) NOT NULL,
	[ArticleContent] [nvarchar](max) NOT NULL,
	[UpdateTime] [datetime] NULL,
	[UserID] [int] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2020/7/22 20:00:52 ******/
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
	[Typed] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contect]    Script Date: 2020/7/22 20:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contect](
	[ContectID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ContencFlag] [int] NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactMoblie] [nvarchar](20) NOT NULL,
	[ContactAddress] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Costs]    Script Date: 2020/7/22 20:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costs](
	[CostsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CostMoney] [decimal](18, 0) NOT NULL,
	[CostType] [nvarchar](50) NOT NULL,
	[CreateTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CostsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DynamicComment]    Script Date: 2020/7/22 20:00:52 ******/
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
/****** Object:  Table [dbo].[Dynamics]    Script Date: 2020/7/22 20:00:52 ******/
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
/****** Object:  Table [dbo].[Footprint]    Script Date: 2020/7/22 20:00:52 ******/
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
/****** Object:  Table [dbo].[ImageTable]    Script Date: 2020/7/22 20:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageTable](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Note] [nvarchar](50) NULL,
 CONSTRAINT [PK_ImageTable] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Integrals]    Script Date: 2020/7/22 20:00:52 ******/
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
/****** Object:  Table [dbo].[Logistics]    Script Date: 2020/7/22 20:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logistics](
	[LogisticsID] [nvarchar](50) NOT NULL,
	[OrderID] [nvarchar](100) NULL,
	[LogisticsNum] [nvarchar](20) NOT NULL,
	[ConpanyName] [nvarchar](20) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactMoblie] [nvarchar](50) NULL,
	[ContactAddress] [nvarchar](50) NOT NULL,
	[ContactNote] [nvarchar](50) NULL,
	[LogisticsStatus] [int] NULL,
	[CreateTime] [date] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogisticsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Moneys]    Script Date: 2020/7/22 20:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moneys](
	[MoneyID] [int] IDENTITY(1,1) NOT NULL,
	[Money] [decimal](18, 0) NOT NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MoneyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Product]    Script Date: 2020/7/22 20:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Product](
	[OPID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderID] [nvarchar](100) NULL,
	[ProductID] [int] NULL,
	[price] [decimal](18, 2) NOT NULL,
	[quantity] [int] NOT NULL,
	[SkuID] [int] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderInfo]    Script Date: 2020/7/22 20:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInfo](
	[OrderID] [nvarchar](100) NOT NULL,
	[UserID] [int] NULL,
	[OrPrice] [decimal](18, 2) NOT NULL,
	[ContacName] [nvarchar](50) NOT NULL,
	[ContacMoblie] [nvarchar](20) NOT NULL,
	[ContacAddress] [nvarchar](50) NOT NULL,
	[OrderStatus] [int] NULL,
	[CreateTime] [datetime] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 2020/7/22 20:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1000,1) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ProductName] [nvarchar](max) NULL,
	[ProDescription] [nvarchar](max) NULL,
	[ShortPrice] [decimal](18, 2) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
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
/****** Object:  Table [dbo].[ProductSku]    Script Date: 2020/7/22 20:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSku](
	[SkuID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[SkuName] [nvarchar](50) NOT NULL,
	[Skuquantity] [int] NOT NULL,
	[SkuPrice] [decimal](18, 2) NOT NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SkuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 2020/7/22 20:00:52 ******/
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
/****** Object:  Table [dbo].[ShopCar]    Script Date: 2020/7/22 20:00:52 ******/
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
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2020/7/22 20:00:52 ******/
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
	[Money] [decimal](18, 2) NULL,
	[RegistrationTime] [datetime] NULL,
	[Note] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2020/7/22 20:00:52 ******/
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
/****** Object:  Table [dbo].[Wishlist]    Script Date: 2020/7/22 20:00:52 ******/
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
SET IDENTITY_INSERT [dbo].[Advert] ON 

INSERT [dbo].[Advert] ([AdvertID], [UserID], [Stor], [Url], [Images], [CreateTime], [Note]) VALUES (1, 1, 1, NULL, N'banner.jpg', CAST(0x0000ABF200000000 AS DateTime), NULL)
INSERT [dbo].[Advert] ([AdvertID], [UserID], [Stor], [Url], [Images], [CreateTime], [Note]) VALUES (2, 1, 2, NULL, N'AD-01.jpg', CAST(0x0000ABF200000000 AS DateTime), NULL)
INSERT [dbo].[Advert] ([AdvertID], [UserID], [Stor], [Url], [Images], [CreateTime], [Note]) VALUES (3, 1, 3, NULL, N'AD-02.jpg', NULL, NULL)
INSERT [dbo].[Advert] ([AdvertID], [UserID], [Stor], [Url], [Images], [CreateTime], [Note]) VALUES (8, 1, 1, NULL, N'banner-tu2.gif', CAST(0x0000AC0000BC6A60 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Advert] OFF
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ArticleID], [Articletitle], [ArticleContent], [UpdateTime], [UserID], [Note]) VALUES (1, N'Ego商城开业庆典全程策划', N'<p>一、 Ego商城开业庆典定位
&nbsp;</p><p>1、规模：xx商城庆典邀请嘉宾人数（ ）名出席观礼，商城全体员工全情投入，共同见证和推波助澜，在xx乃至广东同行业中前所未见，并籍此确定商城在电子行业中的先导地位，场面盛大敢为先，声势浩荡必空前。&nbsp;</p><p>&nbsp;2、目的：增加新闻价值，通过传媒的宣传推广，加强在社会各界中的宣传，从而树立商城良好形象，提高知名度、美誉度。</p><p>&nbsp;3、意义：通过本次隆重的庆典活动，在商城营造热烈、祥和欢乐的气氛，并祝商城生意兴隆、声誉满载，激励商户士气，以压倒性的姿态撼动竟争对手，轰动消费市场。

4、前奏：在商城此次活动工前夕，由商城和各宣传单位做全面周密筹划，在政府的指导下，众志成诚、携手迸进，以xx为中心，向四周的目标市场宣传，如：长安镇区、莞深高速、黄江xx交界口、常平xx交界口、荔景山庄旁等地树立发布“T”型户外广告，在xx及周边镇区派发宣传单页，在镇区各主要交通要道悬挂标语若干。在邻近城市，如：深圳、广州等地，通过主要传播媒体进行大力推广宣传，如使用：报纸、电台、电视台等做广告宣传，务求以多方位、多渠道、多层次、递进式的手法向各市场宣传商城形象和投放庆典的各项信息。</p><p>&nbsp;4、场面：盛大典礼，色彩缤纷，声势浩大；精彩表演，歌舞升平，引人入胜。

二、 xx商城开业庆典筹备委员会小组

在xx商城开业庆典前夕，为了使工作更顺利进行，特成立筹委会领导小组，该领导小组进驻商城办公，指挥、协调和监督商城庆典细节确切地执行，以确保商城庆典工作圆满成功。领导小组由xx镇政府和商城各自派员联合组成，其具体分工安排如下：

总顾问（2名）：

组长（1）：

副组长（2）：

领导小组成员（多名）：

具体分工：（略）

三、 xx商城庆典典嘉宾名单拟定
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>', CAST(0x0000ABF100000000 AS DateTime), 1, NULL)
INSERT [dbo].[Article] ([ArticleID], [Articletitle], [ArticleContent], [UpdateTime], [UserID], [Note]) VALUES (2, N'商城八一建军节活动方案', N'在建军节即将到来之际，我商城预策划优惠活动方案，促进销售：具体为，在8月1日当天，凡是现役军人，退伍军人，转业干部，军人家属等持相关证件，即可在**商城享受6折优惠。

1、 需要电视台，电台广告宣传(从7月25日--8月1日)

热烈庆祝中国人民解放军建军85周年，共享军民鱼水深情。借此机会，向全县广大现役官兵、预备役军人和广大民兵，致以节日的祝贺!向全县退伍军人、革命伤残军人、转业复员军人、军烈属和军队离退休干部，表示诚挚的慰问!并将在8月1日推出军属购物大优惠活动，欢迎广大军民届时光临!

2、 需要传单广告1000份(在7月25日--8月1日之间发出)

在八一建军节即将来临之际，**商城和广大市民一道，热烈庆祝中国人民解放军建军85周年，共享军民鱼水深情。借此机会，向全县广大现役官兵、预备役军人和广大民兵，致以节日的祝贺!向全县退伍军人、革命伤残军人、转业复员军人、军烈属和军队离退休干部，表示诚挚的慰问!同时推出大型优惠活动，凡是现役官兵、预备役军

人和广大民兵，致以节日的祝贺!向全县退伍军人、革命伤残军人、转业复员军人、军烈属和军队离退休干部，军可持有效证件在**商城任何铺位购买享受6折优惠!!还有精美礼品赠送哦。', CAST(0x0000ABEF00000000 AS DateTime), 1, NULL)
INSERT [dbo].[Article] ([ArticleID], [Articletitle], [ArticleContent], [UpdateTime], [UserID], [Note]) VALUES (8, N'Ego商城平台关于封禁违规账号的通知', N'<h4 style="box-sizing: border-box; margin: 0px; padding: 20px 0px; font-size: 14px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(244, 244, 244);">亲爱的点讯号平台作者：</h4><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 10px; font-size: 14px; color: rgb(97, 97, 97); line-height: 22px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(244, 244, 244);">为维护平台良好的阅读体验，打造绿色健康的网络生态环境，始终坚决打击导向不正、格调低俗、血腥色情、恶搞、宣扬扭曲价值观等违规行为。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 10px; font-size: 14px; color: rgb(97, 97, 97); line-height: 22px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(244, 244, 244);">4月21日至5月11日期间，平台共封禁违规帐号53个。该批账号违规发布广告的行为严重影响了用户的阅读体验。现将此批账号予以公示，望各位作者能引以为戒，加强内容把关，共同维护一个内容健康、秩序良好的自媒体平台。</p><h4 style="box-sizing: border-box; margin: 0px; padding: 20px 0px; font-size: 14px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(244, 244, 244);">被封禁帐号名单公示如下：</h4><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 10px; font-size: 14px; color: rgb(97, 97, 97); line-height: 22px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(244, 244, 244);">喜欢的是你、江春入新年、微雨绵绵、士杰娱乐、兔耳的音乐盒、肥牛体育、春意雨纷纷、墨香逸丽、掌心有痕、华娱乐聚焦、潮流穿搭、梦随风去流动、点点落寞、诚实心安、宁谧的夜、莲花的青松、一阕山与水、世界上幸福的人、玫瑰实惠网rosesh、微影姐姐、美丽天使1026、相濡以沫的爱、大海印象工作室、话梅糖说、风潜随风、夏夜的秋意、梅开雪舞时、无尽辰光、球云巅峰、平头小喵、聚焦哪些热点、艺视角娱乐、娱乐灯泡、搞笑娱扒、下发布、如寄教育、一心系娱乐、旧时楼于宇、美女热舞社官方频道、纯白的心、娱乐唠丽、劲爆的娱乐八卦、做喜欢的事就是快乐、玩大转绿满星球、托马斯舞步、收藏说历史、最美好的事、奇葩搞笑哥、U吐槽搞笑、妈咪母婴、铁侠万里、风格和敢于的经、麻辣小说谈喜欢的是你、江春入新年、微雨绵绵、士杰娱乐、兔耳的音乐盒、肥牛体育、春意雨纷纷、墨香逸丽、掌心有痕、华娱乐聚焦、潮流穿搭、梦随风去流动、点点落寞、诚实心安、宁谧的夜、莲花的青松、一阕山与水、世界上幸福的人、玫瑰实惠网rosesh、微影姐姐、美丽天使1026、相濡以沫的爱、大海印象工作室、话梅糖说、风潜随风、夏夜的秋意、梅开雪舞时、无尽辰光、球云巅峰、平头小喵、聚焦哪些热点、艺视角娱乐、娱乐灯泡、搞笑娱扒、下发布、如寄教育、一心系娱乐、旧时楼于宇、美女热舞社官方频道、纯白的心、娱乐唠丽、劲爆的娱乐八卦、做喜欢的事就是快乐、玩大转绿满星球、托马斯舞步、收藏说历史、最美好的事、奇葩搞笑哥、U吐槽搞笑、妈咪母婴、铁侠万里、风格和敢于的经、麻辣小说谈</p><h4 style="box-sizing: border-box; margin: 0px; padding: 20px 0px; font-size: 14px; color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(244, 244, 244);">平台规则</h4><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 10px; font-size: 14px; color: rgb(97, 97, 97); line-height: 22px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(244, 244, 244);">希望每个快传号作者尊重并遵守平台规则，共同为维护平台良好生态秩序而努力。若您对名单有任何疑问，可以到论坛进行反馈：论坛入口</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 10px; font-size: 14px; color: rgb(97, 97, 97); line-height: 22px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(244, 244, 244);">感谢您对我们的工作的配合与支持！</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 10px; font-size: 14px; color: rgb(97, 97, 97); line-height: 22px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(244, 244, 244);">为了给广大作者们提供更好的服务和体验，给予优质原创内容和创作者更多回报，快传号平台将于4月1日正式启动视频内容补贴。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 10px; font-size: 14px; color: rgb(97, 97, 97); line-height: 22px; font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(244, 244, 244);">为维护平台良好的阅读体验，打造绿色健康的网络生态环境，始终坚决打击导向不正、格调低俗、血腥色情、恶搞、宣扬扭曲价值观等违规行为。</p><p><br/></p>', CAST(0x0000ABF4001266F0 AS DateTime), 1, NULL)
INSERT [dbo].[Article] ([ArticleID], [Articletitle], [ArticleContent], [UpdateTime], [UserID], [Note]) VALUES (9, N'快递物流实名制发货公告', N'<p style="margin-top: 0px; margin-bottom: 0px; line-height: 2.5; font-family: &quot;--系统字体--&quot;; color: rgb(97, 97, 97); white-space: normal;">尊敬的Ego商城用户：</p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 2.5; font-family: &quot;--系统字体--&quot;; color: rgb(97, 97, 97); white-space: normal;">&nbsp;&nbsp;&nbsp; 因近期全国快递整顿，要求收件人必须填写真实姓名，否则将无法收发货。兑换商品时请您填写正确收件人实名并确认收货手机号准确无误，方便快递师傅尽快派送，感谢您的大力支持。</p><p style="margin-top: 0px; margin-bottom: 0px; line-height: 2.5; font-family: &quot;--系统字体--&quot;; color: rgb(97, 97, 97); white-space: normal;">&nbsp;&nbsp;&nbsp; 祝您生活愉快。</p><p><br/></p>', CAST(0x0000ABF4001CD6D0 AS DateTime), 1, NULL)
INSERT [dbo].[Article] ([ArticleID], [Articletitle], [ArticleContent], [UpdateTime], [UserID], [Note]) VALUES (10, N'荣耀炫彩青春毕业季活动', N'<p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><strong><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">【活动主题】：</span></strong><strong><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">荣耀炫彩青春毕业季</span></strong></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><strong><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">【活动时间】：</span></strong><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">2020年</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">7月</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">7日</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">00:00~7月</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">12日</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">23:59</span></span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><strong><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">【活动链接地址】</span></strong></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">PC</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">：</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">https://sale.vmall.com/honor.html</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">WAP</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">：</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">https://msale.vmall.com/honor.html</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">APP</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">：</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">https://asale.vmall.com/honor.html</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;"></span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><strong><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">一、</span></strong><strong><span style="line-height: 18.2px; font-size: 14px; font-family: arial, helvetica, sans-serif;">【整点购机赠配件】</span></strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; text-align: justify; background: white;"><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">1</span><span style="font-size: 14px; font-family: 微软雅黑, sans-serif; color: black;"><span style="font-family: arial, helvetica, sans-serif;">、</span><span style="font-family: arial, helvetica, sans-serif;">&nbsp;&nbsp;</span><span style="font-family: arial, helvetica, sans-serif;">活动时间：</span><span style="font-family: arial, helvetica, sans-serif;">2020年</span><span style="font-family: arial, helvetica, sans-serif;">7月</span><span style="font-family: arial, helvetica, sans-serif;">1日</span><span style="font-family: arial, helvetica, sans-serif;">-7月</span><span style="font-family: arial, helvetica, sans-serif;">10日</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; text-align: justify; background: white;"><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">2</span><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">、参与条件：</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; text-align: justify; background: white;"><span style="font-size: 14px; font-family: 微软雅黑, sans-serif; color: black;"><span style="font-family: arial, helvetica, sans-serif;"></span>购买荣耀X10、荣耀9X PRO、荣耀30、荣耀30 Pro、荣耀30S、荣耀V30 PRO、荣耀V30、荣耀Play4 Pro、荣耀20、荣耀20 PRO的用户<span style="font-family: arial, helvetica, sans-serif;">，</span><span style="font-family: arial, helvetica, sans-serif;">7月</span><span style="font-family: arial, helvetica, sans-serif;">1-10日</span><span style="font-family: arial, helvetica, sans-serif;">10:00/12:00/14:00/16:00/20:00下单前</span><span style="font-family: arial, helvetica, sans-serif;">100名（以下单时间为准，赠品随订单显示）赠荣耀手环</span><span style="font-family: arial, helvetica, sans-serif;">4 Running版；</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; text-align: justify; line-height: 18px; background: white;"><span style="font-size: 14px; line-height: 21px; font-family: 微软雅黑, sans-serif; color: black;"><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">购买</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">Play4、</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">Play4T、</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">Play4T Pro、</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">9X、</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">9A、</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">20青春、荣耀</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">Play3、荣耀</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">Play3e手机的用户</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">7月</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">1-10日</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">10:00/12:00/14:00/16:00/20:00下单前</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">100名（以下单时间为准，赠品随订单显示）赠荣耀</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">AM115耳机。</span></span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; line-height: 18px; background: white;"><span style="font-size: 14px; line-height: 21px; font-family: 微软雅黑, sans-serif; color: black;"><span style="font-family: arial, helvetica, sans-serif;"></span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">*</span></span><span style="font-size: 14px; line-height: 21px; font-family: 微软雅黑, sans-serif; color: black;"><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">温馨提示：符合条件的下单用户会在订单界面展示赠品，并随订单一起寄出。部分颜色版本不参加活动，具体请以商品促销信息为准；由于赠品数量更新较快，具体赠品数量请以商品页面显示为准；前</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">100名是指当天每个整点多款指定手机共享</span><span style="line-height: 21px; font-family: arial, helvetica, sans-serif;">100名数量。数量有限，赠完即止。</span></span></p><p style="margin-top: 21px; margin-bottom: 0px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; text-align: justify; background: white;"><strong><span style="font-family: 微软雅黑, sans-serif;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">二、【以旧换新最高补贴</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">1000元】</span></span></strong></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><span style="color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 14px; font-family: arial, helvetica, sans-serif;">以旧换新具体活动公告详见</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><span style="color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 14px; font-family: arial, helvetica, sans-serif;">公告链接：</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><span style="color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 14px; font-family: arial, helvetica, sans-serif;">PC</span><span style="font-family: 微软雅黑, sans-serif; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 14px; font-family: arial, helvetica, sans-serif;">侧：</span><a href="https://www.vmall.com/notice-10922" style="color: rgb(0, 119, 210); cursor: pointer; font-size: 14px;"><span style="color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: arial, helvetica, sans-serif;">https://www.vmall.com/notice-10922</span></a></span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><span style="color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 14px; font-family: arial, helvetica, sans-serif;">Wap</span><span style="font-family: 微软雅黑, sans-serif; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 14px; font-family: arial, helvetica, sans-serif;">侧：</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">https://m.vmall.com/notice-10922</span></span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 15.6px;"><span style="color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 14px; font-family: arial, helvetica, sans-serif;">APP</span><span style="font-family: 微软雅黑, sans-serif; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;"><span style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-size: 14px; font-family: arial, helvetica, sans-serif;">侧：</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">https://mw.vmall.com/notice-10922</span></span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><strong><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">三、</span></strong><strong><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">【免费领</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">534元毕业大礼包】</span></span></strong></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">1</span><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">、活动时间：</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">2020年</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">7月</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">7日</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">-7月</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">12日</span></span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background: white;"><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">2</span><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">、 活动规则：活动期间进入荣耀炫彩青春毕业季活动页面，点击毕业大礼包免费领 。</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background: white;"><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">（此部分奖品由第三方提供，如有疑问，请联系规则中展示的奖品提供方的客服电话）。</span></p><p style="margin-top: 0px; margin-bottom: 19px; margin-left: 24px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">1、</span></span><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">礼包明细及规则：</span></p><p style="margin-top: 0px; margin-bottom: 19px; margin-left: 24px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><strong><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">1）</span></span></strong><strong><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">三只松鼠</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">280元零食礼金</span></span></strong></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">领取方式：</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">使用方法</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">1：点击</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">H5链接领取优惠券，点【立即使用】加购专区商品满</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">399元，结算时选择该优惠券即可减免</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">280元。</span></span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">使用方法</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">2：领取优惠券</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">-微信搜索【三只松鼠会员】公众号</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">-下方自定义菜单点击【微商城】</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">-【超级满减】</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">-选购专区商品满</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">399元，结算时选择该优惠券即可减免</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">280元。</span></span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">活动规则：</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">优惠券为三只松鼠超级满减专区专用券，满</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">399元立减</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">280元，订单包邮，领取次数不限，新老用户皆可领取；</span></span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">优惠券</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">2020.5.1-2020.7.31期间均可领取使用，限量领完即止；</span></span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="color: black; font-size: 14px; font-family: arial, helvetica, sans-serif;">每单仅限使用一张优惠券，不可与其他优惠券同享；</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">三只松鼠全球服务热线：</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">400-800-4900（周一至周五</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">9:30-17:30）；</span></span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px; color: rgb(58, 58, 58); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Heiti SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, sans-serif; color: black;"><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">订单物流查询：可在“三只松鼠会员”微信小程序</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">-【我的】</span><span style="font-size: 14px; font-family: arial, helvetica, sans-serif;">-【我的订单】中查看。</span></span></p><p><br/></p>', CAST(0x0000ABF4002068E0 AS DateTime), 1, NULL)
INSERT [dbo].[Article] ([ArticleID], [Articletitle], [ArticleContent], [UpdateTime], [UserID], [Note]) VALUES (11, N'亲选小冰棒牙刷众测活动中奖名单', N'<p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">本期众测获奖名单：</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">一等奖奖品：荣耀V30 5G手机</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">数量：1名</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">获奖订单号：2863***4452</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><br/></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">恭喜以上这位获奖用户！</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><br/></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">1、众测时间：</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">2020年05月18日~06月06日</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">2、活动规则：</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">众测活动期间05.18-06.06，凡在华为商城购买众测品 亲选小冰棒牙刷 的用户，均可参加抽奖。</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">本期众测结束15个工作日内，由华为工作人员使用VMALL内部统一的抽奖系统随机抽取获奖名单，所有抽奖过程均接受华为公司内审、稽查机构监督；</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">所有退款用户，不得参与抽奖，中奖不予发放奖品。</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">3、活动奖品：</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">一等奖：荣耀V30 5G手机 数量：1名</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">4、奖品发放：</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><span style="font-size: 14px;">中奖名单产生5个工作日内，由北京神州数码科捷技术服务有限公司龙岗分公司联系获奖者，并邮寄奖品，退货用户不予发放奖品。</span></p><p style="margin-top: 0px; margin-bottom: 19px; padding: 0px;"><br/></p><p><br/></p>', CAST(0x0000ABEC00888150 AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentsID], [UserID], [ProductID], [TextContent], [Images], [Stars], [Time], [IsAudit], [Note], [Typed]) VALUES (6, 2, 1021, N'非常好用', N'img108.jpg', 2, CAST(0x45410B00 AS Date), 1, NULL, 0)
INSERT [dbo].[Comments] ([CommentsID], [UserID], [ProductID], [TextContent], [Images], [Stars], [Time], [IsAudit], [Note], [Typed]) VALUES (7, 2, 1021, N'非常好用', N'img108.jpg', 2, CAST(0x45410B00 AS Date), 1, NULL, 0)
INSERT [dbo].[Comments] ([CommentsID], [UserID], [ProductID], [TextContent], [Images], [Stars], [Time], [IsAudit], [Note], [Typed]) VALUES (8, 2, 1021, N'非常好用', N'img108.jpg', 2, CAST(0x45410B00 AS Date), 1, NULL, 0)
INSERT [dbo].[Comments] ([CommentsID], [UserID], [ProductID], [TextContent], [Images], [Stars], [Time], [IsAudit], [Note], [Typed]) VALUES (10, 2, 1029, N'4564646', N'img20.jpg', 0, CAST(0x48410B00 AS Date), 1, NULL, 0)
INSERT [dbo].[Comments] ([CommentsID], [UserID], [ProductID], [TextContent], [Images], [Stars], [Time], [IsAudit], [Note], [Typed]) VALUES (14, 2, 1021, N'高碳铬铁', N'img20.jpg', 4, CAST(0x49410B00 AS Date), 0, NULL, 0)
INSERT [dbo].[Comments] ([CommentsID], [UserID], [ProductID], [TextContent], [Images], [Stars], [Time], [IsAudit], [Note], [Typed]) VALUES (15, 2, 1021, N'高碳铬铁', N'img20.jpg', 4, CAST(0x49410B00 AS Date), 0, NULL, 0)
INSERT [dbo].[Comments] ([CommentsID], [UserID], [ProductID], [TextContent], [Images], [Stars], [Time], [IsAudit], [Note], [Typed]) VALUES (17, 2, 1021, N'dsajfsdhjkdsgdsg', N'img113.jpg', 4, CAST(0x4F410B00 AS Date), 1, NULL, 0)
INSERT [dbo].[Comments] ([CommentsID], [UserID], [ProductID], [TextContent], [Images], [Stars], [Time], [IsAudit], [Note], [Typed]) VALUES (18, 2, 1021, N'grdherhrthrt', N'img110.jpg', 3, CAST(0x4F410B00 AS Date), 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Contect] ON 

INSERT [dbo].[Contect] ([ContectID], [UserID], [ContencFlag], [ContactName], [ContactMoblie], [ContactAddress], [Note]) VALUES (2, 2, 0, N'小明', N'18153560138', N'山东郴州汝城县濠头乡', NULL)
INSERT [dbo].[Contect] ([ContectID], [UserID], [ContencFlag], [ContactName], [ContactMoblie], [ContactAddress], [Note]) VALUES (3, 2, 1, N'kjhk', N'18153860138', N'湖南郴州汝城县濠头乡', NULL)
INSERT [dbo].[Contect] ([ContectID], [UserID], [ContencFlag], [ContactName], [ContactMoblie], [ContactAddress], [Note]) VALUES (4, 5, 0, N'小红', N'18153860138', N'湖南郴州汝城县濠头乡', NULL)
INSERT [dbo].[Contect] ([ContectID], [UserID], [ContencFlag], [ContactName], [ContactMoblie], [ContactAddress], [Note]) VALUES (5, 11, 0, N'小明', N'18153860138', N'湖南郴州汝城县濠头乡', NULL)
INSERT [dbo].[Contect] ([ContectID], [UserID], [ContencFlag], [ContactName], [ContactMoblie], [ContactAddress], [Note]) VALUES (6, 11, 0, N'费在德', N'18153860138', N'湖南郴州汝城县濠头乡', NULL)
INSERT [dbo].[Contect] ([ContectID], [UserID], [ContencFlag], [ContactName], [ContactMoblie], [ContactAddress], [Note]) VALUES (7, 11, 0, N'小郭', N'18153860138', N'湖南郴州汝城县濠头乡', NULL)
INSERT [dbo].[Contect] ([ContectID], [UserID], [ContencFlag], [ContactName], [ContactMoblie], [ContactAddress], [Note]) VALUES (12, 27, 1, N'赵信s', N'17674110187', N'LOL召唤师峡谷', NULL)
INSERT [dbo].[Contect] ([ContectID], [UserID], [ContencFlag], [ContactName], [ContactMoblie], [ContactAddress], [Note]) VALUES (13, 28, 0, N'小明s', N'18153860138', N'湖南郴州汝城县濠头乡logo', NULL)
SET IDENTITY_INSERT [dbo].[Contect] OFF
SET IDENTITY_INSERT [dbo].[Footprint] ON 

INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (7, 1021, 2, CAST(0x4C410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (9, 1043, 2, CAST(0x4C410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (10, 1092, 2, CAST(0x4C410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (11, 1050, 2, CAST(0x4C410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (13, 1021, 2, CAST(0x2E410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (14, 1043, 2, CAST(0x2E410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (15, 1092, 2, CAST(0x0F410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (17, 1021, 1, CAST(0x2E410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (18, 1043, 1, CAST(0x2E410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (19, 1092, 1, CAST(0x0F410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (20, 1050, 1, CAST(0x6B410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (21, 1092, 2, CAST(0x0F410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (22, 1050, 2, CAST(0x6B410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (23, 1079, 2, CAST(0x4D410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (25, 1036, 2, CAST(0x4D410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (26, 1029, 2, CAST(0x4D410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (27, 1032, 27, CAST(0x4E410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (28, 1040, 27, CAST(0x4E410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (30, 1032, 2, CAST(0x4F410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (31, 1047, 2, CAST(0x4F410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (32, 1021, 28, CAST(0x4F410B00 AS Date), NULL)
INSERT [dbo].[Footprint] ([FootprintID], [ProductID], [UserID], [CreateTime], [Note]) VALUES (35, 1099, 28, CAST(0x4F410B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Footprint] OFF
SET IDENTITY_INSERT [dbo].[ImageTable] ON 

INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (1, 1021, N'img106.jpg', N'1')
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (2, 1021, N'img107.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (3, 1021, N'img109.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (4, 1021, N'img110.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (5, 1096, N'blfc1.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (6, 1096, N'blol1.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (7, 1092, N'pro.jpg', N'1')
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (8, 1092, N'pro2.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (9, 1092, N'pro3.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (10, 1092, N'pro4.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (11, 1075, N'img111.png', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (12, 1075, N'img112.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (13, 1098, N'img113.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (14, 1098, N'img114.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (15, 1098, N'img115.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (16, 1099, N'img117.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (17, 1099, N'img118.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (18, 1099, N'img119.jpg', NULL)
INSERT [dbo].[ImageTable] ([ImageID], [ProductID], [ImageUrl], [Note]) VALUES (19, 1099, N'img120.jpg', NULL)
SET IDENTITY_INSERT [dbo].[ImageTable] OFF
INSERT [dbo].[Logistics] ([LogisticsID], [OrderID], [LogisticsNum], [ConpanyName], [ContactName], [ContactMoblie], [ContactAddress], [ContactNote], [LogisticsStatus], [CreateTime], [Note]) VALUES (N'eIEgo20200707388', N'sEgo220200702151809302', N'IEgo20200707388', N'百世汇通', N'小明s556', N'18153860138', N'湖南郴州汝城县濠头乡方法胜多负少的', NULL, 0, CAST(0x4C410B00 AS Date), NULL)
INSERT [dbo].[Logistics] ([LogisticsID], [OrderID], [LogisticsNum], [ConpanyName], [ContactName], [ContactMoblie], [ContactAddress], [ContactNote], [LogisticsStatus], [CreateTime], [Note]) VALUES (N'eIEgo20200707668', N'sEgo22020020212', N'IEgo20200707668', N'圆通速递', N'陈耀根', N'18153860138', N'湖南郴州汝城县濠头乡方法胜多负少的', NULL, 0, CAST(0x4C410B00 AS Date), NULL)
INSERT [dbo].[Logistics] ([LogisticsID], [OrderID], [LogisticsNum], [ConpanyName], [ContactName], [ContactMoblie], [ContactAddress], [ContactNote], [LogisticsStatus], [CreateTime], [Note]) VALUES (N'eIEgo20200709377', N'sEgo220200703215', N'IEgo20200709377', N'百世汇通', N'陈耀根', N'181538601', N'湖南郴州汝城县濠头乡', NULL, 0, CAST(0x4E410B00 AS Date), NULL)
INSERT [dbo].[Logistics] ([LogisticsID], [OrderID], [LogisticsNum], [ConpanyName], [ContactName], [ContactMoblie], [ContactAddress], [ContactNote], [LogisticsStatus], [CreateTime], [Note]) VALUES (N'eIEgo20200710566', N'sEgo22020070782', N'IEgo20200710566', N'顺丰速运', N'小明', N'18153560138', N'山东郴州汝城县濠头乡', NULL, 0, CAST(0x4F410B00 AS Date), NULL)
INSERT [dbo].[Logistics] ([LogisticsID], [OrderID], [LogisticsNum], [ConpanyName], [ContactName], [ContactMoblie], [ContactAddress], [ContactNote], [LogisticsStatus], [CreateTime], [Note]) VALUES (N'eIEgo20200710793', N'sEgo2820200710325', N'IEgo20200710793', N'百世汇通', N'小明s', N'18153860138', N'湖南郴州汝城县濠头乡方法胜多负少的', NULL, 0, CAST(0x4F410B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Order_Product] ON 

INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (1, 2, N'sEgo220200702151809302', 1021, CAST(35000.00 AS Decimal(18, 2)), 7, 1, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (2, 2, N'sEgo220200702151809302', 1021, CAST(5000.00 AS Decimal(18, 2)), 1, 2, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (4, 2, N'sEgo220200702152243511', 1021, CAST(10000.00 AS Decimal(18, 2)), 2, 2, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (9, 2, N'sEgo220200703215', 1021, CAST(4500.00 AS Decimal(18, 2)), 1, 1, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (10, 2, N'sEgo220200707195', 1087, CAST(7452.00 AS Decimal(18, 2)), 1, 33, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (11, 2, N'sEgo22020070782', 1023, CAST(2000.00 AS Decimal(18, 2)), 2, 4, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (12, 2, N'sEgo220200707569', 1075, CAST(2000.00 AS Decimal(18, 2)), 1, 9, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (13, 2, N'sEgo22020070710', 1092, CAST(2500.00 AS Decimal(18, 2)), 1, 40, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (14, 2, N'sEgo220200707960', 1092, CAST(4600.00 AS Decimal(18, 2)), 2, 41, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (15, 2, N'sEgo220200707369', 1021, CAST(9000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (16, 2, N'sEgo220200707498', 1092, CAST(5000.00 AS Decimal(18, 2)), 2, 40, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (18, 2, N'sEgo220200708849', 1079, CAST(13500.00 AS Decimal(18, 2)), 3, 16, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (19, 2, N'sEgo220200708849', 1080, CAST(28000.00 AS Decimal(18, 2)), 8, 19, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (21, 2, N'sEgo220200710548', 1021, CAST(30100.00 AS Decimal(18, 2)), 7, 2, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (22, 28, N'sEgo2820200710325', 1021, CAST(13500.00 AS Decimal(18, 2)), 3, 1, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (23, 28, N'sEgo2820200710325', 1092, CAST(2200.00 AS Decimal(18, 2)), 1, 42, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (24, 28, N'sEgo2820200710752', 1079, CAST(4300.00 AS Decimal(18, 2)), 1, 17, NULL)
INSERT [dbo].[Order_Product] ([OPID], [UserID], [OrderID], [ProductID], [price], [quantity], [SkuID], [Note]) VALUES (25, 28, N'sEgo2820200710316', 1099, CAST(26400.00 AS Decimal(18, 2)), 11, 111, NULL)
SET IDENTITY_INSERT [dbo].[Order_Product] OFF
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo22020020212', 2, CAST(100.00 AS Decimal(18, 2)), N'陈耀根', N'18153860138', N'湖南郴州汝城县濠头乡方法胜多负少的', 3, CAST(0x0000ABEC00000000 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo220200702123', 2, CAST(7000.00 AS Decimal(18, 2)), N'', N'', N'', 1, CAST(0x0000ABEC00000000 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo220200702151809302', 2, CAST(35800.00 AS Decimal(18, 2)), N'小明s556', N'18153860138', N'湖南郴州汝城县濠头乡方法胜多负少的', 3, CAST(0x0000ABEC00000000 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo220200702152243511', 2, CAST(8600.00 AS Decimal(18, 2)), N'小明', N'18153860101', N'湖南郴州', 0, CAST(0x0000ABEC00000000 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo220200703215', 2, CAST(4500.00 AS Decimal(18, 2)), N'陈耀根', N'181538601', N'湖南郴州汝城县濠头乡', 2, CAST(0x0000ABED00000000 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo22020070710', 2, CAST(5000.00 AS Decimal(18, 2)), N'小青', N'18153860138', N'湖南郴州汝城县濠头乡', 1, CAST(0x0000ABF100000000 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo220200707195', 2, CAST(3800.00 AS Decimal(18, 2)), N'小青', N'18153860138', N'湖南郴州汝城县濠头乡', 1, CAST(0x0000ABF100000000 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo220200707369', 2, CAST(9000.00 AS Decimal(18, 2)), N'', N'', N'', 0, CAST(0x0000ABF100B73D09 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo220200707498', 2, CAST(12500.00 AS Decimal(18, 2)), N'', N'', N'', 0, CAST(0x0000ABF100BBF3EE AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo220200707569', 2, CAST(220.00 AS Decimal(18, 2)), N'小明', N'18153860138', N'山东郴州汝城县濠头乡', 1, CAST(0x0000ABF100000000 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo22020070782', 2, CAST(520.00 AS Decimal(18, 2)), N'小明', N'18153560138', N'山东郴州汝城县濠头乡', 3, CAST(0x0000ABF100000000 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo220200707960', 2, CAST(4600.00 AS Decimal(18, 2)), N'小青', N'18153860138', N'湖南郴州汝城县濠头乡', 0, CAST(0x0000ABF100B566E9 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo220200708849', 2, CAST(41500.00 AS Decimal(18, 2)), N'kjhk', N'18153860138', N'湖南郴州汝城县濠头乡', 0, CAST(0x0000ABF2011960F3 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo220200710548', 2, CAST(30100.00 AS Decimal(18, 2)), N'kjhk', N'18153860138', N'湖南郴州汝城县濠头乡', 0, CAST(0x0000ABF40090E500 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo2820200710316', 28, CAST(26400.00 AS Decimal(18, 2)), N'小明s', N'18153860138', N'湖南郴州汝城县濠头乡logo', 1, CAST(0x0000ABF400C1F50E AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo2820200710325', 28, CAST(-2300.00 AS Decimal(18, 2)), N'小明s', N'18153860138', N'湖南郴州汝城县濠头乡方法胜多负少的', 3, CAST(0x0000ABF400B7A8A7 AS DateTime), NULL)
INSERT [dbo].[OrderInfo] ([OrderID], [UserID], [OrPrice], [ContacName], [ContacMoblie], [ContacAddress], [OrderStatus], [CreateTime], [Note]) VALUES (N'sEgo2820200710752', 28, CAST(4300.00 AS Decimal(18, 2)), N'小明s', N'18153860138', N'湖南郴州汝城县濠头乡方法胜多负少的', 1, CAST(0x0000ABF400B9F810 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1021, 33, N'佳能TS3380打印机家用小型复印一体机无线连接手机', N'佳能TS3380打印机家用小型复印一体机无线连接手机wifi彩色喷墨照片扫描黑白a4学生家庭办公室MG2580S打印机', CAST(4500.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), 200, 10, N'img106.jpg', CAST(0x3C410B00 AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1023, 33, N'打印机家用迷你小型A4学生手机便携式可', N'打印机家用迷你小型A4学生手机便携式可连手机移动无线热敏蓝牙试卷整理神器照片写作业错题打印机', CAST(1000.00 AS Decimal(18, 2)), CAST(4000.00 AS Decimal(18, 2)), 400, 20, N'img107.jpg', CAST(0x3C410B00 AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1026, 33, N'Canon/佳能瞬彩 彩色专用相片纸日本原装进口ZP-2030', N'Canon/佳能瞬彩 彩色专用相片纸日本原装进口ZP-2030', CAST(120.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 2001, 10, N'img6.jpg', CAST(0x3C410B00 AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1028, NULL, N'阳澄湖大闸蟹', N'大闸蟹螃蟹鲜活现货包邮14只特大可全母2.5两六月黄清水大闸蟹', CAST(200.00 AS Decimal(18, 2)), CAST(196.00 AS Decimal(18, 2)), 10, 10, N'img3.jpg', NULL, N'限时抢购')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1029, NULL, N'保护儿童行车安全', NULL, CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 20, 5, N'img.jpg', NULL, N'限时抢购')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1030, NULL, N'韩后919爱购节', NULL, CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 100, 2, N'img2.jpg', NULL, N'限时抢购')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1031, NULL, N'星莱特智能手环测心率血压彩圆屏医疗级量心电图监测仪运动计步多功能记步', N'星莱特智能手环测心率血压彩圆屏医疗级量心电图监测仪运动计步多功能健康手表华为男苹果小米女老人记步', CAST(200.00 AS Decimal(18, 2)), CAST(196.00 AS Decimal(18, 2)), 10, 101, N'img4.jpg', NULL, N'易易特色')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1032, NULL, N'【狂暑12期免息】Huawei/华为nova7 Pro 5G SoC芯片追焦双摄曲面屏麒麟985 5g智能手机华为', N'【狂暑季专享12期免息】Huawei/华为nova7 Pro 5G SoC芯片追焦双摄曲面屏麒麟985 5g智能手机华为官方旗舰店', CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 20, 5, N'img5.jpg', NULL, N'易易特色')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1033, NULL, N'分期免息 苹果 ipad 2019新款 Air3 2平板电脑mini5 4 Pro 2018 7', N'分期免息 苹果 ipad 2019新款 Air3 2平板电脑mini5 4 Pro 2018 7', CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 100, 2, N'img6.jpg', NULL, N'易易特色')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1035, NULL, N'苹果WATCH手表 智能穿戴 智能手表 Apple Watch', N'苹果WATCH手表 智能穿戴 智能手表 Apple Watch', CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 100, 2, N'img4.jpg', NULL, N'易易特色')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1036, NULL, N'美的家用热水器、轻便', N'美的60升V3S出水断电储水式变频速热电热水器节能抑菌家用智能80L', CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 200, 4, N'img8.jpg', NULL, N'易易特色')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1040, NULL, N' 360手机模拟卡车欧卡2驾驶电视Switch模拟器', N'莱仕达900度赛车游戏方向盘电脑PC学车游戏机xbox 360手机模拟卡车欧卡2驾驶电视Switch模拟器PS4地平线4汽车', CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 220, 5, N'img9.jpg', NULL, N'易易特色')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1041, NULL, N'运动鞋男士官方旗舰店正品NB夏季透气豪新百伦斯凯n字鞋子潮流574', N'运动鞋男士官方旗舰店正品NB夏季透气豪新百伦斯凯n字鞋子潮流574', CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 100, 2, N'img10.jpg', NULL, N'易易特色')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1042, NULL, N'帝王蟹活动', N'帝王蟹活动', CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 200, 101, N'img11.jpg', NULL, N'新品上市')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1043, NULL, N'WEWE唯唯2020秋季新品上市复古学院风格子衬衫清新减龄新款女装', N'WEWE唯唯2020秋季新品上市复古学院风格子衬衫清新减龄新款女装', CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 220, 5, N'img12.jpg', NULL, N'新品上市')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1044, NULL, N'Nike耐克短袖男 2020夏季新款字母logo白色T恤休闲半袖体恤CV1076', N'Nike耐克短袖男 2020夏季新款字母logo白色T恤休闲半袖体恤CV1076', CAST(200.00 AS Decimal(18, 2)), CAST(196.00 AS Decimal(18, 2)), 10, 10, N'img13.jpg', NULL, N'新品上市')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1045, NULL, N'Vivo A17', N'立减100新品上市6期免息0首付全国联保vivo X30 Pro双模5G新品手机官方正品新款限量版x30Pro vivo x27 x23', CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 20, 5, N'img13.jpg', NULL, N'新品上市')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1046, NULL, N'I Do BOOM瓷系列 ', N'I Do BOOM瓷系列 18K金真钻石锁骨项链女玫瑰金吊坠礼物正品ido', CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 100, 2, N'img14.jpg', NULL, N'新品上市')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1047, NULL, N'抖音猪小屁网红同款电动跳舞婴儿有声会动宝宝玩具男1岁2儿童女孩', N'抖音猪小屁网红同款电动跳舞婴儿有声会动宝宝玩具男1岁2儿童女孩', CAST(200.00 AS Decimal(18, 2)), CAST(196.00 AS Decimal(18, 2)), 10, 10, N'img15.jpg', NULL, N'新品上市')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1048, NULL, N'保护儿童行车安全', NULL, CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 20, 5, N'img16.jpg', NULL, N'新品上市')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1049, NULL, N'Apple/苹果 13 英寸 MacBook Pro 1.4GHz 4 核处理器 (Turbo Boost 最高可达 3.9GHz) 256GB 存储容量 触控栏和触控 ID', N'Apple/苹果 13 英寸 MacBook Pro 1.4GHz 4 核处理器 (Turbo Boost 最高可达 3.9GHz) 256GB 存储容量 触控栏和触控 ID', CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 100, 101, N'img18.jpg', NULL, N'热销产品')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1050, NULL, N'【金九旗舰店】吴川金九月饼伍仁金腿中秋礼盒装1斤 团购送礼', N'【金九旗舰店】吴川金九月饼伍仁金腿中秋礼盒装1斤 团购送礼', CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 100, 4, N'img16.jpg', NULL, N'热销产品')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1051, NULL, N'红米note8pro 6400万四摄全面屏智能学生小米官方旗舰正品手机 k30', N'【6+128G低至1299】红米note8pro 6400万四摄全面屏智能学生小米官方旗舰正品手机 k30 红米note7红米note8', CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 200, 4, N'img17.jpg', NULL, N'热销产品')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1052, NULL, N'2019新款Apple/苹果10.2英寸iPad2018款mini5 4平板电脑2017Air3', N'2019新款Apple/苹果10.2英寸iPad2018款mini5 4平板电脑2017Air3', CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 220, 5, N'img18.jpg', NULL, N'热销产品')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1053, NULL, N'空调被夏凉被薄款夏季被子春秋被芯双人儿童水洗棉夏被单人可机洗', N'空调被夏凉被薄款夏季被子春秋被芯双人儿童水洗棉夏被单人可机洗', CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 100, 2, N'img19.jpg', NULL, N'热销产品')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1054, NULL, N'蓝月亮亮白洗衣液机洗家用4瓶家庭装香味持久促销组合装天猫超市', N'蓝月亮亮白洗衣液机洗家用4瓶家庭装香味持久促销组合装天猫超市', CAST(3000.00 AS Decimal(18, 2)), CAST(99.00 AS Decimal(18, 2)), 200, 4, N'img20.jpg', NULL, N'热销产品')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1055, NULL, N'图拉斯手持小风扇迷你USB充电静音大风力电动便携式超小型学生儿童挂脖电扇f', N'图拉斯手持小风扇迷你USB充电静音大风力电动便携式超小型学生儿童挂脖小电风扇手拿握随身制冷空调喷雾电扇f', CAST(3000.00 AS Decimal(18, 2)), CAST(99.00 AS Decimal(18, 2)), 220, 5, N'img21.jpg', NULL, N'热销产品')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1056, NULL, N'保护儿童行车安全', NULL, CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 20, 101, N'img25.jpg', NULL, N'精品推荐')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1057, NULL, N'伊利安慕希高端酸牛奶风味酸奶230g*10瓶', N'伊利安慕希高端酸牛奶风味酸奶230g*10瓶/整箱早餐型', CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 100, 5, N'img26.jpg', NULL, N'精品推荐')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1058, NULL, N'维达抽纸超韧3层M码120抽24包卫生餐巾纸巾抽纸家用实惠整箱装', N'维达抽纸超韧3层M码120抽24包卫生餐巾纸巾抽纸家用实惠整箱装', CAST(200.00 AS Decimal(18, 2)), CAST(196.00 AS Decimal(18, 2)), 10, 10, N'img27.jpg', NULL, N'精品推荐')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1059, NULL, N'威刚HD710PRO移动硬盘2TB USB3.1防水防摔防尘2t机械硬盘USB3.0', N'威刚HD710PRO移动硬盘2TB USB3.1防水防摔防尘2t机械硬盘USB3.0', CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 20, 5, N'img28.jpg', NULL, N'精品推荐')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1060, NULL, N'韩后919爱购节', NULL, CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 100, 2, N'img29.jpg', NULL, N'精品推荐')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1061, NULL, N'贝圣美加固防凹折叠床办公室单人床午睡午休床躺椅简易陪护床便携', N'贝圣美加固防凹折叠床办公室单人床午睡午休床躺椅简易陪护床便携', CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 100, 2, N'img30.jpg', NULL, N'精品推荐')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1062, NULL, N'分期免息 苹果 ipad 2019新款 Air3 2平板电脑mini5 4 Pro 2018 7', NULL, CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 200, 4, N'img28.jpg', NULL, N'精品推荐')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1063, NULL, N'2019新款Apple/苹果10.2英寸iPad2018款mini5 4平板电脑2017Air3', NULL, CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 220, 101, N'img32.jpg', NULL, N'生活服务')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1064, NULL, N'2019新款Apple/苹果10.2英寸iPad2018款mini5 4平板电脑2017Air3', NULL, CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 220, 5, N'img33.jpg', NULL, N'生活服务')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1065, NULL, N'苹果WATCH手表 智能穿戴 智能手表 Apple Watch', NULL, CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 100, 2, N'img34.jpg', NULL, N'生活服务')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1066, NULL, N'分期免息 苹果 ipad 2019新款 Air3 2平板电脑mini5 4 Pro 2018 7', NULL, CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 200, 4, N'img35.jpg', NULL, N'生活服务')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1067, NULL, N'2019新款Apple/苹果10.2英寸iPad2018款mini5 4平板电脑2017Air3', NULL, CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 220, 5, N'img36.jpg', NULL, N'生活服务')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1068, NULL, N'保护儿童行车安全', NULL, CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 20, 5, N'img37.jpg', NULL, N'生活服务')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1069, NULL, N'韩后919爱购节', NULL, CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 100, 2, N'img38.jpg', NULL, N'生活服务')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1070, NULL, N'阳澄湖大闸蟹', NULL, CAST(200.00 AS Decimal(18, 2)), CAST(196.00 AS Decimal(18, 2)), 10, 10, N'img24.jpg', NULL, N'')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1071, NULL, N'保护儿童行车安全', NULL, CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 20, 5, N'img25.jpg', NULL, N'')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1072, NULL, N'韩后919爱购节', NULL, CAST(2000.00 AS Decimal(18, 2)), CAST(1320.00 AS Decimal(18, 2)), 100, 2, N'img26.jpg', NULL, N'')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1073, NULL, N'苹果WATCH手表 智能穿戴 智能手表 Apple Watch', NULL, CAST(3000.00 AS Decimal(18, 2)), CAST(2658.00 AS Decimal(18, 2)), 100, 2, N'img27.jpg', NULL, N'NUll')
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1075, 21, N'HOST好帅A6智能机器人高科技语音儿童老人陪护学习早教机学习机潮', NULL, CAST(2000.00 AS Decimal(18, 2)), CAST(5678.00 AS Decimal(18, 2)), 50, 2, N'img100.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1077, 29, N'黛末8支月光化妆刷子套装初学者彩妆工具全套遮瑕散粉腮红', NULL, CAST(1000.00 AS Decimal(18, 2)), CAST(170.00 AS Decimal(18, 2)), 200, 5, N'img99.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1078, 22, N'桂花糕传统糕点正宗米糕手工点心茶点怀旧小零食', NULL, CAST(5000.00 AS Decimal(18, 2)), CAST(56.00 AS Decimal(18, 2)), 500, 101, N'img98.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1079, 108, N'红米Redmi K30 Pro 5G先锋 骁龙865旗舰处理器 弹出式超光感全面屏游戏智能手机', NULL, CAST(3400.00 AS Decimal(18, 2)), CAST(88.00 AS Decimal(18, 2)), 456, 4, N'img97.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1080, 108, N'华为 畅玩7X官方正品全网通', NULL, CAST(7855.00 AS Decimal(18, 2)), CAST(852.00 AS Decimal(18, 2)), 777, 2, N'img96.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1082, 19, N'桔梗裙', NULL, CAST(8522.00 AS Decimal(18, 2)), CAST(475.00 AS Decimal(18, 2)), 854, 101, N'img95.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1083, 29, N'兰蔻大粉水玫瑰清滢舒缓柔肤水', NULL, CAST(7855.00 AS Decimal(18, 2)), CAST(742.00 AS Decimal(18, 2)), 563, 4, N'img94.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1084, 29, N'美国Axxxx袋鼠洗发水护发素三分钟保湿发膜', NULL, CAST(7456.00 AS Decimal(18, 2)), CAST(562.00 AS Decimal(18, 2)), 752, 2, N'img93.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1087, 21, N'美国歌德 SR225 摇滚耳机安润行货', NULL, CAST(7452.00 AS Decimal(18, 2)), CAST(525.00 AS Decimal(18, 2)), 755, 4, N'img92.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1088, 24, N'欧式沙发组合客厅实木皮艺沙发转角单双人位贵妃位小户型家具套装', NULL, CAST(4255.00 AS Decimal(18, 2)), CAST(412.00 AS Decimal(18, 2)), 785, 2, N'img91.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1089, 21, N'苹果五代学生多功能运动手表防水手环', NULL, CAST(7586.00 AS Decimal(18, 2)), CAST(853.00 AS Decimal(18, 2)), 758, 5, N'img90.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1092, 97, N'唐科wifi智能手表男手机多功能4g全网通可上网的电话手表成年人大屏拍照学生安卓黑科技适配华为小米苹果考试', NULL, CAST(4256.00 AS Decimal(18, 2)), CAST(752.00 AS Decimal(18, 2)), 514, 5, N'img89.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1093, 19, N'娃娃领格子连衣裙', NULL, CAST(4538.00 AS Decimal(18, 2)), CAST(582.00 AS Decimal(18, 2)), 452, 2, N'img88.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1094, 19, N'一字肩背带裙', NULL, CAST(7522.00 AS Decimal(18, 2)), CAST(752.00 AS Decimal(18, 2)), 785, 4, N'img87.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1095, 39, N'乐高积木泰姬陵微颗粒成年高难度建筑城堡立体益智拼装图大人玩具', NULL, CAST(4623.00 AS Decimal(18, 2)), CAST(453.00 AS Decimal(18, 2)), 756, 5, N'img86.jpg', NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1096, 106, N'电脑', N'只有9999', CAST(4000.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), 1000, 50, N'blfc1.jpg', CAST(0x61410B00 AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1098, 44, N'一伏特V101万用表', N'fluke福禄克数字万用表18b+F15B+F17B+107高精度12E+自动便携式', CAST(150.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), 1000, 50, N'img113.jpg', CAST(0xD9410B00 AS Date), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductTypeID], [ProductName], [ProDescription], [ShortPrice], [Price], [ProQuantity], [SallQuantity], [ProImage], [UpdateTime], [Note]) VALUES (1099, 105, N'一体相机', N'县级市附属公司的好地方若干个豆腐干豆腐干十大富豪调查的符号的风格和dfg', CAST(2400.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), 100, 7000, N'img117.jpg', CAST(0x54410B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductSku] ON 

INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (1, 1021, N'金色', 500, CAST(4500.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (2, 1021, N'黑色', 500, CAST(4300.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (3, 1021, N'粉色', 500, CAST(4200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (4, 1023, N'金色', 500, CAST(260.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (5, 1023, N'黑色', 500, CAST(260.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (6, 1023, N'粉色', 500, CAST(260.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (7, 1075, N'金色', 500, CAST(250.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (8, 1075, N'黑色', 500, CAST(230.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (9, 1075, N'粉色', 500, CAST(220.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (10, 1077, N'橘红', 500, CAST(170.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (11, 1077, N'正红', 500, CAST(160.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (12, 1077, N'桃红', 500, CAST(170.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (13, 1078, N'实惠半斤装', 500, CAST(1500.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (14, 1078, N'1000g', 500, CAST(30.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (15, 1078, N'1500g', 500, CAST(40.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (16, 1079, N'黑色', 500, CAST(4500.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (17, 1079, N'金色', 500, CAST(4300.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (18, 1079, N'粉色', 500, CAST(4200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (19, 1080, N'黑色', 500, CAST(3500.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (20, 1080, N'金色', 500, CAST(3300.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (21, 1080, N'粉色', 500, CAST(3200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (22, 1082, N'M码', 500, CAST(200.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (23, 1082, N'L码', 500, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (24, 1082, N'XL码', 500, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (25, 1083, N'20ml', 500, CAST(40.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (26, 1083, N'50ml', 500, CAST(60.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (27, 1083, N'80ml', 500, CAST(90.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (28, 1084, N'450ml', 500, CAST(120.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (29, 1084, N'500ml', 500, CAST(100.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (30, 1084, N'750ml', 500, CAST(80.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (31, 1087, N'黑色', 500, CAST(4000.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (32, 1087, N'金色', 500, CAST(3900.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (33, 1087, N'粉色', 500, CAST(3800.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (34, 1088, N'黑色', 500, CAST(1500.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (35, 1088, N'金色', 500, CAST(1300.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (36, 1088, N'粉色', 500, CAST(1200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (37, 1089, N'黑色', 500, CAST(8200.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (38, 1089, N'金色', 500, CAST(8100.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (39, 1089, N'粉色', 500, CAST(8000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (40, 1092, N'黑色', 500, CAST(2500.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (41, 1092, N'金色', 500, CAST(2300.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (42, 1092, N'粉色', 500, CAST(2200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (43, 1093, N'M码', 500, CAST(120.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (44, 1093, N'L码', 500, CAST(120.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (45, 1093, N'XL码', 500, CAST(120.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (46, 1094, N'M码', 500, CAST(80.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (47, 1094, N'L码', 500, CAST(80.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (48, 1094, N'XL码', 500, CAST(80.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (49, 1095, N'官方标配', 500, CAST(150.00 AS Decimal(18, 2)), N'1')
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (50, 1095, N'简约装', 500, CAST(100.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (51, 1095, N'豪华装', 500, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (61, 1096, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (65, 1028, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (66, 1029, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (67, 1030, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (68, 1031, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (69, 1032, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (70, 1033, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (71, 1035, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (72, 1036, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (73, 1040, N'活动款s', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (74, 1041, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (75, 1042, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (76, 1043, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (77, 1044, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (78, 1045, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (79, 1046, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (80, 1047, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (81, 1048, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (82, 1049, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (83, 1050, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (84, 1051, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (85, 1052, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (86, 1053, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (87, 1054, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (88, 1055, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (89, 1056, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (90, 1057, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (91, 1058, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (92, 1059, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (93, 1060, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (94, 1061, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (95, 1062, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (96, 1063, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (97, 1064, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (98, 1065, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (99, 1067, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (100, 1068, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (101, 1069, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (102, 1070, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (103, 1071, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (104, 1072, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (105, 1073, N'活动款', 1000, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (106, 1073, N'活动款2', 1002, CAST(180.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (107, 1098, N'家用', 100, CAST(200.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (108, 1098, N'学校用', 100, CAST(230.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (109, 1099, N'金装', 100, CAST(2400.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (110, 1099, N'银装', 100, CAST(2000.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[ProductSku] ([SkuID], [ProductID], [SkuName], [Skuquantity], [SkuPrice], [Note]) VALUES (111, 1099, N'铜装', 200, CAST(2400.00 AS Decimal(18, 2)), NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductSku] OFF
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (1, N'功能商品', NULL, 0, NULL, N'li01')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (19, N'服装箱包', NULL, 1, NULL, N'li02')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (20, N'珠宝饰品', NULL, 2, NULL, N'li04')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (21, N'数码家电', NULL, 3, NULL, N'li05')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (22, N'食品茶酒', NULL, 4, NULL, N'li06')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (23, N'运动体育', NULL, 5, NULL, N'li07')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (24, N'家居家纺', NULL, 6, NULL, N'li08')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (28, N'生活服务', NULL, 7, NULL, N'li09')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (29, N'美妆护肤', NULL, 8, NULL, N'li03')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (30, N'办公', NULL, 9, 1, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (31, N'五金电子', NULL, 10, 1, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (32, N'DIY', NULL, 11, 1, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (33, N'打印机', NULL, 12, 30, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (35, N'一体机', NULL, 13, 30, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (36, N'收银机', NULL, 14, 30, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (37, N'保险箱5', NULL, 15, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (38, N'办公椅s', NULL, 16, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (39, N'文具', NULL, 17, 30, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (40, N'碎纸机的覅的', NULL, 18, 30, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (41, N'考勤门禁', NULL, 19, 30, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (42, N'会议白板', NULL, 20, 30, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (43, N'物联网市场', NULL, 21, 31, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (44, N'万用表', NULL, 22, 31, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (46, N'管钳子', NULL, 24, 31, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (48, N'无尘锯', NULL, 26, 31, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (49, N'角磨机', NULL, 27, 31, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (50, N'切割机', NULL, 28, 31, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (51, N'定制T恤', NULL, 29, 32, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (52, N'文化衫', NULL, 30, 32, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (53, N'LOGO设计', NULL, 31, 32, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (54, N'VI设计', NULL, 32, 32, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (55, N'广告扇', NULL, 33, 32, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (57, N'奖杯', NULL, 34, 32, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (58, N'软陶人偶', NULL, 35, 32, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (59, N'二维码贴纸', NULL, 36, 32, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (60, N'男装', NULL, 37, 19, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (61, N'女装12', NULL, 38, 19, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (62, N'内衣', NULL, 39, 19, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (63, N'箱包', NULL, 40, 19, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (64, N'夏秋新品', NULL, 41, 60, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (65, N'T恤', NULL, 42, 60, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (66, N'衬衫', NULL, 43, 60, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (67, N'休闲裤', NULL, 44, 60, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (68, N'牛仔裤', NULL, 45, 60, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (69, N'外套', NULL, 46, 60, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (70, N'夹克', NULL, 47, 60, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (71, N'卫衣', NULL, 48, 60, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (72, N'风衣', NULL, 49, 60, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (73, N'羽绒服', NULL, 50, 60, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (75, N'连衣裙', NULL, 51, 61, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (76, N'半身裙', NULL, 52, 61, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (77, N'毛针织杉', NULL, 53, 61, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (78, N'T恤', NULL, 54, 61, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (79, N'短外套', NULL, 55, 61, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (80, N'背心吊带', NULL, 56, 61, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (83, N'珠宝', NULL, 58, 19, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (84, N'配件配饰', NULL, 59, 19, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (85, N'眼镜', NULL, 60, 19, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (86, N'高端定制', NULL, 61, 83, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (87, N'彩色宝石', NULL, 62, 83, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (88, N'情侣对戒', NULL, 63, 83, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (89, N'帽子', NULL, 64, 84, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (90, N'真丝围巾', NULL, 65, 84, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (91, N'耳环', NULL, 66, 84, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (92, N'3D眼镜', NULL, 67, 85, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (93, N'无框眼镜', NULL, 68, 85, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (94, N'护目镜', NULL, 69, 85, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (95, N'家电', NULL, 70, 21, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (96, N'数码', NULL, 71, 21, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (97, N'手机', NULL, 72, 21, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (98, N'生活电器', NULL, 73, 95, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (101, N'个人护理', NULL, 74, 95, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (102, N'取暖器', NULL, 75, 95, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (103, N'吹风机', NULL, 76, 95, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (104, N'游戏主机', NULL, 77, 96, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (105, N'数码精选', NULL, 78, 96, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (106, N'平板电脑', NULL, 79, 96, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (107, N'数码相机', NULL, 80, 96, NULL)
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (108, N'苹果', NULL, 81, 97, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (109, N'华为', NULL, 82, 97, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (110, N'小米', NULL, 83, 97, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (111, N'荣耀', NULL, 84, 97, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (112, N'oppo', NULL, 85, 87, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (113, N'vivo', NULL, 86, 87, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (114, N'其他', NULL, 87, NULL, N'li10')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (115, N'诺比亚', NULL, NULL, 97, N'3')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (116, N'女装', NULL, NULL, 19, N'2')
INSERT [dbo].[ProductType] ([ProductTypeID], [ProductTypeName], [Images], [Sort], [ErciID], [Note]) VALUES (117, N'连衣裙', NULL, NULL, 116, N'3')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
SET IDENTITY_INSERT [dbo].[ShopCar] ON 

INSERT [dbo].[ShopCar] ([CarID], [ProductID], [UserID], [Quantity], [CreateTime], [SkuID], [Note]) VALUES (26, 1032, 27, 5, CAST(0x4E410B00 AS Date), 69, NULL)
INSERT [dbo].[ShopCar] ([CarID], [ProductID], [UserID], [Quantity], [CreateTime], [SkuID], [Note]) VALUES (28, 1040, 27, 2, CAST(0x4E410B00 AS Date), 73, NULL)
INSERT [dbo].[ShopCar] ([CarID], [ProductID], [UserID], [Quantity], [CreateTime], [SkuID], [Note]) VALUES (31, 1036, 2, 1, CAST(0x4F410B00 AS Date), 72, NULL)
INSERT [dbo].[ShopCar] ([CarID], [ProductID], [UserID], [Quantity], [CreateTime], [SkuID], [Note]) VALUES (32, 1047, 2, 1, CAST(0x4F410B00 AS Date), 80, NULL)
INSERT [dbo].[ShopCar] ([CarID], [ProductID], [UserID], [Quantity], [CreateTime], [SkuID], [Note]) VALUES (33, 1050, 2, 1, CAST(0x4F410B00 AS Date), 83, NULL)
INSERT [dbo].[ShopCar] ([CarID], [ProductID], [UserID], [Quantity], [CreateTime], [SkuID], [Note]) VALUES (34, 1021, 2, 3, CAST(0x4F410B00 AS Date), 2, NULL)
INSERT [dbo].[ShopCar] ([CarID], [ProductID], [UserID], [Quantity], [CreateTime], [SkuID], [Note]) VALUES (37, 1092, 28, 1, CAST(0x4F410B00 AS Date), 40, NULL)
INSERT [dbo].[ShopCar] ([CarID], [ProductID], [UserID], [Quantity], [CreateTime], [SkuID], [Note]) VALUES (40, 1099, 28, 1, CAST(0x4F410B00 AS Date), 110, NULL)
SET IDENTITY_INSERT [dbo].[ShopCar] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (1, 1, N'admin', N'202cb962ac59075b964b07152d234b70', NULL, NULL, 0, N'avatar.png', 100, CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000ABE500000000 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (2, 2, N'chyg', N'bce9f432fa899325f51364f0108a1b5f', N'上电视', N'2458237320@qq.com', 1, N'user2.jpg', 100, CAST(3860.00 AS Decimal(18, 2)), CAST(0x0000ABE500000000 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (5, 2, N'gly', N'bce9f432fa899325f51364f0108a1b5f', NULL, NULL, 0, N'avatar3.png', 100, CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000ABE500000000 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (11, 2, N'df', N'bce9f432fa899325f51364f0108a1b5f', NULL, NULL, 0, N'avatar4.png', 100, CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000ABE500000000 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (13, 2, N'dfd', N'bce9f432fa899325f51364f0108a1b5f', NULL, NULL, 1, N'avatar5.png', 100, CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000ABE500000000 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (15, 2, N'rtr', N'bce9f432fa899325f51364f0108a1b5f', NULL, NULL, 0, N'avatar2.png', 100, CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000ABE500000000 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (16, 2, N'er', N'bce9f432fa899325f51364f0108a1b5f', NULL, NULL, 1, N'avatar3.png', 100, CAST(10000.00 AS Decimal(18, 2)), CAST(0x0000ABE500000000 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (18, NULL, N'lqccs', N'bce9f432fa899325f51364f0108a1b5f', NULL, NULL, 0, N'avatar4.png', 100, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000ABF200AEE80D AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (19, 2, N'trty', N'ec4e2d27630b3859bda056931ae79fbf', NULL, NULL, 0, N'avatar2.png', 100, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000ABF200AF63AE AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (20, 2, N'yuytuy', N'ec4e2d27630b3859bda056931ae79fbf', NULL, NULL, 0, N'avatar2.png', 100, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000ABF200AFCA69 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (21, 2, N'hgfh', N'bce9f432fa899325f51364f0108a1b5f', NULL, NULL, 0, N'avatar2.png', 100, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000ABF200B05A32 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (22, 2, N'hgh', N'ec4e2d27630b3859bda056931ae79fbf', NULL, NULL, 0, N'avatar3.png', 100, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000ABF200B06DBD AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (23, 2, N'hgfh', N'ec4e2d27630b3859bda056931ae79fbf', NULL, NULL, 0, N'avatar4.png', 100, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000ABF200B08070 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (24, 2, N'klk', N'ec4e2d27630b3859bda056931ae79fbf', NULL, NULL, 0, N'avatar.png', 100, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000ABF200B34C7B AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (27, 2, N'dingwei', N'bce9f432fa899325f51364f0108a1b5f', N'小伟', N'2458237320@qq.com', 1, NULL, 100, CAST(900.00 AS Decimal(18, 2)), CAST(0x0000ABF300000000 AS DateTime), NULL)
INSERT [dbo].[UserInfo] ([UserID], [UserRole], [UserName], [UserPwd], [NickName], [Email], [IsVip], [Images], [Integral], [Money], [RegistrationTime], [Note]) VALUES (28, 2, N'瑶姐', N'bce9f432fa899325f51364f0108a1b5f', N'dfd', N'2458237320@qq.com', 0, N'user2.jpg', 100, CAST(4400.00 AS Decimal(18, 2)), CAST(0x0000ABF400B69467 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([id], [Name], [Note]) VALUES (1, N'管理员', NULL)
INSERT [dbo].[UserRole] ([id], [Name], [Note]) VALUES (2, N'用户', NULL)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([WishlistID], [ProductID], [UserID], [SkuID], [WishTime], [Note]) VALUES (7, 1045, 2, 50, CAST(0x4C410B00 AS Date), NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [ProductID], [UserID], [SkuID], [WishTime], [Note]) VALUES (8, 1046, 2, 48, CAST(0x4C410B00 AS Date), NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [ProductID], [UserID], [SkuID], [WishTime], [Note]) VALUES (9, 1043, 2, 45, CAST(0x4C410B00 AS Date), NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [ProductID], [UserID], [SkuID], [WishTime], [Note]) VALUES (10, 1080, 2, 19, CAST(0x4D410B00 AS Date), NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [ProductID], [UserID], [SkuID], [WishTime], [Note]) VALUES (11, 1032, 27, 69, CAST(0x4E410B00 AS Date), NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [ProductID], [UserID], [SkuID], [WishTime], [Note]) VALUES (12, 1032, 27, 17, CAST(0x4E410B00 AS Date), NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [ProductID], [UserID], [SkuID], [WishTime], [Note]) VALUES (15, 1021, 2, 2, CAST(0x4F410B00 AS Date), NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [ProductID], [UserID], [SkuID], [WishTime], [Note]) VALUES (16, 1021, 2, 1, CAST(0x4F410B00 AS Date), NULL)
INSERT [dbo].[Wishlist] ([WishlistID], [ProductID], [UserID], [SkuID], [WishTime], [Note]) VALUES (18, 1099, 28, 111, CAST(0x4F410B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
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
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([UserID])
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
ALTER TABLE [dbo].[ImageTable]  WITH CHECK ADD  CONSTRAINT [FK_ImageTable_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ImageTable] CHECK CONSTRAINT [FK_ImageTable_Products]
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
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD FOREIGN KEY([SkuID])
REFERENCES [dbo].[ProductSku] ([SkuID])
GO
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserInfo] ([UserID])
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
