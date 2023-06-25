USE [master]
GO
/****** Object:  Database [SneakerDB]    Script Date: 10/4/2022 1:43:54 PM ******/
CREATE DATABASE [SneakerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SneakerDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SneakerDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SneakerDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SneakerDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SneakerDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SneakerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SneakerDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SneakerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SneakerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SneakerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SneakerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SneakerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SneakerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SneakerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SneakerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SneakerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SneakerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SneakerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SneakerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SneakerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SneakerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SneakerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SneakerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SneakerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SneakerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SneakerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SneakerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SneakerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SneakerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SneakerDB] SET  MULTI_USER 
GO
ALTER DATABASE [SneakerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SneakerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SneakerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SneakerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SneakerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SneakerDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SneakerDB] SET QUERY_STORE = OFF
GO
USE [SneakerDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/4/2022 1:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[phoneNumber] [nvarchar](50) NULL,
	[password] [nvarchar](250) NULL,
	[idStatus] [int] NULL,
	[idRole] [int] NULL,
 CONSTRAINT [PK__Account__3213E83FEA5998B1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountDetail]    Script Date: 10/4/2022 1:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idAccount] [int] NULL,
	[nickName] [nvarchar](150) NULL,
	[dob] [date] NULL,
	[doc] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressContact]    Script Date: 10/4/2022 1:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressContact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idAccountDetail] [int] NULL,
	[address] [nvarchar](500) NULL,
	[nameContact] [nvarchar](150) NULL,
	[phoneContact] [nvarchar](50) NULL,
 CONSTRAINT [PK__AddressC__3213E83F0AA0D832] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 10/4/2022 1:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK__Brand__3213E83FB3E082E9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModelSneaker]    Script Date: 10/4/2022 1:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelSneaker](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[idBrand] [int] NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK__Product__3213E83F9F8D4D8C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/4/2022 1:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idAdressContact] [int] NULL,
	[orderDate] [date] NULL,
	[expectedDate] [date] NULL,
	[doneDate] [date] NULL,
	[idStatus] [int] NULL,
	[total] [bigint] NULL,
 CONSTRAINT [PK__Order__3213E83FE19E9502] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/4/2022 1:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idOrder] [int] NULL,
	[idProduct] [int] NULL,
	[nameProduct] [nvarchar](150) NULL,
	[priceProduct] [int] NULL,
	[idSize] [int] NULL,
	[quantity] [int] NULL,
	[discount] [int] NULL,
	[total] [bigint] NULL,
 CONSTRAINT [PK__OrderDet__3213E83F0CA6F794] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/4/2022 1:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idModelSneaker] [int] NULL,
	[name] [nvarchar](150) NULL,
	[unitPrice] [int] NULL,
	[img] [nvarchar](150) NULL,
	[idSize] [int] NULL,
	[quantity] [int] NULL,
	[idStatus] [int] NULL,
 CONSTRAINT [PK__ProductD__3213E83F92EACB05] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 10/4/2022 1:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [nvarchar](150) NULL,
	[phoneNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK__Shipper__3213E83F3CBCFD10] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 10/4/2022 1:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sizeValue] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 10/4/2022 1:43:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[key] [nvarchar](150) NULL,
	[value] [int] NULL,
	[name] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (1, N'0911092002', N'Shironeko02@', 5, 14)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (2, N'0912345678', N'QuyQuoc02@', 5, 14)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (3, N'0911092002', N'KuroShiro03@', 7, 14)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (4, N'0927032009', N'TBaoaoao09@', 5, 14)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (6, N'0911092002', N'admin', 5, 13)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountDetail] ON 

INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (1, 1, N'Quốc Phùng', CAST(N'2002-09-11' AS Date), CAST(N'2022-09-22' AS Date))
INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (2, 2, N'Quý Quốc', CAST(N'2002-01-01' AS Date), CAST(N'2021-09-22' AS Date))
INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (3, 3, N'Kuro', CAST(N'2003-11-09' AS Date), CAST(N'2021-01-22' AS Date))
INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (4, 4, N'Baooooo', CAST(N'2009-03-27' AS Date), CAST(N'2022-03-27' AS Date))
SET IDENTITY_INSERT [dbo].[AccountDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[AddressContact] ON 

INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact]) VALUES (1, 1, N'trọ Hoàng Nam ', N'Phùng Quý Quốc ', N'0911092002')
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact]) VALUES (2, 2, N'FPT Hola', N'Quốc Phùng', N'0912345678')
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact]) VALUES (3, 2, N'trọ Minh Anh Hola', N'Mỹ Hoàn ', N'0345678912')
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact]) VALUES (4, 3, N'KS Bui', N'Châu Tấn', N'0123456789')
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact]) VALUES (5, 3, N'DH Bach Khoa', N'Hảo Hảo', N'0323243234')
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact]) VALUES (6, 4, N'DH Quốc Gia Hola', N'TaoBao', N'0987654321')
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact]) VALUES (7, 4, N'DH Quốc Gia', N'TaoBao', N'0912323245')
SET IDENTITY_INSERT [dbo].[AddressContact] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [name]) VALUES (1, N'Nike')
INSERT [dbo].[Brand] ([id], [name]) VALUES (2, N'Adidas')
INSERT [dbo].[Brand] ([id], [name]) VALUES (3, N'MLB')
INSERT [dbo].[Brand] ([id], [name]) VALUES (4, N'Converse')
INSERT [dbo].[Brand] ([id], [name]) VALUES (5, N'Vans')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[ModelSneaker] ON 

INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (2, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (3, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''', 1, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (4, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
', 1, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (5, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (7, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 1, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (8, N'MLB CHUNKY LINER BOSTON RED', 3, N'MLB CHUNKY LINER BOSTON RED')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (9, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
', 3, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (10, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
', 3, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (11, N'Giày Adidas Ultra Boost 21 White Stripes Black Like Auth', 2, N'Giày Adidas Ultra Boost 21 White Stripes Black Like Auth')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (12, N'Giày Adidas Ultra Boost 21 Triple White Like Auth', 2, N'Giày Adidas Ultra Boost 21 Triple White Like Auth')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (13, N'Giày Adidas Ultra Boost 21 Multi-Color Like Auth', 2, N'Giày Adidas Ultra Boost 21 Multi-Color Like Auth')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (14, N'Giày Vans Slip-On 47 V DX Fear of God Black White Like Auth', 5, N'Giày Vans Slip-On 47 V DX Fear of God Black White Like Auth')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (15, N'Giày Vans Vault Old Skool Black White 2019 Like Auth', 5, N'Giày Vans Vault Old Skool Black White 2019 Like Auth')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (16, N'Giày Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’ Like Auth', 5, N'Giày Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’ Like Auth')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (17, N'CONVERSE CHUCK 70 FEAR OF GOD
', 4, N'CONVERSE CHUCK 70 FEAR OF GOD
')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (18, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 4, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (19, N'CONVERSE CHUCK 70 PLUS BLACK
', 4, N'CONVERSE CHUCK 70 PLUS BLACK
')
INSERT [dbo].[ModelSneaker] ([id], [name], [idBrand], [description]) VALUES (20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 4, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
')
SET IDENTITY_INSERT [dbo].[ModelSneaker] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [idAdressContact], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (1, 2, CAST(N'2022-01-01' AS Date), CAST(N'2022-01-06' AS Date), CAST(N'2022-01-05' AS Date), 10, 2464000)
INSERT [dbo].[Order] ([id], [idAdressContact], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (2, 4, CAST(N'2021-12-01' AS Date), CAST(N'2021-12-03' AS Date), CAST(N'2021-12-03' AS Date), 12, 5010000)
INSERT [dbo].[Order] ([id], [idAdressContact], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (3, 5, CAST(N'2022-04-05' AS Date), CAST(N'2022-04-09' AS Date), CAST(N'2022-04-12' AS Date), 10, 4890000)
INSERT [dbo].[Order] ([id], [idAdressContact], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (4, 6, CAST(N'2022-04-05' AS Date), CAST(N'2022-04-09' AS Date), CAST(N'2022-04-09' AS Date), 10, 3960000)
INSERT [dbo].[Order] ([id], [idAdressContact], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (5, 6, CAST(N'2022-06-06' AS Date), CAST(N'2022-06-09' AS Date), CAST(N'2022-06-10' AS Date), 12, 9710000)
INSERT [dbo].[Order] ([id], [idAdressContact], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (6, 7, CAST(N'2022-07-08' AS Date), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11' AS Date), 10, 11790000)
INSERT [dbo].[Order] ([id], [idAdressContact], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (7, 7, CAST(N'2022-07-09' AS Date), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-11' AS Date), 10, 251979000)
INSERT [dbo].[Order] ([id], [idAdressContact], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (8, 6, CAST(N'2022-09-20' AS Date), CAST(N'2022-09-24' AS Date), NULL, 9, 5600000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (1, 1, 2, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, 4, 2, 33, 1474000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (2, 1, 3, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, 5, 1, 10, 990000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (3, 2, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, 3, 1, 0, 1100000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (4, 2, 20, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, 4, 3, 40, 3060000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (5, 2, 6, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1700000, 6, 1, 50, 850000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (6, 3, 14, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
', 1400000, 5, 2, 0, 2800000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (7, 3, 3, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, 5, 1, 10, 990000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (8, 3, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, 3, 1, 0, 1100000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (9, 4, 17, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
', 1400000, 8, 1, 10, 1260000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (11, 4, 63, N'Vans Slip-On 47 V DX Fear of God Black White Like Auth', 3000000, 4, 1, 10, 2700000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (12, 5, 85, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, 7, 1, 20, 8000000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (13, 5, 23, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, 3, 1, 10, 1710000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (14, 6, 29, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 1400000, 3, 2, 20, 2240000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (15, 6, 28, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 2500000, 8, 4, 30, 7000000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (16, 6, 21, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, 5, 3, 50, 2550000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (17, 7, 88, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, 5, 30, 30, 251979000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (18, 8, 45, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, 3, 1, 10, 1800000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (19, 8, 46, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, 4, 1, 10, 1800000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [idSize], [quantity], [discount], [total]) VALUES (20, 8, 47, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, 5, 1, 0, 2000000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (1, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, N'1-nike-air-jordan-1-high-trophy-room-freeze-out', 3, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (2, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, N'1-nike-air-jordan-1-high-trophy-room-freeze-out', 4, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (3, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, N'1-nike-air-jordan-1-high-trophy-room-freeze-out', 5, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (4, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, N'1-nike-air-jordan-1-high-trophy-room-freeze-out', 6, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (5, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, N'1-nike-air-jordan-1-high-trophy-room-freeze-out', 7, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (6, 2, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1700000, N'2-nike-air-jordan-1-high-university-blue-like-auth', 6, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (7, 2, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1700000, N'2-nike-air-jordan-1-high-university-blue-like-auth', 7, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (8, 2, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1700000, N'2-nike-air-jordan-1-high-university-blue-like-auth', 8, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (9, 2, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1700000, N'2-nike-air-jordan-1-high-university-blue-like-auth', 5, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (10, 3, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''', 1700000, N'3-nike-air-jordan-1-high-black-white-1-1', 5, 1, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (11, 3, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''', 1700000, N'3-nike-air-jordan-1-high-black-white-1-1', 6, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (12, 3, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''', 1700000, N'3-nike-air-jordan-1-high-black-white-1-1', 7, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (13, 3, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''', 1700000, N'3-nike-air-jordan-1-high-black-white-1-1', 8, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (14, 4, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
', 1400000, N'4-nike-air-jordan-1-high-zoom-cmft-multi-color', 5, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (15, 4, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
', 1400000, N'4-nike-air-jordan-1-high-zoom-cmft-multi-color', 6, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (16, 4, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
', 1400000, N'4-nike-air-jordan-1-high-zoom-cmft-multi-color', 7, 99, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (17, 4, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
', 1400000, N'4-nike-air-jordan-1-high-zoom-cmft-multi-color', 8, 89, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (19, 5, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, N'5-nike-air-force-1-low-golden-toothbrush', 3, 70, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (20, 5, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, N'5-nike-air-force-1-low-golden-toothbrush', 4, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (21, 5, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, N'5-nike-air-force-1-low-golden-toothbrush', 5, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (22, 5, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, N'5-nike-air-force-1-low-golden-toothbrush', 6, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (23, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, N'6-nike-air-force-1-low-07-white-metallic-silver', 3, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (24, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, N'6-nike-air-force-1-low-07-white-metallic-silver', 4, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (25, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, N'6-nike-air-force-1-low-07-white-metallic-silver', 5, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (26, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, N'6-nike-air-force-1-low-07-white-metallic-silver', 6, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (27, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, N'6-nike-air-force-1-low-07-white-metallic-silver', 7, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (28, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 2500000, N'6-nike-air-force-1-low-07-white-metallic-silver-2', 8, 50, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (29, 7, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 1400000, N'7-nike-air-force-1-low-gore-tex-olive', 3, 20, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (30, 7, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 1400000, N'7-nike-air-force-1-low-gore-tex-olive', 4, 30, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (31, 7, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 1400000, N'7-nike-air-force-1-low-gore-tex-olive', 5, 40, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (32, 7, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 1400000, N'7-nike-air-force-1-low-gore-tex-olive', 6, 20, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (33, 8, N'MLB CHUNKY LINER BOSTON RED', 1800000, N'8-mlb-chunky-liner-boston-red', 3, 190, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (34, 8, N'MLB CHUNKY LINER BOSTON RED', 1800000, N'8-mlb-chunky-liner-boston-red', 4, 180, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (35, 8, N'MLB CHUNKY LINER BOSTON RED', 1800000, N'8-mlb-chunky-liner-boston-red', 5, 170, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (36, 8, N'MLB CHUNKY LINER BOSTON RED', 1800000, N'8-mlb-chunky-liner-boston-red', 6, 169, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (37, 9, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
', 1000000, N'9-mlb-chunky-liner-new-york-yankees-grey', 3, 190, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (38, 9, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
', 1000000, N'9-mlb-chunky-liner-new-york-yankees-grey', 4, 190, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (39, 9, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
', 1000000, N'9-mlb-chunky-liner-new-york-yankees-grey', 5, 200, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (40, 9, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
', 1000000, N'9-mlb-chunky-liner-new-york-yankees-grey', 6, 200, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (41, 10, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
', 900000, N'10-mlb-chunky-high-low-new-york-yankees', 3, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (42, 10, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
', 900000, N'10-mlb-chunky-high-low-new-york-yankees', 4, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (43, 10, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
', 900000, N'10-mlb-chunky-high-low-new-york-yankees', 5, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (44, 10, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
', 900000, N'10-mlb-chunky-high-low-new-york-yankees', 6, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (45, 11, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, N'11-adidas-ultra-boost-21-white-black-800x601', 3, 10, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (46, 11, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, N'11-adidas-ultra-boost-21-white-black-800x601', 4, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (47, 11, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, N'11-adidas-ultra-boost-21-white-black-800x601', 5, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (48, 11, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, N'11-adidas-ultra-boost-21-white-black-800x601', 6, 200, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (49, 12, N'Adidas Ultra Boost 21 Triple White Like Auth', 1799000, N'12-ULTRABOOST-21-TRIPLE-WHITE-800x601', 4, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (50, 12, N'Adidas Ultra Boost 21 Triple White Like Auth', 1799000, N'12-ULTRABOOST-21-TRIPLE-WHITE-800x601', 5, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (51, 12, N'Adidas Ultra Boost 21 Triple White Like Auth', 1799000, N'12-ULTRABOOST-21-TRIPLE-WHITE-800x601', 6, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (52, 12, N'Adidas Ultra Boost 21 Triple White Like Auth', 1799000, N'12-ULTRABOOST-21-TRIPLE-WHITE-800x601', 7, 30, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (60, 13, N'Adidas Ultra Boost 21 Multi-Color Like Auth', 1999000, N'13-Giay-Adidas-Ultra-Boost-21-Multi-Color', 4, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (61, 13, N'Adidas Ultra Boost 21 Multi-Color Like Auth', 1999000, N'13-Giay-Adidas-Ultra-Boost-21-Multi-Color', 5, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (62, 13, N'Adidas Ultra Boost 21 Multi-Color Like Auth', 1999000, N'13-Giay-Adidas-Ultra-Boost-21-Multi-Color', 6, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (63, 14, N'Vans Slip-On 47 V DX Fear of God Black White Like Auth', 3000000, N'14-Vans-Slip-On-Fear-Of-God-800x600', 4, 60, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (64, 14, N'Vans Slip-On 47 V DX Fear of God Black White Like Auth', 3000000, N'14-Vans-Slip-On-Fear-Of-God-800x600', 5, 70, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (65, 14, N'Vans Slip-On 47 V DX Fear of God Black White Like Auth', 3000000, N'14-Vans-Slip-On-Fear-Of-God-800x600', 6, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (66, 14, N'Vans Slip-On 47 V DX Fear of God Black White Like Auth', 3000000, N'14-Vans-Slip-On-Fear-Of-God-800x600', 7, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (67, 15, N'Vans Vault Old Skool Black White 2019 Like Auth', 2399000, N'15-vans-vault-og-old-skl-800x600', 4, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (68, 15, N'Vans Vault Old Skool Black White 2019 Like Auth', 2399000, N'15-vans-vault-og-old-skl-800x600', 5, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (69, 15, N'Vans Vault Old Skool Black White 2019 Like Auth', 2399000, N'15-vans-vault-og-old-skl-800x600', 6, 80, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (70, 15, N'Vans Vault Old Skool Black White 2019 Like Auth', 2399000, N'15-vans-vault-og-old-skl-800x600', 7, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (71, 16, N'Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’ Like Auth', 2400000, N'16-giay-vans-cdg-print-blanc-de-800x600', 4, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (72, 16, N'Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’ Like Auth', 2400000, N'16-giay-vans-cdg-print-blanc-de-800x600', 5, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (73, 16, N'Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’ Like Auth', 2400000, N'16-giay-vans-cdg-print-blanc-de-800x600', 6, 40, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (74, 16, N'Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’ Like Auth', 2400000, N'16-giay-vans-cdg-print-blanc-de-800x600', 7, 45, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (75, 17, N'CONVERSE CHUCK 70 FEAR OF GOD
', 5000000, N'17-converse-chuck-70-fear-of-god', 5, 10, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (76, 17, N'CONVERSE CHUCK 70 FEAR OF GOD
', 5000000, N'17-converse-chuck-70-fear-of-god', 6, 10, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (77, 17, N'CONVERSE CHUCK 70 FEAR OF GOD
', 5000000, N'17-converse-chuck-70-fear-of-god', 7, 10, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (78, 17, N'CONVERSE CHUCK 70 FEAR OF GOD
', 5000000, N'17-converse-chuck-70-fear-of-god', 8, 10, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (79, 18, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 6000000, N'18-converse-run-star-motion-white-gum-honey', 5, 11, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (80, 18, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 6000000, N'18-converse-run-star-motion-white-gum-honey', 6, 11, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (81, 18, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 6000000, N'18-converse-run-star-motion-white-gum-honey', 7, 11, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (82, 18, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 6000000, N'18-converse-run-star-motion-white-gum-honey', 8, 11, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (83, 19, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, N'19-converse-chuck-70-plus-black', 5, 12, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (84, 19, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, N'19-converse-chuck-70-plus-black', 6, 12, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (85, 19, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, N'19-converse-chuck-70-plus-black', 7, 12, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (86, 19, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, N'19-converse-chuck-70-plus-black', 8, 12, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (87, 19, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, N'19-converse-chuck-70-plus-black', 1, 5, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (88, 20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, N'20-converse-run-star-hike-twisted-classic', 5, 5, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (89, 20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, N'20-converse-run-star-hike-twisted-classic', 6, 6, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (90, 20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, N'20-converse-run-star-hike-twisted-classic', 7, 7, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (91, 20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, N'20-converse-run-star-hike-twisted-classic', 8, 8, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (92, 20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, N'20-converse-run-star-hike-twisted-classic', 1, 3, 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipper] ON 

INSERT [dbo].[Shipper] ([id], [companyName], [phoneNumber]) VALUES (1, N'Goject', N'0912345678')
INSERT [dbo].[Shipper] ([id], [companyName], [phoneNumber]) VALUES (2, N'Bee', N'0921432455')
INSERT [dbo].[Shipper] ([id], [companyName], [phoneNumber]) VALUES (3, N'Bee', N'0981224352')
SET IDENTITY_INSERT [dbo].[Shipper] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([id], [sizeValue]) VALUES (1, 38)
INSERT [dbo].[Size] ([id], [sizeValue]) VALUES (2, 39)
INSERT [dbo].[Size] ([id], [sizeValue]) VALUES (3, 40)
INSERT [dbo].[Size] ([id], [sizeValue]) VALUES (4, 41)
INSERT [dbo].[Size] ([id], [sizeValue]) VALUES (5, 42)
INSERT [dbo].[Size] ([id], [sizeValue]) VALUES (6, 43)
INSERT [dbo].[Size] ([id], [sizeValue]) VALUES (7, 44)
INSERT [dbo].[Size] ([id], [sizeValue]) VALUES (8, 45)
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (1, N'STATUS_PRODUCT', 1, N'Còn Hàng')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (2, N'STATUS_PRODUCT', 2, N'Hết Hàng')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (3, N'STATUS_PRODUCT', 3, N'Giảm Giá')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (4, N'STATUS_PRODUCT', 4, N'Ngừng Kinh Doanh')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (5, N'STATUS_ACCOUNT', 1, N'Đang Hoạt Động')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (6, N'STATUS_ACCOUNT', 2, N'Đang Chờ Duyệt')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (7, N'STATUS_ACCOUNT', 3, N'Ngừng Hoạt Động')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (8, N'STATUS_ORDER', 1, N'Đang Xử Lý')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (9, N'STATUS_ORDER', 2, N'Đang Giao Hàng')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (10, N'STATUS_ORDER', 3, N'Giao Hàng Thành Công')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (11, N'STATUS_ORDER', 4, N'Đang Hủy Đơn Hàng')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (12, N'STATUS_ORDER', 5, N'Đã Hủy Bỏ')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (13, N'ROLE_ACCOUNT', 1, N'Admin')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (14, N'ROLE_ACCOUNT', 2, N'Client')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
ALTER TABLE [dbo].[AccountDetail]  WITH CHECK ADD  CONSTRAINT [FK_AccountDetail_Account] FOREIGN KEY([idAccount])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[AccountDetail] CHECK CONSTRAINT [FK_AccountDetail_Account]
GO
ALTER TABLE [dbo].[AddressContact]  WITH CHECK ADD  CONSTRAINT [FK_AddressContact_AccountDetail] FOREIGN KEY([idAccountDetail])
REFERENCES [dbo].[AccountDetail] ([id])
GO
ALTER TABLE [dbo].[AddressContact] CHECK CONSTRAINT [FK_AddressContact_AccountDetail]
GO
ALTER TABLE [dbo].[ModelSneaker]  WITH CHECK ADD  CONSTRAINT [FK_ModelSneaker_Brand] FOREIGN KEY([idBrand])
REFERENCES [dbo].[Brand] ([id])
GO
ALTER TABLE [dbo].[ModelSneaker] CHECK CONSTRAINT [FK_ModelSneaker_Brand]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AddressContact] FOREIGN KEY([idAdressContact])
REFERENCES [dbo].[AddressContact] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AddressContact]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([idOrder])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_ProductDetail] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_ProductDetail]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size] FOREIGN KEY([idSize])
REFERENCES [dbo].[Size] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Size]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([idModelSneaker])
REFERENCES [dbo].[ModelSneaker] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
USE [master]
GO
ALTER DATABASE [SneakerDB] SET  READ_WRITE 
GO
