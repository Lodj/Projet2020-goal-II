USE [master]
GO
/****** Object:  Database [Projet2020]    Script Date: 14/05/2020 23:58:48 ******/
CREATE DATABASE [Projet2020]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Projet2020', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Projet2020.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Projet2020_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Projet2020_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Projet2020] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projet2020].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projet2020] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Projet2020] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Projet2020] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Projet2020] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Projet2020] SET ARITHABORT OFF 
GO
ALTER DATABASE [Projet2020] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Projet2020] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Projet2020] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Projet2020] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Projet2020] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Projet2020] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Projet2020] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Projet2020] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Projet2020] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Projet2020] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Projet2020] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Projet2020] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Projet2020] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Projet2020] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Projet2020] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Projet2020] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Projet2020] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Projet2020] SET RECOVERY FULL 
GO
ALTER DATABASE [Projet2020] SET  MULTI_USER 
GO
ALTER DATABASE [Projet2020] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Projet2020] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Projet2020] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Projet2020] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Projet2020] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Projet2020', N'ON'
GO
ALTER DATABASE [Projet2020] SET QUERY_STORE = OFF
GO
USE [Projet2020]
GO
/****** Object:  Table [dbo].[Conjoint]    Script Date: 14/05/2020 23:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conjoint](
	[Id_conjoint] [int] IDENTITY(1,1) NOT NULL,
	[etat_sante] [varchar](50) NULL,
	[fonction] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_conjoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enfant]    Script Date: 14/05/2020 23:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enfant](
	[Id_enfant] [int] IDENTITY(1,1) NOT NULL,
	[niveau_etude] [varchar](50) NULL,
	[nom_ecole] [varchar](50) NULL,
	[distance_ecole_maison] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_enfant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent]    Script Date: 14/05/2020 23:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[Id_parent] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Planing]    Script Date: 14/05/2020 23:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Planing](
	[Id_planing] [int] IDENTITY(1,1) NOT NULL,
	[Id_usercreator] [int] NULL,
	[Create_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_planing] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tache]    Script Date: 14/05/2020 23:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tache](
	[Id_tache] [int] IDENTITY(1,1) NOT NULL,
	[Id_planing] [int] NOT NULL,
	[nom_tache] [nchar](10) NULL,
	[date_debut] [date] NULL,
	[date_fin] [date] NULL,
	[duree_tolerance] [varchar](50) NULL,
	[emplacement] [varchar](50) NULL,
	[personnes_impliques] [text] NULL,
	[description] [varchar](50) NULL,
	[type_tache] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_tache] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCible]    Script Date: 14/05/2020 23:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCible](
	[Id_usercible] [int] IDENTITY(1,1) NOT NULL,
	[Id_user] [int] NULL,
	[Id_enfant] [int] NULL,
	[Id_conjoint] [int] NULL,
	[Id_parent] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_usercible] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 14/05/2020 23:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateur](
	[Id_user] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[prenom] [varchar](50) NOT NULL,
	[date_naiss] [date] NOT NULL,
	[genre] [varchar](50) NOT NULL,
	[photo] [varbinary](max) NULL,
	[fonction] [varchar](50) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[adress] [varchar](50) NULL,
	[etat_civil] [varchar](50) NOT NULL,
	[nbre_enfant] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Planing]  WITH CHECK ADD  CONSTRAINT [FK_Planing_ToUserCible] FOREIGN KEY([Id_usercreator])
REFERENCES [dbo].[UserCible] ([Id_usercible])
GO
ALTER TABLE [dbo].[Planing] CHECK CONSTRAINT [FK_Planing_ToUserCible]
GO
ALTER TABLE [dbo].[Tache]  WITH CHECK ADD FOREIGN KEY([Id_planing])
REFERENCES [dbo].[Planing] ([Id_planing])
GO
ALTER TABLE [dbo].[UserCible]  WITH CHECK ADD  CONSTRAINT [FK_UserCible_ToConjoint] FOREIGN KEY([Id_conjoint])
REFERENCES [dbo].[Conjoint] ([Id_conjoint])
GO
ALTER TABLE [dbo].[UserCible] CHECK CONSTRAINT [FK_UserCible_ToConjoint]
GO
ALTER TABLE [dbo].[UserCible]  WITH CHECK ADD  CONSTRAINT [FK_UserCible_ToEnfant] FOREIGN KEY([Id_enfant])
REFERENCES [dbo].[Enfant] ([Id_enfant])
GO
ALTER TABLE [dbo].[UserCible] CHECK CONSTRAINT [FK_UserCible_ToEnfant]
GO
ALTER TABLE [dbo].[UserCible]  WITH CHECK ADD  CONSTRAINT [FK_UserCible_ToParent] FOREIGN KEY([Id_parent])
REFERENCES [dbo].[Parent] ([Id_parent])
GO
ALTER TABLE [dbo].[UserCible] CHECK CONSTRAINT [FK_UserCible_ToParent]
GO
ALTER TABLE [dbo].[UserCible]  WITH CHECK ADD  CONSTRAINT [FK_UserCible_ToUtilisateur] FOREIGN KEY([Id_user])
REFERENCES [dbo].[Utilisateur] ([Id_user])
GO
ALTER TABLE [dbo].[UserCible] CHECK CONSTRAINT [FK_UserCible_ToUtilisateur]
GO
USE [master]
GO
ALTER DATABASE [Projet2020] SET  READ_WRITE 
GO
