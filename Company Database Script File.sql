USE [master]
GO
/****** Object:  Database [Company Database]    Script Date: 27-Jul-19 6:48:00 PM ******/
CREATE DATABASE [Company Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Company Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Company Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Company Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Company Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Company Database] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Company Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Company Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Company Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Company Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Company Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Company Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Company Database] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Company Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Company Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Company Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Company Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Company Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Company Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Company Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Company Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Company Database] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Company Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Company Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Company Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Company Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Company Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Company Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Company Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Company Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Company Database] SET  MULTI_USER 
GO
ALTER DATABASE [Company Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Company Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Company Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Company Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Company Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Company Database] SET QUERY_STORE = OFF
GO
USE [Company Database]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27-Jul-19 6:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 27-Jul-19 6:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[company_name] [nvarchar](50) NOT NULL,
	[category] [nvarchar](50) NOT NULL,
	[founder] [nvarchar](50) NOT NULL,
	[co_founder] [nvarchar](50) NULL,
	[founded] [smallint] NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[networth_busd] [smallint] NOT NULL,
	[stock] [nvarchar](50) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[company_name] ASC,
	[category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryLog]    Script Date: 27-Jul-19 6:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryLog](
	[country] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CountryLog] PRIMARY KEY CLUSTERED 
(
	[country] ASC,
	[city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoundedBy]    Script Date: 27-Jul-19 6:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoundedBy](
	[founder] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[networth_busd] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 27-Jul-19 6:48:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[service_type] [nvarchar](50) NOT NULL,
	[company_name] [nvarchar](50) NOT NULL,
	[services_type_2] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([category]) VALUES (N'Conglomerate')
INSERT [dbo].[Category] ([category]) VALUES (N'Game Development')
INSERT [dbo].[Category] ([category]) VALUES (N'Investment')
INSERT [dbo].[Category] ([category]) VALUES (N'Medical')
INSERT [dbo].[Category] ([category]) VALUES (N'Oil & Gas')
INSERT [dbo].[Category] ([category]) VALUES (N'Social Networking')
INSERT [dbo].[Category] ([category]) VALUES (N'Technology')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Activision Blizzard', N'Game Development', N'Robert A Kotick', NULL, 2008, N'United States', N'California', 37, N'47.99/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'AIRBUS', N'Technology', N'Roger B�teille', NULL, 1998, N'Netherlands', N'Leiden', 105, N'131.00/EUR')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Alibaba', N'Conglomerate', N'Jack Ma', N'Joseph C. Tsai', 1999, N'China', N'Hangzhou', 352, N'178.74/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Alphabet', N'Conglomerate', N'Larry Page', N'Sergey Brin', 2015, N'United States', N'California', 739, N'1245.22/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Amazon.com', N'Technology', N'Jeff Bezos', NULL, 1994, N'United States', N'Washington', 120, N'1943.05/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Apple', N'Technology', N'Steve Jobs', N'Ronald Wayne', 1976, N'United States', N'California', 1000, N'207.74/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'AT&T', N'Technology', N'Bell Telephone Company', NULL, 1983, N'United States', N'Texas', 233, N'34.15/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Bank of America', N'Investment', N'Amadeo Giannini', NULL, 1998, N'United States', N'North Carolina', 401, N'30.77/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Berkshire Hathaway', N'Conglomerate', N'Oliver Chace', NULL, 1839, N'United States', N'Massaschusetts', 620, N'315000/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'BMW Group', N'Technology', N'Karl Rapp', N'Franz Josef Popp', 1916, N'Germany', N'Munich', 58, N'68.67/EUR')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'BNP Paribas', N'Investment', N'Banque Nationale de Paris (BNP)', N'Paribas', 1848, N'France', N'Paris', 69, N'42.94/EUR')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Boeing', N'Conglomerate', N'William Boeing', NULL, 1916, N'United States', N'Chicago', 215, N'345.00/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'BP', N'Oil & Gas', N'William Knox D''Arcy', NULL, 1909, N'United Kingdom', N'England', 150, N'38.98/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Daimler', N'Technology', N'Gottlieb Daimler', NULL, 1886, N'Germany', N'Stuttgart', 71, N'48.38/EUR')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Electronic Arts', N'Game Development', N'Trip Hawkins', NULL, 1982, N'United States', N'California', 5, N'89.51/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Enel', N'Technology', N'Antonio Segni', NULL, 1962, N'Italy', N'Rome', 63, N'6.21/EUR')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'ExxonMobil', N'Oil & Gas', N'John D Rockefeller', NULL, 1999, N'United States', N'Texas', 279, N'74.81/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Facebook', N'Social Networking', N'Mark Zuckerberg', N'Andrew McCollum', 2004, N'United States', N'Massaschusetts', 62, N'199.75/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Gazprom', N'Oil & Gas', N'Viktor Chernomyrdin', NULL, 1989, N'Russia', N'Moscow', 60, N'234.23/RUB')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Goldman Sachs Group', N'Investment', N'Viktor Chernomyrdin', N'Samuel Sachs', 1869, N'United States', N'New York', 76, N'222.14/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Google', N'Technology', N'Larry Page', N'Sergey Brin', 1998, N'United States', N'California', 279, N'1245.22/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'HSBC Holdings', N'Investment', N'Thomas Sutherland', NULL, 1865, N'United Kingdom', N'England', 176, N'662.40/GBX')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'IBM', N'Technology', N'Charles Ranlett Flint', NULL, 1911, N'United States', N'New York', 125, N'151.36/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Intel', N'Technology', N'Gordon Moore', N'Robert Noyce', 1968, N'United States', N'California', 200, N'51.59/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Johnson & Johnson', N'Medical', N'James Wood Johnson', N'Edward Mead Johnson', 1886, N'United States', N'New Jersey', 360, N'130.73/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'JPMorgan Chase', N'Investment', N'J P Morgan', NULL, 2000, N'United States', N'New York', 256, N'116.22/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'MetLife', N'Investment', N'William P Stewart', NULL, 1868, N'United States', N'New York', 44, N'50.69/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Nintendo', N'Game Development', N'Fusajiro Yamauchi', NULL, 1889, N'Japan', N'Kyoto', 38, N'40220/JPY')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'PepsiCo', N'Conglomerate', N'Caleb Bradham', NULL, 1965, N'United States', N'New York', 178, N'131.22/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'PetroChina', N'Oil & Gas', N'Joint Stock Company', NULL, 1999, N'China', N'Beijing', 1000, N'6.54/CNY')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Procter & Gamble', N'Conglomerate', N'James Gamble', N'William Procter', 1837, N'United States', N'Ohio', 265, N'114.73/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'RBC', N'Investment', N'David I. McKay', NULL, 1864, N'Canada', N'Toronto', 115, N'104.77/CAD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Reliance Industries', N'Oil & Gas', N'Dhirubhai Ambani', NULL, 1966, N'India', N'Mumbai', 126, N'1217.00/INR')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Rockstar Games', N'Game Development', N'Sam Houser', N'Dan Houser', 1998, N'United States', N'New York', 3, N'45.5/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Royal Dutch Shell', N'Oil & Gas', N'Marcus Samuel', N'Samuel Samuel', 1911, N'Netherlands', N'Hague', 265, N'28.38/EUR')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Samsung Electronics', N'Conglomerate', N'Lee Byung-chul', NULL, 1969, N'South Korea', N'Suwonsi', 326, N'47150/KRW')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Samsung Electronics', N'Technology', N'Lee Byung-chul', NULL, 1969, N'South Korea', N'Suwon', 272, N'47150/KRW')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Santander', N'Investment', N'Ana Patricia Botin', N'Antonio Alvarez', 2013, N'Spain', N'Madrid', 84, N'4.06/EUR')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Siemens', N'Conglomerate', N'Werner von Siemens', N'Johann Georg Halske', 1847, N'Germany', N'Munich', 97, N'1184.70/INR')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Sony Computer Entertainment', N'Game Development', N'Ken Kutaragi', N'Norio Ohga', 1993, N'Japan', N'Tokyo', 38, N'61.02/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Tencent Holdings', N'Investment', N'Ma Huateng', N'Zhang Zhidong', 1998, N'China', N'Shenzhen', 511, N'370.20/HKD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Toyota Motor', N'Technology', N'Kiichiro Toyoda', NULL, 1937, N'Japan', N'Toyota', 176, N'7151/JPY')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Twitter', N'Social Networking', N'Jack Dorsey', N'Noah Glass', 2006, N'United States', N'California', 5, N'51.59/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Ubisoft', N'Game Development', N'Guillemot Family', NULL, 1986, N'France', N'Carentoir', 4, N'75.90/EUR')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'UnitedHealth Group', N'Medical', N'Richard T Burke', NULL, 1977, N'United States', N'Minnesota', 213, N'252.94/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Valve Corporation', N'Game Development', N'Gabe Newell', N'Mike Harrington', 1996, N'United States', N'Washington', 3, NULL)
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Verizon Communications', N'Technology', N'Charles Lee', N'Ivan Seidenberg', 1995, N'United States', N'New Jersey', 239, N'57.08/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Volkswagen Group', N'Technology', N'German Labour Front', NULL, 1937, N'Germany', N'Wolfsburg', 92, N'155.26/EUR')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Walmart', N'Conglomerate', N'Sam Walton', NULL, 1962, N'United States', N'Arkansas', 296, N'113.02/USD')
INSERT [dbo].[Companies] ([company_name], [category], [founder], [co_founder], [founded], [country], [city], [networth_busd], [stock]) VALUES (N'Walt Disney', N'Conglomerate', N'Walter Elias Disney', NULL, 1923, N'United States', N'California', 238, N'144.65/USD')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'Canada', N'Toronto')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'China', N'Beijing')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'China', N'Hangzhou')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'China', N'Shenzhen')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'France', N'Carentoir')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'France', N'Paris')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'Germany', N'Munich')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'Germany', N'Stuttgart')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'Germany', N'Wolfsburg')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'India', N'Mumbai')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'Italy', N'Rome')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'Japan', N'Kyoto')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'Japan', N'Tokyo')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'Netherlands', N'Hague')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'Netherlands', N'Leiden')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'Russia', N'Moscow')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'South Korea', N'Suwon')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'Spain', N'Madrid')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United Kingdom', N'England')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United States', N'Arkansas')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United States', N'California')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United States', N'Chicago')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United States', N'Massaschusetts')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United States', N'Minnesota')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United States', N'New Jersey')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United States', N'New York')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United States', N'North Carolina')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United States', N'Ohio')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United States', N'Texas')
INSERT [dbo].[CountryLog] ([country], [city]) VALUES (N'United States', N'Washington')
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Mark Zuckerberg', N'United States', N'Massaschusetts', 62)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Jeff Bezos', N'United States', N'Washington', 120)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Larry Page', N'United States', N'California', 279)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Steve Jobs', N'United States', N'California', 1000)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Jack Ma', N'China', N'Hangzhou', 352)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Ma Huateng', N'China', N'Shenzhen', 511)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Oliver Chace', N'United States', N'Massaschusetts', 620)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'J P Morgan', N'United States', N'New York', 256)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'John D Rockefeller', N'United States', N'Texas', 279)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'James Wood Johnson', N'United States', N'New Jersey', 360)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Lee Byung-chul', N'South Korea', N'Suwonsi', 326)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Amadeo Giannini', N'United States', N'North Carolina', 401)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Gordon Moore', N'United States', N'California', 200)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Jack Dorsey', N'United States', N'California', 5)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Joint Stock Company', N'China', N'Beijing', 1000)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Fusajiro Yamauchi', N'Japan', N'Kyoto', 38)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Gabe Newell', N'United States', N'Washington', 3)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Sam Houser', N'United States', N'New York', 3)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Trip Hawkins', N'United States', N'California', 5)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Robert A Kotick', N'United States', N'California', 37)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Ken Kutaragi', N'Japan', N'Tokyo', 38)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Guillemot Family', N'France', N'Carentoir', 4)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Marcus Samuel', N'Netherlands', N'Hague', 265)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Lee Byung-chul', N'South Korea', N'Suwon', 272)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Kiichiro Toyoda', N'Japan', N'Toyota', 176)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'German Labour Front', N'Germany', N'Wolfsburg', 92)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Bell Telephone Company', N'United States', N'Texas', 233)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Charles Lee', N'United States', N'New Jersey', 239)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Thomas Sutherland', N'United Kingdom', N'England', 176)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Sam Walton', N'United States', N'Arkansas', 296)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'William Knox D''Arcy', N'United Kingdom', N'England', 150)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Ana Patricia Botin', N'Spain', N'Madrid', 84)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Richard T Burke', N'United States', N'Minnesota', 213)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Banque Nationale de Paris (BNP)', N'France', N'Paris', 69)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Gottlieb Daimler', N'Germany', N'Stuttgart', 71)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Viktor Chernomyrdin', N'Russia', N'Moscow', 60)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'David I. McKay', N'Canada', N'Toronto', 115)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'William Boeing', N'United States', N'Chicago', 215)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Viktor Chernomyrdin', N'United States', N'New York', 76)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'James Gamble', N'United States', N'Ohio', 265)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Karl Rapp', N'Germany', N'Munich', 58)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Charles Ranlett Flint', N'United States', N'New York', 125)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Walter Elias Disney', N'United States', N'California', 238)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Werner von Siemens', N'Germany', N'Munich', 97)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Dhirubhai Ambani', N'India', N'Mumbai', 126)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Antonio Segni', N'Italy', N'Rome', 63)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Caleb Bradham', N'United States', N'New York', 178)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'William P Stewart', N'United States', N'New York', 44)
INSERT [dbo].[FoundedBy] ([founder], [country], [city], [networth_busd]) VALUES (N'Roger Beteille', N'Netherlands', N'Leiden', 105)
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Social Networking', N'Facebook', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'Amazon.com', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'Google', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Conglomerate', N'Alphabet', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'Apple', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Conglomerate', N'Alibaba', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Investment', N'Tencent Holdings', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Conglomerate', N'Berkshire Hathaway', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Investment', N'JPMorgan Chase', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Oil & Gas', N'ExxonMobil', N'Local')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Medical', N'Johnson & Johnson', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Conglomerate', N'Samsung Electronics', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Investment', N'Bank of America', N'Local')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'Intel', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Social Networking', N'Twitter', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Oil & Gas', N'PetroChina', N'Local')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Game Development', N'Nintendo', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Game Development', N'Valve Corporation', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Game Development', N'Rockstar Games', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Game Development', N'Electronic Arts', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Game Development', N'Activision Blizzard', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Game Development', N'Sony Computer Entertainment', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Game Development', N'Ubisoft', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Oil & Gas', N'Royal Dutch Shell', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'Samsung Electronics', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'Toyota Motor', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'Volkswagen Group', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'AT&T', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'Verizon Communications', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Investment', N'HSBC Holdings', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Conglomerate', N'Walmart', N'Local')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Oil & Gas', N'BP', N'Local')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Investment', N'Santander', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Medical', N'UnitedHealth Group', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Investment', N'BNP Paribas', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'Daimler', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Oil & Gas', N'Gazprom', N'Local')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Investment', N'RBC', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Conglomerate', N'Boeing', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Investment', N'Goldman Sachs Group', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Conglomerate', N'Procter & Gamble', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'BMW Group', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'IBM', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Conglomerate', N'Walt Disney', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Conglomerate', N'Siemens', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Oil & Gas', N'Reliance Industries', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'Enel', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Conglomerate', N'PepsiCo', N'International')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Investment', N'MetLife', N'Multinational')
INSERT [dbo].[Services] ([service_type], [company_name], [services_type_2]) VALUES (N'Technology', N'AIRBUS', N'Multinational')
USE [master]
GO
ALTER DATABASE [Company Database] SET  READ_WRITE 
GO
