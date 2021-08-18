USE [master]
GO
/****** Object:  Database [Estudiantes]    Script Date: 26/7/2021 15:41:15 ******/
CREATE DATABASE [Estudiantes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Estudiantes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Estudiantes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Estudiantes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Estudiantes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Estudiantes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Estudiantes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Estudiantes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Estudiantes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Estudiantes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Estudiantes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Estudiantes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Estudiantes] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Estudiantes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Estudiantes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Estudiantes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Estudiantes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Estudiantes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Estudiantes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Estudiantes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Estudiantes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Estudiantes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Estudiantes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Estudiantes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Estudiantes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Estudiantes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Estudiantes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Estudiantes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Estudiantes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Estudiantes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Estudiantes] SET  MULTI_USER 
GO
ALTER DATABASE [Estudiantes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Estudiantes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Estudiantes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Estudiantes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Estudiantes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Estudiantes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Estudiantes] SET QUERY_STORE = OFF
GO
USE [Estudiantes]
GO
/****** Object:  Table [dbo].[tbl_cursos]    Script Date: 26/7/2021 15:41:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cursos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
	[description] [nchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_cursos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_estudiantes]    Script Date: 26/7/2021 15:41:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estudiantes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](50) NOT NULL,
	[firstLastname] [nchar](50) NOT NULL,
	[secondLastname] [nchar](50) NOT NULL,
	[dni] [nchar](20) NOT NULL,
	[age] [int] NOT NULL,
	[registerDate] [date] NOT NULL,
 CONSTRAINT [PK_tbl_estudiantes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_matriculas_cursos]    Script Date: 26/7/2021 15:41:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_matriculas_cursos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idcurso] [int] NOT NULL,
	[idestudiante] [int] NOT NULL,
	[descripcion] [nchar](10) NULL,
 CONSTRAINT [PK_tbl_matriculas_cursos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_cursos] ON 
GO
INSERT [dbo].[tbl_cursos] ([id], [name], [description]) VALUES (1, N'Programación                                      ', N'Curso de Programación                             ')
GO
INSERT [dbo].[tbl_cursos] ([id], [name], [description]) VALUES (2, N'Base de datos                                     ', N'Curso de Bases de datos                           ')
GO
INSERT [dbo].[tbl_cursos] ([id], [name], [description]) VALUES (3, N'Matemáticas Discretas                             ', N'Curso de Matemáticas Discretas                    ')
GO
INSERT [dbo].[tbl_cursos] ([id], [name], [description]) VALUES (4, N'Contabilidad I                                    ', N'Curso de Contabilidad I                           ')
GO
SET IDENTITY_INSERT [dbo].[tbl_cursos] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_estudiantes] ON 
GO
INSERT [dbo].[tbl_estudiantes] ([id], [name], [firstLastname], [secondLastname], [dni], [age], [registerDate]) VALUES (1, N' Olman                                            ', N' Monge                                            ', N' Torres                                           ', N'112230987           ', 32, CAST(N'2021-07-03' AS Date))
GO
INSERT [dbo].[tbl_estudiantes] ([id], [name], [firstLastname], [secondLastname], [dni], [age], [registerDate]) VALUES (6, N' JOSE                                             ', N' TORRES                                           ', N' Perez                                            ', N'11234566            ', 25, CAST(N'2021-07-24' AS Date))
GO
SET IDENTITY_INSERT [dbo].[tbl_estudiantes] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_matriculas_cursos] ON 
GO
INSERT [dbo].[tbl_matriculas_cursos] ([id], [idcurso], [idestudiante], [descripcion]) VALUES (1, 1, 1, NULL)
GO
INSERT [dbo].[tbl_matriculas_cursos] ([id], [idcurso], [idestudiante], [descripcion]) VALUES (2, 2, 6, NULL)
GO
INSERT [dbo].[tbl_matriculas_cursos] ([id], [idcurso], [idestudiante], [descripcion]) VALUES (19, 1, 6, NULL)
GO
INSERT [dbo].[tbl_matriculas_cursos] ([id], [idcurso], [idestudiante], [descripcion]) VALUES (26, 3, 1, NULL)
GO
INSERT [dbo].[tbl_matriculas_cursos] ([id], [idcurso], [idestudiante], [descripcion]) VALUES (27, 3, 6, NULL)
GO
INSERT [dbo].[tbl_matriculas_cursos] ([id], [idcurso], [idestudiante], [descripcion]) VALUES (28, 4, 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_matriculas_cursos] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [dni_un]    Script Date: 26/7/2021 15:41:15 ******/
ALTER TABLE [dbo].[tbl_estudiantes] ADD  CONSTRAINT [dni_un] UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_matriculas_cursos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_matriculas_cursos_tbl_cursos] FOREIGN KEY([idcurso])
REFERENCES [dbo].[tbl_cursos] ([id])
GO
ALTER TABLE [dbo].[tbl_matriculas_cursos] CHECK CONSTRAINT [FK_tbl_matriculas_cursos_tbl_cursos]
GO
ALTER TABLE [dbo].[tbl_matriculas_cursos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_matriculas_cursos_tbl_estudiantes] FOREIGN KEY([idestudiante])
REFERENCES [dbo].[tbl_estudiantes] ([id])
GO
ALTER TABLE [dbo].[tbl_matriculas_cursos] CHECK CONSTRAINT [FK_tbl_matriculas_cursos_tbl_estudiantes]
GO
USE [master]
GO
ALTER DATABASE [Estudiantes] SET  READ_WRITE 
GO
