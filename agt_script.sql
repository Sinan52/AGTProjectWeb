USE [master]
GO
/****** Object:  Database [Agt_Project_DB]    Script Date: 25.6.2020 18:09:04 ******/
CREATE DATABASE [Agt_Project_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Agt_Project_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Agt_Project_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Agt_Project_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Agt_Project_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Agt_Project_DB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Agt_Project_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Agt_Project_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Agt_Project_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Agt_Project_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Agt_Project_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Agt_Project_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Agt_Project_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Agt_Project_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Agt_Project_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Agt_Project_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Agt_Project_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Agt_Project_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Agt_Project_DB] SET QUERY_STORE = OFF
GO
USE [Agt_Project_DB]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 25.6.2020 18:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Number] [bigint] NULL,
	[Mail] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[IS_ACTIVE] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 25.6.2020 18:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 25.6.2020 18:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[CustomerId] [int] NULL,
	[StatusId] [int] NULL,
	[IS_PAYMENT] [bit] NULL,
	[IS_DELIVERY] [bit] NULL,
	[OrderDate] [datetime] NULL,
	[OrderPrice] [money] NULL,
	[Order_KDV_Price] [money] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 25.6.2020 18:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[Price] [money] NULL,
	[Details] [nvarchar](max) NULL,
	[KDV_Rate] [int] NULL,
	[IS_KDV] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (1, N'Şennur', N'Ağnar', 5069745135, N'sennuragnar@hotmail.com', N'sennuragnar123', N'Üsküdar/İstanbul', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (2, N'Süheyl', N'Esvap', 5365651874, N'suheylesvap@hotmail.com', N'suheylesvap123', N'Kadıköy/İstanbul', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (3, N'Hanife', N'Önen', 5441231684, N'hanifeonen@hotmail.com', N'hanifeonen123', N'Ümraniye/İstanbul', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (4, N'Onur', N'Kına', 5552681369, N'onurkina@hotmail.com', N'onurkina123', N'Ataşehir/İstanbul', 0)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (5, N'Lokman ', N'Kırbıyık', 5443674269, N'lokmankirbiyik@hotmail.com', N'lokman12345', N'Şişli/İstanbul', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (6, N'Mehmet', N'Özkol', 5364128752, N'mehmetozkol@hotmail.com', N'mehmetozkol123', N'Beşiktaş/İstanbul', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (7, N'Aybüke', N'Turna', 5073695472, N'aybuketurna@hotmail.com', N'aybuketurna123', N'Çekmeköy/İstanbul', 0)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (8, N'Mert', N'Kırgız', 5563216784, N'mertkirgiz@hotmail.com', N'mertkirgiz123', N'Sarıyer/İstanbul', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (9, N'Bahar', N'Purçu', 5547452361, N'baharpurcu@hotmail.com', N'baharpurcu123', N'Bornova/İzmir', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (10, N'Dilara ', N'Hiçyılmam', 5696153673, N'dilarahicyilmam@hotmail.com', N'dilara12345', N'Bergama/İzmir', 0)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (11, N'Günan', N'Güral', 5562573688, N'gunangural@hotmail.com', N'gunangural123', N'Çeşme/İzmir', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (12, N'Esengül', N'Sarıteke', 5781234564, N'esengulsariteke@hotmail.com', N'esengul12345', N'Selçuk/İzmir', 0)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (13, N'Selcen', N'Çağan', 5462357951, N'selcencagan@hotmail.com', N'selcencagan123', N'Bodrum/Muğla', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (14, N'Ömer', N'Pamukçu', 5551236547, N'omerpamukcu@hotmail.com', N'pamukcuomer123', N'Marmaris/Muğla', 0)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (15, N'Çağatay', N'Sabah', 5537521698, N'cagataysabah@hotmail.com', N'cagataysabah123', N'Ortaca/Muğla', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (16, N'Özer', N'Ciddi', 5658513544, N'ozerciddi@hotmail.com', N'ozerciddi123', N'Fethiye/Muğla', 0)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (17, N'Şehmus', N'Mursal', 5466541255, N'sehmusmursal@hotmail.com', N'sehmus123', N'Sican/Ankara', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (18, N'Muktedir', N'Kılınçarslan', 5554128654, N'muhtedir@hotmail.com', N'muhtedir123', N'Mamak/Ankara', 0)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (19, N'Muhammed', N'Toslu', 5471234586, N'muhammedtoslu@hotmail.com', N'mtoslu123', N'Ünye/Ordu', 1)
INSERT [dbo].[Customers] ([CustomerId], [Name], [Surname], [Number], [Mail], [Password], [Address], [IS_ACTIVE]) VALUES (20, N'Gülçe', N'Kıvılcım', 5562546399, N'gulcekivilcim@hotmail.com', N'gkivilcim123', N'Fatsa/Ordu', 1)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Order_Status] ON 

INSERT [dbo].[Order_Status] ([StatusId], [StatusName]) VALUES (1, N'Ödeme Bekliyor')
INSERT [dbo].[Order_Status] ([StatusId], [StatusName]) VALUES (2, N'Onay Bekliyor')
INSERT [dbo].[Order_Status] ([StatusId], [StatusName]) VALUES (3, N'Hazırlanıyor')
INSERT [dbo].[Order_Status] ([StatusId], [StatusName]) VALUES (4, N'Kargoya Verildi')
INSERT [dbo].[Order_Status] ([StatusId], [StatusName]) VALUES (5, N'Tamamlandı')
INSERT [dbo].[Order_Status] ([StatusId], [StatusName]) VALUES (6, N'İptal Edildi')
SET IDENTITY_INSERT [dbo].[Order_Status] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (1, 1, 1, 5, 1, 1, CAST(N'2020-01-01T10:00:00.000' AS DateTime), 2000.0000, 2360.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (2, 1, 2, 5, 1, 1, CAST(N'2020-01-04T11:00:00.000' AS DateTime), 2000.0000, 2360.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (3, 1, 3, 6, 0, 0, CAST(N'2020-01-13T14:00:00.000' AS DateTime), 2000.0000, 2360.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (4, 2, 1, 5, 1, 1, CAST(N'2020-01-14T15:00:00.000' AS DateTime), 52.0000, 52.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (5, 2, 14, 6, 0, 0, CAST(N'2020-01-14T11:30:00.000' AS DateTime), 52.0000, 52.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (6, 3, 7, 5, 1, 1, CAST(N'2020-01-20T16:30:00.000' AS DateTime), 100.0000, 118.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (7, 4, 6, 5, 1, 1, CAST(N'2020-02-01T19:30:00.000' AS DateTime), 50.0000, 59.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (8, 4, 11, 5, 1, 1, CAST(N'2020-02-02T18:45:00.000' AS DateTime), 50.0000, 59.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (9, 5, 8, 6, 0, 0, CAST(N'2020-02-10T13:15:00.000' AS DateTime), 34.9500, 34.9500)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (10, 6, 13, 5, 1, 1, CAST(N'2020-02-21T12:20:00.000' AS DateTime), 552.0000, 552.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (11, 7, 4, 5, 1, 1, CAST(N'2020-03-15T10:10:00.000' AS DateTime), 119.5000, 119.5000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (12, 8, 9, 5, 1, 1, CAST(N'2020-03-26T13:10:00.000' AS DateTime), 169.4500, 169.4500)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (13, 8, 10, 6, 0, 0, CAST(N'2020-04-01T13:10:00.000' AS DateTime), 169.4500, 169.4500)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (14, 10, 12, 6, 1, 0, CAST(N'2020-05-01T14:10:00.000' AS DateTime), 76.7500, 76.7500)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (15, 12, 15, 5, 1, 1, CAST(N'2020-05-02T14:10:00.000' AS DateTime), 119.0000, 119.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (16, 1, 1, 6, 1, 0, CAST(N'2020-06-01T14:10:00.000' AS DateTime), 2000.0000, 2360.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (17, 2, 20, 3, 1, 0, CAST(N'2020-06-02T10:00:00.000' AS DateTime), 52.0000, 52.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (18, 3, 19, 4, 1, 1, CAST(N'2020-06-04T23:00:00.000' AS DateTime), 100.0000, 118.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (19, 5, 17, 4, 1, 1, CAST(N'2020-06-06T21:00:00.000' AS DateTime), 34.9500, 34.9500)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (20, 6, 16, 5, 1, 1, CAST(N'2020-06-10T17:15:00.000' AS DateTime), 552.0000, 552.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (21, 12, 15, 6, 0, 0, CAST(N'2020-06-11T15:15:00.000' AS DateTime), 119.0000, 119.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (22, 11, 9, 5, 1, 1, CAST(N'2020-06-15T16:30:00.000' AS DateTime), 149.0000, 149.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (23, 7, 11, 1, 0, 0, CAST(N'2020-06-16T13:30:00.000' AS DateTime), 119.5000, 119.5000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (24, 2, 14, 2, 1, 0, CAST(N'2020-06-18T14:10:00.000' AS DateTime), 52.0000, 52.0000)
INSERT [dbo].[Orders] ([OrderId], [ProductId], [CustomerId], [StatusId], [IS_PAYMENT], [IS_DELIVERY], [OrderDate], [OrderPrice], [Order_KDV_Price]) VALUES (25, 4, 12, 2, 0, 0, CAST(N'2020-06-20T19:00:00.000' AS DateTime), 59.0000, 59.0000)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (1, N'Televizyon', 2360.0000, N'Smart Led TV', 18, 1, CAST(N'2020-01-01T10:30:00.000' AS DateTime), CAST(N'2020-01-01T10:30:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (2, N'Kulaklık', 52.0000, N'Bluetooth Kulaklık', 18, 0, CAST(N'2020-01-02T12:00:00.000' AS DateTime), CAST(N'2020-01-02T12:15:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (3, N'Saat', 118.0000, N'Spor Saat', 18, 1, CAST(N'2020-02-10T13:45:00.000' AS DateTime), CAST(N'2020-02-10T13:45:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (4, N'Powerbank', 59.0000, N'5000mAh', 18, 1, CAST(N'2020-02-21T14:20:00.000' AS DateTime), CAST(N'2020-02-22T14:25:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (5, N'USB Bellek', 34.9500, N'36 GB', 18, 0, CAST(N'2020-03-09T16:33:00.000' AS DateTime), CAST(N'2020-03-09T16:36:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (6, N'Buzdolabı', 552.0000, N'A++ Beyaz Eşya', 8, 1, CAST(N'2020-03-16T15:57:00.000' AS DateTime), CAST(N'2020-03-16T15:57:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (7, N'Çelik Çaydanlık', 119.5000, N'Paslanmaz Çelik', 8, 0, CAST(N'2020-04-25T09:10:00.000' AS DateTime), CAST(N'2020-04-26T09:12:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (8, N'Mini Fırın', 169.4500, N'Ekmek Pişirme Özellikli', 8, 1, CAST(N'2020-04-30T10:36:00.000' AS DateTime), CAST(N'2020-04-30T10:39:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (9, N'Vantilatör', 89.9900, N'3 Farklı Hız Seçeneği', 18, 1, CAST(N'2020-05-08T11:43:00.000' AS DateTime), CAST(N'2020-05-08T11:50:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (10, N'Kettle', 76.7500, N'Led Aydınlatmalı', 8, 0, CAST(N'2020-05-14T13:30:00.000' AS DateTime), CAST(N'2020-05-14T13:30:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (11, N'Blender Seti', 149.0000, N'Çift Kademeli Hız Sistemi', 8, 1, CAST(N'2020-06-04T14:38:00.000' AS DateTime), CAST(N'2020-06-05T14:30:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [Details], [KDV_Rate], [IS_KDV], [CreateDate], [UpdateDate]) VALUES (12, N'Ayak Masaj Aleti', 119.0000, N'3 Farklı Fonksiyon', 18, 1, CAST(N'2020-06-11T17:00:00.000' AS DateTime), CAST(N'2020-06-11T17:05:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Order_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Order_Status] ([StatusId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Order_Status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllOrders]    Script Date: 25.6.2020 18:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllOrders]
AS
SELECT
	O.OrderId,
	P.ProductName,
	C.Name +' ' + C.Surname CustomerName,
	OS.StatusName,
	O.IS_PAYMENT,
	O.IS_DELIVERY,
	O.OrderDate,
	O.Order_KDV_Price
FROM Agt_Project_DB.dbo.Orders O
LEFT JOIN Products P ON P.ProductId = O.ProductId
LEFT JOIN Customers C ON C.CustomerId = O.CustomerId
LEFT JOIN Order_Status OS ON OS.StatusId = O.StatusId
GO
/****** Object:  StoredProcedure [dbo].[SelectByActiveCustomersOrders]    Script Date: 25.6.2020 18:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectByActiveCustomersOrders]
AS
SELECT
	O.OrderId,
	P.ProductName,
	C.Name +' ' + C.Surname CustomerName,
	C.IS_ACTIVE,
	OS.StatusName,
	O.IS_PAYMENT,
	O.IS_DELIVERY,
	O.OrderDate,
	O.Order_KDV_Price
FROM Agt_Project_DB.dbo.Orders O
LEFT JOIN Products P ON P.ProductId = O.ProductId
LEFT JOIN Customers C ON C.CustomerId = O.CustomerId
LEFT JOIN Order_Status OS ON OS.StatusId = O.StatusId
WHERE C.IS_ACTIVE = 1 AND O.OrderId IS NOT NULL
GO
/****** Object:  StoredProcedure [dbo].[SelectByBestSellingProduct]    Script Date: 25.6.2020 18:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectByBestSellingProduct]
AS
SELECT P.ProductId,P.ProductName,COUNT(P.ProductId) TOTAL FROM Agt_Project_DB.dbo.Products P
LEFT JOIN Orders O ON O.ProductId = P.ProductId
GROUP BY P.ProductName,P.ProductId,O.IS_DELIVERY
HAVING O.IS_DELIVERY= 1
ORDER BY TOTAL DESC,ProductId
GO
/****** Object:  StoredProcedure [dbo].[SelectByOrderDate]    Script Date: 25.6.2020 18:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectByOrderDate] @Date1 datetime, @Date2 datetime
AS
SELECT
	O.OrderId,
	P.ProductName,
	C.Name +' ' + C.Surname CustomerName,
	OS.StatusName,
	O.IS_PAYMENT,
	O.IS_DELIVERY,
	O.OrderDate,
	O.Order_KDV_Price
FROM Agt_Project_DB.dbo.Orders O
LEFT JOIN Products P ON P.ProductId = O.ProductId
LEFT JOIN Customers C ON C.CustomerId = O.CustomerId
LEFT JOIN Order_Status OS ON OS.StatusId = O.StatusId
WHERE OrderDate BETWEEN @Date1 AND @Date2
GO
/****** Object:  StoredProcedure [dbo].[SelectByOrderPrice]    Script Date: 25.6.2020 18:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectByOrderPrice] @Price1 money, @Price2 money
AS
SELECT
	O.OrderId,
	P.ProductName,
	C.Name +' ' + C.Surname CustomerName,
	OS.StatusName,
	O.IS_PAYMENT,
	O.IS_DELIVERY,
	O.OrderDate,
	O.Order_KDV_Price
FROM Agt_Project_DB.dbo.Orders O
LEFT JOIN Products P ON P.ProductId = O.ProductId
LEFT JOIN Customers C ON C.CustomerId = O.CustomerId
LEFT JOIN Order_Status OS ON OS.StatusId = O.StatusId
WHERE O.Order_KDV_Price BETWEEN @Price1 AND @Price2
GO
/****** Object:  StoredProcedure [dbo].[SelectByPassiveCustomersOrders]    Script Date: 25.6.2020 18:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectByPassiveCustomersOrders]
AS
SELECT
	O.OrderId,
	P.ProductName,
	C.Name +' ' + C.Surname CustomerName,
	C.IS_ACTIVE,
	OS.StatusName,
	O.IS_PAYMENT,
	O.IS_DELIVERY,
	O.OrderDate,
	O.Order_KDV_Price
FROM Agt_Project_DB.dbo.Orders O
LEFT JOIN Products P ON P.ProductId = O.ProductId
LEFT JOIN Customers C ON C.CustomerId = O.CustomerId
LEFT JOIN Order_Status OS ON OS.StatusId = O.StatusId
WHERE C.IS_ACTIVE = 0 AND O.OrderId IS NOT NULL
GO
/****** Object:  StoredProcedure [dbo].[SelectByUnSoldProduct]    Script Date: 25.6.2020 18:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectByUnSoldProduct]
AS
SELECT P.ProductId,P.ProductName FROM Agt_Project_DB.dbo.Products P
LEFT JOIN Orders O ON O.ProductId = P.ProductId
WHERE P.ProductId NOT IN (SELECT ProductId FROM Orders WHERE IS_DELIVERY = 1)
GO
USE [master]
GO
ALTER DATABASE [Agt_Project_DB] SET  READ_WRITE 
GO
