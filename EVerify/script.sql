USE [master]
GO
/****** Object:  Database [EVerify]    Script Date: 4/30/2018 11:00:51 AM ******/
CREATE DATABASE [EVerify]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EVerify', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EVerify.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EVerify_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EVerify_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EVerify] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EVerify].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EVerify] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EVerify] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EVerify] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EVerify] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EVerify] SET ARITHABORT OFF 
GO
ALTER DATABASE [EVerify] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EVerify] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EVerify] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EVerify] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EVerify] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EVerify] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EVerify] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EVerify] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EVerify] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EVerify] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EVerify] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EVerify] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EVerify] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EVerify] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EVerify] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EVerify] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EVerify] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EVerify] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EVerify] SET  MULTI_USER 
GO
ALTER DATABASE [EVerify] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EVerify] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EVerify] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EVerify] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EVerify] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EVerify]
GO
/****** Object:  Table [dbo].[FormI9]    Script Date: 4/30/2018 11:00:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormI9](
	[Status] [varchar](25) NULL,
	[AppID] [varchar](250) NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[Middle] [char](1) NULL,
	[OtherName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[AptNum] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [char](2) NULL,
	[Zip] [char](5) NULL,
	[Zip4] [char](4) NULL,
	[Birth] [int] NULL,
	[SSN] [char](9) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Change] [bit] NULL,
	[Citizenship] [int] NULL,
	[Signature] [varchar](50) NULL,
	[SignatureCertifyEmp] [bit] NULL,
	[Assist] [bit] NULL,
	[AlienNum1] [varchar](50) NULL,
	[AuthorizationExpDate] [date] NULL,
	[AlienNum2] [varchar](50) NULL,
	[I94Num] [varchar](50) NULL,
	[ForeignPPNum] [varchar](50) NULL,
	[ForeignPPCountry] [varchar](50) NULL,
	[SignatureDate] [date] NULL,
	[SignaturePrep] [varchar](50) NULL,
	[SignatureCertifyPrep] [bit] NULL,
	[SignaturePrepDate] [date] NULL,
	[PrepLastName] [varchar](50) NULL,
	[PrepFirstName] [varchar](50) NULL,
	[PrepAddress] [varchar](50) NULL,
	[PrepCity] [varchar](50) NULL,
	[PrepState] [char](2) NULL,
	[PrepZip] [char](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[States]    Script Date: 4/30/2018 11:00:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[States](
	[StateID] [char](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[States] ([StateID]) VALUES (N'AK')
INSERT [dbo].[States] ([StateID]) VALUES (N'AR')
INSERT [dbo].[States] ([StateID]) VALUES (N'AZ')
INSERT [dbo].[States] ([StateID]) VALUES (N'CA')
INSERT [dbo].[States] ([StateID]) VALUES (N'CO')
INSERT [dbo].[States] ([StateID]) VALUES (N'CT')
INSERT [dbo].[States] ([StateID]) VALUES (N'DE')
INSERT [dbo].[States] ([StateID]) VALUES (N'FL')
INSERT [dbo].[States] ([StateID]) VALUES (N'GA')
INSERT [dbo].[States] ([StateID]) VALUES (N'HI')
INSERT [dbo].[States] ([StateID]) VALUES (N'ID')
INSERT [dbo].[States] ([StateID]) VALUES (N'IL')
INSERT [dbo].[States] ([StateID]) VALUES (N'IN')
INSERT [dbo].[States] ([StateID]) VALUES (N'IA')
INSERT [dbo].[States] ([StateID]) VALUES (N'KS')
INSERT [dbo].[States] ([StateID]) VALUES (N'KY')
INSERT [dbo].[States] ([StateID]) VALUES (N'LA')
INSERT [dbo].[States] ([StateID]) VALUES (N'ME')
INSERT [dbo].[States] ([StateID]) VALUES (N'MD')
INSERT [dbo].[States] ([StateID]) VALUES (N'MA')
INSERT [dbo].[States] ([StateID]) VALUES (N'MI')
INSERT [dbo].[States] ([StateID]) VALUES (N'MN')
INSERT [dbo].[States] ([StateID]) VALUES (N'MS')
INSERT [dbo].[States] ([StateID]) VALUES (N'MO')
INSERT [dbo].[States] ([StateID]) VALUES (N'MT')
INSERT [dbo].[States] ([StateID]) VALUES (N'NE')
INSERT [dbo].[States] ([StateID]) VALUES (N'NH')
INSERT [dbo].[States] ([StateID]) VALUES (N'NV')
INSERT [dbo].[States] ([StateID]) VALUES (N'NJ')
INSERT [dbo].[States] ([StateID]) VALUES (N'NM')
INSERT [dbo].[States] ([StateID]) VALUES (N'NY')
INSERT [dbo].[States] ([StateID]) VALUES (N'NC')
INSERT [dbo].[States] ([StateID]) VALUES (N'ND')
INSERT [dbo].[States] ([StateID]) VALUES (N'OH')
INSERT [dbo].[States] ([StateID]) VALUES (N'OK')
INSERT [dbo].[States] ([StateID]) VALUES (N'OR')
INSERT [dbo].[States] ([StateID]) VALUES (N'PA')
INSERT [dbo].[States] ([StateID]) VALUES (N'RI')
INSERT [dbo].[States] ([StateID]) VALUES (N'SC')
INSERT [dbo].[States] ([StateID]) VALUES (N'SD')
INSERT [dbo].[States] ([StateID]) VALUES (N'TN')
INSERT [dbo].[States] ([StateID]) VALUES (N'TX')
INSERT [dbo].[States] ([StateID]) VALUES (N'UT')
INSERT [dbo].[States] ([StateID]) VALUES (N'VT')
INSERT [dbo].[States] ([StateID]) VALUES (N'VA')
INSERT [dbo].[States] ([StateID]) VALUES (N'DC')
INSERT [dbo].[States] ([StateID]) VALUES (N'WA')
INSERT [dbo].[States] ([StateID]) VALUES (N'WV')
INSERT [dbo].[States] ([StateID]) VALUES (N'WI')
INSERT [dbo].[States] ([StateID]) VALUES (N'WY')
USE [master]
GO
ALTER DATABASE [EVerify] SET  READ_WRITE 
GO
