USE [master]
GO
/****** Object:  Database [TurizmAcentası]    Script Date: 23.12.2024 21:39:34 ******/
CREATE DATABASE [TurizmAcentası]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TurizmAcentası', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TurizmAcentası.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TurizmAcentası_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TurizmAcentası_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TurizmAcentası] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TurizmAcentası].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TurizmAcentası] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TurizmAcentası] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TurizmAcentası] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TurizmAcentası] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TurizmAcentası] SET ARITHABORT OFF 
GO
ALTER DATABASE [TurizmAcentası] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TurizmAcentası] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TurizmAcentası] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TurizmAcentası] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TurizmAcentası] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TurizmAcentası] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TurizmAcentası] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TurizmAcentası] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TurizmAcentası] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TurizmAcentası] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TurizmAcentası] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TurizmAcentası] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TurizmAcentası] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TurizmAcentası] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TurizmAcentası] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TurizmAcentası] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TurizmAcentası] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TurizmAcentası] SET RECOVERY FULL 
GO
ALTER DATABASE [TurizmAcentası] SET  MULTI_USER 
GO
ALTER DATABASE [TurizmAcentası] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TurizmAcentası] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TurizmAcentası] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TurizmAcentası] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TurizmAcentası] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TurizmAcentası] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TurizmAcentası', N'ON'
GO
ALTER DATABASE [TurizmAcentası] SET QUERY_STORE = ON
GO
ALTER DATABASE [TurizmAcentası] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TurizmAcentası]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 23.12.2024 21:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Address] [text] NULL,
	[PassportOrID] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 23.12.2024 21:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[Salary] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 23.12.2024 21:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[Subject] [varchar](100) NULL,
	[Message] [text] NULL,
	[FeedbackDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 23.12.2024 21:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[HotelID] [int] IDENTITY(1,1) NOT NULL,
	[HotelName] [varchar](100) NULL,
	[Location] [varchar](100) NULL,
	[StarRating] [int] NULL,
	[Capacity] [int] NULL,
	[Phone] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourPackages]    Script Date: 23.12.2024 21:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourPackages](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[TourID] [int] NULL,
	[PackageName] [varchar](100) NULL,
	[Price] [decimal](10, 2) NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tours]    Script Date: 23.12.2024 21:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tours](
	[TourID] [int] IDENTITY(1,1) NOT NULL,
	[TourName] [varchar](100) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[DeparturePoint] [varchar](100) NULL,
	[DestinationPoint] [varchar](100) NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportation]    Script Date: 23.12.2024 21:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportation](
	[TransportationID] [int] IDENTITY(1,1) NOT NULL,
	[VehicleType] [varchar](50) NULL,
	[CompanyName] [varchar](100) NULL,
	[DeparturePoint] [varchar](100) NULL,
	[DestinationPoint] [varchar](100) NULL,
	[DepartureDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransportationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[TourPackages]  WITH CHECK ADD FOREIGN KEY([TourID])
REFERENCES [dbo].[Tours] ([TourID])
GO
USE [master]
GO
ALTER DATABASE [TurizmAcentası] SET  READ_WRITE 
GO
