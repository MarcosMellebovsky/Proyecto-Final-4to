USE [master]
GO
/****** Object:  Database [ReservaRestaurantes]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 21/11/2023 17:48:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[IdRestaurante] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Precio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reseña]    Script Date: 21/11/2023 17:48:45 ******/
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
	[NombreUsuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reseña] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  Table [dbo].[Restaurante]    Script Date: 21/11/2023 17:48:45 ******/
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
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([IdMenu], [IdRestaurante], [Nombre], [Descripcion], [Precio]) VALUES (6, 10, N'Churrasquito de Pollo', N'Nuestro churrasquito de pollo a la parrilla combina tierna pechuga de pollo sazonada y asada a la parrilla para obtener un sabor jugoso y ahumado. Perfecto para satisfacer tus antojos de pollo a la parrilla', N'3700')
INSERT [dbo].[Menu] ([IdMenu], [IdRestaurante], [Nombre], [Descripcion], [Precio]) VALUES (7, 8, N'Bucket Clasico', N'Disfruta de una deliciosa y crujiente experiencia gastronómica con nuestro emblemático Bucket de Pollo. Este irresistible combo te ofrece piezas de pollo frito a la perfección, sazonadas con nuestras especias secretas, que harán que cada bocado sea inolvidable. Ideal para compartir en familia o con amigos', N'6400')
INSERT [dbo].[Menu] ([IdMenu], [IdRestaurante], [Nombre], [Descripcion], [Precio]) VALUES (8, 7, N'Bacon Cheeseburger', N'Hamburguesa de carne de 120g, cheddar, panceta crocante y salsa Dennys', N'3400')
INSERT [dbo].[Menu] ([IdMenu], [IdRestaurante], [Nombre], [Descripcion], [Precio]) VALUES (9, 6, N'Houston Barbecue Ribs', N'Costillar de cerdo asado a fuego lento, aderezado con salsa barbacoa, acompañado de papas fritas y cole slaw o papa rellena.', N'15600')
INSERT [dbo].[Menu] ([IdMenu], [IdRestaurante], [Nombre], [Descripcion], [Precio]) VALUES (10, 9, N'Bife de lomo fino', N'Un exquisito bife de lomo, tierno y jugoso, cocinado a la perfección. Este corte premium de carne se derrite en tu boca con su sabor inigualable. Cada bocado es una experiencia de placer gastronómico, con su textura suave y su sabor inigualable. Una verdadera indulgencia para los amantes de la carne.', N'19140')
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Restaurante] ON 

INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion]) VALUES (6, N'Kansas', N'Av. del Libertador 4625', N'12:00', N'00:00', CAST(N'1999-06-09' AS Date), N'https://statics.eleconomista.com.ar/2023/08/64cbc8308cc87.jpg', N'Kansas es un restaurant de Contemporary American Cuisine. El primer Restaurant fue inaugurado en Junio de 1999 en San Isidro. Nuestra visión es aportar alimentos de calidad en un ambiente placentero a través de un servicio excelente.')
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion]) VALUES (7, N'Dean & Dennys', N'Malabia 1591', N'10:00', N'21:00', CAST(N'2012-04-08' AS Date), N'https://www.cronista.com/files/image/474/474433/62ff95554e214.jpg', N'Dean & Dennys nace en Buenos Aires, Argentina, con la premisa de ofrecer hamburguesas y hot dogs de calidad premium, con locales de ambiente moderno, distendido y agradable.')
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion]) VALUES (8, N'KFC', N'Av. Corrientes 3201', N'10:00', N'23:00', CAST(N'1952-09-24' AS Date), N'https://s39940.pcdn.co/wp-content/uploads/2022/11/iStock-1321150254.jpg', N'KFC corporations, (Kentucky Fried Chicken) es la marca líder especializada en los productos de pollo con más de 17.000 restaurantes en todo el mundo con sede en Louisville.')
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion]) VALUES (9, N'Don Julio', N'Guatemala 4699', N'11:00', N'01:00', CAST(N'1999-12-30' AS Date), N'https://imag.bonviveur.com/agradable-rincon-del-restaurante-don-julio.jpg', N'Don Julio se encuentra en el barrio porteño de Palermo y se destaca por servir cortes de carne premium a la parrilla, acompañados por vegetales y productos orgánicos de cada temporada -cultivados especialmente para el restaurante- y embutidos elaborados de manera artesanal.')
INSERT [dbo].[Restaurante] ([IdRestaurante], [Nombre], [Direccion], [HorarioApertura], [HorarioClausura], [FechaFundacion], [Imagen], [Descripcion]) VALUES (10, N'El Ferroviario', N'Av. Reservistas Argentinos 219', N'12:00', N'23:00', CAST(N'2006-05-24' AS Date), N'https://www.clarin.com/2022/04/11/EQuIGEVpZ_1200x0__1.jpg', N'Con el paso del tiempo y respondiendo a las peticiones de los comensales, se fueron incluyendo diversidad de platos y manjares. Se incorporaron al menú carnes asadas, guarniciones, pastas, picadas, postres elaborados, carnes exóticas, vinos de todas las gamas y tragos lo que llevó al pequeño buffet del Club a convertirse en el Restaurante- Parrilla tan famoso que hoy conocemos, con su característica fidelidad por las tradiciones nacionales.')
SET IDENTITY_INSERT [dbo].[Restaurante] OFF
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Restaurante] FOREIGN KEY([IdRestaurante])
REFERENCES [dbo].[Restaurante] ([IdRestaurante])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Restaurante]
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarMenu]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarReseña]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarReserva]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_AgregarRestaurante]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetInfoMenu]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetInfoRestaurante]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetListaReseñasDeUnRestaurante]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetListaRestaurantes]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ObtenerContraseñaPorEmail]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Registro]    Script Date: 21/11/2023 17:48:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_VerificarCredenciales]    Script Date: 21/11/2023 17:48:45 ******/
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
