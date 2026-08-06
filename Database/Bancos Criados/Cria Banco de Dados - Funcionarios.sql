USE [master]
GO
drop database [funcionarios]
GO
/****** Object:  Database [Funcionarios]    Script Date: 06/02/2026 18:12:59 ******/
CREATE DATABASE [Funcionarios]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Funcionarios', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Funcionarios.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Funcionarios_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Funcionarios_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Funcionarios] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Funcionarios].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Funcionarios] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Funcionarios] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Funcionarios] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Funcionarios] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Funcionarios] SET ARITHABORT OFF 
GO
ALTER DATABASE [Funcionarios] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Funcionarios] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Funcionarios] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Funcionarios] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Funcionarios] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Funcionarios] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Funcionarios] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Funcionarios] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Funcionarios] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Funcionarios] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Funcionarios] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Funcionarios] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Funcionarios] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Funcionarios] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Funcionarios] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Funcionarios] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Funcionarios] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Funcionarios] SET RECOVERY FULL 
GO
ALTER DATABASE [Funcionarios] SET  MULTI_USER 
GO
ALTER DATABASE [Funcionarios] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Funcionarios] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Funcionarios] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Funcionarios] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Funcionarios] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Funcionarios] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Funcionarios', N'ON'
GO
ALTER DATABASE [Funcionarios] SET QUERY_STORE = ON
GO
ALTER DATABASE [Funcionarios] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Funcionarios]
GO
/****** Object:  Table [dbo].[apontamentos]    Script Date: 06/02/2026 18:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apontamentos](
	[func_id] [int] NOT NULL,
	[ano] [int] NOT NULL,
	[mes] [int] NOT NULL,
	[total_horas] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_apontamentos] PRIMARY KEY CLUSTERED 
(
	[func_id] ASC,
	[ano] ASC,
	[mes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cargos]    Script Date: 06/02/2026 18:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargos](
	[cargo_id] [int] NOT NULL,
	[cargo_nome] [varchar](30) NOT NULL,
 CONSTRAINT [PK_cargos] PRIMARY KEY CLUSTERED 
(
	[cargo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[funcionarios]    Script Date: 06/02/2026 18:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funcionarios](
	[func_id] [int] NOT NULL,
	[func_nome] [varchar](130) NULL,
	[gerente_id] [int] NULL,
	[setor_id] [int] NULL,
	[func_salario] [numeric](18, 2) NULL,
	[func_dataNasc] [datetime] NULL,
	[cargo_id] [int] NULL,
	[func_valorHora] [numeric](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[func_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[setores]    Script Date: 06/02/2026 18:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[setores](
	[setor_id] [int] NOT NULL,
	[setor_nome] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[setor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (1, 2025, 10, CAST(155.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (5, 2025, 7, CAST(61.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (7, 2025, 2, CAST(204.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (8, 2025, 5, CAST(84.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (10, 2025, 7, CAST(186.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (10, 2025, 9, CAST(161.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (11, 2025, 3, CAST(182.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (12, 2025, 2, CAST(173.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (13, 2025, 2, CAST(71.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (13, 2025, 4, CAST(202.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (14, 2025, 2, CAST(79.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (14, 2025, 5, CAST(147.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (14, 2025, 11, CAST(162.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (15, 2025, 4, CAST(127.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (17, 2025, 3, CAST(176.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (17, 2025, 7, CAST(142.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (19, 2025, 8, CAST(155.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (20, 2025, 7, CAST(149.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (22, 2025, 4, CAST(215.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (23, 2025, 9, CAST(146.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (24, 2025, 8, CAST(208.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (24, 2025, 11, CAST(62.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (27, 2025, 5, CAST(136.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (28, 2025, 8, CAST(162.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (31, 2025, 5, CAST(75.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (34, 2025, 8, CAST(63.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (35, 2025, 5, CAST(97.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (35, 2025, 7, CAST(174.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (35, 2025, 12, CAST(96.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (40, 2025, 4, CAST(113.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (40, 2025, 12, CAST(97.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (42, 2025, 1, CAST(67.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (44, 2025, 12, CAST(162.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (45, 2025, 2, CAST(142.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (45, 2025, 4, CAST(94.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (45, 2025, 9, CAST(158.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (48, 2025, 5, CAST(206.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (49, 2025, 4, CAST(169.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (51, 2025, 4, CAST(93.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (51, 2025, 9, CAST(183.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (52, 2025, 8, CAST(160.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (54, 2025, 12, CAST(157.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (56, 2025, 8, CAST(185.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (57, 2025, 7, CAST(190.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (58, 2025, 3, CAST(65.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (60, 2025, 3, CAST(128.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (61, 2025, 8, CAST(61.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (65, 2025, 11, CAST(194.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (67, 2025, 7, CAST(74.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (68, 2025, 8, CAST(114.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (72, 2025, 1, CAST(172.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (72, 2025, 3, CAST(148.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (72, 2025, 11, CAST(68.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (76, 2025, 3, CAST(168.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (76, 2025, 6, CAST(148.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (82, 2025, 1, CAST(99.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (82, 2025, 9, CAST(138.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (84, 2025, 6, CAST(186.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (86, 2025, 11, CAST(74.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (88, 2025, 2, CAST(210.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (88, 2025, 11, CAST(187.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (89, 2025, 11, CAST(85.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (91, 2025, 2, CAST(174.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (93, 2025, 8, CAST(185.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (94, 2025, 8, CAST(216.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (98, 2025, 3, CAST(114.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (98, 2025, 11, CAST(114.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (100, 2025, 6, CAST(208.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (101, 2025, 9, CAST(124.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (103, 2025, 10, CAST(131.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (104, 2025, 10, CAST(136.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (106, 2025, 6, CAST(150.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (107, 2025, 7, CAST(130.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (108, 2025, 3, CAST(142.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (108, 2025, 6, CAST(162.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (110, 2025, 12, CAST(162.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (121, 2025, 1, CAST(215.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (121, 2025, 10, CAST(83.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (121, 2025, 12, CAST(66.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (122, 2025, 3, CAST(125.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (124, 2025, 10, CAST(100.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (125, 2025, 12, CAST(134.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (126, 2025, 1, CAST(206.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (128, 2025, 6, CAST(104.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (130, 2025, 2, CAST(73.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (131, 2025, 8, CAST(164.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (135, 2025, 9, CAST(130.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (136, 2025, 10, CAST(201.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (140, 2025, 6, CAST(103.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (141, 2025, 6, CAST(109.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (142, 2025, 5, CAST(158.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (142, 2025, 11, CAST(68.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (147, 2025, 10, CAST(186.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (154, 2025, 1, CAST(197.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (154, 2025, 2, CAST(75.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (154, 2025, 4, CAST(170.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (158, 2025, 4, CAST(193.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (158, 2025, 7, CAST(196.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (159, 2025, 8, CAST(155.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (161, 2025, 2, CAST(75.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (161, 2025, 8, CAST(70.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (165, 2025, 5, CAST(71.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (169, 2025, 5, CAST(147.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (170, 2025, 5, CAST(142.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (170, 2025, 6, CAST(216.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (171, 2025, 12, CAST(203.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (173, 2025, 12, CAST(135.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (174, 2025, 8, CAST(128.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (176, 2025, 5, CAST(207.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (176, 2025, 8, CAST(196.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (178, 2025, 11, CAST(185.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (180, 2025, 1, CAST(166.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (180, 2025, 5, CAST(81.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (180, 2025, 10, CAST(137.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (182, 2025, 8, CAST(172.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (183, 2025, 3, CAST(121.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (183, 2025, 5, CAST(148.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (188, 2025, 1, CAST(133.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (191, 2025, 2, CAST(80.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (191, 2025, 9, CAST(189.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (191, 2025, 10, CAST(127.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (198, 2025, 6, CAST(118.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (198, 2025, 9, CAST(119.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (199, 2025, 3, CAST(179.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (200, 2025, 6, CAST(139.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (203, 2025, 10, CAST(201.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (206, 2025, 6, CAST(193.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (206, 2025, 10, CAST(160.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (206, 2025, 12, CAST(171.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (207, 2025, 3, CAST(87.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (208, 2025, 12, CAST(78.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (214, 2025, 4, CAST(201.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (215, 2025, 5, CAST(61.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (216, 2025, 4, CAST(211.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (216, 2025, 6, CAST(88.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (216, 2025, 9, CAST(142.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (217, 2025, 12, CAST(157.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (219, 2025, 3, CAST(166.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (219, 2025, 11, CAST(111.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (220, 2025, 1, CAST(195.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (222, 2025, 3, CAST(172.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (224, 2025, 6, CAST(158.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (225, 2025, 12, CAST(137.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (226, 2025, 5, CAST(144.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (228, 2025, 4, CAST(62.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (230, 2025, 2, CAST(201.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (233, 2025, 4, CAST(130.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (233, 2025, 10, CAST(65.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (235, 2025, 8, CAST(187.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (236, 2025, 4, CAST(189.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (237, 2025, 6, CAST(90.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (238, 2025, 9, CAST(129.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (239, 2025, 11, CAST(127.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (240, 2025, 4, CAST(72.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (240, 2025, 9, CAST(67.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (244, 2025, 7, CAST(204.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (245, 2025, 2, CAST(119.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (246, 2025, 4, CAST(185.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (247, 2025, 10, CAST(95.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (252, 2025, 7, CAST(135.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (253, 2025, 7, CAST(190.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (254, 2025, 11, CAST(126.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (255, 2025, 2, CAST(177.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (258, 2025, 3, CAST(172.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (261, 2025, 1, CAST(179.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (264, 2025, 4, CAST(103.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (264, 2025, 9, CAST(134.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (265, 2025, 7, CAST(168.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (265, 2025, 11, CAST(142.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (266, 2025, 1, CAST(122.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (268, 2025, 2, CAST(62.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (268, 2025, 7, CAST(195.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (269, 2025, 6, CAST(104.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (270, 2025, 12, CAST(184.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (272, 2025, 8, CAST(192.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (272, 2025, 11, CAST(124.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (275, 2025, 7, CAST(178.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (277, 2025, 3, CAST(156.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (278, 2025, 8, CAST(86.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (284, 2025, 2, CAST(87.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (285, 2025, 10, CAST(113.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (292, 2025, 5, CAST(69.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (292, 2025, 7, CAST(78.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (292, 2025, 11, CAST(112.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (294, 2025, 7, CAST(183.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (294, 2025, 12, CAST(128.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (295, 2025, 4, CAST(158.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (295, 2025, 5, CAST(109.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (300, 2025, 4, CAST(199.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (304, 2025, 8, CAST(173.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (306, 2025, 7, CAST(177.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (308, 2025, 11, CAST(173.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (309, 2025, 6, CAST(137.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (309, 2025, 10, CAST(139.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (312, 2025, 4, CAST(187.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (312, 2025, 5, CAST(208.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (314, 2025, 5, CAST(165.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (316, 2025, 7, CAST(204.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (317, 2025, 2, CAST(97.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (317, 2025, 6, CAST(190.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (318, 2025, 5, CAST(94.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (321, 2025, 4, CAST(63.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (321, 2025, 10, CAST(185.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (323, 2025, 7, CAST(90.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (327, 2025, 12, CAST(121.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (328, 2025, 7, CAST(107.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (328, 2025, 9, CAST(101.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (331, 2025, 1, CAST(183.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (331, 2025, 5, CAST(194.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (331, 2025, 6, CAST(119.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (332, 2025, 3, CAST(214.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (333, 2025, 4, CAST(196.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (336, 2025, 12, CAST(153.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (337, 2025, 7, CAST(162.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (338, 2025, 4, CAST(86.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (343, 2025, 2, CAST(99.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (343, 2025, 9, CAST(173.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (348, 2025, 1, CAST(84.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (348, 2025, 3, CAST(159.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (350, 2025, 2, CAST(158.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (353, 2025, 5, CAST(101.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (355, 2025, 4, CAST(82.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (357, 2025, 2, CAST(177.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (357, 2025, 12, CAST(126.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (360, 2025, 1, CAST(167.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (360, 2025, 12, CAST(187.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (362, 2025, 5, CAST(83.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (364, 2025, 9, CAST(112.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (364, 2025, 12, CAST(96.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (365, 2025, 11, CAST(126.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (368, 2025, 12, CAST(212.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (369, 2025, 5, CAST(198.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (369, 2025, 7, CAST(190.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (370, 2025, 9, CAST(117.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (373, 2025, 1, CAST(210.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (374, 2025, 2, CAST(164.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (374, 2025, 3, CAST(165.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (376, 2025, 10, CAST(109.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (377, 2025, 3, CAST(83.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (380, 2025, 10, CAST(199.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (381, 2025, 9, CAST(217.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (381, 2025, 11, CAST(78.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (382, 2025, 6, CAST(88.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (384, 2025, 5, CAST(216.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (391, 2025, 4, CAST(141.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (392, 2025, 8, CAST(168.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (392, 2025, 10, CAST(113.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (393, 2025, 2, CAST(89.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (394, 2025, 2, CAST(157.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (395, 2025, 7, CAST(200.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (396, 2025, 8, CAST(200.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (396, 2025, 9, CAST(101.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (398, 2025, 10, CAST(168.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (399, 2025, 3, CAST(164.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (400, 2025, 12, CAST(184.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (402, 2025, 4, CAST(210.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (403, 2025, 1, CAST(81.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (403, 2025, 10, CAST(60.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (405, 2025, 1, CAST(199.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (405, 2025, 5, CAST(210.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (406, 2025, 7, CAST(213.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (407, 2025, 4, CAST(197.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (407, 2025, 7, CAST(70.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (409, 2025, 7, CAST(126.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (409, 2025, 11, CAST(156.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (410, 2025, 3, CAST(152.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (411, 2025, 8, CAST(202.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (411, 2025, 10, CAST(136.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (413, 2025, 5, CAST(94.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (415, 2025, 8, CAST(160.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (422, 2025, 9, CAST(150.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (425, 2025, 1, CAST(153.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (425, 2025, 4, CAST(96.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (425, 2025, 7, CAST(178.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (426, 2025, 1, CAST(126.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (426, 2025, 7, CAST(175.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (428, 2025, 3, CAST(83.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (428, 2025, 12, CAST(164.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (429, 2025, 4, CAST(121.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (430, 2025, 5, CAST(194.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (430, 2025, 6, CAST(124.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (431, 2025, 3, CAST(178.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (431, 2025, 7, CAST(68.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (434, 2025, 4, CAST(198.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (434, 2025, 6, CAST(203.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (436, 2025, 9, CAST(181.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (438, 2025, 6, CAST(188.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (439, 2025, 5, CAST(116.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (441, 2025, 9, CAST(177.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (442, 2025, 12, CAST(210.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (443, 2025, 2, CAST(196.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (443, 2025, 3, CAST(160.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (444, 2025, 5, CAST(214.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (444, 2025, 10, CAST(155.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (447, 2025, 6, CAST(140.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (447, 2025, 8, CAST(123.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (448, 2025, 3, CAST(71.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (448, 2025, 6, CAST(163.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (448, 2025, 11, CAST(68.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[apontamentos] ([func_id], [ano], [mes], [total_horas]) VALUES (449, 2025, 2, CAST(190.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (1, N'Aux Adm')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (2, N'Assist Adm')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (3, N'Analista Adm Jr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (4, N'Analista Adm Pl')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (5, N'Analista Adm Sr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (6, N'Aux Financeiro')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (7, N'Assist Financeiro')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (8, N'Analista Fin Jr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (9, N'Analista Fin Pl')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (10, N'Analista Fin Sr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (11, N'Aux Contabil')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (12, N'Analista Cont Jr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (13, N'Analista Cont Pl')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (14, N'Analista Cont Sr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (15, N'Analista RH Jr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (16, N'Analista RH Pl')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (17, N'Analista RH Sr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (18, N'Assist Comercial')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (19, N'Vendedor Interno')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (20, N'Executivo Contas')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (21, N'Coord Comercial')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (22, N'Sup Operacoes')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (23, N'Assist Logistica')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (24, N'Analista Log Jr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (25, N'Analista Log Pl')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (26, N'Analista Log Sr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (27, N'Suporte N1')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (28, N'Suporte N2')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (29, N'Dev Jr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (30, N'Dev Pl')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (31, N'Dev Sr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (32, N'Anal Sist Jr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (33, N'Anal Sist Pl')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (34, N'Anal Sist Sr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (35, N'DBA Jr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (36, N'DBA Pl')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (37, N'DBA Sr')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (38, N'Coord TI')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (39, N'Gerente TI')
GO
INSERT [dbo].[cargos] ([cargo_id], [cargo_nome]) VALUES (40, N'Diretor')
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (1, N'Larissa Campos Cavalcanti', NULL, 12, CAST(6542.50 AS Numeric(18, 2)), CAST(N'2000-11-30T00:00:00.000' AS DateTime), 15, CAST(30.04 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (2, N'Daniel Almeida Dias', NULL, 3, CAST(1920.00 AS Numeric(18, 2)), CAST(N'1997-08-17T00:00:00.000' AS DateTime), 7, CAST(9.16 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (3, N'Thiago Barbosa Gomes', NULL, 20, CAST(11412.00 AS Numeric(18, 2)), CAST(N'1973-03-06T00:00:00.000' AS DateTime), 27, CAST(56.02 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (4, N'Andre Costa Pereira', NULL, 19, CAST(6826.25 AS Numeric(18, 2)), CAST(N'1986-02-16T00:00:00.000' AS DateTime), 16, CAST(28.24 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (5, N'Natalia Santos Cavalcanti', NULL, 10, CAST(7115.40 AS Numeric(18, 2)), CAST(N'1997-07-10T00:00:00.000' AS DateTime), 27, CAST(32.34 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (6, N'Vinicius Ribeiro Rocha', NULL, 1, CAST(12249.00 AS Numeric(18, 2)), CAST(N'1981-03-03T00:00:00.000' AS DateTime), 29, CAST(50.11 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (7, N'Joao Teixeira Freitas', NULL, 8, CAST(9030.00 AS Numeric(18, 2)), CAST(N'1973-07-25T00:00:00.000' AS DateTime), 25, CAST(37.76 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (8, N'Patricia Cardoso Santos', NULL, 9, CAST(5627.00 AS Numeric(18, 2)), CAST(N'1994-07-04T00:00:00.000' AS DateTime), 6, CAST(24.04 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (9, N'Igor Gomes Nunes', NULL, 2, CAST(4780.00 AS Numeric(18, 2)), CAST(N'1985-11-24T00:00:00.000' AS DateTime), 10, CAST(19.77 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (10, N'Otavio Souza Araujo', NULL, 7, CAST(2692.50 AS Numeric(18, 2)), CAST(N'1976-07-18T00:00:00.000' AS DateTime), 14, CAST(12.97 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (11, N'Marcos Campos Ribeiro', NULL, 12, CAST(3415.00 AS Numeric(18, 2)), CAST(N'1970-08-14T00:00:00.000' AS DateTime), 18, CAST(17.08 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (12, N'Helena Moreira Almeida', NULL, 3, CAST(5884.00 AS Numeric(18, 2)), CAST(N'1996-08-16T00:00:00.000' AS DateTime), 5, CAST(26.48 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (13, N'Vanessa Moura Dias', NULL, 5, CAST(11790.00 AS Numeric(18, 2)), CAST(N'1966-07-05T00:00:00.000' AS DateTime), 30, CAST(58.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (14, N'Nicole Barbosa Costa', NULL, 8, CAST(8332.20 AS Numeric(18, 2)), CAST(N'1994-01-02T00:00:00.000' AS DateTime), 27, CAST(37.87 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (15, N'Otavio Teixeira Costa', NULL, 13, CAST(5578.00 AS Numeric(18, 2)), CAST(N'1969-07-29T00:00:00.000' AS DateTime), 5, CAST(25.61 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (16, N'Otavio Pereira Cavalcanti', NULL, 14, CAST(5593.00 AS Numeric(18, 2)), CAST(N'1999-12-07T00:00:00.000' AS DateTime), 9, CAST(24.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (17, N'Eduardo Freitas Mendes', NULL, 13, CAST(5346.25 AS Numeric(18, 2)), CAST(N'1990-01-01T00:00:00.000' AS DateTime), 11, CAST(23.09 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (18, N'Patricia Santos Oliveira', NULL, 3, CAST(2544.00 AS Numeric(18, 2)), CAST(N'1979-03-22T00:00:00.000' AS DateTime), 4, CAST(11.79 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (19, N'Natalia Oliveira Souza', NULL, 13, CAST(7796.00 AS Numeric(18, 2)), CAST(N'1994-02-21T00:00:00.000' AS DateTime), 7, CAST(36.85 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (20, N'Mariana Cardoso Cardoso', NULL, 10, CAST(3760.00 AS Numeric(18, 2)), CAST(N'1994-11-08T00:00:00.000' AS DateTime), 17, CAST(16.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (21, N'Ana Martins Ferreira', NULL, 5, CAST(10015.60 AS Numeric(18, 2)), CAST(N'1970-06-20T00:00:00.000' AS DateTime), 22, CAST(47.80 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (22, N'Vanessa Souza Barbosa', 9, 19, CAST(15436.80 AS Numeric(18, 2)), CAST(N'1977-04-25T00:00:00.000' AS DateTime), 27, CAST(63.85 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (23, N'Bruno Lima Teixeira', NULL, 11, CAST(8317.00 AS Numeric(18, 2)), CAST(N'1979-12-01T00:00:00.000' AS DateTime), 5, CAST(34.78 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (24, N'Elaine Oliveira Nunes', 17, 14, CAST(11702.60 AS Numeric(18, 2)), CAST(N'1990-11-22T00:00:00.000' AS DateTime), 23, CAST(55.85 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (25, N'William Moura Correia', NULL, 9, CAST(3483.00 AS Numeric(18, 2)), CAST(N'1997-01-16T00:00:00.000' AS DateTime), 7, CAST(15.04 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (26, N'Patricia Freitas Gomes', NULL, 18, CAST(6941.00 AS Numeric(18, 2)), CAST(N'1994-08-08T00:00:00.000' AS DateTime), 9, CAST(33.76 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (27, N'Bruno Cavalcanti Dias', NULL, 14, CAST(2361.25 AS Numeric(18, 2)), CAST(N'1984-03-01T00:00:00.000' AS DateTime), 11, CAST(11.48 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (28, N'Caio Lima Lima', 16, 18, CAST(6136.00 AS Numeric(18, 2)), CAST(N'2001-05-23T00:00:00.000' AS DateTime), 8, CAST(25.10 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (29, N'Sabrina Martins Teixeira', NULL, 7, CAST(7443.00 AS Numeric(18, 2)), CAST(N'1986-09-06T00:00:00.000' AS DateTime), 2, CAST(36.20 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (30, N'Bruno Araujo Santos', NULL, 12, CAST(1899.00 AS Numeric(18, 2)), CAST(N'1971-04-22T00:00:00.000' AS DateTime), 8, CAST(8.03 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (31, N'Beatriz Araujo Oliveira', NULL, 1, CAST(4327.00 AS Numeric(18, 2)), CAST(N'1981-04-05T00:00:00.000' AS DateTime), 9, CAST(19.67 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (32, N'Elaine Rocha Souza', 27, 20, CAST(4501.25 AS Numeric(18, 2)), CAST(N'1980-09-02T00:00:00.000' AS DateTime), 20, CAST(19.85 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (33, N'Daniel Batista Martins', 17, 10, CAST(10736.25 AS Numeric(18, 2)), CAST(N'1992-09-22T00:00:00.000' AS DateTime), 11, CAST(51.24 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (34, N'Bruno Silva Teixeira', 11, 12, CAST(8713.60 AS Numeric(18, 2)), CAST(N'1979-12-19T00:00:00.000' AS DateTime), 24, CAST(38.42 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (35, N'Sergio Barbosa Rocha', 14, 11, CAST(9255.60 AS Numeric(18, 2)), CAST(N'1985-05-24T00:00:00.000' AS DateTime), 27, CAST(46.28 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (36, N'Tatiane Ferreira Batista', 15, 9, CAST(9983.40 AS Numeric(18, 2)), CAST(N'1997-07-29T00:00:00.000' AS DateTime), 26, CAST(46.74 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (37, N'Sergio Monteiro Cardoso', NULL, 7, CAST(8892.80 AS Numeric(18, 2)), CAST(N'1990-05-22T00:00:00.000' AS DateTime), 21, CAST(43.66 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (38, N'Sergio Correia Nunes', 36, 15, CAST(8008.20 AS Numeric(18, 2)), CAST(N'1968-12-08T00:00:00.000' AS DateTime), 27, CAST(38.22 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (39, N'Joao Souza Batista', 22, 18, CAST(7518.00 AS Numeric(18, 2)), CAST(N'1987-12-27T00:00:00.000' AS DateTime), 8, CAST(32.12 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (40, N'Rafael Carvalho Moura', 27, 15, CAST(10323.60 AS Numeric(18, 2)), CAST(N'2003-04-27T00:00:00.000' AS DateTime), 26, CAST(46.46 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (41, N'Fernanda Cardoso Souza', 40, 9, CAST(9892.50 AS Numeric(18, 2)), CAST(N'1997-05-31T00:00:00.000' AS DateTime), 13, CAST(45.42 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (42, N'Renata Cardoso Costa', NULL, 10, CAST(7107.00 AS Numeric(18, 2)), CAST(N'1966-02-14T00:00:00.000' AS DateTime), 6, CAST(32.95 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (43, N'Thiago Almeida Freitas', 6, 13, CAST(2625.00 AS Numeric(18, 2)), CAST(N'1972-07-03T00:00:00.000' AS DateTime), 19, CAST(10.86 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (44, N'Natalia Santos Cardoso', 33, 10, CAST(7884.00 AS Numeric(18, 2)), CAST(N'1986-06-05T00:00:00.000' AS DateTime), 27, CAST(35.84 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (45, N'Andre Lima Pereira', 42, 15, CAST(8541.40 AS Numeric(18, 2)), CAST(N'1988-06-08T00:00:00.000' AS DateTime), 24, CAST(37.27 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (46, N'Yasmin Cardoso Rocha', NULL, 3, CAST(7770.60 AS Numeric(18, 2)), CAST(N'1981-03-21T00:00:00.000' AS DateTime), 28, CAST(34.26 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (47, N'Ana Freitas Silva', NULL, 20, CAST(10087.50 AS Numeric(18, 2)), CAST(N'1993-09-26T00:00:00.000' AS DateTime), 15, CAST(42.64 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (48, N'Isabela Gomes Monteiro', NULL, 1, CAST(6324.00 AS Numeric(18, 2)), CAST(N'1967-05-04T00:00:00.000' AS DateTime), 9, CAST(30.18 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (49, N'Sabrina Barbosa Almeida', NULL, 6, CAST(5326.20 AS Numeric(18, 2)), CAST(N'1983-02-28T00:00:00.000' AS DateTime), 27, CAST(23.24 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (50, N'William Monteiro Rodrigues', 15, 8, CAST(12025.80 AS Numeric(18, 2)), CAST(N'1988-08-21T00:00:00.000' AS DateTime), 29, CAST(55.21 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (51, N'Fernanda Martins Rocha', 42, 20, CAST(13716.00 AS Numeric(18, 2)), CAST(N'1995-05-12T00:00:00.000' AS DateTime), 30, CAST(57.36 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (52, N'Eduardo Correia Carvalho', 15, 8, CAST(12299.00 AS Numeric(18, 2)), CAST(N'1997-12-16T00:00:00.000' AS DateTime), 22, CAST(57.58 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (53, N'Ana Ferreira Rodrigues', 21, 12, CAST(9100.80 AS Numeric(18, 2)), CAST(N'1991-03-27T00:00:00.000' AS DateTime), 29, CAST(45.50 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (54, N'Otavio Souza Moreira', 9, 1, CAST(7348.75 AS Numeric(18, 2)), CAST(N'1967-06-24T00:00:00.000' AS DateTime), 14, CAST(34.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (55, N'Paulo Cavalcanti Almeida', 18, 15, CAST(5262.00 AS Numeric(18, 2)), CAST(N'1985-03-16T00:00:00.000' AS DateTime), 8, CAST(21.53 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (56, N'Fernanda Cavalcanti Moura', 53, 19, CAST(6000.40 AS Numeric(18, 2)), CAST(N'1968-08-12T00:00:00.000' AS DateTime), 25, CAST(24.82 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (57, N'Gustavo Moura Cavalcanti', 7, 5, CAST(5246.00 AS Numeric(18, 2)), CAST(N'1981-05-09T00:00:00.000' AS DateTime), 3, CAST(21.94 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (58, N'Fernanda Carvalho Mendes', NULL, 19, CAST(6077.50 AS Numeric(18, 2)), CAST(N'1977-07-25T00:00:00.000' AS DateTime), 20, CAST(28.45 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (59, N'Igor Cardoso Monteiro', 3, 15, CAST(8616.25 AS Numeric(18, 2)), CAST(N'1999-10-31T00:00:00.000' AS DateTime), 15, CAST(40.73 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (60, N'Beatriz Monteiro Campos', 22, 5, CAST(8809.20 AS Numeric(18, 2)), CAST(N'1998-09-12T00:00:00.000' AS DateTime), 27, CAST(43.65 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (61, N'Nicole Moreira Oliveira', 59, 15, CAST(6575.40 AS Numeric(18, 2)), CAST(N'1982-07-09T00:00:00.000' AS DateTime), 30, CAST(32.28 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (62, N'Bruno Moura Almeida', 50, 11, CAST(7432.00 AS Numeric(18, 2)), CAST(N'1965-12-03T00:00:00.000' AS DateTime), 4, CAST(35.81 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (63, N'Daniel Oliveira Carvalho', 39, 10, CAST(9376.25 AS Numeric(18, 2)), CAST(N'1976-04-05T00:00:00.000' AS DateTime), 16, CAST(38.78 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (64, N'Patricia Rocha Araujo', 45, 5, CAST(7288.75 AS Numeric(18, 2)), CAST(N'1999-01-19T00:00:00.000' AS DateTime), 12, CAST(31.81 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (65, N'Fernanda Nunes Nunes', 44, 6, CAST(6166.80 AS Numeric(18, 2)), CAST(N'2002-03-11T00:00:00.000' AS DateTime), 27, CAST(27.47 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (66, N'Gabriel Santos Carvalho', 38, 4, CAST(2594.00 AS Numeric(18, 2)), CAST(N'1999-04-06T00:00:00.000' AS DateTime), 5, CAST(10.97 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (67, N'Karen Mendes Martins', NULL, 3, CAST(9707.40 AS Numeric(18, 2)), CAST(N'1965-11-29T00:00:00.000' AS DateTime), 28, CAST(42.36 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (68, N'Elaine Carvalho Martins', 20, 4, CAST(6371.40 AS Numeric(18, 2)), CAST(N'1978-08-09T00:00:00.000' AS DateTime), 21, CAST(27.51 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (69, N'Natalia Monteiro Cavalcanti', 56, 2, CAST(6578.00 AS Numeric(18, 2)), CAST(N'2001-10-23T00:00:00.000' AS DateTime), 7, CAST(32.89 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (70, N'Renata Correia Moura', 58, 18, CAST(8858.75 AS Numeric(18, 2)), CAST(N'1994-11-27T00:00:00.000' AS DateTime), 19, CAST(38.25 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (71, N'Caio Araujo Moura', NULL, 6, CAST(6963.75 AS Numeric(18, 2)), CAST(N'1998-03-21T00:00:00.000' AS DateTime), 18, CAST(30.70 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (72, N'Otavio Santos Freitas', 64, 12, CAST(4443.75 AS Numeric(18, 2)), CAST(N'1999-08-09T00:00:00.000' AS DateTime), 14, CAST(19.79 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (73, N'Gabriel Freitas Campos', NULL, 17, CAST(14229.00 AS Numeric(18, 2)), CAST(N'1988-02-16T00:00:00.000' AS DateTime), 29, CAST(71.15 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (74, N'Daniel Correia Freitas', NULL, 19, CAST(6058.00 AS Numeric(18, 2)), CAST(N'2002-06-01T00:00:00.000' AS DateTime), 9, CAST(27.81 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (75, N'Juliana Dias Martins', 64, 12, CAST(7577.00 AS Numeric(18, 2)), CAST(N'1996-03-20T00:00:00.000' AS DateTime), 3, CAST(33.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (76, N'Igor Pereira Oliveira', 70, 20, CAST(3497.20 AS Numeric(18, 2)), CAST(N'1993-04-16T00:00:00.000' AS DateTime), 22, CAST(16.06 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (77, N'Nicole Barbosa Ferreira', 18, 6, CAST(8694.00 AS Numeric(18, 2)), CAST(N'1968-11-12T00:00:00.000' AS DateTime), 30, CAST(40.70 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (78, N'Sabrina Batista Almeida', 76, 20, CAST(4573.80 AS Numeric(18, 2)), CAST(N'1990-11-21T00:00:00.000' AS DateTime), 21, CAST(18.71 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (79, N'Joao Campos Gomes', 65, 4, CAST(10789.80 AS Numeric(18, 2)), CAST(N'2002-07-20T00:00:00.000' AS DateTime), 24, CAST(47.08 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (80, N'Juliana Barbosa Cavalcanti', 50, 7, CAST(12738.60 AS Numeric(18, 2)), CAST(N'1974-10-25T00:00:00.000' AS DateTime), 27, CAST(63.69 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (81, N'Caio Silva Cardoso', 32, 17, CAST(5467.00 AS Numeric(18, 2)), CAST(N'1992-02-14T00:00:00.000' AS DateTime), 24, CAST(25.35 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (82, N'Sergio Silva Pereira', 42, 17, CAST(5633.75 AS Numeric(18, 2)), CAST(N'1981-08-23T00:00:00.000' AS DateTime), 19, CAST(27.14 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (83, N'Yasmin Mendes Cardoso', 45, 6, CAST(6053.00 AS Numeric(18, 2)), CAST(N'1968-05-17T00:00:00.000' AS DateTime), 8, CAST(28.06 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (84, N'Lucas Cavalcanti Cardoso', 22, 5, CAST(2422.00 AS Numeric(18, 2)), CAST(N'1988-05-27T00:00:00.000' AS DateTime), 9, CAST(11.78 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (85, N'Paulo Lima Dias', NULL, 6, CAST(8069.00 AS Numeric(18, 2)), CAST(N'1992-10-23T00:00:00.000' AS DateTime), 8, CAST(38.88 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (86, N'Natalia Carvalho Rodrigues', 78, 10, CAST(2556.25 AS Numeric(18, 2)), CAST(N'1983-12-13T00:00:00.000' AS DateTime), 12, CAST(11.39 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (87, N'Lucas Araujo Ferreira', 42, 12, CAST(4925.00 AS Numeric(18, 2)), CAST(N'1999-07-17T00:00:00.000' AS DateTime), 18, CAST(22.39 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (88, N'Helena Teixeira Moreira', 66, 20, CAST(4705.00 AS Numeric(18, 2)), CAST(N'1984-06-06T00:00:00.000' AS DateTime), 20, CAST(21.60 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (89, N'Tatiane Barbosa Ferreira', 82, 2, CAST(7529.00 AS Numeric(18, 2)), CAST(N'2001-03-18T00:00:00.000' AS DateTime), 2, CAST(36.28 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (90, N'Rafael Moura Santos', 1, 1, CAST(6129.20 AS Numeric(18, 2)), CAST(N'1975-09-28T00:00:00.000' AS DateTime), 26, CAST(26.19 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (91, N'Eduardo Moreira Cavalcanti', 58, 20, CAST(8166.25 AS Numeric(18, 2)), CAST(N'1972-07-14T00:00:00.000' AS DateTime), 19, CAST(40.09 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (92, N'Mariana Teixeira Ribeiro', NULL, 15, CAST(7502.50 AS Numeric(18, 2)), CAST(N'1977-01-02T00:00:00.000' AS DateTime), 20, CAST(34.44 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (93, N'Elaine Rocha Ribeiro', 41, 7, CAST(5617.00 AS Numeric(18, 2)), CAST(N'1977-01-29T00:00:00.000' AS DateTime), 6, CAST(26.55 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (94, N'Felipe Ribeiro Dias', 64, 13, CAST(5972.50 AS Numeric(18, 2)), CAST(N'1979-02-25T00:00:00.000' AS DateTime), 13, CAST(29.86 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (95, N'Gustavo Dias Correia', NULL, 17, CAST(5594.00 AS Numeric(18, 2)), CAST(N'2001-07-27T00:00:00.000' AS DateTime), 4, CAST(27.72 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (96, N'Marcos Barbosa Cardoso', 92, 6, CAST(2501.25 AS Numeric(18, 2)), CAST(N'1974-10-21T00:00:00.000' AS DateTime), 14, CAST(11.94 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (97, N'Karen Correia Carvalho', 60, 20, CAST(3605.00 AS Numeric(18, 2)), CAST(N'1991-04-11T00:00:00.000' AS DateTime), 21, CAST(18.03 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (98, N'Eduardo Rocha Araujo', 53, 20, CAST(2752.00 AS Numeric(18, 2)), CAST(N'1994-02-18T00:00:00.000' AS DateTime), 10, CAST(13.51 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (99, N'Isabela Lima Silva', 7, 20, CAST(2731.00 AS Numeric(18, 2)), CAST(N'1990-09-18T00:00:00.000' AS DateTime), 4, CAST(11.17 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (100, N'Caio Cavalcanti Nunes', 11, 14, CAST(3088.75 AS Numeric(18, 2)), CAST(N'1970-11-16T00:00:00.000' AS DateTime), 19, CAST(13.90 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (101, N'Fernanda Monteiro Martins', 14, 19, CAST(11163.60 AS Numeric(18, 2)), CAST(N'1994-10-25T00:00:00.000' AS DateTime), 25, CAST(47.19 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (102, N'Diego Almeida Batista', 15, 8, CAST(9830.00 AS Numeric(18, 2)), CAST(N'1976-12-25T00:00:00.000' AS DateTime), 11, CAST(45.58 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (103, N'Patricia Silva Lima', 69, 10, CAST(3779.00 AS Numeric(18, 2)), CAST(N'1974-09-04T00:00:00.000' AS DateTime), 2, CAST(17.86 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (104, N'Diego Araujo Barbosa', 73, 6, CAST(4011.25 AS Numeric(18, 2)), CAST(N'1979-07-26T00:00:00.000' AS DateTime), 16, CAST(18.78 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (105, N'Vinicius Pereira Nunes', 80, 15, CAST(5961.20 AS Numeric(18, 2)), CAST(N'1996-03-01T00:00:00.000' AS DateTime), 24, CAST(24.39 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (106, N'Andre Ferreira Monteiro', NULL, 13, CAST(5620.00 AS Numeric(18, 2)), CAST(N'1968-07-07T00:00:00.000' AS DateTime), 17, CAST(23.50 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (107, N'Fernanda Mendes Correia', NULL, 3, CAST(8372.50 AS Numeric(18, 2)), CAST(N'1993-11-21T00:00:00.000' AS DateTime), 11, CAST(39.96 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (108, N'Juliana Souza Lima', NULL, 13, CAST(3382.00 AS Numeric(18, 2)), CAST(N'1986-10-16T00:00:00.000' AS DateTime), 7, CAST(16.14 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (109, N'Carla Teixeira Almeida', 101, 9, CAST(8657.50 AS Numeric(18, 2)), CAST(N'1986-11-08T00:00:00.000' AS DateTime), 18, CAST(40.14 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (110, N'Larissa Nunes Campos', 89, 10, CAST(7923.00 AS Numeric(18, 2)), CAST(N'1992-09-18T00:00:00.000' AS DateTime), 8, CAST(38.17 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (111, N'Igor Teixeira Dias', 44, 11, CAST(3060.00 AS Numeric(18, 2)), CAST(N'1975-07-02T00:00:00.000' AS DateTime), 20, CAST(13.77 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (112, N'Vinicius Gomes Cavalcanti', 74, 13, CAST(14740.20 AS Numeric(18, 2)), CAST(N'1971-10-22T00:00:00.000' AS DateTime), 29, CAST(61.64 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (113, N'Tatiane Moreira Costa', NULL, 13, CAST(3500.00 AS Numeric(18, 2)), CAST(N'1994-07-30T00:00:00.000' AS DateTime), 7, CAST(14.32 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (114, N'Tatiane Batista Monteiro', 11, 18, CAST(4406.25 AS Numeric(18, 2)), CAST(N'1975-03-16T00:00:00.000' AS DateTime), 15, CAST(21.23 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (115, N'Gabriel Freitas Barbosa', NULL, 5, CAST(6471.00 AS Numeric(18, 2)), CAST(N'1982-07-29T00:00:00.000' AS DateTime), 10, CAST(29.71 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (116, N'Larissa Cardoso Almeida', 55, 11, CAST(5537.50 AS Numeric(18, 2)), CAST(N'1970-10-30T00:00:00.000' AS DateTime), 14, CAST(23.16 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (117, N'Felipe Almeida Moreira', NULL, 16, CAST(3580.00 AS Numeric(18, 2)), CAST(N'1969-01-09T00:00:00.000' AS DateTime), 18, CAST(17.74 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (118, N'Bruno Dias Araujo', 66, 15, CAST(4612.50 AS Numeric(18, 2)), CAST(N'1997-08-06T00:00:00.000' AS DateTime), 17, CAST(22.64 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (119, N'Renata Teixeira Carvalho', NULL, 1, CAST(10946.25 AS Numeric(18, 2)), CAST(N'1999-08-11T00:00:00.000' AS DateTime), 13, CAST(52.24 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (120, N'Vinicius Rodrigues Freitas', 12, 4, CAST(9966.60 AS Numeric(18, 2)), CAST(N'1977-12-15T00:00:00.000' AS DateTime), 29, CAST(44.85 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (121, N'Vanessa Rocha Moura', 73, 7, CAST(7345.80 AS Numeric(18, 2)), CAST(N'1978-03-20T00:00:00.000' AS DateTime), 24, CAST(34.06 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (122, N'Renata Gomes Batista', 100, 2, CAST(5504.80 AS Numeric(18, 2)), CAST(N'1967-12-22T00:00:00.000' AS DateTime), 23, CAST(26.27 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (123, N'Rafael Cardoso Cavalcanti', NULL, 3, CAST(11365.20 AS Numeric(18, 2)), CAST(N'1986-03-11T00:00:00.000' AS DateTime), 23, CAST(48.04 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (124, N'Elaine Almeida Martins', NULL, 5, CAST(3492.00 AS Numeric(18, 2)), CAST(N'1967-11-02T00:00:00.000' AS DateTime), 30, CAST(15.24 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (125, N'Igor Nunes Oliveira', NULL, 11, CAST(4652.00 AS Numeric(18, 2)), CAST(N'2003-06-09T00:00:00.000' AS DateTime), 1, CAST(19.24 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (126, N'Andre Costa Cardoso', 86, 15, CAST(2311.00 AS Numeric(18, 2)), CAST(N'1984-11-10T00:00:00.000' AS DateTime), 4, CAST(11.45 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (127, N'Tatiane Dias Cardoso', 71, 19, CAST(3532.00 AS Numeric(18, 2)), CAST(N'1972-12-08T00:00:00.000' AS DateTime), 4, CAST(14.77 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (128, N'Lucas Rodrigues Ferreira', 56, 9, CAST(3730.00 AS Numeric(18, 2)), CAST(N'1987-12-01T00:00:00.000' AS DateTime), 20, CAST(17.29 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (129, N'Karen Silva Oliveira', NULL, 3, CAST(7345.80 AS Numeric(18, 2)), CAST(N'1985-09-01T00:00:00.000' AS DateTime), 26, CAST(33.39 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (130, N'Caio Cavalcanti Oliveira', NULL, 16, CAST(5751.20 AS Numeric(18, 2)), CAST(N'1968-05-16T00:00:00.000' AS DateTime), 22, CAST(24.57 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (131, N'Andre Lima Cavalcanti', NULL, 17, CAST(2542.40 AS Numeric(18, 2)), CAST(N'1974-11-01T00:00:00.000' AS DateTime), 21, CAST(11.44 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (132, N'Eduardo Monteiro Cardoso', 20, 8, CAST(5310.00 AS Numeric(18, 2)), CAST(N'1981-12-21T00:00:00.000' AS DateTime), 3, CAST(22.21 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (133, N'Joao Correia Cavalcanti', NULL, 4, CAST(2283.00 AS Numeric(18, 2)), CAST(N'1991-05-19T00:00:00.000' AS DateTime), 2, CAST(9.86 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (134, N'Karen Santos Moreira', NULL, 8, CAST(6350.00 AS Numeric(18, 2)), CAST(N'1977-09-13T00:00:00.000' AS DateTime), 10, CAST(26.27 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (135, N'Otavio Gomes Moreira', 93, 16, CAST(6210.40 AS Numeric(18, 2)), CAST(N'1976-06-06T00:00:00.000' AS DateTime), 26, CAST(26.82 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (136, N'Natalia Moura Lima', NULL, 4, CAST(5266.80 AS Numeric(18, 2)), CAST(N'1968-09-04T00:00:00.000' AS DateTime), 29, CAST(23.22 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (137, N'Vanessa Freitas Mendes', 15, 14, CAST(4155.20 AS Numeric(18, 2)), CAST(N'1979-12-21T00:00:00.000' AS DateTime), 24, CAST(18.51 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (138, N'Natalia Costa Barbosa', 47, 20, CAST(11651.40 AS Numeric(18, 2)), CAST(N'1997-03-03T00:00:00.000' AS DateTime), 29, CAST(52.43 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (139, N'Renata Oliveira Nunes', NULL, 2, CAST(2786.00 AS Numeric(18, 2)), CAST(N'1994-12-03T00:00:00.000' AS DateTime), 8, CAST(11.90 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (140, N'Patricia Freitas Oliveira', 134, 3, CAST(5778.00 AS Numeric(18, 2)), CAST(N'1996-05-27T00:00:00.000' AS DateTime), 9, CAST(23.64 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (141, N'Larissa Nunes Barbosa', 88, 20, CAST(7483.00 AS Numeric(18, 2)), CAST(N'1996-09-30T00:00:00.000' AS DateTime), 8, CAST(36.05 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (142, N'Natalia Rocha Moura', 123, 14, CAST(7923.75 AS Numeric(18, 2)), CAST(N'1993-02-17T00:00:00.000' AS DateTime), 11, CAST(32.78 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (143, N'Felipe Monteiro Pereira', NULL, 8, CAST(14463.00 AS Numeric(18, 2)), CAST(N'1970-01-30T00:00:00.000' AS DateTime), 27, CAST(59.82 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (144, N'Caio Barbosa Correia', 70, 12, CAST(6383.75 AS Numeric(18, 2)), CAST(N'1974-10-10T00:00:00.000' AS DateTime), 19, CAST(29.60 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (145, N'Mariana Gomes Mendes', NULL, 2, CAST(5997.50 AS Numeric(18, 2)), CAST(N'1970-12-10T00:00:00.000' AS DateTime), 12, CAST(29.71 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (146, N'Patricia Correia Moura', NULL, 7, CAST(7589.00 AS Numeric(18, 2)), CAST(N'1967-02-13T00:00:00.000' AS DateTime), 4, CAST(31.39 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (147, N'Marcos Monteiro Araujo', 116, 8, CAST(2254.00 AS Numeric(18, 2)), CAST(N'1976-12-28T00:00:00.000' AS DateTime), 2, CAST(10.25 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (148, N'Lucas Rodrigues Santos', 25, 3, CAST(8118.60 AS Numeric(18, 2)), CAST(N'1973-08-09T00:00:00.000' AS DateTime), 22, CAST(38.38 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (149, N'Andre Cavalcanti Cardoso', 139, 7, CAST(7108.75 AS Numeric(18, 2)), CAST(N'1985-06-19T00:00:00.000' AS DateTime), 14, CAST(32.96 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (150, N'Ana Ferreira Araujo', 121, 20, CAST(3380.40 AS Numeric(18, 2)), CAST(N'1999-11-17T00:00:00.000' AS DateTime), 28, CAST(16.59 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (151, N'Thiago Martins Souza', 123, 20, CAST(4547.20 AS Numeric(18, 2)), CAST(N'1999-10-16T00:00:00.000' AS DateTime), 25, CAST(20.46 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (152, N'William Cardoso Nunes', 9, 3, CAST(2002.00 AS Numeric(18, 2)), CAST(N'1981-06-23T00:00:00.000' AS DateTime), 7, CAST(9.10 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (153, N'Gabriel Araujo Mendes', 78, 11, CAST(8150.00 AS Numeric(18, 2)), CAST(N'1999-08-31T00:00:00.000' AS DateTime), 16, CAST(35.19 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (154, N'Eduardo Monteiro Martins', 11, 19, CAST(10873.75 AS Numeric(18, 2)), CAST(N'1991-03-09T00:00:00.000' AS DateTime), 12, CAST(51.90 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (155, N'Joao Teixeira Batista', 4, 4, CAST(8166.25 AS Numeric(18, 2)), CAST(N'1969-11-17T00:00:00.000' AS DateTime), 13, CAST(37.12 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (156, N'Sabrina Pereira Carvalho', 72, 15, CAST(5682.00 AS Numeric(18, 2)), CAST(N'1999-08-31T00:00:00.000' AS DateTime), 7, CAST(26.86 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (157, N'Rafael Silva Lima', 100, 6, CAST(2530.00 AS Numeric(18, 2)), CAST(N'1975-05-01T00:00:00.000' AS DateTime), 20, CAST(10.93 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (158, N'Yasmin Ribeiro Barbosa', 48, 20, CAST(5254.20 AS Numeric(18, 2)), CAST(N'2001-10-21T00:00:00.000' AS DateTime), 30, CAST(22.45 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (159, N'Caio Dias Martins', 21, 4, CAST(10393.75 AS Numeric(18, 2)), CAST(N'1985-03-20T00:00:00.000' AS DateTime), 20, CAST(42.52 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (160, N'Elaine Moreira Souza', 31, 6, CAST(5476.00 AS Numeric(18, 2)), CAST(N'1967-12-05T00:00:00.000' AS DateTime), 7, CAST(26.63 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (161, N'Tatiane Rocha Gomes', 107, 15, CAST(3169.60 AS Numeric(18, 2)), CAST(N'1970-06-13T00:00:00.000' AS DateTime), 25, CAST(13.54 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (162, N'Larissa Correia Carvalho', 17, 13, CAST(7561.00 AS Numeric(18, 2)), CAST(N'2002-11-27T00:00:00.000' AS DateTime), 6, CAST(33.68 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (163, N'Patricia Campos Moura', 92, 2, CAST(9841.25 AS Numeric(18, 2)), CAST(N'1995-07-16T00:00:00.000' AS DateTime), 15, CAST(48.76 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (164, N'Otavio Ferreira Correia', NULL, 17, CAST(13118.40 AS Numeric(18, 2)), CAST(N'2003-03-03T00:00:00.000' AS DateTime), 29, CAST(53.67 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (165, N'Gabriel Martins Mendes', NULL, 19, CAST(10067.40 AS Numeric(18, 2)), CAST(N'1980-12-05T00:00:00.000' AS DateTime), 30, CAST(42.10 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (166, N'William Monteiro Dias', 101, 3, CAST(2541.25 AS Numeric(18, 2)), CAST(N'1986-07-24T00:00:00.000' AS DateTime), 17, CAST(11.55 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (167, N'Vinicius Martins Silva', NULL, 12, CAST(8756.00 AS Numeric(18, 2)), CAST(N'1969-06-24T00:00:00.000' AS DateTime), 1, CAST(36.22 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (168, N'Carla Dias Santos', 63, 13, CAST(7741.25 AS Numeric(18, 2)), CAST(N'1997-04-17T00:00:00.000' AS DateTime), 11, CAST(34.84 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (169, N'Yasmin Costa Rocha', 48, 9, CAST(14677.20 AS Numeric(18, 2)), CAST(N'1976-03-03T00:00:00.000' AS DateTime), 28, CAST(60.04 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (170, N'Juliana Costa Dias', 126, 11, CAST(8674.00 AS Numeric(18, 2)), CAST(N'1975-08-09T00:00:00.000' AS DateTime), 1, CAST(42.58 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (171, N'Igor Nunes Gomes', 116, 20, CAST(7120.00 AS Numeric(18, 2)), CAST(N'1973-07-04T00:00:00.000' AS DateTime), 14, CAST(31.07 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (172, N'Eduardo Lima Rocha', 71, 11, CAST(7648.20 AS Numeric(18, 2)), CAST(N'1986-01-26T00:00:00.000' AS DateTime), 25, CAST(32.68 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (173, N'Andre Barbosa Souza', 54, 1, CAST(15418.80 AS Numeric(18, 2)), CAST(N'1978-03-07T00:00:00.000' AS DateTime), 29, CAST(75.69 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (174, N'Beatriz Lima Freitas', 10, 1, CAST(6980.00 AS Numeric(18, 2)), CAST(N'2000-09-15T00:00:00.000' AS DateTime), 9, CAST(30.14 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (175, N'Thiago Carvalho Silva', 126, 15, CAST(4429.80 AS Numeric(18, 2)), CAST(N'1970-03-16T00:00:00.000' AS DateTime), 30, CAST(19.73 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (176, N'Vinicius Lima Almeida', NULL, 3, CAST(5030.00 AS Numeric(18, 2)), CAST(N'1976-09-28T00:00:00.000' AS DateTime), 12, CAST(21.72 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (177, N'Bruno Monteiro Pereira', NULL, 1, CAST(6828.00 AS Numeric(18, 2)), CAST(N'1989-03-22T00:00:00.000' AS DateTime), 7, CAST(28.55 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (178, N'Renata Lima Souza', NULL, 3, CAST(5551.00 AS Numeric(18, 2)), CAST(N'1970-05-16T00:00:00.000' AS DateTime), 21, CAST(26.75 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (179, N'Gustavo Ferreira Batista', NULL, 3, CAST(7558.00 AS Numeric(18, 2)), CAST(N'1993-09-28T00:00:00.000' AS DateTime), 4, CAST(36.76 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (180, N'Fernanda Dias Lima', NULL, 8, CAST(4406.00 AS Numeric(18, 2)), CAST(N'1992-01-18T00:00:00.000' AS DateTime), 3, CAST(18.02 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (181, N'Ana Martins Araujo', NULL, 2, CAST(15631.20 AS Numeric(18, 2)), CAST(N'1987-03-15T00:00:00.000' AS DateTime), 29, CAST(68.92 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (182, N'Sabrina Pereira Moura', 15, 14, CAST(15516.00 AS Numeric(18, 2)), CAST(N'1970-09-12T00:00:00.000' AS DateTime), 28, CAST(69.82 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (183, N'Mariana Oliveira Dias', 137, 1, CAST(3925.00 AS Numeric(18, 2)), CAST(N'1993-08-17T00:00:00.000' AS DateTime), 17, CAST(16.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (184, N'Yasmin Teixeira Barbosa', 6, 4, CAST(10529.40 AS Numeric(18, 2)), CAST(N'1972-11-10T00:00:00.000' AS DateTime), 26, CAST(45.95 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (185, N'Renata Moreira Freitas', 66, 10, CAST(8256.00 AS Numeric(18, 2)), CAST(N'1997-04-15T00:00:00.000' AS DateTime), 3, CAST(34.90 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (186, N'Gustavo Souza Moreira', 106, 8, CAST(4213.00 AS Numeric(18, 2)), CAST(N'1970-09-04T00:00:00.000' AS DateTime), 10, CAST(21.07 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (187, N'Ana Rodrigues Cardoso', 6, 15, CAST(8055.00 AS Numeric(18, 2)), CAST(N'1998-12-05T00:00:00.000' AS DateTime), 13, CAST(38.81 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (188, N'Carla Rodrigues Rodrigues', 160, 5, CAST(2427.50 AS Numeric(18, 2)), CAST(N'2002-10-10T00:00:00.000' AS DateTime), 11, CAST(12.14 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (189, N'Lucas Martins Monteiro', 173, 16, CAST(9381.25 AS Numeric(18, 2)), CAST(N'1995-04-13T00:00:00.000' AS DateTime), 11, CAST(43.07 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (190, N'Beatriz Araujo Rodrigues', 11, 9, CAST(4516.25 AS Numeric(18, 2)), CAST(N'1979-04-22T00:00:00.000' AS DateTime), 20, CAST(22.38 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (191, N'Carla Barbosa Costa', 125, 20, CAST(7218.75 AS Numeric(18, 2)), CAST(N'1978-07-30T00:00:00.000' AS DateTime), 12, CAST(31.50 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (192, N'Nicole Araujo Ferreira', 190, 17, CAST(2272.00 AS Numeric(18, 2)), CAST(N'1986-06-04T00:00:00.000' AS DateTime), 1, CAST(10.33 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (193, N'Isabela Almeida Nunes', 172, 3, CAST(8762.50 AS Numeric(18, 2)), CAST(N'1966-02-23T00:00:00.000' AS DateTime), 19, CAST(36.24 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (194, N'Natalia Mendes Oliveira', 187, 8, CAST(3112.20 AS Numeric(18, 2)), CAST(N'1978-09-17T00:00:00.000' AS DateTime), 22, CAST(15.28 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (195, N'Yasmin Campos Lima', 9, 8, CAST(2727.20 AS Numeric(18, 2)), CAST(N'1987-10-27T00:00:00.000' AS DateTime), 21, CAST(13.39 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (196, N'Natalia Correia Campos', 73, 9, CAST(8330.00 AS Numeric(18, 2)), CAST(N'1976-09-06T00:00:00.000' AS DateTime), 13, CAST(37.49 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (197, N'Otavio Pereira Monteiro', 39, 16, CAST(3961.25 AS Numeric(18, 2)), CAST(N'1976-03-21T00:00:00.000' AS DateTime), 15, CAST(18.91 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (198, N'Andre Nunes Moura', NULL, 10, CAST(5480.00 AS Numeric(18, 2)), CAST(N'1992-09-16T00:00:00.000' AS DateTime), 3, CAST(26.65 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (199, N'Marcos Batista Cavalcanti', NULL, 6, CAST(6202.00 AS Numeric(18, 2)), CAST(N'2003-04-11T00:00:00.000' AS DateTime), 7, CAST(30.73 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (200, N'Rafael Ferreira Mendes', NULL, 18, CAST(4260.00 AS Numeric(18, 2)), CAST(N'1984-08-10T00:00:00.000' AS DateTime), 12, CAST(18.78 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (201, N'Bruno Campos Carvalho', 51, 19, CAST(8355.60 AS Numeric(18, 2)), CAST(N'1970-11-10T00:00:00.000' AS DateTime), 30, CAST(41.78 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (202, N'Paulo Moura Batista', 190, 14, CAST(6765.00 AS Numeric(18, 2)), CAST(N'1994-01-20T00:00:00.000' AS DateTime), 4, CAST(32.60 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (203, N'Larissa Monteiro Batista', 94, 10, CAST(8631.00 AS Numeric(18, 2)), CAST(N'1998-02-24T00:00:00.000' AS DateTime), 23, CAST(38.84 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (204, N'Helena Mendes Dias', 112, 17, CAST(8467.00 AS Numeric(18, 2)), CAST(N'1989-06-11T00:00:00.000' AS DateTime), 5, CAST(40.80 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (205, N'Sergio Rodrigues Lima', 110, 7, CAST(9736.25 AS Numeric(18, 2)), CAST(N'2000-02-05T00:00:00.000' AS DateTime), 18, CAST(46.91 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (206, N'Ana Campos Monteiro', 138, 17, CAST(8622.00 AS Numeric(18, 2)), CAST(N'1975-04-15T00:00:00.000' AS DateTime), 27, CAST(40.37 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (207, N'Marcos Costa Correia', NULL, 7, CAST(3213.75 AS Numeric(18, 2)), CAST(N'1998-08-08T00:00:00.000' AS DateTime), 19, CAST(14.75 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (208, N'Andre Nunes Pereira', 45, 5, CAST(11568.60 AS Numeric(18, 2)), CAST(N'2000-08-06T00:00:00.000' AS DateTime), 29, CAST(57.32 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (209, N'Sabrina Rocha Mendes', 10, 15, CAST(8762.50 AS Numeric(18, 2)), CAST(N'1992-12-26T00:00:00.000' AS DateTime), 15, CAST(41.02 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (210, N'Joao Lima Ferreira', 77, 14, CAST(8883.00 AS Numeric(18, 2)), CAST(N'1977-12-18T00:00:00.000' AS DateTime), 22, CAST(37.55 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (211, N'Marcos Mendes Moreira', 69, 10, CAST(3287.00 AS Numeric(18, 2)), CAST(N'1995-07-11T00:00:00.000' AS DateTime), 4, CAST(14.19 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (212, N'Paulo Pereira Cavalcanti', 184, 8, CAST(7848.00 AS Numeric(18, 2)), CAST(N'2001-04-28T00:00:00.000' AS DateTime), 3, CAST(32.11 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (213, N'Thiago Moreira Ferreira', NULL, 5, CAST(3691.00 AS Numeric(18, 2)), CAST(N'1983-09-05T00:00:00.000' AS DateTime), 10, CAST(16.78 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (214, N'Lucas Teixeira Monteiro', 173, 8, CAST(7116.20 AS Numeric(18, 2)), CAST(N'1974-08-06T00:00:00.000' AS DateTime), 21, CAST(30.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (215, N'Renata Rocha Martins', 211, 10, CAST(6669.00 AS Numeric(18, 2)), CAST(N'1996-01-09T00:00:00.000' AS DateTime), 29, CAST(30.92 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (216, N'Vanessa Dias Oliveira', 87, 19, CAST(10159.80 AS Numeric(18, 2)), CAST(N'1969-04-27T00:00:00.000' AS DateTime), 23, CAST(42.02 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (217, N'Fernanda Nunes Campos', NULL, 11, CAST(4122.50 AS Numeric(18, 2)), CAST(N'1976-10-11T00:00:00.000' AS DateTime), 15, CAST(20.24 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (218, N'Isabela Gomes Souza', 52, 20, CAST(10281.25 AS Numeric(18, 2)), CAST(N'1984-07-31T00:00:00.000' AS DateTime), 18, CAST(48.60 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (219, N'Paulo Mendes Martins', NULL, 16, CAST(6656.00 AS Numeric(18, 2)), CAST(N'1990-12-18T00:00:00.000' AS DateTime), 2, CAST(33.28 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (220, N'Juliana Teixeira Monteiro', 170, 15, CAST(2056.00 AS Numeric(18, 2)), CAST(N'2002-11-22T00:00:00.000' AS DateTime), 9, CAST(9.53 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (221, N'Caio Almeida Moura', 143, 18, CAST(2076.00 AS Numeric(18, 2)), CAST(N'2000-11-10T00:00:00.000' AS DateTime), 1, CAST(9.63 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (222, N'Lucas Souza Cardoso', 57, 8, CAST(2684.00 AS Numeric(18, 2)), CAST(N'1978-12-21T00:00:00.000' AS DateTime), 10, CAST(13.18 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (223, N'Sergio Santos Souza', 8, 8, CAST(14380.20 AS Numeric(18, 2)), CAST(N'1969-07-01T00:00:00.000' AS DateTime), 27, CAST(70.59 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (224, N'Gustavo Freitas Teixeira', 17, 1, CAST(3365.00 AS Numeric(18, 2)), CAST(N'1973-11-17T00:00:00.000' AS DateTime), 9, CAST(14.99 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (225, N'Igor Ferreira Teixeira', 3, 4, CAST(1897.00 AS Numeric(18, 2)), CAST(N'2003-07-15T00:00:00.000' AS DateTime), 1, CAST(8.11 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (226, N'Daniel Carvalho Rocha', 157, 15, CAST(4674.00 AS Numeric(18, 2)), CAST(N'1996-11-24T00:00:00.000' AS DateTime), 10, CAST(22.31 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (227, N'Sabrina Rodrigues Barbosa', 175, 16, CAST(6007.40 AS Numeric(18, 2)), CAST(N'1985-02-17T00:00:00.000' AS DateTime), 26, CAST(29.76 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (228, N'Sabrina Monteiro Mendes', 192, 9, CAST(3267.50 AS Numeric(18, 2)), CAST(N'1980-06-11T00:00:00.000' AS DateTime), 18, CAST(13.81 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (229, N'Fernanda Araujo Pereira', 136, 15, CAST(6168.40 AS Numeric(18, 2)), CAST(N'2003-11-04T00:00:00.000' AS DateTime), 21, CAST(30.84 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (230, N'Sabrina Cavalcanti Costa', NULL, 8, CAST(5945.00 AS Numeric(18, 2)), CAST(N'1978-07-20T00:00:00.000' AS DateTime), 20, CAST(29.45 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (231, N'Carla Moreira Oliveira', 120, 20, CAST(9954.00 AS Numeric(18, 2)), CAST(N'1998-08-10T00:00:00.000' AS DateTime), 30, CAST(42.53 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (232, N'Igor Freitas Silva', NULL, 6, CAST(2861.25 AS Numeric(18, 2)), CAST(N'1985-06-08T00:00:00.000' AS DateTime), 18, CAST(13.79 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (233, N'Andre Moura Pereira', NULL, 6, CAST(2300.00 AS Numeric(18, 2)), CAST(N'1988-08-02T00:00:00.000' AS DateTime), 17, CAST(10.87 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (234, N'Nicole Batista Lima', 13, 18, CAST(11405.80 AS Numeric(18, 2)), CAST(N'1967-09-16T00:00:00.000' AS DateTime), 23, CAST(55.99 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (235, N'Marcos Silva Cardoso', 85, 10, CAST(2694.00 AS Numeric(18, 2)), CAST(N'1979-08-10T00:00:00.000' AS DateTime), 5, CAST(12.12 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (236, N'Carla Moreira Carvalho', NULL, 11, CAST(8022.00 AS Numeric(18, 2)), CAST(N'2003-04-04T00:00:00.000' AS DateTime), 22, CAST(34.28 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (237, N'Beatriz Almeida Moura', 164, 17, CAST(6926.25 AS Numeric(18, 2)), CAST(N'1996-09-06T00:00:00.000' AS DateTime), 17, CAST(34.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (238, N'Nicole Almeida Carvalho', 12, 8, CAST(7860.00 AS Numeric(18, 2)), CAST(N'1982-01-20T00:00:00.000' AS DateTime), 17, CAST(35.73 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (239, N'Vanessa Lima Souza', NULL, 15, CAST(3740.00 AS Numeric(18, 2)), CAST(N'1967-11-14T00:00:00.000' AS DateTime), 14, CAST(17.68 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (240, N'Diego Moreira Nunes', 202, 3, CAST(4692.00 AS Numeric(18, 2)), CAST(N'1981-12-22T00:00:00.000' AS DateTime), 10, CAST(20.05 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (241, N'Lucas Teixeira Cardoso', 57, 8, CAST(2763.75 AS Numeric(18, 2)), CAST(N'1969-07-08T00:00:00.000' AS DateTime), 13, CAST(11.56 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (242, N'Vanessa Mendes Santos', NULL, 2, CAST(11443.60 AS Numeric(18, 2)), CAST(N'1966-04-04T00:00:00.000' AS DateTime), 25, CAST(49.94 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (243, N'Nicole Mendes Rodrigues', NULL, 7, CAST(4132.00 AS Numeric(18, 2)), CAST(N'1997-03-21T00:00:00.000' AS DateTime), 8, CAST(17.47 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (244, N'Patricia Souza Cavalcanti', 228, 8, CAST(7034.40 AS Numeric(18, 2)), CAST(N'1996-10-27T00:00:00.000' AS DateTime), 28, CAST(29.74 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (245, N'Sabrina Carvalho Souza', NULL, 9, CAST(3237.00 AS Numeric(18, 2)), CAST(N'1988-02-28T00:00:00.000' AS DateTime), 1, CAST(15.01 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (246, N'Joao Carvalho Nunes', 164, 3, CAST(5977.50 AS Numeric(18, 2)), CAST(N'1972-10-01T00:00:00.000' AS DateTime), 20, CAST(26.36 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (247, N'Gustavo Lima Araujo', 243, 1, CAST(5150.00 AS Numeric(18, 2)), CAST(N'1980-02-10T00:00:00.000' AS DateTime), 6, CAST(21.54 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (248, N'Gustavo Oliveira Campos', 247, 12, CAST(2259.00 AS Numeric(18, 2)), CAST(N'1994-08-23T00:00:00.000' AS DateTime), 8, CAST(11.09 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (249, N'Beatriz Campos Dias', 29, 14, CAST(8201.20 AS Numeric(18, 2)), CAST(N'1993-07-22T00:00:00.000' AS DateTime), 21, CAST(37.28 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (250, N'Tatiane Ribeiro Oliveira', 200, 12, CAST(5762.50 AS Numeric(18, 2)), CAST(N'1997-06-17T00:00:00.000' AS DateTime), 20, CAST(23.57 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (251, N'Vanessa Correia Teixeira', 192, 16, CAST(6000.40 AS Numeric(18, 2)), CAST(N'1979-10-14T00:00:00.000' AS DateTime), 23, CAST(24.55 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (252, N'Tatiane Moreira Mendes', 144, 9, CAST(4732.50 AS Numeric(18, 2)), CAST(N'1998-09-26T00:00:00.000' AS DateTime), 14, CAST(20.01 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (253, N'Patricia Costa Santos', 248, 14, CAST(3595.00 AS Numeric(18, 2)), CAST(N'1983-10-04T00:00:00.000' AS DateTime), 18, CAST(17.32 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (254, N'Thiago Carvalho Moura', 141, 16, CAST(5598.00 AS Numeric(18, 2)), CAST(N'1998-09-16T00:00:00.000' AS DateTime), 28, CAST(24.43 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (255, N'Daniel Carvalho Batista', 66, 5, CAST(8228.00 AS Numeric(18, 2)), CAST(N'1989-09-11T00:00:00.000' AS DateTime), 10, CAST(35.53 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (256, N'Nicole Rocha Ribeiro', 166, 20, CAST(6099.80 AS Numeric(18, 2)), CAST(N'1991-05-20T00:00:00.000' AS DateTime), 22, CAST(28.28 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (257, N'Helena Silva Barbosa', 107, 4, CAST(9390.00 AS Numeric(18, 2)), CAST(N'2003-11-28T00:00:00.000' AS DateTime), 14, CAST(44.82 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (258, N'Lucas Costa Rodrigues', 206, 3, CAST(6303.00 AS Numeric(18, 2)), CAST(N'1970-01-28T00:00:00.000' AS DateTime), 6, CAST(25.79 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (259, N'Karen Souza Rocha', NULL, 16, CAST(3359.00 AS Numeric(18, 2)), CAST(N'1981-06-03T00:00:00.000' AS DateTime), 7, CAST(14.35 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (260, N'Joao Gomes Freitas', 115, 11, CAST(3706.00 AS Numeric(18, 2)), CAST(N'1986-08-25T00:00:00.000' AS DateTime), 10, CAST(16.51 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (261, N'Otavio Monteiro Silva', 257, 4, CAST(4742.50 AS Numeric(18, 2)), CAST(N'1973-05-22T00:00:00.000' AS DateTime), 14, CAST(22.20 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (262, N'Marcos Correia Ribeiro', NULL, 1, CAST(4859.00 AS Numeric(18, 2)), CAST(N'1989-06-16T00:00:00.000' AS DateTime), 3, CAST(23.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (263, N'Sabrina Nunes Freitas', 164, 7, CAST(3067.50 AS Numeric(18, 2)), CAST(N'1999-12-07T00:00:00.000' AS DateTime), 18, CAST(12.55 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (264, N'Caio Moura Barbosa', 20, 17, CAST(13534.20 AS Numeric(18, 2)), CAST(N'1975-04-26T00:00:00.000' AS DateTime), 28, CAST(55.98 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (265, N'Carla Martins Pereira', 215, 5, CAST(3904.60 AS Numeric(18, 2)), CAST(N'1975-11-16T00:00:00.000' AS DateTime), 22, CAST(16.15 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (266, N'Igor Barbosa Carvalho', 186, 12, CAST(4726.25 AS Numeric(18, 2)), CAST(N'1968-04-20T00:00:00.000' AS DateTime), 13, CAST(21.48 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (267, N'Patricia Dias Correia', 5, 8, CAST(4937.50 AS Numeric(18, 2)), CAST(N'1990-02-06T00:00:00.000' AS DateTime), 13, CAST(20.65 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (268, N'Yasmin Moura Campos', 198, 12, CAST(8443.75 AS Numeric(18, 2)), CAST(N'1995-05-02T00:00:00.000' AS DateTime), 17, CAST(38.38 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (269, N'Andre Pereira Ribeiro', 48, 6, CAST(8587.50 AS Numeric(18, 2)), CAST(N'1973-02-22T00:00:00.000' AS DateTime), 20, CAST(37.86 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (270, N'Isabela Teixeira Araujo', 58, 8, CAST(8536.00 AS Numeric(18, 2)), CAST(N'1977-09-15T00:00:00.000' AS DateTime), 10, CAST(36.08 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (271, N'Vinicius Freitas Dias', 36, 9, CAST(10137.60 AS Numeric(18, 2)), CAST(N'1973-11-18T00:00:00.000' AS DateTime), 28, CAST(41.93 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (272, N'Diego Ferreira Freitas', 162, 13, CAST(6347.00 AS Numeric(18, 2)), CAST(N'2002-10-04T00:00:00.000' AS DateTime), 3, CAST(29.43 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (273, N'Mariana Ferreira Araujo', 137, 7, CAST(5543.75 AS Numeric(18, 2)), CAST(N'1982-08-25T00:00:00.000' AS DateTime), 11, CAST(25.70 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (274, N'Juliana Ribeiro Cavalcanti', 145, 13, CAST(10742.40 AS Numeric(18, 2)), CAST(N'1973-10-27T00:00:00.000' AS DateTime), 30, CAST(46.88 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (275, N'Yasmin Campos Rodrigues', NULL, 20, CAST(4683.00 AS Numeric(18, 2)), CAST(N'1977-06-02T00:00:00.000' AS DateTime), 26, CAST(22.99 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (276, N'Beatriz Lima Santos', 251, 7, CAST(13456.80 AS Numeric(18, 2)), CAST(N'1972-02-27T00:00:00.000' AS DateTime), 30, CAST(56.27 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (277, N'Paulo Moura Campos', 201, 17, CAST(4655.00 AS Numeric(18, 2)), CAST(N'1992-05-16T00:00:00.000' AS DateTime), 17, CAST(21.16 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (278, N'Joao Dias Batista', 228, 1, CAST(15589.80 AS Numeric(18, 2)), CAST(N'1989-09-23T00:00:00.000' AS DateTime), 27, CAST(68.03 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (279, N'Daniel Campos Barbosa', 5, 10, CAST(11138.40 AS Numeric(18, 2)), CAST(N'1985-09-25T00:00:00.000' AS DateTime), 22, CAST(49.11 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (280, N'Juliana Moura Ferreira', 1, 17, CAST(5446.00 AS Numeric(18, 2)), CAST(N'1967-01-01T00:00:00.000' AS DateTime), 9, CAST(25.99 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (281, N'Igor Nunes Nunes', 170, 14, CAST(5091.80 AS Numeric(18, 2)), CAST(N'1966-03-01T00:00:00.000' AS DateTime), 24, CAST(24.07 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (282, N'Thiago Nunes Ferreira', 121, 15, CAST(3078.75 AS Numeric(18, 2)), CAST(N'2001-03-12T00:00:00.000' AS DateTime), 19, CAST(12.59 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (283, N'Vanessa Correia Santos', NULL, 11, CAST(8245.00 AS Numeric(18, 2)), CAST(N'1981-12-05T00:00:00.000' AS DateTime), 10, CAST(37.10 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (284, N'Joao Barbosa Costa', NULL, 12, CAST(9196.25 AS Numeric(18, 2)), CAST(N'1999-03-07T00:00:00.000' AS DateTime), 17, CAST(41.38 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (285, N'Joao Almeida Araujo', NULL, 2, CAST(4609.00 AS Numeric(18, 2)), CAST(N'1967-08-22T00:00:00.000' AS DateTime), 3, CAST(22.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (286, N'Eduardo Moura Monteiro', NULL, 5, CAST(5067.50 AS Numeric(18, 2)), CAST(N'1996-12-07T00:00:00.000' AS DateTime), 14, CAST(21.88 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (287, N'Carla Correia Rodrigues', 270, 8, CAST(3256.40 AS Numeric(18, 2)), CAST(N'2002-05-12T00:00:00.000' AS DateTime), 25, CAST(15.69 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (288, N'Gabriel Correia Pereira', 281, 4, CAST(8948.75 AS Numeric(18, 2)), CAST(N'1991-09-08T00:00:00.000' AS DateTime), 17, CAST(37.02 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (289, N'Patricia Oliveira Mendes', 227, 4, CAST(2977.50 AS Numeric(18, 2)), CAST(N'1993-10-10T00:00:00.000' AS DateTime), 17, CAST(12.18 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (290, N'Caio Lima Moura', NULL, 2, CAST(4978.75 AS Numeric(18, 2)), CAST(N'1987-12-21T00:00:00.000' AS DateTime), 12, CAST(23.99 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (291, N'Andre Dias Cardoso', 130, 18, CAST(4893.00 AS Numeric(18, 2)), CAST(N'1972-05-16T00:00:00.000' AS DateTime), 9, CAST(24.02 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (292, N'Vanessa Cardoso Souza', NULL, 5, CAST(7530.00 AS Numeric(18, 2)), CAST(N'1968-03-19T00:00:00.000' AS DateTime), 20, CAST(32.17 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (293, N'Andre Gomes Barbosa', 7, 2, CAST(3641.00 AS Numeric(18, 2)), CAST(N'1994-12-11T00:00:00.000' AS DateTime), 5, CAST(16.72 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (294, N'Lucas Teixeira Dias', NULL, 19, CAST(3322.00 AS Numeric(18, 2)), CAST(N'1971-05-18T00:00:00.000' AS DateTime), 8, CAST(14.95 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (295, N'Natalia Carvalho Lima', 53, 8, CAST(6955.00 AS Numeric(18, 2)), CAST(N'1978-04-30T00:00:00.000' AS DateTime), 14, CAST(34.14 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (296, N'Tatiane Araujo Campos', NULL, 4, CAST(12041.40 AS Numeric(18, 2)), CAST(N'1984-11-18T00:00:00.000' AS DateTime), 24, CAST(58.56 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (297, N'Otavio Oliveira Batista', 206, 4, CAST(5769.00 AS Numeric(18, 2)), CAST(N'1970-07-18T00:00:00.000' AS DateTime), 6, CAST(28.06 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (298, N'Igor Pereira Souza', NULL, 9, CAST(2473.75 AS Numeric(18, 2)), CAST(N'1985-11-04T00:00:00.000' AS DateTime), 17, CAST(11.47 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (299, N'William Rodrigues Teixeira', 189, 14, CAST(3360.00 AS Numeric(18, 2)), CAST(N'1986-01-12T00:00:00.000' AS DateTime), 11, CAST(16.80 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (300, N'Helena Mendes Moura', 116, 13, CAST(4843.00 AS Numeric(18, 2)), CAST(N'1996-12-29T00:00:00.000' AS DateTime), 10, CAST(22.89 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (301, N'Felipe Martins Santos', NULL, 6, CAST(6055.00 AS Numeric(18, 2)), CAST(N'1974-08-16T00:00:00.000' AS DateTime), 26, CAST(25.60 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (302, N'Isabela Almeida Lima', NULL, 19, CAST(7500.00 AS Numeric(18, 2)), CAST(N'1973-08-21T00:00:00.000' AS DateTime), 8, CAST(33.07 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (303, N'Sergio Cavalcanti Rodrigues', 166, 11, CAST(4447.80 AS Numeric(18, 2)), CAST(N'1998-05-07T00:00:00.000' AS DateTime), 23, CAST(18.80 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (304, N'Helena Batista Barbosa', 70, 15, CAST(4559.80 AS Numeric(18, 2)), CAST(N'1997-12-05T00:00:00.000' AS DateTime), 23, CAST(21.76 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (305, N'Ana Campos Campos', NULL, 18, CAST(7738.75 AS Numeric(18, 2)), CAST(N'1972-05-05T00:00:00.000' AS DateTime), 19, CAST(37.99 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (306, N'Paulo Lima Cardoso', NULL, 6, CAST(12271.00 AS Numeric(18, 2)), CAST(N'1987-08-05T00:00:00.000' AS DateTime), 22, CAST(61.36 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (307, N'William Santos Silva', 38, 11, CAST(3432.00 AS Numeric(18, 2)), CAST(N'1975-09-28T00:00:00.000' AS DateTime), 3, CAST(15.44 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (308, N'Ana Moreira Barbosa', NULL, 8, CAST(8898.40 AS Numeric(18, 2)), CAST(N'1985-02-17T00:00:00.000' AS DateTime), 22, CAST(38.83 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (309, N'Daniel Carvalho Carvalho', 279, 6, CAST(8603.00 AS Numeric(18, 2)), CAST(N'1991-11-15T00:00:00.000' AS DateTime), 6, CAST(43.02 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (310, N'Isabela Moreira Pereira', 103, 1, CAST(6909.00 AS Numeric(18, 2)), CAST(N'1998-02-08T00:00:00.000' AS DateTime), 9, CAST(33.60 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (311, N'Yasmin Correia Ribeiro', NULL, 12, CAST(10532.50 AS Numeric(18, 2)), CAST(N'1986-02-27T00:00:00.000' AS DateTime), 15, CAST(45.96 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (312, N'Vinicius Oliveira Rocha', NULL, 7, CAST(11557.00 AS Numeric(18, 2)), CAST(N'1966-07-23T00:00:00.000' AS DateTime), 23, CAST(48.33 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (313, N'Rafael Batista Freitas', 260, 13, CAST(3620.00 AS Numeric(18, 2)), CAST(N'1969-02-17T00:00:00.000' AS DateTime), 3, CAST(17.77 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (314, N'Igor Moura Pereira', 307, 3, CAST(7175.00 AS Numeric(18, 2)), CAST(N'1972-11-30T00:00:00.000' AS DateTime), 9, CAST(32.94 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (315, N'Gustavo Campos Almeida', 89, 13, CAST(6556.00 AS Numeric(18, 2)), CAST(N'2004-01-13T00:00:00.000' AS DateTime), 5, CAST(29.80 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (316, N'William Moura Araujo', NULL, 8, CAST(3305.00 AS Numeric(18, 2)), CAST(N'2003-02-17T00:00:00.000' AS DateTime), 11, CAST(16.07 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (317, N'Fernanda Rocha Ferreira', 199, 3, CAST(7342.00 AS Numeric(18, 2)), CAST(N'1990-04-21T00:00:00.000' AS DateTime), 2, CAST(33.04 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (318, N'Paulo Cavalcanti Martins', 130, 10, CAST(11930.80 AS Numeric(18, 2)), CAST(N'1992-12-11T00:00:00.000' AS DateTime), 21, CAST(58.03 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (319, N'Vanessa Gomes Oliveira', NULL, 11, CAST(6899.00 AS Numeric(18, 2)), CAST(N'1973-05-16T00:00:00.000' AS DateTime), 7, CAST(29.79 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (320, N'Caio Barbosa Ribeiro', 163, 3, CAST(10582.20 AS Numeric(18, 2)), CAST(N'1990-04-08T00:00:00.000' AS DateTime), 27, CAST(44.73 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (321, N'Patricia Almeida Araujo', NULL, 2, CAST(4484.00 AS Numeric(18, 2)), CAST(N'1999-01-16T00:00:00.000' AS DateTime), 4, CAST(20.99 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (322, N'Beatriz Carvalho Ferreira', NULL, 15, CAST(6928.00 AS Numeric(18, 2)), CAST(N'1979-01-01T00:00:00.000' AS DateTime), 3, CAST(30.23 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (323, N'Elaine Silva Carvalho', 231, 1, CAST(7447.50 AS Numeric(18, 2)), CAST(N'1985-06-06T00:00:00.000' AS DateTime), 17, CAST(36.90 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (324, N'Vinicius Silva Martins', NULL, 7, CAST(7736.25 AS Numeric(18, 2)), CAST(N'1977-08-02T00:00:00.000' AS DateTime), 11, CAST(37.98 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (325, N'Vanessa Ferreira Cardoso', NULL, 14, CAST(7219.80 AS Numeric(18, 2)), CAST(N'1986-02-03T00:00:00.000' AS DateTime), 25, CAST(31.50 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (326, N'Felipe Monteiro Correia', 93, 7, CAST(4012.20 AS Numeric(18, 2)), CAST(N'1992-11-05T00:00:00.000' AS DateTime), 28, CAST(17.51 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (327, N'Elaine Monteiro Mendes', 176, 7, CAST(6682.50 AS Numeric(18, 2)), CAST(N'1994-08-09T00:00:00.000' AS DateTime), 16, CAST(32.81 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (328, N'Paulo Pereira Rodrigues', 284, 7, CAST(6300.00 AS Numeric(18, 2)), CAST(N'1979-04-13T00:00:00.000' AS DateTime), 4, CAST(31.21 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (329, N'Caio Martins Oliveira', NULL, 8, CAST(5405.00 AS Numeric(18, 2)), CAST(N'1966-07-15T00:00:00.000' AS DateTime), 1, CAST(24.57 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (330, N'Marcos Teixeira Cavalcanti', NULL, 12, CAST(6447.60 AS Numeric(18, 2)), CAST(N'2000-08-27T00:00:00.000' AS DateTime), 27, CAST(31.65 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (331, N'Gabriel Batista Monteiro', 186, 3, CAST(2851.25 AS Numeric(18, 2)), CAST(N'1982-07-24T00:00:00.000' AS DateTime), 11, CAST(12.05 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (332, N'Caio Moreira Correia', 184, 9, CAST(4861.00 AS Numeric(18, 2)), CAST(N'1985-02-24T00:00:00.000' AS DateTime), 1, CAST(20.11 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (333, N'Larissa Carvalho Ribeiro', 49, 3, CAST(9108.40 AS Numeric(18, 2)), CAST(N'1976-09-30T00:00:00.000' AS DateTime), 26, CAST(39.75 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (334, N'Helena Moreira Mendes', 238, 19, CAST(4553.00 AS Numeric(18, 2)), CAST(N'1999-08-04T00:00:00.000' AS DateTime), 4, CAST(20.90 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (335, N'Diego Rocha Costa', 305, 14, CAST(10607.50 AS Numeric(18, 2)), CAST(N'1982-06-09T00:00:00.000' AS DateTime), 19, CAST(51.11 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (336, N'Sergio Mendes Ferreira', NULL, 16, CAST(5245.00 AS Numeric(18, 2)), CAST(N'1990-12-05T00:00:00.000' AS DateTime), 3, CAST(21.70 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (337, N'Felipe Dias Dias', 176, 14, CAST(4510.00 AS Numeric(18, 2)), CAST(N'1981-09-19T00:00:00.000' AS DateTime), 16, CAST(22.55 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (338, N'Mariana Cardoso Cardoso', 214, 5, CAST(4458.75 AS Numeric(18, 2)), CAST(N'2003-04-05T00:00:00.000' AS DateTime), 11, CAST(19.66 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (339, N'Diego Freitas Carvalho', NULL, 4, CAST(10321.25 AS Numeric(18, 2)), CAST(N'1995-08-04T00:00:00.000' AS DateTime), 16, CAST(45.98 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (340, N'William Martins Rodrigues', 292, 13, CAST(8886.25 AS Numeric(18, 2)), CAST(N'1996-06-08T00:00:00.000' AS DateTime), 16, CAST(37.16 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (341, N'Patricia Teixeira Almeida', NULL, 10, CAST(4241.25 AS Numeric(18, 2)), CAST(N'2003-12-26T00:00:00.000' AS DateTime), 14, CAST(17.54 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (342, N'Daniel Rodrigues Barbosa', 232, 15, CAST(4591.80 AS Numeric(18, 2)), CAST(N'2004-02-23T00:00:00.000' AS DateTime), 28, CAST(20.66 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (343, N'Natalia Ferreira Silva', 91, 6, CAST(5919.00 AS Numeric(18, 2)), CAST(N'1997-11-13T00:00:00.000' AS DateTime), 1, CAST(24.21 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (344, N'Andre Gomes Almeida', 340, 19, CAST(9588.75 AS Numeric(18, 2)), CAST(N'1985-01-25T00:00:00.000' AS DateTime), 18, CAST(39.66 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (345, N'Lucas Santos Dias', 103, 12, CAST(6422.50 AS Numeric(18, 2)), CAST(N'1990-12-05T00:00:00.000' AS DateTime), 11, CAST(29.49 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (346, N'Eduardo Moura Monteiro', 89, 3, CAST(8902.60 AS Numeric(18, 2)), CAST(N'1967-10-03T00:00:00.000' AS DateTime), 24, CAST(38.04 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (347, N'Sergio Santos Costa', 12, 10, CAST(5516.00 AS Numeric(18, 2)), CAST(N'1986-08-30T00:00:00.000' AS DateTime), 4, CAST(23.82 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (348, N'Diego Rocha Martins', NULL, 9, CAST(12011.40 AS Numeric(18, 2)), CAST(N'1984-03-18T00:00:00.000' AS DateTime), 29, CAST(53.51 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (349, N'Gabriel Teixeira Martins', 78, 6, CAST(5546.80 AS Numeric(18, 2)), CAST(N'1988-10-22T00:00:00.000' AS DateTime), 25, CAST(23.45 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (350, N'Juliana Santos Gomes', NULL, 11, CAST(3015.00 AS Numeric(18, 2)), CAST(N'2004-01-28T00:00:00.000' AS DateTime), 5, CAST(13.70 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (351, N'Helena Gomes Rodrigues', NULL, 17, CAST(3925.00 AS Numeric(18, 2)), CAST(N'1993-05-09T00:00:00.000' AS DateTime), 15, CAST(19.27 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (352, N'Larissa Monteiro Mendes', NULL, 2, CAST(5015.00 AS Numeric(18, 2)), CAST(N'2002-09-07T00:00:00.000' AS DateTime), 16, CAST(21.43 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (353, N'Larissa Lima Costa', NULL, 2, CAST(10791.25 AS Numeric(18, 2)), CAST(N'1999-02-03T00:00:00.000' AS DateTime), 16, CAST(46.60 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (354, N'Felipe Martins Rocha', NULL, 5, CAST(3305.00 AS Numeric(18, 2)), CAST(N'1983-02-06T00:00:00.000' AS DateTime), 19, CAST(14.57 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (355, N'Elaine Ferreira Araujo', 186, 7, CAST(10012.50 AS Numeric(18, 2)), CAST(N'1991-01-19T00:00:00.000' AS DateTime), 20, CAST(46.88 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (356, N'Larissa Araujo Cavalcanti', NULL, 18, CAST(15129.00 AS Numeric(18, 2)), CAST(N'1994-07-03T00:00:00.000' AS DateTime), 27, CAST(74.27 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (357, N'Igor Cavalcanti Dias', 224, 20, CAST(4725.00 AS Numeric(18, 2)), CAST(N'1996-09-15T00:00:00.000' AS DateTime), 28, CAST(21.26 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (358, N'Diego Batista Monteiro', 245, 19, CAST(6011.25 AS Numeric(18, 2)), CAST(N'1992-06-10T00:00:00.000' AS DateTime), 18, CAST(25.68 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (359, N'Diego Moreira Oliveira', 345, 11, CAST(4020.80 AS Numeric(18, 2)), CAST(N'1968-04-21T00:00:00.000' AS DateTime), 23, CAST(20.10 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (360, N'Fernanda Barbosa Silva', NULL, 16, CAST(7173.75 AS Numeric(18, 2)), CAST(N'1987-10-29T00:00:00.000' AS DateTime), 13, CAST(33.59 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (361, N'Vanessa Dias Moreira', NULL, 10, CAST(6175.40 AS Numeric(18, 2)), CAST(N'1987-10-04T00:00:00.000' AS DateTime), 25, CAST(29.75 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (362, N'Ana Teixeira Cavalcanti', NULL, 11, CAST(3662.00 AS Numeric(18, 2)), CAST(N'1983-02-19T00:00:00.000' AS DateTime), 2, CAST(16.15 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (363, N'Carla Moreira Cardoso', NULL, 20, CAST(4321.25 AS Numeric(18, 2)), CAST(N'1971-06-01T00:00:00.000' AS DateTime), 19, CAST(21.21 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (364, N'Natalia Cavalcanti Silva', 137, 2, CAST(6413.75 AS Numeric(18, 2)), CAST(N'1972-08-13T00:00:00.000' AS DateTime), 11, CAST(29.15 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (365, N'Gustavo Costa Moreira', 256, 13, CAST(11565.00 AS Numeric(18, 2)), CAST(N'1983-11-15T00:00:00.000' AS DateTime), 27, CAST(51.52 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (366, N'Thiago Gomes Gomes', 348, 14, CAST(2461.25 AS Numeric(18, 2)), CAST(N'1989-06-12T00:00:00.000' AS DateTime), 17, CAST(11.08 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (367, N'Yasmin Moreira Silva', 145, 10, CAST(11552.40 AS Numeric(18, 2)), CAST(N'1983-01-05T00:00:00.000' AS DateTime), 28, CAST(50.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (368, N'Caio Teixeira Freitas', 355, 8, CAST(5878.60 AS Numeric(18, 2)), CAST(N'1983-01-19T00:00:00.000' AS DateTime), 23, CAST(29.13 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (369, N'Thiago Correia Pereira', 50, 9, CAST(3783.00 AS Numeric(18, 2)), CAST(N'1985-04-15T00:00:00.000' AS DateTime), 1, CAST(18.40 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (370, N'Otavio Araujo Monteiro', NULL, 10, CAST(5485.00 AS Numeric(18, 2)), CAST(N'1970-07-05T00:00:00.000' AS DateTime), 1, CAST(26.93 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (371, N'Helena Batista Moura', 288, 7, CAST(10424.40 AS Numeric(18, 2)), CAST(N'1977-11-14T00:00:00.000' AS DateTime), 24, CAST(50.70 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (372, N'Renata Carvalho Pereira', 114, 13, CAST(9956.80 AS Numeric(18, 2)), CAST(N'1996-11-01T00:00:00.000' AS DateTime), 25, CAST(49.33 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (373, N'Bruno Batista Cavalcanti', 162, 11, CAST(6579.00 AS Numeric(18, 2)), CAST(N'2003-10-18T00:00:00.000' AS DateTime), 28, CAST(31.10 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (374, N'Carla Moreira Araujo', 210, 3, CAST(2503.00 AS Numeric(18, 2)), CAST(N'1980-08-26T00:00:00.000' AS DateTime), 5, CAST(10.92 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (375, N'Karen Teixeira Souza', 301, 5, CAST(9018.80 AS Numeric(18, 2)), CAST(N'1999-10-29T00:00:00.000' AS DateTime), 23, CAST(40.17 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (376, N'Joao Almeida Cardoso', 297, 13, CAST(7070.00 AS Numeric(18, 2)), CAST(N'1978-06-10T00:00:00.000' AS DateTime), 17, CAST(34.71 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (377, N'Thiago Pereira Nunes', NULL, 3, CAST(10798.75 AS Numeric(18, 2)), CAST(N'1993-12-09T00:00:00.000' AS DateTime), 15, CAST(45.16 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (378, N'Nicole Moreira Cardoso', 92, 19, CAST(6188.75 AS Numeric(18, 2)), CAST(N'1975-04-08T00:00:00.000' AS DateTime), 13, CAST(27.29 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (379, N'Gabriel Costa Ribeiro', 35, 17, CAST(3782.00 AS Numeric(18, 2)), CAST(N'1986-02-20T00:00:00.000' AS DateTime), 9, CAST(16.33 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (380, N'Daniel Rocha Lima', 153, 3, CAST(11914.00 AS Numeric(18, 2)), CAST(N'1983-05-22T00:00:00.000' AS DateTime), 22, CAST(55.78 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (381, N'Vanessa Freitas Mendes', 6, 12, CAST(7452.00 AS Numeric(18, 2)), CAST(N'1975-11-08T00:00:00.000' AS DateTime), 30, CAST(31.84 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (382, N'Eduardo Mendes Silva', NULL, 16, CAST(8730.00 AS Numeric(18, 2)), CAST(N'2000-08-19T00:00:00.000' AS DateTime), 12, CAST(40.48 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (383, N'Vinicius Campos Oliveira', 76, 11, CAST(2996.00 AS Numeric(18, 2)), CAST(N'1996-11-04T00:00:00.000' AS DateTime), 1, CAST(13.07 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (384, N'Renata Rocha Monteiro', 284, 19, CAST(2956.00 AS Numeric(18, 2)), CAST(N'1984-04-22T00:00:00.000' AS DateTime), 5, CAST(12.90 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (385, N'Karen Santos Silva', NULL, 9, CAST(10862.60 AS Numeric(18, 2)), CAST(N'2003-05-20T00:00:00.000' AS DateTime), 24, CAST(51.84 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (386, N'Patricia Rocha Costa', 56, 13, CAST(4997.50 AS Numeric(18, 2)), CAST(N'1984-01-03T00:00:00.000' AS DateTime), 11, CAST(23.85 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (387, N'Thiago Dias Moreira', 159, 18, CAST(9915.00 AS Numeric(18, 2)), CAST(N'1998-02-15T00:00:00.000' AS DateTime), 11, CAST(49.58 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (388, N'Paulo Lima Ribeiro', NULL, 8, CAST(11010.60 AS Numeric(18, 2)), CAST(N'1974-03-19T00:00:00.000' AS DateTime), 30, CAST(51.05 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (389, N'Vanessa Cavalcanti Freitas', 289, 17, CAST(10190.60 AS Numeric(18, 2)), CAST(N'1998-05-05T00:00:00.000' AS DateTime), 25, CAST(50.03 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (390, N'Igor Carvalho Mendes', 357, 19, CAST(9752.50 AS Numeric(18, 2)), CAST(N'1993-07-19T00:00:00.000' AS DateTime), 12, CAST(48.32 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (391, N'Thiago Nunes Dias', 17, 14, CAST(9955.80 AS Numeric(18, 2)), CAST(N'1976-10-10T00:00:00.000' AS DateTime), 30, CAST(48.42 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (392, N'Karen Campos Ferreira', 220, 1, CAST(3540.00 AS Numeric(18, 2)), CAST(N'1990-08-11T00:00:00.000' AS DateTime), 17, CAST(14.96 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (393, N'Yasmin Correia Ferreira', NULL, 4, CAST(3525.00 AS Numeric(18, 2)), CAST(N'1986-01-05T00:00:00.000' AS DateTime), 13, CAST(17.63 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (394, N'Andre Cardoso Correia', 194, 19, CAST(3746.25 AS Numeric(18, 2)), CAST(N'1974-04-30T00:00:00.000' AS DateTime), 17, CAST(17.54 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (395, N'Yasmin Monteiro Correia', 194, 14, CAST(4615.00 AS Numeric(18, 2)), CAST(N'1993-05-21T00:00:00.000' AS DateTime), 10, CAST(19.72 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (396, N'William Barbosa Rocha', 93, 14, CAST(4444.00 AS Numeric(18, 2)), CAST(N'1989-07-27T00:00:00.000' AS DateTime), 5, CAST(21.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (397, N'Thiago Barbosa Ferreira', 152, 9, CAST(7956.00 AS Numeric(18, 2)), CAST(N'2000-02-24T00:00:00.000' AS DateTime), 28, CAST(35.08 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (398, N'Natalia Almeida Cavalcanti', NULL, 1, CAST(7061.60 AS Numeric(18, 2)), CAST(N'1981-11-16T00:00:00.000' AS DateTime), 25, CAST(30.49 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (399, N'Rafael Pereira Freitas', 291, 5, CAST(2650.20 AS Numeric(18, 2)), CAST(N'2003-10-08T00:00:00.000' AS DateTime), 26, CAST(11.93 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (400, N'Vanessa Araujo Batista', 94, 5, CAST(5336.25 AS Numeric(18, 2)), CAST(N'1997-04-11T00:00:00.000' AS DateTime), 19, CAST(24.26 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (401, N'William Rodrigues Oliveira', 322, 18, CAST(6771.80 AS Numeric(18, 2)), CAST(N'1989-09-26T00:00:00.000' AS DateTime), 26, CAST(27.70 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (402, N'Thiago Cavalcanti Freitas', NULL, 11, CAST(4178.00 AS Numeric(18, 2)), CAST(N'1998-10-30T00:00:00.000' AS DateTime), 10, CAST(18.61 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (403, N'Mariana Nunes Pereira', 186, 13, CAST(3383.80 AS Numeric(18, 2)), CAST(N'1969-10-04T00:00:00.000' AS DateTime), 25, CAST(14.61 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (404, N'Nicole Correia Rocha', 242, 13, CAST(3567.00 AS Numeric(18, 2)), CAST(N'1992-05-12T00:00:00.000' AS DateTime), 3, CAST(16.86 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (405, N'Helena Pereira Barbosa', 203, 5, CAST(7132.00 AS Numeric(18, 2)), CAST(N'1975-05-26T00:00:00.000' AS DateTime), 7, CAST(33.07 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (406, N'Isabela Lima Silva', NULL, 7, CAST(12475.80 AS Numeric(18, 2)), CAST(N'1979-01-14T00:00:00.000' AS DateTime), 29, CAST(52.74 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (407, N'Caio Ribeiro Ribeiro', 174, 5, CAST(4289.40 AS Numeric(18, 2)), CAST(N'1968-10-23T00:00:00.000' AS DateTime), 30, CAST(18.91 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (408, N'Patricia Silva Campos', NULL, 10, CAST(8256.25 AS Numeric(18, 2)), CAST(N'2002-07-08T00:00:00.000' AS DateTime), 14, CAST(37.90 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (409, N'Yasmin Souza Barbosa', NULL, 9, CAST(7051.80 AS Numeric(18, 2)), CAST(N'1974-12-24T00:00:00.000' AS DateTime), 22, CAST(30.77 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (410, N'Lucas Lima Cavalcanti', 301, 5, CAST(6612.20 AS Numeric(18, 2)), CAST(N'1991-07-04T00:00:00.000' AS DateTime), 25, CAST(30.66 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (411, N'Helena Moreira Silva', NULL, 13, CAST(10194.80 AS Numeric(18, 2)), CAST(N'1983-11-22T00:00:00.000' AS DateTime), 23, CAST(48.66 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (412, N'Thiago Batista Barbosa', 314, 1, CAST(6325.00 AS Numeric(18, 2)), CAST(N'1970-12-09T00:00:00.000' AS DateTime), 11, CAST(29.33 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (413, N'Igor Mendes Campos', 361, 13, CAST(7293.60 AS Numeric(18, 2)), CAST(N'1969-02-22T00:00:00.000' AS DateTime), 29, CAST(35.47 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (414, N'Diego Lima Nunes', 390, 11, CAST(2573.75 AS Numeric(18, 2)), CAST(N'2003-05-27T00:00:00.000' AS DateTime), 17, CAST(11.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (415, N'Elaine Cardoso Barbosa', 45, 18, CAST(5025.00 AS Numeric(18, 2)), CAST(N'1997-07-31T00:00:00.000' AS DateTime), 8, CAST(23.75 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (416, N'Lucas Dias Cardoso', 345, 4, CAST(6573.60 AS Numeric(18, 2)), CAST(N'1983-12-12T00:00:00.000' AS DateTime), 28, CAST(31.37 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (417, N'Helena Martins Silva', 364, 15, CAST(8466.00 AS Numeric(18, 2)), CAST(N'1988-08-07T00:00:00.000' AS DateTime), 3, CAST(36.94 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (418, N'Juliana Teixeira Moreira', NULL, 8, CAST(9712.50 AS Numeric(18, 2)), CAST(N'1966-05-07T00:00:00.000' AS DateTime), 20, CAST(42.82 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (419, N'Marcos Freitas Almeida', 264, 17, CAST(2095.00 AS Numeric(18, 2)), CAST(N'1972-10-16T00:00:00.000' AS DateTime), 4, CAST(10.09 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (420, N'Ana Monteiro Cardoso', NULL, 13, CAST(3685.00 AS Numeric(18, 2)), CAST(N'1991-02-04T00:00:00.000' AS DateTime), 8, CAST(16.58 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (421, N'Eduardo Oliveira Almeida', 97, 12, CAST(8664.60 AS Numeric(18, 2)), CAST(N'2000-05-23T00:00:00.000' AS DateTime), 23, CAST(43.32 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (422, N'Larissa Correia Monteiro', 328, 4, CAST(10718.40 AS Numeric(18, 2)), CAST(N'1971-01-31T00:00:00.000' AS DateTime), 21, CAST(47.75 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (423, N'Bruno Santos Cavalcanti', NULL, 4, CAST(3458.75 AS Numeric(18, 2)), CAST(N'1990-07-14T00:00:00.000' AS DateTime), 13, CAST(17.29 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (424, N'Carla Correia Dias', 126, 5, CAST(8195.00 AS Numeric(18, 2)), CAST(N'1988-10-04T00:00:00.000' AS DateTime), 19, CAST(36.88 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (425, N'Fernanda Carvalho Cardoso', 394, 10, CAST(6127.80 AS Numeric(18, 2)), CAST(N'1969-07-11T00:00:00.000' AS DateTime), 23, CAST(29.52 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (426, N'Bruno Carvalho Martins', NULL, 8, CAST(6377.00 AS Numeric(18, 2)), CAST(N'1992-03-24T00:00:00.000' AS DateTime), 23, CAST(29.86 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (427, N'Eduardo Ferreira Oliveira', 300, 10, CAST(5835.20 AS Numeric(18, 2)), CAST(N'1968-02-14T00:00:00.000' AS DateTime), 23, CAST(24.67 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (428, N'Karen Moreira Lima', NULL, 12, CAST(2848.75 AS Numeric(18, 2)), CAST(N'1982-03-22T00:00:00.000' AS DateTime), 19, CAST(13.60 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (429, N'Tatiane Martins Teixeira', 255, 9, CAST(4527.00 AS Numeric(18, 2)), CAST(N'1988-03-31T00:00:00.000' AS DateTime), 29, CAST(19.75 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (430, N'Rafael Freitas Mendes', 58, 15, CAST(7963.00 AS Numeric(18, 2)), CAST(N'1991-04-18T00:00:00.000' AS DateTime), 7, CAST(32.94 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (431, N'Igor Pereira Ferreira', 409, 16, CAST(4579.00 AS Numeric(18, 2)), CAST(N'2000-03-22T00:00:00.000' AS DateTime), 10, CAST(21.02 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (432, N'Gabriel Souza Monteiro', 150, 12, CAST(5364.00 AS Numeric(18, 2)), CAST(N'1985-10-04T00:00:00.000' AS DateTime), 6, CAST(22.19 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (433, N'Yasmin Cardoso Araujo', NULL, 11, CAST(11694.20 AS Numeric(18, 2)), CAST(N'1988-08-05T00:00:00.000' AS DateTime), 22, CAST(57.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (434, N'Ana Martins Rocha', NULL, 8, CAST(2998.75 AS Numeric(18, 2)), CAST(N'1994-01-29T00:00:00.000' AS DateTime), 18, CAST(14.72 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (435, N'Otavio Correia Cardoso', 279, 13, CAST(2959.60 AS Numeric(18, 2)), CAST(N'1974-05-23T00:00:00.000' AS DateTime), 24, CAST(12.24 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (436, N'Felipe Freitas Mendes', 62, 18, CAST(15661.80 AS Numeric(18, 2)), CAST(N'1994-09-05T00:00:00.000' AS DateTime), 27, CAST(71.90 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (437, N'Larissa Araujo Batista', 269, 8, CAST(6840.00 AS Numeric(18, 2)), CAST(N'1984-10-23T00:00:00.000' AS DateTime), 3, CAST(28.91 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (438, N'Gustavo Barbosa Cardoso', 243, 17, CAST(6970.00 AS Numeric(18, 2)), CAST(N'1970-05-07T00:00:00.000' AS DateTime), 6, CAST(28.83 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (439, N'Carla Cardoso Batista', 421, 8, CAST(3096.25 AS Numeric(18, 2)), CAST(N'2003-12-05T00:00:00.000' AS DateTime), 18, CAST(14.64 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (440, N'Thiago Nunes Silva', NULL, 3, CAST(4546.00 AS Numeric(18, 2)), CAST(N'1977-06-25T00:00:00.000' AS DateTime), 8, CAST(19.84 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (441, N'Gustavo Almeida Araujo', NULL, 15, CAST(1878.00 AS Numeric(18, 2)), CAST(N'1975-02-22T00:00:00.000' AS DateTime), 6, CAST(8.54 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (442, N'Fernanda Ferreira Teixeira', NULL, 3, CAST(3851.40 AS Numeric(18, 2)), CAST(N'1979-11-17T00:00:00.000' AS DateTime), 22, CAST(16.81 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (443, N'Tatiane Almeida Pereira', NULL, 13, CAST(4561.25 AS Numeric(18, 2)), CAST(N'1994-02-15T00:00:00.000' AS DateTime), 11, CAST(20.53 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (444, N'Lucas Carvalho Araujo', 138, 20, CAST(3711.60 AS Numeric(18, 2)), CAST(N'1999-04-16T00:00:00.000' AS DateTime), 29, CAST(15.35 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (445, N'Felipe Silva Nunes', 150, 12, CAST(4427.50 AS Numeric(18, 2)), CAST(N'1986-02-25T00:00:00.000' AS DateTime), 18, CAST(21.53 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (446, N'Eduardo Cardoso Rodrigues', NULL, 18, CAST(5447.00 AS Numeric(18, 2)), CAST(N'1985-10-23T00:00:00.000' AS DateTime), 6, CAST(22.53 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (447, N'Tatiane Rocha Silva', 445, 10, CAST(3808.75 AS Numeric(18, 2)), CAST(N'1982-01-10T00:00:00.000' AS DateTime), 18, CAST(16.79 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (448, N'Yasmin Gomes Cavalcanti', 307, 18, CAST(8313.75 AS Numeric(18, 2)), CAST(N'1974-07-30T00:00:00.000' AS DateTime), 17, CAST(36.28 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (449, N'Bruno Monteiro Mendes', 411, 10, CAST(5481.00 AS Numeric(18, 2)), CAST(N'1975-12-31T00:00:00.000' AS DateTime), 25, CAST(24.17 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (450, N'Felipe Almeida Carvalho', NULL, 6, CAST(3627.50 AS Numeric(18, 2)), CAST(N'1987-04-28T00:00:00.000' AS DateTime), 12, CAST(16.32 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (451, N'Sabrina Dias Freitas', 355, 15, CAST(7968.75 AS Numeric(18, 2)), CAST(N'1997-02-28T00:00:00.000' AS DateTime), 20, CAST(32.60 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (452, N'Nicole Nunes Barbosa', 295, 10, CAST(5915.00 AS Numeric(18, 2)), CAST(N'1970-08-01T00:00:00.000' AS DateTime), 1, CAST(24.74 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (453, N'Karen Lima Rodrigues', 279, 9, CAST(2803.00 AS Numeric(18, 2)), CAST(N'1994-12-21T00:00:00.000' AS DateTime), 7, CAST(12.74 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (454, N'Beatriz Cavalcanti Dias', 450, 1, CAST(5225.40 AS Numeric(18, 2)), CAST(N'1966-03-07T00:00:00.000' AS DateTime), 29, CAST(22.56 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (455, N'Karen Pereira Santos', NULL, 15, CAST(4040.00 AS Numeric(18, 2)), CAST(N'2002-06-18T00:00:00.000' AS DateTime), 8, CAST(16.71 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (456, N'Renata Ferreira Carvalho', 229, 11, CAST(5427.80 AS Numeric(18, 2)), CAST(N'1976-12-27T00:00:00.000' AS DateTime), 21, CAST(26.15 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (457, N'Gustavo Campos Ribeiro', NULL, 18, CAST(6050.00 AS Numeric(18, 2)), CAST(N'1973-04-29T00:00:00.000' AS DateTime), 11, CAST(29.98 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (458, N'Mariana Santos Martins', NULL, 12, CAST(6175.00 AS Numeric(18, 2)), CAST(N'1975-02-13T00:00:00.000' AS DateTime), 17, CAST(28.35 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (459, N'Diego Lima Araujo', 400, 15, CAST(9722.50 AS Numeric(18, 2)), CAST(N'1968-07-20T00:00:00.000' AS DateTime), 17, CAST(46.84 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (460, N'Carla Ribeiro Monteiro', 248, 8, CAST(3821.25 AS Numeric(18, 2)), CAST(N'1993-05-13T00:00:00.000' AS DateTime), 17, CAST(17.72 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (461, N'Andre Batista Santos', 331, 11, CAST(9302.40 AS Numeric(18, 2)), CAST(N'1970-06-24T00:00:00.000' AS DateTime), 28, CAST(41.86 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (462, N'Isabela Barbosa Monteiro', 392, 4, CAST(8951.60 AS Numeric(18, 2)), CAST(N'2001-08-15T00:00:00.000' AS DateTime), 22, CAST(36.62 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (463, N'Elaine Araujo Araujo', NULL, 16, CAST(6172.50 AS Numeric(18, 2)), CAST(N'1971-11-28T00:00:00.000' AS DateTime), 19, CAST(27.50 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (464, N'Thiago Carvalho Rodrigues', 298, 18, CAST(13087.80 AS Numeric(18, 2)), CAST(N'1980-02-12T00:00:00.000' AS DateTime), 29, CAST(55.33 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (465, N'Diego Carvalho Ferreira', 113, 8, CAST(7941.25 AS Numeric(18, 2)), CAST(N'1999-11-13T00:00:00.000' AS DateTime), 14, CAST(38.62 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (466, N'Lucas Araujo Gomes', 433, 20, CAST(6008.75 AS Numeric(18, 2)), CAST(N'1987-04-09T00:00:00.000' AS DateTime), 16, CAST(28.13 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (467, N'Yasmin Rocha Dias', 16, 3, CAST(10976.40 AS Numeric(18, 2)), CAST(N'1970-09-09T00:00:00.000' AS DateTime), 29, CAST(51.89 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (468, N'Fernanda Ferreira Moreira', 222, 18, CAST(15163.20 AS Numeric(18, 2)), CAST(N'1986-08-10T00:00:00.000' AS DateTime), 30, CAST(75.82 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (469, N'Elaine Monteiro Moreira', 121, 19, CAST(6922.00 AS Numeric(18, 2)), CAST(N'1995-09-27T00:00:00.000' AS DateTime), 10, CAST(32.41 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (470, N'Marcos Rodrigues Moreira', NULL, 5, CAST(10180.00 AS Numeric(18, 2)), CAST(N'1969-02-27T00:00:00.000' AS DateTime), 12, CAST(49.51 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (471, N'Joao Carvalho Oliveira', 67, 5, CAST(6670.00 AS Numeric(18, 2)), CAST(N'1992-12-08T00:00:00.000' AS DateTime), 15, CAST(33.35 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (472, N'Caio Freitas Barbosa', 198, 1, CAST(7400.00 AS Numeric(18, 2)), CAST(N'1981-10-29T00:00:00.000' AS DateTime), 19, CAST(34.65 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (473, N'Bruno Souza Costa', 90, 11, CAST(3961.00 AS Numeric(18, 2)), CAST(N'1970-04-30T00:00:00.000' AS DateTime), 2, CAST(18.36 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (474, N'Karen Cavalcanti Dias', 176, 15, CAST(4582.80 AS Numeric(18, 2)), CAST(N'1974-06-01T00:00:00.000' AS DateTime), 27, CAST(21.87 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (475, N'Igor Cardoso Carvalho', NULL, 13, CAST(5876.25 AS Numeric(18, 2)), CAST(N'1997-08-31T00:00:00.000' AS DateTime), 20, CAST(25.91 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (476, N'Sabrina Lima Rocha', NULL, 16, CAST(7903.80 AS Numeric(18, 2)), CAST(N'1997-04-26T00:00:00.000' AS DateTime), 27, CAST(37.36 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (477, N'Daniel Martins Santos', 393, 8, CAST(7322.50 AS Numeric(18, 2)), CAST(N'2001-12-12T00:00:00.000' AS DateTime), 14, CAST(29.96 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (478, N'Rafael Ferreira Araujo', NULL, 8, CAST(3970.80 AS Numeric(18, 2)), CAST(N'1997-01-16T00:00:00.000' AS DateTime), 27, CAST(19.13 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (479, N'Renata Ribeiro Martins', 222, 1, CAST(6277.00 AS Numeric(18, 2)), CAST(N'1971-05-31T00:00:00.000' AS DateTime), 1, CAST(27.11 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (480, N'Lucas Moura Costa', 392, 11, CAST(6436.00 AS Numeric(18, 2)), CAST(N'1966-09-05T00:00:00.000' AS DateTime), 10, CAST(31.01 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (481, N'Patricia Freitas Batista', 310, 13, CAST(5923.40 AS Numeric(18, 2)), CAST(N'1996-12-19T00:00:00.000' AS DateTime), 25, CAST(24.50 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (482, N'Paulo Moura Nunes', 273, 13, CAST(4517.00 AS Numeric(18, 2)), CAST(N'1988-08-26T00:00:00.000' AS DateTime), 4, CAST(20.12 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (483, N'Isabela Ribeiro Lima', 51, 3, CAST(5202.40 AS Numeric(18, 2)), CAST(N'1971-08-18T00:00:00.000' AS DateTime), 21, CAST(26.01 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (484, N'Rafael Souza Ferreira', 159, 11, CAST(10866.80 AS Numeric(18, 2)), CAST(N'1975-05-29T00:00:00.000' AS DateTime), 21, CAST(45.94 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (485, N'Joao Batista Lima', 276, 11, CAST(4497.00 AS Numeric(18, 2)), CAST(N'1996-10-26T00:00:00.000' AS DateTime), 8, CAST(19.83 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (486, N'Fernanda Rodrigues Moreira', NULL, 9, CAST(5917.80 AS Numeric(18, 2)), CAST(N'1976-10-27T00:00:00.000' AS DateTime), 26, CAST(26.90 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (487, N'Bruno Araujo Rocha', 65, 17, CAST(8030.00 AS Numeric(18, 2)), CAST(N'2001-06-28T00:00:00.000' AS DateTime), 20, CAST(33.58 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (488, N'Eduardo Cardoso Almeida', 3, 19, CAST(4160.00 AS Numeric(18, 2)), CAST(N'1973-09-27T00:00:00.000' AS DateTime), 17, CAST(18.15 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (489, N'Gustavo Freitas Oliveira', 213, 14, CAST(10663.75 AS Numeric(18, 2)), CAST(N'1987-12-22T00:00:00.000' AS DateTime), 18, CAST(49.93 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (490, N'Vanessa Monteiro Moura', 342, 7, CAST(9284.40 AS Numeric(18, 2)), CAST(N'1984-06-13T00:00:00.000' AS DateTime), 28, CAST(44.73 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (491, N'Eduardo Pereira Cavalcanti', 486, 12, CAST(10811.25 AS Numeric(18, 2)), CAST(N'2003-09-22T00:00:00.000' AS DateTime), 15, CAST(49.63 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (492, N'Juliana Almeida Nunes', 452, 2, CAST(8429.40 AS Numeric(18, 2)), CAST(N'1985-05-15T00:00:00.000' AS DateTime), 24, CAST(35.63 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (493, N'Vinicius Nunes Araujo', 115, 13, CAST(2511.00 AS Numeric(18, 2)), CAST(N'1967-11-25T00:00:00.000' AS DateTime), 10, CAST(10.96 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (494, N'Beatriz Teixeira Martins', 465, 8, CAST(6328.00 AS Numeric(18, 2)), CAST(N'1977-11-29T00:00:00.000' AS DateTime), 26, CAST(29.34 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (495, N'Thiago Lima Correia', 3, 9, CAST(3095.00 AS Numeric(18, 2)), CAST(N'1983-02-15T00:00:00.000' AS DateTime), 18, CAST(13.93 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (496, N'Beatriz Rocha Batista', 11, 9, CAST(3953.00 AS Numeric(18, 2)), CAST(N'1995-07-26T00:00:00.000' AS DateTime), 7, CAST(17.07 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (497, N'Larissa Nunes Cardoso', 476, 14, CAST(9648.80 AS Numeric(18, 2)), CAST(N'1966-06-03T00:00:00.000' AS DateTime), 25, CAST(44.74 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (498, N'Nicole Cardoso Nunes', 199, 20, CAST(4341.25 AS Numeric(18, 2)), CAST(N'1971-02-04T00:00:00.000' AS DateTime), 12, CAST(20.92 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (499, N'Nicole Rocha Costa', 20, 1, CAST(10773.00 AS Numeric(18, 2)), CAST(N'1992-07-09T00:00:00.000' AS DateTime), 25, CAST(47.99 AS Numeric(18, 2)))
GO
INSERT [dbo].[funcionarios] ([func_id], [func_nome], [gerente_id], [setor_id], [func_salario], [func_dataNasc], [cargo_id], [func_valorHora]) VALUES (500, N'Thiago Gomes Oliveira', 373, 19, CAST(7637.40 AS Numeric(18, 2)), CAST(N'1968-09-13T00:00:00.000' AS DateTime), 29, CAST(37.49 AS Numeric(18, 2)))
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (1, N'Administracao')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (2, N'Financeiro')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (3, N'Contabilidade')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (4, N'Recursos Humanos')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (5, N'Departamento Pessoal')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (6, N'Comercial')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (7, N'Vendas')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (8, N'Pos Vendas')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (9, N'Marketing')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (10, N'Planejamento')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (11, N'Compras')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (12, N'Suprimentos')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (13, N'Logistica')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (14, N'Almoxarifado')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (15, N'Operacoes')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (16, N'Producao')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (17, N'Qualidade')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (18, N'Manutencao')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (19, N'Engenharia')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (20, N'Pesquisa e Desenv')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (21, N'Tecnologia da Info')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (22, N'Suporte Tecnico')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (23, N'Infraestrutura')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (24, N'Seguranca da Info')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (25, N'Juridico')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (26, N'Compliance')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (27, N'Auditoria')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (28, N'Atendimento')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (29, N'Relacionamento')
GO
INSERT [dbo].[setores] ([setor_id], [setor_nome]) VALUES (30, N'Diretoria')
GO
ALTER TABLE [dbo].[apontamentos]  WITH CHECK ADD  CONSTRAINT [FK_apontamentos_funcionarios] FOREIGN KEY([func_id])
REFERENCES [dbo].[funcionarios] ([func_id])
GO
ALTER TABLE [dbo].[apontamentos] CHECK CONSTRAINT [FK_apontamentos_funcionarios]
GO
ALTER TABLE [dbo].[funcionarios]  WITH CHECK ADD  CONSTRAINT [FK_funcionarios_cargos] FOREIGN KEY([cargo_id])
REFERENCES [dbo].[cargos] ([cargo_id])
GO
ALTER TABLE [dbo].[funcionarios] CHECK CONSTRAINT [FK_funcionarios_cargos]
GO
ALTER TABLE [dbo].[funcionarios]  WITH CHECK ADD  CONSTRAINT [FK_funcionarios_gerente] FOREIGN KEY([gerente_id])
REFERENCES [dbo].[funcionarios] ([func_id])
GO
ALTER TABLE [dbo].[funcionarios] CHECK CONSTRAINT [FK_funcionarios_gerente]
GO
ALTER TABLE [dbo].[funcionarios]  WITH CHECK ADD  CONSTRAINT [FK_funcionarios_setores] FOREIGN KEY([setor_id])
REFERENCES [dbo].[setores] ([setor_id])
GO
ALTER TABLE [dbo].[funcionarios] CHECK CONSTRAINT [FK_funcionarios_setores]
GO
ALTER TABLE [dbo].[apontamentos]  WITH CHECK ADD  CONSTRAINT [CK_apontamentos_ano] CHECK  (([ano]>=(2000)))
GO
ALTER TABLE [dbo].[apontamentos] CHECK CONSTRAINT [CK_apontamentos_ano]
GO
ALTER TABLE [dbo].[apontamentos]  WITH CHECK ADD  CONSTRAINT [CK_apontamentos_horas] CHECK  (([total_horas]>=(0)))
GO
ALTER TABLE [dbo].[apontamentos] CHECK CONSTRAINT [CK_apontamentos_horas]
GO
ALTER TABLE [dbo].[apontamentos]  WITH CHECK ADD  CONSTRAINT [CK_apontamentos_mes] CHECK  (([mes]>=(1) AND [mes]<=(12)))
GO
ALTER TABLE [dbo].[apontamentos] CHECK CONSTRAINT [CK_apontamentos_mes]
GO
USE [master]
GO
ALTER DATABASE [Funcionarios] SET  READ_WRITE 
GO

