
INSERT INTO Restaurante(Nombre, Direccion, HorarioApertura, HorarioClausura, FechaFundacion, Imagen, Descripcion) 
VALUES('Kansas', 'Av. del Libertador 4625', '12:00', '00:00', '1999-06-09', 'https://buenosairesenvivo.com/wp-content/uploads/2023/08/unnamed-7.png', 'Kansas es un restaurant de Contemporary American Cuisine. El primer Restaurant fue inaugurado en Junio de 1999 en San Isidro. Nuestra visión es aportar alimentos de calidad en un ambiente placentero a través de un servicio excelente.'),
	  ('Dean & Dennys', 'Malabia 1591', '10:00', '21:00', '2012-04-08', 'https://deananddennys.com/contenidos/1611864738.png', 'Dean & Dennys nace en Buenos Aires, Argentina, con la premisa de ofrecer hamburguesas y hot dogs de calidad premium, con locales de ambiente moderno, distendido y agradable.'), 
	  ('KFC', 'Av. Corrientes 3201', '10:00', '23:00', '1952-09-24', 'https://assets.website-files.com/609c023f320888ea539cdc7e/60e4938c76307be2564c66fb_KFC_Website_SobreKFC_LegacyLogo.svg', 'KFC corporations, (Kentucky Fried Chicken) es la marca líder especializada en los productos de pollo con más de 17.000 restaurantes en todo el mundo con sede en Louisville.'), 
	  ('Don Julio', 'Guatemala 4699', '11:00', '01:00', '1999-12-30', 'https://www.parrilladonjulio.com/images/logo.png', 'Don Julio se encuentra en el barrio porteño de Palermo y se destaca por servir cortes de carne premium a la parrilla, acompañados por vegetales y productos orgánicos de cada temporada -cultivados especialmente para el restaurante- y embutidos elaborados de manera artesanal.'), 
	  ('El Ferroviario', 'Av. Reservistas Argentinos 219', '12:00', '23:00', '2006-05-24', 'https://elferroviarioparrilla.com/images/logo.png', 'Con el paso del tiempo y respondiendo a las peticiones de los comensales, se fueron incluyendo diversidad de platos y manjares. Se incorporaron al menú carnes asadas, guarniciones, pastas, picadas, postres elaborados, carnes exóticas, vinos de todas las gamas y tragos lo que llevó al pequeño buffet del Club a convertirse en el Restaurante- Parrilla tan famoso que hoy conocemos, con su característica fidelidad por las tradiciones nacionales.')


INSERT INTO Menu(IdRestaurante, Nombre, Descripcion, Precio) 
VALUES(10, 'Churrasquito de Pollo', 'Nuestro churrasquito de pollo a la parrilla combina tierna pechuga de pollo sazonada y asada a la parrilla para obtener un sabor jugoso y ahumado. Perfecto para satisfacer tus antojos de pollo a la parrilla', 3700),
	  (8, 'Bucket Clasico', 'Disfruta de una deliciosa y crujiente experiencia gastronómica con nuestro emblemático Bucket de Pollo. Este irresistible combo te ofrece piezas de pollo frito a la perfección, sazonadas con nuestras especias secretas, que harán que cada bocado sea inolvidable. Ideal para compartir en familia o con amigos', 6400),
	  (7, 'Bacon Cheeseburger', 'Hamburguesa de carne de 120g, cheddar, panceta crocante y salsa Dennys', 3400),
	  (6, 'Houston Barbecue Ribs', 'Costillar de cerdo asado a fuego lento, aderezado con salsa barbacoa, acompañado de papas fritas y cole slaw o papa rellena.', 15600),
	  (9, 'Bife de lomo fino', 'Un exquisito bife de lomo, tierno y jugoso, cocinado a la perfección. Este corte premium de carne se derrite en tu boca con su sabor inigualable. Cada bocado es una experiencia de placer gastronómico, con su textura suave y su sabor inigualable. Una verdadera indulgencia para los amantes de la carne.', 19140)


CREATE PROCEDURE sp_AgregarMenu
@IdRestaurante int,
@Nombree varchar(50), 
@DescripcionMenu varchar(500),
@Precioo int
AS 
BEGIN
	INSERT INTO Menu(IdRestaurante, Nombre, Descripcion, Precio) 
	VALUES(@IdRestaurante, @Nombree, @DescripcionMenu, @Precioo)
END




CREATE PROCEDURE sp_AgregarRestaurante
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


CREATE PROCEDURE sp_AgregarReseña
@IdResto int,
@IdClient int,
@Comment varchar(500),
@Valoracion int
AS 
BEGIN
	INSERT INTO Reseña(IdRestaurante, IdCliente, Comentario, Valoracion)
	VALUES(@IdResto, @IdClient, @Comment, @Valoracion)
END


CREATE PROCEDURE sp_GetListaRestaurantes
AS 
BEGIN
	SELECT * FROM Restaurante
END

CREATE PROCEDURE sp_GetInfoRestaurante
@IdRestaurante int
AS 
BEGIN
	SELECT * FROM Restaurante WHERE IdRestaurante = @IdRestaurante
END

