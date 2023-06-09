USE [master]
GO
/****** Object:  Database [SneakerDB]    Script Date: 6/27/2023 11:24:24 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 6/27/2023 11:24:24 PM ******/
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
/****** Object:  Table [dbo].[AccountDetail]    Script Date: 6/27/2023 11:24:24 PM ******/
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
/****** Object:  Table [dbo].[AddressContact]    Script Date: 6/27/2023 11:24:24 PM ******/
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
	[addressDefault] [bit] NULL,
 CONSTRAINT [PK__AddressC__3213E83F0AA0D832] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 6/27/2023 11:24:24 PM ******/
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
/****** Object:  Table [dbo].[ModelSneaker]    Script Date: 6/27/2023 11:24:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelSneaker](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NULL,
	[img] [nvarchar](250) NULL,
	[price] [int] NULL,
	[idBrand] [int] NULL,
	[description] [nvarchar](500) NULL,
	[idStatus] [int] NULL,
 CONSTRAINT [PK__Product__3213E83F9F8D4D8C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/27/2023 11:24:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameContact] [nvarchar](250) NULL,
	[phoneContact] [nvarchar](250) NULL,
	[address] [nvarchar](250) NULL,
	[idAccountDetail] [int] NULL,
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/27/2023 11:24:24 PM ******/
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
	[size] [int] NULL,
	[quantity] [int] NULL,
	[discount] [int] NULL,
	[total] [bigint] NULL,
 CONSTRAINT [PK__OrderDet__3213E83F0CA6F794] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/27/2023 11:24:24 PM ******/
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
/****** Object:  Table [dbo].[Size]    Script Date: 6/27/2023 11:24:24 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 6/27/2023 11:24:24 PM ******/
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
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (4, N'0927032009', N'123456', 5, 14)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (6, N'0911092002', N'admin', 5, 13)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (7, N'0911292231', N'Shironeko02@', 5, 14)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (8, N'ds', N'Shironeko02@', 5, 14)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (9, N'0911092005', N'123', 5, 14)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (10, N'sd', N'123', 5, 14)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (13, N'0123456789', N'Hoalac123', 5, 14)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (14, N'0987654321', N'Shironeko02@', 5, 14)
INSERT [dbo].[Account] ([id], [phoneNumber], [password], [idStatus], [idRole]) VALUES (15, N'0816011103', N'Shironeko02@', 5, 14)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountDetail] ON 

INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (1, 1, N'Quốc Phùng', CAST(N'2022-09-11' AS Date), CAST(N'2022-09-22' AS Date))
INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (2, 2, N'Quý Quốc', CAST(N'2002-01-01' AS Date), CAST(N'2021-09-22' AS Date))
INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (3, 3, N'Kuro', CAST(N'2003-11-09' AS Date), CAST(N'2021-01-22' AS Date))
INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (4, 4, N'Baooooo', CAST(N'2009-03-27' AS Date), CAST(N'2022-03-27' AS Date))
INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (7, 7, N'Phụng T', CAST(N'2002-09-11' AS Date), CAST(N'2022-10-24' AS Date))
INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (8, 13, N'Bach Mieu', CAST(N'2002-09-10' AS Date), CAST(N'2022-10-24' AS Date))
INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (9, 14, N'Quốc phùng', CAST(N'2022-09-11' AS Date), CAST(N'2023-01-07' AS Date))
INSERT [dbo].[AccountDetail] ([id], [idAccount], [nickName], [dob], [doc]) VALUES (10, 15, N'Quốc phùng', CAST(N'2022-09-11' AS Date), CAST(N'2023-06-25' AS Date))
SET IDENTITY_INSERT [dbo].[AccountDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[AddressContact] ON 

INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (1, 1, N'trọ Hoàng Nam ', N'Phùng Quý Quốc ', N'0911092002', 1)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (2, 2, N'FPT Hola', N'Quốc Phùng', N'0912345678', 1)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (3, 2, N'trọ Minh Anh Hola', N'Mỹ Hoàn ', N'0345678912', 0)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (4, 3, N'KS Bui', N'Châu Tấn', N'0123456789', 1)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (5, 3, N'DH Bach Khoa', N'Hảo Hảo', N'0323243234', 0)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (6, 4, N'DH Quốc Gia Hola', N'TaoBao', N'0911092002', 0)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (7, 4, N'DHSDQWE', N'Quoc', N'0911092002', 0)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (11, 4, N'Ninh Binh City, Viet Nam', N'Phung Quoc', N'0911092002', 1)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (12, 7, N'Ninh Binh City, Viet Nam', N'Phung Quoc', N'0911092002', 0)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (13, 8, N'Ninh Binh City, Viet Nam', N'Phung Quoc', N'0123456789', 1)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (14, 8, N'Ninh Binh City, Viet Nam', N'Panda', N'0987654321', 0)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (15, 9, N'Ninh Binh City, Viet Nam', N'Phung Quoc', N'0911092002', 0)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (16, 9, N'Hola', N'Tai', N'0911092002', 1)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (17, 9, N'Ninh Binh City, Viet Nam', N'Phung', N'0911092002', 0)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (18, 1, N'ádasdd', N'ádasd', N'0911092002', 0)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (20, 10, N'qựeqwjelqwje', N'Quốc', N'09132131321', 0)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (21, 10, N'Ninh Binh City, Viet Nam', N'Phung Quoc', N'0911092002', 1)
INSERT [dbo].[AddressContact] ([id], [idAccountDetail], [address], [nameContact], [phoneContact], [addressDefault]) VALUES (22, 10, N'NA', N'Huya', N'0911092003', 0)
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

INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE', N'NikeJordan/1-nike-air-jordan-1-high-trophy-room-freeze-out.', 1000000, 1, NULL, 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (2, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE', N'NikeJordan/2-nike-air-jordan-1-high-university-blue-like-auth.', 1700000, 1, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (3, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''', N'NikeJordan/3-nike-air-jordan-1-high-black-white-1-1.', 1700000, 1, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (4, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR', N'NikeJordan/4-nike-air-jordan-1-high-zoom-cmft-multi-color.', 1400000, 1, NULL, 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (5, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', N'NikeAirForce/5-nike-air-force-1-low-golden-toothbrush.', 1700000, 1, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', N'NikeAirForce/6-nike-air-force-1-low-07-white-metallic-silver.', 1900000, 1, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (7, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', N'NikeAirForce/7-nike-air-force-1-low-gore-tex-olive.', 1400000, 1, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (8, N'MLB CHUNKY LINER BOSTON RED', N'MLB/8-mlb-chunky-liner-boston-red.', 1800000, 3, N'MLB CHUNKY LINER BOSTON RED', 1)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (9, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
', N'MLB/9-mlb-chunky-liner-new-york-yankees-grey.', 1000000, 3, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (10, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
', N'MLB/10-mlb-chunky-high-low-new-york-yankees.', 900000, 3, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (11, N'Adidas Ultra Boost 21 White Stripes Black ', N'Adidas/11-adidas-ultra-boost-21-white-black.', 2000000, 2, N'Giày Adidas Ultra Boost 21 White Stripes Black Like Auth', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (12, N'Adidas Ultra Boost 21 Triple White', N'Adidas/12-ULTRABOOST-21-TRIPLE-WHITE.', 1799000, 2, N'Giày Adidas Ultra Boost 21 Triple White Like Auth', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (13, N'Adidas Ultra Boost 21 Multi-Color', N'Adidas/13-Giay-Adidas-Ultra-Boost-21-Multi-Color.', 1999000, 2, N'Giày Adidas Ultra Boost 21 Multi-Color Like Auth', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (14, N'Vans Slip-On 47 V DX Fear of God Black White', N'Vans/14-Vans-Slip-On-Fear-Of-God.', 3000000, 5, N'Giày Vans Slip-On 47 V DX Fear of God Black White Like Auth', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (15, N'Vans Vault Old Skool Black White 2019', N'Vans/15-vans-vault-og-old-skl.', 2399000, 5, NULL, 2)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (16, N'Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’', N'Vans/16-giay-vans-cdg-print-blanc-de.', 2400000, 5, N'Giày Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’ Like Auth', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (17, N'CONVERSE CHUCK 70 FEAR OF GOD
', N'Converse/17-converse-chuck-70-fear-of-god.', 5100000, 4, N'CONVERSE CHUCK 70 FEAR OF GOD
', 1)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (18, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', N'Converse/18-converse-run-star-motion-white-gum-honey.', 6000000, 4, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 2)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (19, N'CONVERSE CHUCK 70 PLUS BLACK
', N'Converse/19-converse-chuck-70-plus-black.', 10000000, 4, N'CONVERSE CHUCK 70 PLUS BLACK
', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', N'Converse/20-converse-run-star-hike-twisted-classic.', 11999000, 4, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (21, N'NIKE AIR JORDAN 1 LOW BULLS
', N'NikeJordan/21-nike-air-jordan-1-low-bulls.', 10000000, 1, N'NIKE AIR JORDAN 1 LOW BULLS
', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (22, N'NIKE AIR JORDAN 1 HIGH DARK MOCHA PK GOD', N'NikeJordan/22-nike-air-jordan-1-high-dark-mocha-pk-god.', 2000000, 1, N'NIKE AIR JORDAN 1 HIGH DARK MOCHA PK GOD', 2)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (23, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT PINK OXFORD', N'NikeJordan/23-nike-air-jordan-1-high-zoom-cmft-pink-oxford.', 1500000, 1, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT PINK OXFORD', 2)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (24, N'ADIDAS YEEZY 700 BRIGHT BLUE
', N'Adidas/24-adidas-yeezy-700-bright-blue.', 1700000, 2, N'ADIDAS YEEZY 700 BRIGHT BLUE
', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (25, N'ADIDAS YEEZY 700 TEAL BLUE', N'Adidas/25-adidas-yeezy-700-teal-blue.', 1700000, 2, N'ADIDAS YEEZY 700 TEAL BLUE', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (26, N'ADIDAS YEEZY 700 UNIVERSITY BLUE', N'Adidas/26-adidas-yeezy-700-university-blue.', 2000000, 2, N'ADIDAS YEEZY 700 UNIVERSITY BLUE', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (27, N'ADIDAS YEEZY 700 V2 STATIC', N'Adidas/27-adidas-yeezy-700-v2-static.', 3500000, 2, N'ADIDAS YEEZY 700 V2 STATIC', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (28, N'ADIDAS YEEZY 700 BOOST MAGNET', N'Adidas/28-adidas-yeezy-700-boost-magnet-nam-nu.', 1900000, 2, N'ADIDAS YEEZY 700 BOOST MAGNET', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (29, N'ADIDAS NMD HUMANRACE GREEN', N'Adidas/29-adidas-nmd-humanrace-xanh-nam-nu-replica-1-1.', 800000, 2, N'ADIDAS NMD HUMANRACE XANH NAM, NỮ REPLICA 1:1', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (30, N'ADIDAS NMD HUMANRACE YELLOW', N'Adidas/30-adidas-nmd-humanrace-vang-nam-nu-replica-1-1.', 900000, 2, N'ADIDAS NMD HUMANRACE VÀNG NAM, NỮ REPLICA 1:1', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (31, N'MLB CHUNKY LINER NEW YORK YANKEES WHITE GREEN', N'MLB/31-mlb-chunky-liner-new-york-yankees-white-green.', 1100000, 3, N'MLB CHUNKY LINER NEW YORK YANKEES WHITE GREEN', 2)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (32, N'MLB CHUNKY LINER NEW YORK YANKEES OFF WHITE', N'MLB/32-mlb-chunky-liner-new-york-yankees-off-white.', 1200000, 3, N'MLB CHUNKY LINER NEW YORK YANKEES OFF WHITE', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (33, N'MLB BOSTON RED SOX BIG BALL CHUNKY P 3D', N'MLB/33-mlb-boston-red-sox-nam-nu.', 1500000, 3, N'MLB BOSTON RED SOX BIG BALL CHUNKY P 3D', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (34, N'MLB KOREA CHUNKY NY YANKEES PURPLE', N'MLB/34-mlb-korea-chunky-ny-yankees-purple.', 2000000, 3, N'MLB KOREA CHUNKY NY YANKEES PURPLE', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (35, N'MLB NEW YORK YANKEES BLACK BIG BALL CHUNKY A', N'MLB/35-mlb-new-york-yankees-black-big-ball-chunky-a.', 2200000, 3, N'MLB NEW YORK YANKEES BLACK BIG BALL CHUNKY A', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (36, N'MLB NY YANKEES SHINY GOLD HOLOGRAM METALLIC BIG BALL CHUNKY', N'MLB/36-mlb-ny-yankees-shiny-gold-hologram-metallic-big-ball-chunky.', 1700000, 3, N'MLB NY YANKEES SHINY GOLD HOLOGRAM METALLIC BIG BALL CHUNKY', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (37, N'MLB BOSTON SHINY/PINK HOLOGRAM BIG BALL CHUNKY', N'MLB/37-mlb-boston-shiny-pink-hologram-big-ball-chunky.', 1500000, 3, N'MLB BOSTON SHINY/PINK HOLOGRAM BIG BALL CHUNKY', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (38, N'CONVERSE DRKSTAR LOW CHUCK 70 WHITE', N'Converse/38-converse-drkstar-low-chuck-70-white.', 2100000, 4, N'CONVERSE DRKSTAR LOW CHUCK 70 WHITE', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (39, N'CONVERSE DRKSTAR CHUCK 70 WHITE', N'Converse/39-converse-drkstar-chuck-70-white.', 2500000, 4, N'CONVERSE DRKSTAR CHUCK 70 WHITE', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (40, N'CONVERSE CHUCK 70 PLUS WHITE', N'Converse/40-converse-chuck-70-plus-white.', 3200000, 4, N'CONVERSE CHUCK 70 PLUS WHITE', 2)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (41, N'CONVERSE CHUCK 1970 BLACK', N'Converse/41-converse-den-co-cao-nam-nu.', 2200000, 4, N'CONVERSE CHUCK 1970 ĐEN CỔ CAO NAM, NỮ', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (42, N'CONVERSE CHUCK 1970 YELLOW', N'Converse/42-converse-vang-co-cao-nam-nu.', 1800000, 4, N'CONVERSE CHUCK 1970 VÀNG CỔ CAO NAM, NỮ', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (43, N'CONVERSE CHUCK 1970 CHINATOWN MARKET UV', N'Converse/43-converse-chuck-1970-chinatown-market-uv-doi-mau.', 1800000, 4, N'CONVERSE CHUCK 1970 CHINATOWN MARKET UV ĐỔI MÀU NAM NỮ', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (44, N'VANS CARO', N'Vans/44-vans-soc-caro.', 1100000, 5, N'VANS SỌC CARO', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (45, N'VANS MARVEL ALL OVER PRINT', N'Vans/45-vans-marvel-authentic-all-over-print-nam-nu.', 1500000, 5, N'VANS MARVEL ALL OVER PRINT NAM, NỮ', 2)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (46, N'VANS MARVEL WHITE BLACK', N'Vans/46-vans-marvel-authentic-nam-nu.', 1500000, 5, N'VANS MARVEL TRẮNG ĐEN NAM, NỮ', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (47, N'VANS SLIP ON HULK REPLICA', N'Vans/47-vans-slip-on-hulk-replica-nam-nu.', 1300000, 5, N'VANS SLIP ON HULK REPLICA NAM, NỮ', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (48, N'VANS CANVAS OLD SKOOL CLASSIC TRUE WHITE', N'Vans/48-vans-old-skool-classic-true-white-vn000d3hw00-1.', 1900000, 5, N'VANS CANVAS OLD SKOOL CLASSIC TRUE WHITE', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (49, N'Vans Breana Geering Old Skool (Port Royal/Black) Skate Shoes', N'Vans/49-vansbreanashoes.', 2100000, 5, N'Vans Breana Geering Old Skool (Port Royal/Black) Skate Shoes', 3)
INSERT [dbo].[ModelSneaker] ([id], [name], [img], [price], [idBrand], [description], [idStatus]) VALUES (50, N'Vans Old Skool Safari Multi (Mix/True White) Women''s Shoes', N'Vans/50-vn0a3wkt9xb.', 2000000, 5, NULL, 1)
SET IDENTITY_INSERT [dbo].[ModelSneaker] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (1, N'Quốc Phùng', N'0912345678', N'FPT Hola', 2, CAST(N'2022-01-01' AS Date), CAST(N'2022-01-06' AS Date), CAST(N'2022-01-05' AS Date), 3, 2464000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (2, N'Châu Tấn', N'0123456789', N'KS Bui', 3, CAST(N'2021-12-01' AS Date), CAST(N'2021-12-03' AS Date), CAST(N'2021-12-03' AS Date), 5, 5010000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (3, N'Hảo Hảo', N'0323243234', N'DH Bach Khoa', 3, CAST(N'2022-04-05' AS Date), CAST(N'2022-04-09' AS Date), CAST(N'2022-04-12' AS Date), 3, 4890000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (4, N'TaoBao', N'0911092002', N'DH Quốc Gia Hola', 4, CAST(N'2022-04-05' AS Date), CAST(N'2022-04-09' AS Date), CAST(N'2022-04-09' AS Date), 3, 3960000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (5, N'TaoBao', N'0911092002', N'DH Quốc Gia Hola', 4, CAST(N'2022-06-06' AS Date), CAST(N'2022-06-09' AS Date), CAST(N'2022-06-10' AS Date), 5, 9710000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (6, N'Quoc', N'0911092002', N'DHSDQWE', 4, CAST(N'2022-07-08' AS Date), CAST(N'2022-07-11' AS Date), CAST(N'2022-07-11' AS Date), 3, 11790000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (7, N'Quoc', N'09341092002', N'DHSDQWE', 4, CAST(N'2022-07-09' AS Date), CAST(N'2022-07-12' AS Date), CAST(N'2022-07-11' AS Date), 3, 251979000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (8, N'TaoBao', N'0231092002', N'DH Quốc Gia Hola', 4, CAST(N'2022-09-20' AS Date), CAST(N'2022-09-24' AS Date), CAST(N'2022-11-01' AS Date), 3, 5600000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (13, N'Phùng Quý Quốc ', N'0911092302', N'trọ Hoàng Nam ', 1, CAST(N'2022-10-19' AS Date), CAST(N'2022-10-24' AS Date), CAST(N'2022-11-01' AS Date), 3, 3500000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (14, N'Phùng Quý Quốc ', N'0912092002', N'trọ Hoàng Nam ', 1, CAST(N'2022-10-19' AS Date), CAST(N'2022-10-24' AS Date), CAST(N'2022-11-01' AS Date), 3, 11900000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (15, N'Phung Quoc', N'0911092002', N'Ninh Binh City, Viet Nam', 7, CAST(N'2022-10-24' AS Date), CAST(N'2022-10-29' AS Date), CAST(N'2022-11-01' AS Date), 3, 1800000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (16, N'Panda', N'0987654321', N'Ninh Binh City, Viet Nam', 8, CAST(N'2022-10-24' AS Date), CAST(N'2022-10-29' AS Date), CAST(N'2022-10-26' AS Date), 3, 1100000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (17, N'Phung Quoc', N'0123456789', N'Ninh Binh City, Viet Nam', 8, CAST(N'2022-10-25' AS Date), CAST(N'2022-10-30' AS Date), CAST(N'2022-11-01' AS Date), 3, 16100000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (18, N'Phung Quoc', N'0123456789', N'Ninh Binh City, Viet Nam', 8, CAST(N'2022-10-25' AS Date), CAST(N'2022-10-30' AS Date), CAST(N'2022-10-26' AS Date), 3, 1700000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (19, N'Phùng Quý Quốc ', N'0911092002', N'trọ Hoàng Nam ', 1, CAST(N'2022-11-01' AS Date), CAST(N'2022-11-06' AS Date), CAST(N'2022-11-01' AS Date), 3, 17000000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (20, N'TaoBao', N'0911092002', N'DH Quốc Gia Hola', 4, CAST(N'2022-11-02' AS Date), CAST(N'2022-11-07' AS Date), CAST(N'2022-11-02' AS Date), 3, 8800000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (21, N'Tai', N'0911092002', N'Hola', 9, CAST(N'2023-01-07' AS Date), CAST(N'2023-01-12' AS Date), CAST(N'2023-01-07' AS Date), 3, 3700000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (22, N'Phùng Quý Quốc ', N'0911092002', N'trọ Hoàng Nam ', 1, CAST(N'2023-06-18' AS Date), CAST(N'2023-06-23' AS Date), CAST(N'2023-06-18' AS Date), 3, 6800000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (23, N'Phùng Quý Quốc ', N'0911092002', N'trọ Hoàng Nam ', 1, CAST(N'2023-06-22' AS Date), CAST(N'2023-06-27' AS Date), CAST(N'2023-06-22' AS Date), 3, 6000000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (24, N'Phùng Quý Quốc ', N'0911092002', N'trọ Hoàng Nam ', 1, CAST(N'2023-06-22' AS Date), CAST(N'2023-06-27' AS Date), CAST(N'2023-06-22' AS Date), 3, 6000000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (25, N'Phùng Quý Quốc ', N'0911092002', N'trọ Hoàng Nam ', 1, CAST(N'2023-06-22' AS Date), CAST(N'2023-06-27' AS Date), NULL, 2, 1800000)
INSERT [dbo].[Order] ([id], [nameContact], [phoneContact], [address], [idAccountDetail], [orderDate], [expectedDate], [doneDate], [idStatus], [total]) VALUES (26, N'Phung Quoc', N'0911092002', N'Ninh Binh City, Viet Nam', 10, CAST(N'2023-06-25' AS Date), CAST(N'2023-06-30' AS Date), CAST(N'2023-06-25' AS Date), 3, 15200000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (1, 1, 2, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, 4, 2, 33, 1474000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (2, 1, 3, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, 5, 1, 10, 990000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (3, 2, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, 3, 1, 0, 1100000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (4, 2, 20, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, 4, 3, 40, 3060000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (5, 2, 6, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1700000, 6, 1, 50, 850000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (6, 3, 14, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
', 1400000, 5, 2, 0, 2800000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (7, 3, 3, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, 5, 1, 10, 990000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (8, 3, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, 3, 1, 0, 1100000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (9, 4, 17, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
', 1400000, 8, 1, 10, 1260000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (11, 4, 63, N'Vans Slip-On 47 V DX Fear of God Black White Like Auth', 3000000, 4, 1, 10, 2700000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (12, 5, 85, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, 7, 1, 20, 8000000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (13, 5, 23, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, 3, 1, 10, 1710000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (14, 6, 29, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 1400000, 3, 2, 20, 2240000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (15, 6, 28, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 2500000, 8, 4, 30, 7000000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (16, 6, 21, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, 5, 3, 50, 2550000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (17, 7, 88, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, 5, 30, 30, 251979000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (18, 8, 45, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, 3, 1, 10, 1800000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (19, 8, 46, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, 4, 1, 10, 1800000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (20, 8, 47, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, 5, 1, 0, 2000000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (21, 13, 7, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE', 1700000, 44, 1, 0, 1700000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (22, 13, 34, N'MLB CHUNKY LINER BOSTON RED', 1800000, 41, 1, 0, 1800000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (23, 14, 7, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE', 1700000, 44, 1, 0, 1700000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (24, 14, 17, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
', 1400000, 45, 3, 0, 4200000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (25, 14, 117, N'NIKE AIR JORDAN 1 HIGH DARK MOCHA PK GOD', 2000000, 43, 3, 0, 6000000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (26, 15, 34, N'MLB CHUNKY LINER BOSTON RED', 1800000, 41, 1, 0, 1800000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (27, 16, 4, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE OUT
', 1100000, 43, 1, 0, 1100000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (28, 17, 8, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE', 1700000, 45, 7, 0, 11900000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (29, 17, 15, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR
', 1400000, 43, 3, 0, 4200000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (30, 18, 6, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE', 1700000, 43, 1, 0, 1700000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (31, 19, 253, N'Vans Old Skool Safari Multi (Mix/True White) Women''s Shoes', 2000000, 38, 4, 0, 8000000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (32, 19, 244, N'VANS SLIP ON HULK REPLICA', 1300000, 40, 3, 0, 3900000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (33, 19, 124, N'ADIDAS YEEZY 700 BRIGHT BLUE
', 1700000, 40, 3, 0, 5100000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (34, 20, 6, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE', 1700000, 43, 2, 0, 3400000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (35, 20, 34, N'MLB CHUNKY LINER BOSTON RED', 1800000, 41, 3, 0, 5400000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (36, 21, 9, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE', 1700000, 42, 1, 0, 1700000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (37, 21, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE', 1000000, 40, 2, 0, 2000000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (38, 22, 6, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE', 1700000, 43, 4, 0, 6800000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (39, 23, 79, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 6000000, 42, 1, 0, 6000000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (40, 24, 81, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 6000000, 44, 1, 0, 6000000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (41, 25, 35, N'MLB CHUNKY LINER BOSTON RED', 1800000, 42, 1, 0, 1800000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (42, 26, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE', 1000000, 40, 5, 0, 5000000)
INSERT [dbo].[OrderDetail] ([id], [idOrder], [idProduct], [nameProduct], [priceProduct], [size], [quantity], [discount], [total]) VALUES (43, 26, 6, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE', 1700000, 43, 6, 0, 10200000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (1, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE', 1000000, N'NikeJordan/1-nike-air-jordan-1-high-trophy-room-freeze-out.', 3, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (2, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE', 1000000, N'NikeJordan/1-nike-air-jordan-1-high-trophy-room-freeze-out.', 4, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (3, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE', 1000000, N'NikeJordan/1-nike-air-jordan-1-high-trophy-room-freeze-out.', 5, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (4, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE', 1000000, N'NikeJordan/1-nike-air-jordan-1-high-trophy-room-freeze-out.', 6, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (5, 1, N'NIKE AIR JORDAN 1 HIGH TROPHY ROOM FREEZE', 1000000, N'NikeJordan/1-nike-air-jordan-1-high-trophy-room-freeze-out.', 7, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (6, 2, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1700000, N'NikeJordan/2-nike-air-jordan-1-high-university-blue-like-auth.', 6, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (7, 2, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1700000, N'NikeJordan/2-nike-air-jordan-1-high-university-blue-like-auth.', 7, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (8, 2, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1700000, N'NikeJordan/2-nike-air-jordan-1-high-university-blue-like-auth.', 8, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (9, 2, N'NIKE AIR JORDAN 1 HIGH UNIVERSITY BLUE LIKE AUTH
', 1700000, N'NikeJordan/2-nike-air-jordan-1-high-university-blue-like-auth.', 5, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (10, 3, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''', 1700000, N'NikeJordan/3-nike-air-jordan-1-high-black-white-1-1.', 5, 1, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (11, 3, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''', 1700000, N'NikeJordan/3-nike-air-jordan-1-high-black-white-1-1.', 6, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (12, 3, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''', 1700000, N'NikeJordan/3-nike-air-jordan-1-high-black-white-1-1.', 7, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (13, 3, N'NIKE AIR JORDAN 1 HIGH ''BLACK WHITE''', 1700000, N'NikeJordan/3-nike-air-jordan-1-high-black-white-1-1.', 8, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (14, 4, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR', 1400000, N'NikeJordan/4-nike-air-jordan-1-high-zoom-cmft-multi-color.', 5, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (15, 4, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR', 1400000, N'NikeJordan/4-nike-air-jordan-1-high-zoom-cmft-multi-color.', 6, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (16, 4, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR', 1400000, N'NikeJordan/4-nike-air-jordan-1-high-zoom-cmft-multi-color.', 7, 99, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (17, 4, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT MULTI COLOR', 1400000, N'NikeJordan/4-nike-air-jordan-1-high-zoom-cmft-multi-color.', 8, 89, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (19, 5, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, N'NikeAirForce/5-nike-air-force-1-low-golden-toothbrush.', 3, 70, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (20, 5, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, N'NikeAirForce/5-nike-air-force-1-low-golden-toothbrush.', 4, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (21, 5, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, N'NikeAirForce/5-nike-air-force-1-low-golden-toothbrush.', 5, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (22, 5, N'NIKE AIR FORCE 1 LOW GOLDEN TOOTHBRUSH
', 1700000, N'NikeAirForce/5-nike-air-force-1-low-golden-toothbrush.', 6, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (23, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, N'NikeAirForce/6-nike-air-force-1-low-07-white-metallic-silver.', 3, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (24, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, N'NikeAirForce/6-nike-air-force-1-low-07-white-metallic-silver.', 4, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (25, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, N'NikeAirForce/6-nike-air-force-1-low-07-white-metallic-silver.', 5, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (26, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, N'NikeAirForce/6-nike-air-force-1-low-07-white-metallic-silver.', 6, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (27, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, N'NikeAirForce/6-nike-air-force-1-low-07-white-metallic-silver.', 7, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (28, 6, N'NIKE AIR FORCE 1 LOW 07 WHITE METALLIC SILVER
', 1900000, N'NikeAirForce/6-nike-air-force-1-low-07-white-metallic-silver.', 8, 50, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (29, 7, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 1400000, N'NikeAirForce/7-nike-air-force-1-low-gore-tex-olive.', 3, 20, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (30, 7, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 1400000, N'NikeAirForce/7-nike-air-force-1-low-gore-tex-olive.', 4, 30, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (31, 7, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 1400000, N'NikeAirForce/7-nike-air-force-1-low-gore-tex-olive.', 5, 40, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (32, 7, N'NIKE AIR FORCE 1 LOW GORE-TEX OLIVE
', 1400000, N'NikeAirForce/7-nike-air-force-1-low-gore-tex-olive.', 6, 20, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (33, 8, N'MLB CHUNKY LINER BOSTON RED', 1800000, N'MLB/8-mlb-chunky-liner-boston-red.', 3, 190, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (34, 8, N'MLB CHUNKY LINER BOSTON RED', 1800000, N'MLB/8-mlb-chunky-liner-boston-red.', 4, 180, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (35, 8, N'MLB CHUNKY LINER BOSTON RED', 1800000, N'MLB/8-mlb-chunky-liner-boston-red.', 5, 170, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (36, 8, N'MLB CHUNKY LINER BOSTON RED', 1800000, N'MLB/8-mlb-chunky-liner-boston-red.', 6, 169, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (37, 9, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
', 1000000, N'MLB/9-mlb-chunky-liner-new-york-yankees-grey.', 3, 190, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (38, 9, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
', 1000000, N'MLB/9-mlb-chunky-liner-new-york-yankees-grey.', 4, 190, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (39, 9, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
', 1000000, N'MLB/9-mlb-chunky-liner-new-york-yankees-grey.', 5, 200, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (40, 9, N'MLB CHUNKY LINER NEW YORK YANKEES GREY
', 1000000, N'MLB/9-mlb-chunky-liner-new-york-yankees-grey.', 6, 200, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (41, 10, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
', 900000, N'MLB/10-mlb-chunky-high-low-new-york-yankees.', 3, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (42, 10, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
', 900000, N'MLB/10-mlb-chunky-high-low-new-york-yankees.', 4, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (43, 10, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
', 900000, N'MLB/10-mlb-chunky-high-low-new-york-yankees.', 5, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (44, 10, N'MLB CHUNKY HIGH LOW NEW YORK YANKEES
', 900000, N'MLB/10-mlb-chunky-high-low-new-york-yankees.', 6, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (45, 11, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, N'Adidas/11-adidas-ultra-boost-21-white-black.', 3, 10, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (46, 11, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, N'Adidas/11-adidas-ultra-boost-21-white-black.', 4, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (47, 11, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, N'Adidas/11-adidas-ultra-boost-21-white-black.', 5, 150, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (48, 11, N'Adidas Ultra Boost 21 White Stripes Black Like Auth', 2000000, N'Adidas/11-adidas-ultra-boost-21-white-black.', 6, 200, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (49, 12, N'Adidas Ultra Boost 21 Triple White Like Auth', 1799000, N'Adidas/12-ULTRABOOST-21-TRIPLE-WHITE.', 4, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (50, 12, N'Adidas Ultra Boost 21 Triple White Like Auth', 1799000, N'Adidas/12-ULTRABOOST-21-TRIPLE-WHITE.', 5, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (51, 12, N'Adidas Ultra Boost 21 Triple White Like Auth', 1799000, N'Adidas/12-ULTRABOOST-21-TRIPLE-WHITE.', 6, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (52, 12, N'Adidas Ultra Boost 21 Triple White Like Auth', 1799000, N'Adidas/12-ULTRABOOST-21-TRIPLE-WHITE.', 7, 30, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (60, 13, N'Adidas Ultra Boost 21 Multi-Color Like Auth', 1999000, N'Adidas/13-Giay-Adidas-Ultra-Boost-21-Multi-Color.', 4, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (61, 13, N'Adidas Ultra Boost 21 Multi-Color Like Auth', 1999000, N'Adidas/13-Giay-Adidas-Ultra-Boost-21-Multi-Color.', 5, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (62, 13, N'Adidas Ultra Boost 21 Multi-Color Like Auth', 1999000, N'Adidas/13-Giay-Adidas-Ultra-Boost-21-Multi-Color.', 6, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (63, 14, N'Vans Slip-On 47 V DX Fear of God Black White Like Auth', 3000000, N'Vans/14-Vans-Slip-On-Fear-Of-God.', 4, 60, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (64, 14, N'Vans Slip-On 47 V DX Fear of God Black White Like Auth', 3000000, N'Vans/14-Vans-Slip-On-Fear-Of-God.', 5, 70, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (65, 14, N'Vans Slip-On 47 V DX Fear of God Black White Like Auth', 3000000, N'Vans/14-Vans-Slip-On-Fear-Of-God.', 6, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (66, 14, N'Vans Slip-On 47 V DX Fear of God Black White Like Auth', 3000000, N'Vans/14-Vans-Slip-On-Fear-Of-God.', 7, 100, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (67, 15, N'Vans Vault Old Skool Black White 2019 Like Auth', 2399000, N'Vans/15-vans-vault-og-old-skl.', 4, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (68, 15, N'Vans Vault Old Skool Black White 2019 Like Auth', 2399000, N'Vans/15-vans-vault-og-old-skl.', 5, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (69, 15, N'Vans Vault Old Skool Black White 2019 Like Auth', 2399000, N'Vans/15-vans-vault-og-old-skl.', 6, 80, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (70, 15, N'Vans Vault Old Skool Black White 2019 Like Auth', 2399000, N'Vans/15-vans-vault-og-old-skl.', 7, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (71, 16, N'Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’ Like Auth', 2400000, N'Vans/16-giay-vans-cdg-print-blanc-de.', 4, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (72, 16, N'Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’ Like Auth', 2400000, N'Vans/16-giay-vans-cdg-print-blanc-de.', 5, 90, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (73, 16, N'Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’ Like Auth', 2400000, N'Vans/16-giay-vans-cdg-print-blanc-de.', 6, 40, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (74, 16, N'Vans Comme des Garçons x OG Authentic LX ‘CDG Print Blanc De Blanc’ Like Auth', 2400000, N'Vans/16-giay-vans-cdg-print-blanc-de.', 7, 45, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (75, 17, N'CONVERSE CHUCK 70 FEAR OF GOD
', 5000000, N'Converse/17-converse-chuck-70-fear-of-god.', 5, 10, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (76, 17, N'CONVERSE CHUCK 70 FEAR OF GOD
', 5000000, N'Converse/17-converse-chuck-70-fear-of-god.', 6, 10, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (77, 17, N'CONVERSE CHUCK 70 FEAR OF GOD
', 5000000, N'Converse/17-converse-chuck-70-fear-of-god.', 7, 10, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (78, 17, N'CONVERSE CHUCK 70 FEAR OF GOD
', 5000000, N'Converse/17-converse-chuck-70-fear-of-god.', 8, 10, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (79, 18, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 6000000, N'Converse/18-converse-run-star-motion-white-gum-honey.', 5, 11, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (80, 18, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 6000000, N'Converse/18-converse-run-star-motion-white-gum-honey.', 6, 11, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (81, 18, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 6000000, N'Converse/18-converse-run-star-motion-white-gum-honey.', 7, 11, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (82, 18, N'CONVERSE RUN STAR MOTION WHITE GUM HONEY
', 6000000, N'Converse/18-converse-run-star-motion-white-gum-honey.', 8, 11, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (83, 19, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, N'Converse/19-converse-chuck-70-plus-black.', 5, 12, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (84, 19, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, N'Converse/19-converse-chuck-70-plus-black.', 6, 12, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (85, 19, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, N'Converse/19-converse-chuck-70-plus-black.', 7, 12, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (86, 19, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, N'Converse/19-converse-chuck-70-plus-black.', 8, 12, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (87, 19, N'CONVERSE CHUCK 70 PLUS BLACK
', 10000000, N'Converse/19-converse-chuck-70-plus-black.', 1, 5, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (88, 20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, N'Converse/20-converse-run-star-hike-twisted-classic.', 5, 5, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (89, 20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, N'Converse/20-converse-run-star-hike-twisted-classic.', 6, 6, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (90, 20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, N'Converse/20-converse-run-star-hike-twisted-classic.', 7, 7, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (91, 20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, N'Converse/20-converse-run-star-hike-twisted-classic.', 8, 8, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (92, 20, N'CONVERSE RUN STAR HIKE TWISTED CLASSIC
', 11999000, N'20-converse-run-star-hike-twisted-classic', 4, 3, 4)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (93, 21, N'NIKE AIR JORDAN 1 LOW BULLS
', 10000000, N'NikeJordan/21-nike-air-jordan-1-low-bulls.', 1, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (94, 21, N'NIKE AIR JORDAN 1 LOW BULLS
', 10000000, N'NikeJordan/21-nike-air-jordan-1-low-bulls.', 2, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (95, 21, N'NIKE AIR JORDAN 1 LOW BULLS
', 10000000, N'NikeJordan/21-nike-air-jordan-1-low-bulls.', 3, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (96, 21, N'NIKE AIR JORDAN 1 LOW BULLS
', 10000000, N'NikeJordan/21-nike-air-jordan-1-low-bulls.', 4, 20, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (97, 21, N'NIKE AIR JORDAN 1 LOW BULLS
', 10000000, N'NikeJordan/21-nike-air-jordan-1-low-bulls.', 5, 20, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (114, 22, N'NIKE AIR JORDAN 1 HIGH DARK MOCHA PK GOD', 2000000, N'NikeJordan/22-nike-air-jordan-1-high-dark-mocha-pk-god.', 3, 50, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (115, 22, N'NIKE AIR JORDAN 1 HIGH DARK MOCHA PK GOD', 2000000, N'NikeJordan/22-nike-air-jordan-1-high-dark-mocha-pk-god.', 4, 50, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (116, 22, N'NIKE AIR JORDAN 1 HIGH DARK MOCHA PK GOD', 2000000, N'NikeJordan/22-nike-air-jordan-1-high-dark-mocha-pk-god.', 5, 50, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (117, 22, N'NIKE AIR JORDAN 1 HIGH DARK MOCHA PK GOD', 2000000, N'NikeJordan/22-nike-air-jordan-1-high-dark-mocha-pk-god.', 6, 50, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (118, 22, N'NIKE AIR JORDAN 1 HIGH DARK MOCHA PK GOD', 2000000, N'NikeJordan/22-nike-air-jordan-1-high-dark-mocha-pk-god.', 7, 50, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (119, 23, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT PINK OXFORD', 1500000, N'NikeJordan/23-nike-air-jordan-1-high-zoom-cmft-pink-oxford.', 3, 0, 4)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (120, 23, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT PINK OXFORD', 1500000, N'NikeJordan/23-nike-air-jordan-1-high-zoom-cmft-pink-oxford.', 4, 0, 4)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (121, 23, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT PINK OXFORD', 1500000, N'NikeJordan/23-nike-air-jordan-1-high-zoom-cmft-pink-oxford.', 5, 0, 4)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (122, 23, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT PINK OXFORD', 1500000, N'NikeJordan/23-nike-air-jordan-1-high-zoom-cmft-pink-oxford.', 6, 0, 4)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (123, 23, N'NIKE AIR JORDAN 1 HIGH ZOOM CMFT PINK OXFORD', 1500000, N'NikeJordan/23-nike-air-jordan-1-high-zoom-cmft-pink-oxford.', 7, 0, 4)
GO
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (124, 24, N'ADIDAS YEEZY 700 BRIGHT BLUE', 1700000, N'Adidas/24-adidas-yeezy-700-bright-blue.', 3, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (125, 24, N'ADIDAS YEEZY 700 BRIGHT BLUE', 1700000, N'Adidas/24-adidas-yeezy-700-bright-blue.', 4, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (126, 24, N'ADIDAS YEEZY 700 BRIGHT BLUE', 1700000, N'Adidas/24-adidas-yeezy-700-bright-blue.', 5, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (127, 24, N'ADIDAS YEEZY 700 BRIGHT BLUE', 1700000, N'Adidas/24-adidas-yeezy-700-bright-blue.', 6, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (128, 24, N'ADIDAS YEEZY 700 BRIGHT BLUE', 1700000, N'Adidas/24-adidas-yeezy-700-bright-blue.', 7, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (129, 24, N'ADIDAS YEEZY 700 BRIGHT BLUE', 1700000, N'Adidas/24-adidas-yeezy-700-bright-blue.', 8, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (130, 25, N'ADIDAS YEEZY 700 TEAL BLUE', 1700000, N'Adidas/25-adidas-yeezy-700-teal-blue.', 3, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (131, 25, N'ADIDAS YEEZY 700 TEAL BLUE', 1700000, N'Adidas/25-adidas-yeezy-700-teal-blue.', 4, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (132, 25, N'ADIDAS YEEZY 700 TEAL BLUE', 1700000, N'Adidas/25-adidas-yeezy-700-teal-blue.', 5, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (133, 25, N'ADIDAS YEEZY 700 TEAL BLUE', 1700000, N'Adidas/25-adidas-yeezy-700-teal-blue.', 6, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (134, 25, N'ADIDAS YEEZY 700 TEAL BLUE', 1700000, N'Adidas/25-adidas-yeezy-700-teal-blue.', 7, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (135, 26, N'ADIDAS YEEZY 700 UNIVERSITY BLUE', 2000000, N'Adidas/26-adidas-yeezy-700-university-blue.', 1, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (136, 26, N'ADIDAS YEEZY 700 UNIVERSITY BLUE', 2000000, N'Adidas/26-adidas-yeezy-700-university-blue.', 2, 0, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (137, 26, N'ADIDAS YEEZY 700 UNIVERSITY BLUE', 2000000, N'Adidas/26-adidas-yeezy-700-university-blue.', 3, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (138, 26, N'ADIDAS YEEZY 700 UNIVERSITY BLUE', 2000000, N'Adidas/26-adidas-yeezy-700-university-blue.', 4, 0, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (139, 26, N'ADIDAS YEEZY 700 UNIVERSITY BLUE', 2000000, N'Adidas/26-adidas-yeezy-700-university-blue.', 5, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (140, 26, N'ADIDAS YEEZY 700 UNIVERSITY BLUE', 2000000, N'Adidas/26-adidas-yeezy-700-university-blue.', 6, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (141, 27, N'ADIDAS YEEZY 700 V2 STATIC', 3500000, N'Adidas/27-adidas-yeezy-700-v2-static.', 3, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (142, 27, N'ADIDAS YEEZY 700 V2 STATIC', 3500000, N'Adidas/27-adidas-yeezy-700-v2-static.', 4, 50, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (143, 27, N'ADIDAS YEEZY 700 V2 STATIC', 3500000, N'Adidas/27-adidas-yeezy-700-v2-static.', 5, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (144, 27, N'ADIDAS YEEZY 700 V2 STATIC', 3500000, N'Adidas/27-adidas-yeezy-700-v2-static.', 6, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (145, 27, N'ADIDAS YEEZY 700 V2 STATIC', 3500000, N'Adidas/27-adidas-yeezy-700-v2-static.', 7, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (146, 28, N'ADIDAS YEEZY 700 BOOST MAGNET', 1900000, N'Adidas/28-adidas-yeezy-700-boost-magnet-nam-nu.', 1, 23, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (147, 28, N'ADIDAS YEEZY 700 BOOST MAGNET', 1900000, N'Adidas/28-adidas-yeezy-700-boost-magnet-nam-nu.', 2, 22, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (148, 28, N'ADIDAS YEEZY 700 BOOST MAGNET', 1900000, N'Adidas/28-adidas-yeezy-700-boost-magnet-nam-nu.', 3, 23, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (149, 28, N'ADIDAS YEEZY 700 BOOST MAGNET', 1900000, N'Adidas/28-adidas-yeezy-700-boost-magnet-nam-nu.', 4, 50, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (150, 28, N'ADIDAS YEEZY 700 BOOST MAGNET', 1900000, N'Adidas/28-adidas-yeezy-700-boost-magnet-nam-nu.', 5, 62, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (151, 28, N'ADIDAS YEEZY 700 BOOST MAGNET', 1900000, N'Adidas/28-adidas-yeezy-700-boost-magnet-nam-nu.', 6, 23, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (152, 28, N'ADIDAS YEEZY 700 BOOST MAGNET', 1900000, N'Adidas/28-adidas-yeezy-700-boost-magnet-nam-nu.', 7, 23, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (153, 28, N'ADIDAS YEEZY 700 BOOST MAGNET', 1900000, N'Adidas/28-adidas-yeezy-700-boost-magnet-nam-nu.', 8, 23, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (154, 29, N'ADIDAS NMD HUMANRACE GREEN', 800000, N'Adidas/29-adidas-nmd-humanrace-xanh-nam-nu-replica-1-1.', 2, 22, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (155, 29, N'ADIDAS NMD HUMANRACE GREEN', 800000, N'Adidas/29-adidas-nmd-humanrace-xanh-nam-nu-replica-1-1.', 3, 55, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (156, 29, N'ADIDAS NMD HUMANRACE GREEN', 800000, N'Adidas/29-adidas-nmd-humanrace-xanh-nam-nu-replica-1-1.', 4, 50, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (157, 29, N'ADIDAS NMD HUMANRACE GREEN', 800000, N'Adidas/29-adidas-nmd-humanrace-xanh-nam-nu-replica-1-1.', 5, 62, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (158, 29, N'ADIDAS NMD HUMANRACE GREEN', 800000, N'Adidas/29-adidas-nmd-humanrace-xanh-nam-nu-replica-1-1.', 6, 55, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (159, 29, N'ADIDAS NMD HUMANRACE GREEN', 800000, N'Adidas/29-adidas-nmd-humanrace-xanh-nam-nu-replica-1-1.', 7, 23, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (160, 30, N'ADIDAS NMD HUMANRACE YELLOW', 900000, N'Adidas/30-adidas-nmd-humanrace-vang-nam-nu-replica-1-1.', 2, 22, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (161, 30, N'ADIDAS NMD HUMANRACE YELLOW', 900000, N'Adidas/30-adidas-nmd-humanrace-vang-nam-nu-replica-1-1.', 3, 55, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (162, 30, N'ADIDAS NMD HUMANRACE YELLOW', 900000, N'Adidas/30-adidas-nmd-humanrace-vang-nam-nu-replica-1-1.', 4, 50, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (163, 30, N'ADIDAS NMD HUMANRACE YELLOW', 900000, N'Adidas/30-adidas-nmd-humanrace-vang-nam-nu-replica-1-1.', 5, 62, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (164, 30, N'ADIDAS NMD HUMANRACE YELLOW', 900000, N'Adidas/30-adidas-nmd-humanrace-vang-nam-nu-replica-1-1.', 6, 55, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (165, 30, N'ADIDAS NMD HUMANRACE YELLOW', 900000, N'Adidas/30-adidas-nmd-humanrace-vang-nam-nu-replica-1-1.', 7, 23, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (166, 31, N'MLB CHUNKY LINER NEW YORK YANKEES WHITE GREEN', 1100000, N'MLB/31-mlb-chunky-liner-new-york-yankees-white-green.', 2, 22, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (167, 31, N'MLB CHUNKY LINER NEW YORK YANKEES WHITE GREEN', 1100000, N'MLB/31-mlb-chunky-liner-new-york-yankees-white-green.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (168, 31, N'MLB CHUNKY LINER NEW YORK YANKEES WHITE GREEN', 1100000, N'MLB/31-mlb-chunky-liner-new-york-yankees-white-green.', 4, 50, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (169, 31, N'MLB CHUNKY LINER NEW YORK YANKEES WHITE GREEN', 1100000, N'MLB/31-mlb-chunky-liner-new-york-yankees-white-green.', 5, 62, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (170, 32, N'MLB CHUNKY LINER NEW YORK YANKEES OFF WHITE', 1200000, N'MLB/32-mlb-chunky-liner-new-york-yankees-off-white.', 2, 22, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (171, 32, N'MLB CHUNKY LINER NEW YORK YANKEES OFF WHITE', 1200000, N'MLB/32-mlb-chunky-liner-new-york-yankees-off-white.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (172, 32, N'MLB CHUNKY LINER NEW YORK YANKEES OFF WHITE', 1200000, N'MLB/32-mlb-chunky-liner-new-york-yankees-off-white.', 4, 50, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (173, 32, N'MLB CHUNKY LINER NEW YORK YANKEES OFF WHITE', 1200000, N'MLB/32-mlb-chunky-liner-new-york-yankees-off-white.', 5, 62, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (174, 33, N'MLB BOSTON RED SOX BIG BALL CHUNKY P 3D', 1500000, N'MLB/33-mlb-boston-red-sox-nam-nu.', 1, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (175, 33, N'MLB BOSTON RED SOX BIG BALL CHUNKY P 3D', 1500000, N'MLB/33-mlb-boston-red-sox-nam-nu.', 2, 22, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (176, 33, N'MLB BOSTON RED SOX BIG BALL CHUNKY P 3D', 1500000, N'MLB/33-mlb-boston-red-sox-nam-nu.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (177, 33, N'MLB BOSTON RED SOX BIG BALL CHUNKY P 3D', 1500000, N'MLB/33-mlb-boston-red-sox-nam-nu.', 4, 50, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (178, 33, N'MLB BOSTON RED SOX BIG BALL CHUNKY P 3D', 1500000, N'MLB/33-mlb-boston-red-sox-nam-nu.', 5, 62, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (179, 34, N'MLB KOREA CHUNKY NY YANKEES PURPLE', 2000000, N'MLB/34-mlb-korea-chunky-ny-yankees-purple.', 1, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (180, 34, N'MLB KOREA CHUNKY NY YANKEES PURPLE', 2000000, N'MLB/34-mlb-korea-chunky-ny-yankees-purple.', 2, 22, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (181, 34, N'MLB KOREA CHUNKY NY YANKEES PURPLE', 2000000, N'MLB/34-mlb-korea-chunky-ny-yankees-purple.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (182, 34, N'MLB KOREA CHUNKY NY YANKEES PURPLE', 2000000, N'MLB/34-mlb-korea-chunky-ny-yankees-purple.', 4, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (183, 34, N'MLB KOREA CHUNKY NY YANKEES PURPLE', 2000000, N'MLB/34-mlb-korea-chunky-ny-yankees-purple.', 5, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (184, 35, N'MLB NEW YORK YANKEES BLACK BIG BALL CHUNKY A', 2200000, N'MLB/35-mlb-new-york-yankees-black-big-ball-chunky-a.', 4, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (185, 35, N'MLB NEW YORK YANKEES BLACK BIG BALL CHUNKY A', 2200000, N'MLB/35-mlb-new-york-yankees-black-big-ball-chunky-a.', 5, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (186, 35, N'MLB NEW YORK YANKEES BLACK BIG BALL CHUNKY A', 2200000, N'MLB/35-mlb-new-york-yankees-black-big-ball-chunky-a.', 6, 55, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (187, 35, N'MLB NEW YORK YANKEES BLACK BIG BALL CHUNKY A', 2200000, N'MLB/35-mlb-new-york-yankees-black-big-ball-chunky-a.', 7, 23, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (188, 35, N'MLB NEW YORK YANKEES BLACK BIG BALL CHUNKY A', 2200000, N'MLB/35-mlb-new-york-yankees-black-big-ball-chunky-a.', 8, 23, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (189, 36, N'MLB NY YANKEES SHINY GOLD HOLOGRAM METALLIC BIG BALL CHUNKY', 1700000, N'MLB/36-mlb-ny-yankees-shiny-gold-hologram-metallic-big-ball-chunky.', 1, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (190, 36, N'MLB NY YANKEES SHINY GOLD HOLOGRAM METALLIC BIG BALL CHUNKY', 1700000, N'MLB/36-mlb-ny-yankees-shiny-gold-hologram-metallic-big-ball-chunky.', 2, 22, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (191, 36, N'MLB NY YANKEES SHINY GOLD HOLOGRAM METALLIC BIG BALL CHUNKY', 1700000, N'MLB/36-mlb-ny-yankees-shiny-gold-hologram-metallic-big-ball-chunky.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (192, 36, N'MLB NY YANKEES SHINY GOLD HOLOGRAM METALLIC BIG BALL CHUNKY', 1700000, N'MLB/36-mlb-ny-yankees-shiny-gold-hologram-metallic-big-ball-chunky.', 4, 5, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (193, 36, N'MLB NY YANKEES SHINY GOLD HOLOGRAM METALLIC BIG BALL CHUNKY', 1700000, N'MLB/36-mlb-ny-yankees-shiny-gold-hologram-metallic-big-ball-chunky.', 5, 5, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (194, 37, N'MLB BOSTON SHINY/PINK HOLOGRAM BIG BALL CHUNKY', 1700000, N'MLB/37-mlb-boston-shiny-pink-hologram-big-ball-chunky.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (195, 37, N'MLB BOSTON SHINY/PINK HOLOGRAM BIG BALL CHUNKY', 1700000, N'MLB/37-mlb-boston-shiny-pink-hologram-big-ball-chunky.', 4, 5, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (196, 37, N'MLB BOSTON SHINY/PINK HOLOGRAM BIG BALL CHUNKY', 1700000, N'MLB/37-mlb-boston-shiny-pink-hologram-big-ball-chunky.', 5, 5, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (197, 37, N'MLB BOSTON SHINY/PINK HOLOGRAM BIG BALL CHUNKY', 1700000, N'MLB/37-mlb-boston-shiny-pink-hologram-big-ball-chunky.', 6, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (198, 37, N'MLB BOSTON SHINY/PINK HOLOGRAM BIG BALL CHUNKY', 1700000, N'MLB/37-mlb-boston-shiny-pink-hologram-big-ball-chunky.', 7, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (199, 38, N'CONVERSE DRKSTAR LOW CHUCK 70 WHITE', 2100000, N'Converse/38-converse-drkstar-low-chuck-70-white.', 2, 22, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (200, 38, N'CONVERSE DRKSTAR LOW CHUCK 70 WHITE', 2100000, N'Converse/38-converse-drkstar-low-chuck-70-white.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (201, 38, N'CONVERSE DRKSTAR LOW CHUCK 70 WHITE', 2100000, N'Converse/38-converse-drkstar-low-chuck-70-white.', 4, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (202, 38, N'CONVERSE DRKSTAR LOW CHUCK 70 WHITE', 2100000, N'Converse/38-converse-drkstar-low-chuck-70-white.', 5, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (203, 39, N'CONVERSE DRKSTAR CHUCK 70 WHITE', 2500000, N'Converse/39-converse-drkstar-chuck-70-white.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (204, 39, N'CONVERSE DRKSTAR CHUCK 70 WHITE', 2500000, N'Converse/39-converse-drkstar-chuck-70-white.', 4, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (205, 39, N'CONVERSE DRKSTAR CHUCK 70 WHITE', 2500000, N'Converse/39-converse-drkstar-chuck-70-white.', 5, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (206, 39, N'CONVERSE DRKSTAR CHUCK 70 WHITE', 2500000, N'Converse/39-converse-drkstar-chuck-70-white.', 6, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (207, 39, N'CONVERSE DRKSTAR CHUCK 70 WHITE', 2500000, N'Converse/39-converse-drkstar-chuck-70-white.', 7, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (208, 39, N'CONVERSE DRKSTAR CHUCK 70 WHITE', 2500000, N'Converse/39-converse-drkstar-chuck-70-white.', 8, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (209, 40, N'CONVERSE CHUCK 70 PLUS WHITE', 3200000, N'Converse/40-converse-chuck-70-plus-white.', 2, 22, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (210, 40, N'CONVERSE CHUCK 70 PLUS WHITE', 3200000, N'Converse/40-converse-chuck-70-plus-white.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (211, 40, N'CONVERSE CHUCK 70 PLUS WHITE', 3200000, N'Converse/40-converse-chuck-70-plus-white.', 4, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (212, 40, N'CONVERSE CHUCK 70 PLUS WHITE', 3200000, N'Converse/40-converse-chuck-70-plus-white.', 5, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (213, 40, N'CONVERSE CHUCK 70 PLUS WHITE', 3200000, N'Converse/40-converse-chuck-70-plus-white.', 6, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (214, 41, N'CONVERSE CHUCK 1970 BLACK', 2200000, N'Converse/41-converse-den-co-cao-nam-nu.', 1, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (215, 41, N'CONVERSE CHUCK 1970 BLACK', 2200000, N'Converse/41-converse-den-co-cao-nam-nu.', 2, 22, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (216, 41, N'CONVERSE CHUCK 1970 BLACK', 2200000, N'Converse/41-converse-den-co-cao-nam-nu.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (217, 41, N'CONVERSE CHUCK 1970 BLACK', 2200000, N'Converse/41-converse-den-co-cao-nam-nu.', 4, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (218, 41, N'CONVERSE CHUCK 1970 BLACK', 2200000, N'Converse/41-converse-den-co-cao-nam-nu.', 5, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (219, 42, N'CONVERSE CHUCK 1970 YELLOW', 1800000, N'Converse/42-converse-vang-co-cao-nam-nu.', 2, 22, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (220, 42, N'CONVERSE CHUCK 1970 YELLOW', 1800000, N'Converse/42-converse-vang-co-cao-nam-nu.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (221, 42, N'CONVERSE CHUCK 1970 YELLOW', 1800000, N'Converse/42-converse-vang-co-cao-nam-nu.', 4, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (222, 42, N'CONVERSE CHUCK 1970 YELLOW', 1800000, N'Converse/42-converse-vang-co-cao-nam-nu.', 5, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (223, 42, N'CONVERSE CHUCK 1970 YELLOW', 1800000, N'Converse/42-converse-vang-co-cao-nam-nu.', 6, 55, 1)
GO
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (224, 43, N'CONVERSE CHUCK 1970 CHINATOWN MARKET UV', 1800000, N'Converse/43-converse-chuck-1970-chinatown-market-uv-doi-mau.', 3, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (225, 43, N'CONVERSE CHUCK 1970 CHINATOWN MARKET UV', 1800000, N'Converse/43-converse-chuck-1970-chinatown-market-uv-doi-mau.', 4, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (226, 43, N'CONVERSE CHUCK 1970 CHINATOWN MARKET UV', 1800000, N'Converse/43-converse-chuck-1970-chinatown-market-uv-doi-mau.', 5, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (227, 43, N'CONVERSE CHUCK 1970 CHINATOWN MARKET UV', 1800000, N'Converse/43-converse-chuck-1970-chinatown-market-uv-doi-mau.', 6, 55, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (228, 43, N'CONVERSE CHUCK 1970 CHINATOWN MARKET UV', 1800000, N'Converse/43-converse-chuck-1970-chinatown-market-uv-doi-mau.', 7, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (229, 43, N'CONVERSE CHUCK 1970 CHINATOWN MARKET UV', 1800000, N'Converse/43-converse-chuck-1970-chinatown-market-uv-doi-mau.', 8, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (230, 44, N'VANS CARO', 1100000, N'Vans/44-vans-soc-caro.', 1, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (231, 44, N'VANS CARO', 1100000, N'Vans/44-vans-soc-caro.', 2, 22, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (232, 44, N'VANS CARO', 1100000, N'Vans/44-vans-soc-caro.', 3, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (233, 44, N'VANS CARO', 1100000, N'Vans/44-vans-soc-caro.', 4, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (234, 44, N'VANS CARO', 1100000, N'Vans/44-vans-soc-caro.', 5, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (235, 44, N'VANS CARO', 1100000, N'Vans/44-vans-soc-caro.', 6, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (236, 44, N'VANS CARO', 1100000, N'Vans/44-vans-soc-caro.', 7, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (237, 44, N'VANS CARO', 1100000, N'Vans/44-vans-soc-caro.', 8, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (238, 45, N'VANS MARVEL ALL OVER PRINT', 1500000, N'Vans/45-vans-marvel-authentic-all-over-print-nam-nu.', 4, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (239, 45, N'VANS MARVEL ALL OVER PRINT', 1500000, N'Vans/45-vans-marvel-authentic-all-over-print-nam-nu.', 5, 52, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (240, 45, N'VANS MARVEL ALL OVER PRINT', 1500000, N'Vans/45-vans-marvel-authentic-all-over-print-nam-nu.', 6, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (241, 45, N'VANS MARVEL ALL OVER PRINT', 1500000, N'Vans/45-vans-marvel-authentic-all-over-print-nam-nu.', 7, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (242, 47, N'VANS SLIP ON HULK REPLICA', 1300000, N'Vans/47-vans-slip-on-hulk-replica-nam-nu.', 1, 23, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (243, 47, N'VANS SLIP ON HULK REPLICA', 1300000, N'Vans/47-vans-slip-on-hulk-replica-nam-nu.', 2, 22, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (244, 47, N'VANS SLIP ON HULK REPLICA', 1300000, N'Vans/47-vans-slip-on-hulk-replica-nam-nu.', 3, 8, 1)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (245, 47, N'VANS SLIP ON HULK REPLICA', 1300000, N'Vans/47-vans-slip-on-hulk-replica-nam-nu.', 4, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (246, 47, N'VANS SLIP ON HULK REPLICA', 1300000, N'Vans/47-vans-slip-on-hulk-replica-nam-nu.', 5, 0, 2)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (247, 49, N'Vans Breana Geering Old Skool (Port Royal/Black) Skate Shoes', 2100000, N'Vans/49-vansbreanashoes.', 1, 23, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (248, 49, N'Vans Breana Geering Old Skool (Port Royal/Black) Skate Shoes', 2100000, N'Vans/49-vansbreanashoes.', 2, 22, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (249, 49, N'Vans Breana Geering Old Skool (Port Royal/Black) Skate Shoes', 2100000, N'Vans/49-vansbreanashoes.', 3, 82, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (250, 49, N'Vans Breana Geering Old Skool (Port Royal/Black) Skate Shoes', 2100000, N'Vans/49-vansbreanashoes.', 4, 55, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (251, 49, N'Vans Breana Geering Old Skool (Port Royal/Black) Skate Shoes', 2100000, N'Vans/49-vansbreanashoes.', 5, 55, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (252, 49, N'Vans Breana Geering Old Skool (Port Royal/Black) Skate Shoes', 2100000, N'Vans/49-vansbreanashoes.', 6, 62, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (253, 50, N'Vans Old Skool Safari Multi (Mix/True White) Women''s Shoes', 2000000, N'Vans/50-vn0a3wkt9xb.', 1, 5, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (254, 50, N'Vans Old Skool Safari Multi (Mix/True White) Women''s Shoes', 2000000, N'Vans/50-vn0a3wkt9xb.', 2, 6, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (255, 50, N'Vans Old Skool Safari Multi (Mix/True White) Women''s Shoes', 2000000, N'Vans/50-vn0a3wkt9xb.', 3, 8, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (256, 50, N'Vans Old Skool Safari Multi (Mix/True White) Women''s Shoes', 2000000, N'Vans/50-vn0a3wkt9xb.', 4, 5, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (257, 50, N'Vans Old Skool Safari Multi (Mix/True White) Women''s Shoes', 2000000, N'Vans/50-vn0a3wkt9xb.', 5, 5, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (258, 50, N'Vans Old Skool Safari Multi (Mix/True White) Women''s Shoes', 2000000, N'Vans/50-vn0a3wkt9xb.', 6, 2, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (259, 50, N'Vans Old Skool Safari Multi (Mix/True White) Women''s Shoes', 2000000, N'Vans/50-vn0a3wkt9xb.', 7, 3, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (260, 50, N'Vans Old Skool Safari Multi (Mix/True White) Women''s Shoes', 2000000, N'Vans/50-vn0a3wkt9xb.', 8, 3, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (261, 46, N'VANS MARVEL WHITE BLACK', 1500000, N'Vans/46-vans-marvel-authentic-nam-nu.', 3, 8, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (262, 46, N'VANS MARVEL WHITE BLACK', 1500000, N'Vans/46-vans-marvel-authentic-nam-nu.', 4, 5, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (263, 46, N'VANS MARVEL WHITE BLACK', 1500000, N'Vans/46-vans-marvel-authentic-nam-nu.', 5, 5, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (264, 46, N'VANS MARVEL WHITE BLACK', 1500000, N'Vans/46-vans-marvel-authentic-nam-nu.', 6, 2, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (265, 46, N'VANS MARVEL WHITE BLACK', 1500000, N'Vans/46-vans-marvel-authentic-nam-nu.', 7, 3, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (266, 48, N'VANS CANVAS OLD SKOOL CLASSIC TRUE WHITE', 1900000, N'Vans/48-vans-old-skool-classic-true-white-vn000d3hw00-1.', 2, 6, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (267, 48, N'VANS CANVAS OLD SKOOL CLASSIC TRUE WHITE', 1900000, N'Vans/48-vans-old-skool-classic-true-white-vn000d3hw00-1.', 3, 8, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (268, 48, N'VANS CANVAS OLD SKOOL CLASSIC TRUE WHITE', 1900000, N'Vans/48-vans-old-skool-classic-true-white-vn000d3hw00-1.', 4, 5, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (269, 48, N'VANS CANVAS OLD SKOOL CLASSIC TRUE WHITE', 1900000, N'Vans/48-vans-old-skool-classic-true-white-vn000d3hw00-1.', 5, 5, 3)
INSERT [dbo].[Product] ([id], [idModelSneaker], [name], [unitPrice], [img], [idSize], [quantity], [idStatus]) VALUES (270, 48, N'VANS CANVAS OLD SKOOL CLASSIC TRUE WHITE', 1900000, N'Vans/48-vans-old-skool-classic-true-white-vn000d3hw00-1.', 6, 2, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
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
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (15, N'STATUS_MODEL', 1, N'New ')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (16, N'STATUS_MODEL', 2, N'Landing Page ')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (17, N'STATUS_MODEL', 3, N'Normal')
INSERT [dbo].[Status] ([id], [key], [value], [name]) VALUES (18, N'STATUS_MODEL', 4, N'stop sell')
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
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AccountDetail] FOREIGN KEY([idAccountDetail])
REFERENCES [dbo].[AccountDetail] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AccountDetail]
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
