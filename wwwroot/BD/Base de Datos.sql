USE [master]
GO
/****** Object:  Database [ReservaRestaurantes]    Script Date: 29/11/2023 16:19:09 ******/
CREATE DATABASE [ReservaRestaurantes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReservaRestaurantes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ReservaRestaurantes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ReservaRestaurantes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ReservaRestaurantes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ReservaRestaurantes] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReservaRestaurantes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReservaRestaurantes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReservaRestaurantes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReservaRestaurantes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ReservaRestaurantes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReservaRestaurantes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET RECOVERY FULL 
GO
ALTER DATABASE [ReservaRestaurantes] SET  MULTI_USER 
GO
ALTER DATABASE [ReservaRestaurantes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReservaRestaurantes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReservaRestaurantes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReservaRestaurantes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ReservaRestaurantes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ReservaRestaurantes] SET QUERY_STORE = OFF
GO
USE [ReservaRestaurantes]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Mensaje] [varchar](50) NOT NULL,
	[Id_Contactanos] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
 CONSTRAINT [PK_Contacto] PRIMARY KEY CLUSTERED 
(
	[Id_Contactanos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseña]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reseña](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[IdRestaurante] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Comentario] [varchar](500) NULL,
	[Valoracion] [int] NULL,
 CONSTRAINT [PK_Reseña] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[IdRestaurante] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[FechaReserva] [date] NOT NULL,
	[HoraReserva] [varchar](50) NOT NULL,
	[CantidadPersonas] [int] NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurante](
	[IdRestaurante] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[HorarioApertura] [varchar](50) NOT NULL,
	[HorarioClausura] [varchar](50) NOT NULL,
	[FechaFundacion] [date] NOT NULL,
	[Imagen] [varchar](500) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Restaurante] PRIMARY KEY CLUSTERED 
(
	[IdRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellido], [Contraseña], [Email]) VALUES (1, N'Marcos', N'Mellebovsky', N'Marcos148', N'marcosmellebovsky@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellido], [Contraseña], [Email]) VALUES (2, N'Marcos', N'Mellebovsky', N'Marcos123', N'marcosmellebovsky')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacto] ON 

INSERT [dbo].[Contacto] ([Nombre], [Apellido], [Email], [Telefono], [Mensaje], [Id_Contactanos], [idCliente]) VALUES (N'Marcos', N'Mellebovsky', N'marcosmellebovsky@gmail.com', 0, N'awdawdawawdaw', 7, 1)
INSERT [dbo].[Contacto] ([Nombre], [Apellido], [Email], [Telefono], [Mensaje], [Id_Contactanos], [idCliente]) VALUES (N'Marcos', N'Mellebovsky', N'marcosmellebovsky@gmail.com', 0, N'gfghdhgfdhggfghfghf', 8, 1)
INSERT [dbo].[Contacto] ([Nombre], [Apellido], [Email], [Telefono], [Mensaje], [Id_Contactanos], [idCliente]) VALUES (N'Marcos', N'Mellebovsky', N'marcosmellebovsky@gmail.com', 0, N'waedadadwdaaaaaaaaaaaaaaaaaaaaa', 9, 1)
SET IDENTITY_INSERT [dbo].[Contacto] OFF
GO
SET IDENTITY_INSERT [dbo].[Reseña] ON 

INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (6, 6, 1, N'muy god', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (7, 6, 1, N'awdadwadadwad', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (8, 6, 1, N'awdadwadadwad', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (9, 6, 1, N'awdadwadadwad', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (10, 6, 1, N'awdadwadadwad', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (11, 6, 1, N'wdawdawdawdwdaw', 3)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (12, 6, 1, N'adawdawdwdaw', 3)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (13, 6, 1, N'adawdawdwdawawdawdwdad', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (14, 6, 1, N'adawdawdwdawawdawdwdad', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (15, 6, 1, N'adawdawdwdawawdawdwdad', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (16, 6, 1, N'adawdawdwdawawdawdwdad', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (17, 6, 1, N'adawdawdwdawawdawdwdad', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (18, 7, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (19, 7, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (20, 7, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (21, 7, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (22, 7, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (23, 7, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (24, 7, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (25, 7, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (26, 7, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (27, 8, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (28, 8, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (29, 8, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (30, 8, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 3)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (31, 8, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 2)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (32, 8, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (33, 8, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (34, 8, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 1)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (35, 8, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (36, 9, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (37, 9, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 4)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (38, 9, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 3)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (39, 9, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 2)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (40, 9, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 1)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (41, 9, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (42, 9, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (43, 9, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (44, 9, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (45, 10, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (46, 10, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (47, 10, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (48, 10, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (49, 10, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (50, 10, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (51, 10, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (52, 10, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (53, 10, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (54, 11, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (55, 11, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (56, 11, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (57, 11, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (58, 11, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (59, 11, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (60, 11, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (61, 11, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (62, 11, 1, N'Experiencia gastronómica excepcional! Cada bocado es una explosión de sabores auténticos. Recomiendo especialmente el plato de la casa, ¡una delicia que no te puedes perder!', 5)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (63, 7, 1, NULL, 3)
INSERT [dbo].[Reseña] ([IdComentario], [IdRestaurante], [IdCliente], [Comentario], [Valoracion]) VALUES (64, 6, 1, N'mierda', 3)
SET IDENTITY_INSERT [dbo].[Reseña] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva] ON 

INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas]) VALUES (1, 6, 1, CAST(N'2023-11-30' AS Date), N'6:00 PM', 6)
INSERT [dbo].[Reserva] ([IdReserva], [IdRestaurante], [IdCliente], [FechaReserva], [HoraReserva], [CantidadPersonas]) VALUES (2, 6, 1, CAST(N'2023-12-09' AS Date), N'6:00 PM', 5)
SET IDENTITY_INSERT [dbo].[Reserva] OFF
GO
SET IDENTITY_INSERT [dbo].[Restaurante] ON 

INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion]) VALUES (6, N'Kansas', N'Av. del Libertador 4625', N'12:00', N'00:00', CAST(N'1999-06-09' AS Date), N'https://statics.eleconomista.com.ar/2023/08/64cbc8308cc87.jpg', N'Kansas es un restaurant de Contemporary American Cuisine. El primer Restaurant fue inaugurado en Junio de 1999 en San Isidro. Nuestra visión es aportar alimentos de calidad en un ambiente placentero a través de un servicio excelente.')
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion]) VALUES (7, N'Dean & Dennys', N'Malabia 1591', N'10:00', N'21:00', CAST(N'2012-04-08' AS Date), N'https://www.cronista.com/files/image/474/474433/62ff95554e214.jpg', N'Dean & Dennys nace en Buenos Aires, Argentina, con la premisa de ofrecer hamburguesas y hot dogs de calidad premium, con locales de ambiente moderno, distendido y agradable.')
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion]) VALUES (8, N'KFC', N'Av. Corrientes 3201', N'10:00', N'23:00', CAST(N'1952-09-24' AS Date), N'https://s39940.pcdn.co/wp-content/uploads/2022/11/iStock-1321150254.jpg', N'KFC corporations, (Kentucky Fried Chicken) es la marca líder especializada en los productos de pollo con más de 17.000 restaurantes en todo el mundo con sede en Louisville.')
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion]) VALUES (9, N'Don Julio', N'Guatemala 4699', N'11:00', N'01:00', CAST(N'1999-12-30' AS Date), N'https://imag.bonviveur.com/agradable-rincon-del-restaurante-don-julio.jpg', N'Don Julio se encuentra en el barrio porteño de Palermo y se destaca por servir cortes de carne premium a la parrilla, acompañados por vegetales y productos orgánicos de cada temporada -cultivados especialmente para el restaurante- y embutidos elaborados de manera artesanal.')
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion]) VALUES (10, N'El Ferroviario', N'Av. Reservistas Argentinos 219', N'12:00', N'23:00', CAST(N'2006-05-24' AS Date), N'https://www.clarin.com/2022/04/11/EQuIGEVpZ_1200x0__1.jpg', N'Con el paso del tiempo y respondiendo a las peticiones de los comensales, se fueron incluyendo diversidad de platos y manjares. Se incorporaron al menú carnes asadas, guarniciones, pastas, picadas, postres elaborados, carnes exóticas, vinos de todas las gamas y tragos lo que llevó al pequeño buffet del Club a convertirse en el Restaurante- Parrilla tan famoso que hoy conocemos, con su característica fidelidad por las tradiciones nacionales.')
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion]) VALUES (11, N'Lo de Carlitos', N'Nogoyá 3062', N'12:00', N'23:00', CAST(N'1983-06-28' AS Date), N'https://toohotel.com/wp-content/uploads/2022/09/TOO_restaurant_Panoramique_vue_Paris_nuit_v2-scaled.jpg', N'¡Bienvenidos a "Lo de Carlitos"! Nuestro encantador restaurante te sumerge en una experiencia culinaria única donde la tradición se mezcla con la innovación. Con un ambiente acogedor y una decoración que evoca la calidez del hogar, "Lo de Carlitos" te invita a disfrutar de exquisitos sabores que cuentan historias.')
SET IDENTITY_INSERT [dbo].[Restaurante] OFF
GO
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Contacto] CHECK CONSTRAINT [FK_Contacto_Cliente]
GO
ALTER TABLE [dbo].[Reseña]  WITH CHECK ADD  CONSTRAINT [FK_Reseña_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Reseña] CHECK CONSTRAINT [FK_Reseña_Cliente]
GO
ALTER TABLE [dbo].[Reseña]  WITH CHECK ADD  CONSTRAINT [FK_Reseña_Restaurante] FOREIGN KEY([IdRestaurante])
REFERENCES [dbo].[Restaurante] ([IdRestaurante])
GO
ALTER TABLE [dbo].[Reseña] CHECK CONSTRAINT [FK_Reseña_Restaurante]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Cliente]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Restaurante] FOREIGN KEY([IdRestaurante])
REFERENCES [dbo].[Restaurante] ([IdRestaurante])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Restaurante]
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarMenu]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarMenu]
@IdRestaurante int,
@Nombree varchar(50), 
@DescripcionMenu varchar(500),
@Precioo int
AS 
BEGIN
	INSERT INTO Menu(IdRestaurante, Nombre, Descripcion, Precio) 
	VALUES(@IdRestaurante, @Nombree, @DescripcionMenu, @Precioo)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarReseña]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarReseña]
@IdResto int,
@IdClient int,
@Comment varchar(500),
@Valoracion int
AS 
BEGIN
	INSERT INTO Reseña(IdRestaurante, IdCliente, Comentario, Valoracion)
	VALUES(@IdResto, @IdClient, @Comment, @Valoracion)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarReserva]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarReserva]
@IdRestaurante int, 
@IdCliente int, 
@FechaReserva date, 
@Hora varchar(50), 
@Cantidad int
AS
BEGIN
	INSERT INTO Reserva(IdRestaurante, IdCliente, FechaReserva, HoraReserva, CantidadPersonas)
	VALUES(@IdRestaurante, @IdCliente, @FechaReserva, @Hora, @Cantidad)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarRestaurante]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarRestaurante]
@NomRestaurante varchar(50),
@Direccionn varchar(100),
@HoraApertura varchar(50),
@HoraClausura varchar(50),
@FechaFunda date,
@Img varchar(500), 
@Descripcionn varchar(500)
AS 
BEGIN
	INSERT INTO Restaurante(Nombre, Direccion, HorarioApertura, HorarioClausura, FechaFundacion, Imagen, Descripcion)
	VALUES(@NomRestaurante, @Direccionn, @HoraApertura, @HoraClausura, @FechaFunda, @Img, @Descripcionn)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Contacto]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Contacto]
@idCliente int,
@Nombre varchar(50),
@Apellido varchar(50),
@Telefono int,
@Email varchar(50),
@Mensaje varchar(50)

AS 
BEGIN
	INSERT INTO Contacto(idCliente,Nombre, Apellido,Telefono, Email, Mensaje)
	VALUES(@idCliente,@Nombre, @Apellido,@Telefono, @Email,@Mensaje )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarRestaurante]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarRestaurante]
    @IdRestaurante INT
AS
BEGIN
        DELETE FROM Restaurante WHERE IdRestaurante = @IdRestaurante; 
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetInfoMenu]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetInfoMenu]
@IdRestaurante int
AS 
BEGIN
	SELECT * FROM Menu WHERE IdRestaurante = @IdRestaurante
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetInfoRestaurante]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetInfoRestaurante]
@IdRestaurante int
AS 
BEGIN
	SELECT * FROM Restaurante WHERE IdRestaurante = @IdRestaurante
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListaReseñasDeUnRestaurante]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetListaReseñasDeUnRestaurante]
@IdRestaurante int
AS 
BEGIN
	SELECT * FROM Reseña Where IdRestaurante = @IdRestaurante
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListaReservaDeUnCliente]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetListaReservaDeUnCliente]
@IdCliente int
AS 
BEGIN
	SELECT Rese.*, Rest.Nombre as NombreRestaurante FROM Reserva Rese
	INNER JOIN Restaurante Rest ON Rese.IdRestaurante = Rest.IdRestaurante
	Where IdCliente = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetListaRestaurantes]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetListaRestaurantes]
AS 
BEGIN
	SELECT * FROM Restaurante
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerContraseñaPorEmail]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ObtenerContraseñaPorEmail]
@Email varchar(50)
AS 
BEGIN
	SELECT * FROM Cliente WHERE Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Registro]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Registro]
@Nombre varchar(50),
@Apellido varchar(50),
@Contraseña varchar(50),
@Email varchar(50)
AS 
BEGIN
	INSERT INTO Cliente(Nombre, Apellido, Contraseña, Email)
	VALUES(@Nombre, @Apellido, @Contraseña, @Email)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_VerificarCredenciales]    Script Date: 29/11/2023 16:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_VerificarCredenciales]
@Email varchar(50)
AS
BEGIN
	SELECT * FROM Cliente WHERE Email = @Email
END
GO
USE [master]
GO
ALTER DATABASE [ReservaRestaurantes] SET  READ_WRITE 
GO
