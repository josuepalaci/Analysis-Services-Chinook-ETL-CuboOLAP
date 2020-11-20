USE [master]
GO
/****** Object:  Database [DW_chinook]    Script Date: 19/11/2020 11:07:24 ******/
CREATE DATABASE [DW_chinook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DW_chinook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DW_chinook.mdf' , SIZE = 89088KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DW_chinook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DW_chinook_log.ldf' , SIZE = 1475904KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DW_chinook] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DW_chinook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DW_chinook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DW_chinook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DW_chinook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DW_chinook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DW_chinook] SET ARITHABORT OFF 
GO
ALTER DATABASE [DW_chinook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DW_chinook] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DW_chinook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DW_chinook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DW_chinook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DW_chinook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DW_chinook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DW_chinook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DW_chinook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DW_chinook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DW_chinook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DW_chinook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DW_chinook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DW_chinook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DW_chinook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DW_chinook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DW_chinook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DW_chinook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DW_chinook] SET RECOVERY FULL 
GO
ALTER DATABASE [DW_chinook] SET  MULTI_USER 
GO
ALTER DATABASE [DW_chinook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DW_chinook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DW_chinook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DW_chinook] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DW_chinook]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 19/11/2020 11:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[id_customer] [int] NOT NULL,
	[firstName] [nvarchar](40) NOT NULL,
	[lastName] [nvarchar](20) NOT NULL,
	[adress] [nvarchar](70) NULL,
	[state] [nvarchar](40) NULL,
	[city] [nvarchar](40) NULL,
	[country] [nvarchar](40) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id_customer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimDateInvoice]    Script Date: 19/11/2020 11:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDateInvoice](
	[id_date] [int] NOT NULL,
	[year] [int] NOT NULL,
	[quarter] [int] NOT NULL,
	[monthNumber] [int] NOT NULL,
	[monthName] [nvarchar](50) NOT NULL,
	[weekNumber] [int] NOT NULL,
	[weekdayName] [nvarchar](50) NOT NULL,
	[dayNumber] [int] NOT NULL,
 CONSTRAINT [PK_Date] PRIMARY KEY CLUSTERED 
(
	[id_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimInvoice]    Script Date: 19/11/2020 11:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimInvoice](
	[id_invoice] [int] NOT NULL,
	[BillingAddress] [nvarchar](70) NULL,
	[BillingCity] [nvarchar](40) NULL,
	[BillingState] [nvarchar](40) NULL,
	[BillingCountry] [nvarchar](40) NULL,
	[total] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[id_invoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimTrack]    Script Date: 19/11/2020 11:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTrack](
	[id_track] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[album] [nvarchar](160) NULL,
	[genero] [nvarchar](120) NULL,
	[artist] [nvarchar](120) NULL,
	[composer] [nvarchar](220) NULL,
	[unitePrice] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED 
(
	[id_track] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactInvoice]    Script Date: 19/11/2020 11:07:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactInvoice](
	[id_invoice_line] [int] NOT NULL,
	[dateId] [int] NOT NULL,
	[customerId] [int] NOT NULL,
	[invoiceId] [int] NOT NULL,
	[trackId] [int] NOT NULL,
	[unit_price] [numeric](10, 2) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[id_invoice_line] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FactInvoice]  WITH CHECK ADD  CONSTRAINT [FK_FactInvoice_DimTrack] FOREIGN KEY([trackId])
REFERENCES [dbo].[DimTrack] ([id_track])
GO
ALTER TABLE [dbo].[FactInvoice] CHECK CONSTRAINT [FK_FactInvoice_DimTrack]
GO
ALTER TABLE [dbo].[FactInvoice]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customer] FOREIGN KEY([customerId])
REFERENCES [dbo].[DimCustomer] ([id_customer])
GO
ALTER TABLE [dbo].[FactInvoice] CHECK CONSTRAINT [FK_Sales_Customer]
GO
ALTER TABLE [dbo].[FactInvoice]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Date] FOREIGN KEY([dateId])
REFERENCES [dbo].[DimDateInvoice] ([id_date])
GO
ALTER TABLE [dbo].[FactInvoice] CHECK CONSTRAINT [FK_Sales_Date]
GO
ALTER TABLE [dbo].[FactInvoice]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Invoice] FOREIGN KEY([invoiceId])
REFERENCES [dbo].[DimInvoice] ([id_invoice])
GO
ALTER TABLE [dbo].[FactInvoice] CHECK CONSTRAINT [FK_Sales_Invoice]
GO
USE [master]
GO
ALTER DATABASE [DW_chinook] SET  READ_WRITE 
GO
