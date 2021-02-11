-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2021 a las 20:51:26
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `periodicodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`) VALUES
(2, 'Televisión'),
(3, 'Cine'),
(4, 'Eventos'),
(5, 'Farándula'),
(8, 'Tecnología'),
(10, 'Clima'),
(11, 'Deportes'),
(16, 'Sociedad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `puesto` varchar(20) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `apellidos`, `puesto`, `user`, `password`) VALUES
(4, 'Jesús Raymundo', 'Hernández Zapata', 'Periodista', 'jesús_hernández@edenoticias.com', 'lf7-z8rk'),
(5, 'Joan Osvaldo', 'Iglesia Reyes', 'Recursos Humanos', 'joan_iglesia@edenoticias.com', '#d538gk1'),
(10, 'Rebeca', ' Sepulveda Rodriguez', 'Editor', 'rebeca_@edenoticias.com', '$9i_ign4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(10000) NOT NULL,
  `fecha` date NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `idEmpleado`, `idCategoria`, `idTipo`, `imagen`, `titulo`, `descripcion`, `fecha`, `estado`) VALUES
(15, 4, 16, 3, '367a31c4c981f80b7e8dafb7f7c888e0.jpg', 'SIN LIMITES PARA ENSEÑAR: MAESTRA TABASQUEÑA DA CLASES EN CASA A NIÑOS SIN INTERNET', 'CUNDUACÁN.\r\n\r\nLa docente nota cuando algunos de los niños no tiene los medios para aprender, ya que no e envían al Whatsapp las evidencias (fotografías) de sus actividades programadas semanalmente.\r\n\r\nLa maestra Teresa Torres sabe que, aunque no pueden explicar en un pizarrón como lo hacia hace un año, su labor continúa en medio de una pandemia sin precedentes. Para ello, acude a la casa de sus pequeños alumnos que no cuentan con internet ni medios electrónicos para poder enseñarles.\r\n\r\nAunque está en esta en marcha el programa Aprende en Casa II, en la entidad hay familias que no cuentan con televisión, celulares o computadoras con internet. Eso la profesora Teresa lo sabe, pues a lo largo de los años ha detectado las necesidades de sus alumnos de la primaria medio rural de la ranchería Culico segunda sección.\r\n\r\nLa docente nota cuando alguno de ellos no tiene los medios para aprender, ya que no le envían por Whatsapp las evidencias de sus activiades programadas semanalmente. Además, al principio del ciclo escolar 2020-2021 se les hizo una encuesta para saber con que medio disponían para estar en comunicación, cuenta la maestra.\r\n\r\nDado que no quiere que ningún niño se quede sin aprender, durante las semanas de reforzamiento localiza a los padres de familia que no cuentan con los dispositivos electrónicos para solicitarles permiso de acudir a sus viviendas y explicarles los temas a los menores.\r\n\r\nCon todas las medidas sanitarias, como el uso de cubrebocas, sana distancia y de preferencia en lugares al aire libre, la maestra Teresa acude casa por casa de los niños oara que entreguen avances de sus activiades y, tanto ellos como sus padres, depejen sus dudas.', '2021-01-23', 0),
(21, 4, 16, 3, '6bf21afa11e708e2a166ca666c0ef839.jpg', 'CONOCE LOS CANALES Y HORARIOS DE LAS CLASES POR TELEVISIÓN', 'Este domingo la Secretaría de Educación Pública (SEP) dio a conocer cuáles serán los canales y horarios de las clases por televisión a iniciar el próximo 24 de agosto.\r\n\r\nY es que con el objetivo de garantizar el acceso a la educación, el Gobierno Federal firmó un acuerdo con cuatro televisoras - Televisa, TV Azteca, Imagen y Multimedios - las cuales apoyarán el regreso a clases a distancia.\r\n\r\nEs por ello que aquí te dejamos todo lo necesario para un regreso a clases fructífero:\r\n\r\nCANALES Y HORARIOS DE APRENDE EN CASA II.\r\n\r\nLas clases de preescolar y primaria serán transmitidas a través de Canal Once (frecuencia 11.2), Televisa (frecuencia 5.2) y TV Azteca (frecuencia 7.3).\r\n\r\nMientras que las clases de secundaria podrán ser vistas por Ingenio TV e Imagen Televisión en la frecuencia 3.2, y las clases de bachillerato por Ingenio TV (14.2) y Milenio Televisión (6.3).\r\n\r\nLa programación de clases iniciara a las 07:30 horas con un especial para madres y padres de familia o tutores. Dichas clases podrán verse en las cuatro cadenas en horarios distintos.', '2020-08-16', 0),
(22, 4, 3, 1, 'e1ef1160440e35301736ec1e39bb868d.jpg', 'CINEASTAS ENFRENTAN CRISIS POR PANDEMIA', 'Tabasqueños comparten de qué manera podrían reactivarse la industria del sétimo arte.\r\n\r\nDespues de que la firma FilmLA, organización encargada de las filmaciones en el área metropolitana de Los Ángeles diera a conocer a medios nacionales la crisis que enfrenta en este momento la industria del cine por la pandemio de Covid-19, atrasando un sin fin de estrenos desde el 2020 y aplazando las grabaciones de nuevas películas, entrevistando a cineastas tabasqueños para que dieran su opinion sobre la situación del sétimo arte.\r\n\r\n- Lo positivo de todo esto es que se tomaron más en serio la seguridad y la salud de la producción - Jorge Paz.\r\n\r\n- Es un reto muy difícil al que nos enfrentamos cineastas. La tecnología puede sacarnos adelante - Juan Chable.\r\n\r\nPOCO PERSONAL.\r\n\r\nUno de ellos fue el cineasta Fabián León, nominado al Ariel en 2018 por su corto - El Chambelan - quien dijo, -  Todo lo que estamos viviendo entorno al covid hacer las cosas más complicadas de cara a nivel producción, lo cal para México no es nada bueno en cuestión de las películas. Creo que el reto es plantear producciones más pequeñas, y contratar a pocas personas -.\r\n\r\nGRAN RETO.\r\n\r\nPor su parte, Jorge Paz, creador del Festival de cortos de terror Voodoo Film Fest comento: - Es un reto muy difícil al que nunca nos habíamos enfrentado, si ya era difícil poder producir una película en circunstancias ordinarias, ahora lo es más, tanto por los ajustes y cambios de presupuesto cómo por las medidas sanitarias. Debemos adaptarnos a la nueva normalidad -.', '2021-01-12', 0),
(25, 4, 8, 2, '259b4c29e0c3018c9ea3d4c1bafad621.jpg', 'CINEMEX RENTARÁ SUS SALAS PARA ¡JUGAR VIDEOJUEGOS!', 'MÉXICO.\r\n\r\nAquí te decimos costos, juegos disponibles, entre otros datos.\r\n\r\n¿Habrá algo más emocionantes? Próximamente los jgadores más aposionados de la Ciudad de Mexico y un futuro no muy lejano de toda la República, podrán llevar la experiencia de un videojuego a una nueva dimensión gracias a Cinemex. Los complejos de la empres podrán usarse para jugar una partida con quien tú quieras.\r\n\r\nSe trata del nuevo formato de Mi Sala Cinemex, con el cual puedes rentar una sala exclusivamente para ti y tus amigos o familiares para disfrutar de una buena película, pero que ahora tendrá un nuevo giro.\r\n\r\nY es que si bien en un principio el proyecto solo contemplaba proyecciones de películas, Cinemex ha decidido que es el momento de llevar su iniciativa a otro nivel y a otros públicos potenciales. Si eres un gamer en busca de un espacio cómodo e increíble para continuar la partida, esto te encantará.\r\n\r\n¿QUÉ JUEGOS SE PODRÁN JUGAR?\r\n\r\nLos interesados podrán jugar en formato libre o torneo con juegos como Super Mario Smash Bros Ultimate, Street Fighter, Mortal Kombat 11, Marvel vs Capcom, Injustice 2, Dragon Ball Fighter Z, FIFA 20, Mario Kart 8 Deluxe, Mario Party, Arms, Pokemon Tournament, Rush of Blood y Beat Saber.\r\n\r\n¿DÓNDE ESTARÁ DISPONIBLE?\r\n\r\nEn la Ciudad de México los complejos en las que ya podrás acceder a Mi Sala Cinemex Gamer sn Artz Pedregal, Parque Delta, Lindavista, Universidad y Reforma 22. La iniciativa llegará a otras salas del país próximamente como las de Corso, Cuernavaca, Premium Metepec, Premium Querétaro, Premium Pachuca, entre otras.\r\n', '2020-11-18', 0),
(26, 4, 4, 1, 'c1a2f3be7da510b4909b58fdefd6f351.jpg', 'ENCABEZA ADÁN AUGUSTO EVENTOS POR DÍA DE LA INDEPENDENCIA', 'En el marco de los festejos de la conmemoración del Día de la Independencia Nacional, esta mañana se llevaron a cabo diversos eventos por parte de las autoridades del Gobierno del Estado.\r\n\r\nAlrededor de las 8:30 de la mañana, el gobernador Adán Augusto López Hernández realizó una entrega floral y guardia en honor a Don Miguel Hidalgo y Costilla, iniciador del movimiento independentista.\r\n\r\nEl gobernador, acompañado de su esposa Dea Isabel Estrada de López, y con la asistencia del personal del Sector Salud, realizó tambien la entregade reconocimientos al personal médico por su papel trascendental al frente de la pandemia que aún afecta a nuestra sociedad. En la ceremonia estuvieron presentes directores de los diversos hospitales, así como jefas de los departamentos en Enfermería de los nosocomios.\r\n\r\nActo seguido, López Hernández presidió el Desfile Militar con motivo del 210 aniversario del Inicio de la Independencia de México, en el cual en esta ocasiónse trató propiamente de una parada militar debido a las restricciones sanitarias por la pandemia. En dicho desfile, participaron el Secretaría de Educación, la Secretaría de Cultura, la Secretaría de Desarrollo Económico para la Competitividad, la Secretaría de Marina, La Guardia Nacional, la Secretaría de Seguridad y Protección Ciudadana de Tabasco.', '2020-09-16', 0),
(27, 4, 4, 1, '70273ebccd283fc9c3d1353765fdb48e.jpg', 'POR COVID-19 POSPONEN EVENTOS EN EL EDÉN', 'Sin duda alguna las empresas de espectáculos han sido un de las más afectadas ha causa de la pandemia del coronavirus, esto debido a que el Gobierno Federal prohibío realizar eventos masivos para evitar la propagación del virus, y nuestra entidad no fue la excepción.\r\n\r\nPor tal motivo empresarios tabasqueños tuvieron que tomar la lamentable decisión de posponer los eventos que tenían planeado llevar acabo de próximos días, semanas y hastas meses, esperando pronto poder llevarlos a cabo.\r\n\r\nEntre ellos podemos mencionar el espectáculo - Los mandamientos de una mujer chingona - con Susana Zavaleta, Rebeca de Alba y Adela Micha, que estaría presetándose el 22 de abril en el Teatro Esperanza Iris, pero fue pospuesto por los organizadores hasta nueva fecha.\r\n\r\nSeguido de la presentaciín del - Divo de Linares -, el cantante español Raphael, quién se tenía planeado arribará a Villahermosa a finales de este mes, pero ahora retornará a tierras tabasqueñas hasta próximo año.', '2020-04-21', 1),
(28, 4, 11, 3, '3fbd8a8ffc555c2a99c25ffbec3b0bf4.jpg', 'SE CABA EL AÑO DEPORTIVO CON EVENTOS CANCELADOS', 'El mundo del deporte ha sido severamente golpeado, por el Covid-19, desde el aplazamiento un año de los Juegos Olimpicos, Eurocopa y Copa America hasta la suspensión de todas las ligas de futbol de manera indefinida el balón, pelota, ovoide o vehículo está detenido, hay peridas millonarias peso sobre todo, una gran incertidumbre de cuando volverá el deporte.\r\n\r\nSin duda alguna la suspención de los Juegos Olimpicos es el evento mpas importante que no perderemos este año, Tokio ya tenia todo listo para recibir a los atletas de todo el mundo y observar como se rompen maracas imposibles pero tendrá que esperar hasta el otro año.\r\n\r\nLa Copa America y la Eurocopa son otras de las justas que estarán presentes hasta el próximo año ante la propagación de la pandemia de manera cruel e inconciente por todo el mundo, los dos eventos de futbol fueron suspendidos el 17 de marzo.\r\n\r\nEl primer evento cancelado fue el torne Masters 1000 de Indian Wells, el 8 de marzo se tomó la determinación de no llebar a cabo este evento de tenis; entre los acontencimientos deportivos que ya no veremos este 2020 tenemos el GP de Australia, la Clase más Grande de Box, que se efecutuaría en la explanada del Zócalo de la Ciudad de México, las Series de MLB de México y Puerto Rico, el Recorrido del fuego de los Juegos Olimpicos y Wilbledon.\r\n\r\nQueda a la espera de las fechas para que reinicie el futbol mundial, comience el beisbol de Grande Ligas y la Liga Mexicana de Besibol, la NBA, NHL y aún no se sabe si será cambiada la fecha de inicio de la NFL que hasta el momento cuenta con varios meses de colchón para su inicio pero la pretemporada si estará afectada.', '2020-04-03', 0),
(29, 4, 4, 1, '43d25c3861d798b99c1a634640309adb.jpg', 'PROPONEN QUE LA FERIA SEA EN OCTUBRE O NOVIEMBRE', 'La Cámara Nacional de Comercio, Servicios y Turismo de Villahermosa (CONACO SERVYTUR) solicitó al gobernador Adán Augusto López Hernández, que se analice la opción de realizar la máxima fiesta de los tabasqueños en el mes de octubre o noviembre de 2021.\r\n\r\nA través de un oficio emitido por el presidente del Comité Organizador de la Feria Tabasco, José Estrada Garrido, indicó que, actividades como la Feria es un respiroo para el sector comercial y de turismo.\r\n\r\n- Activiades como la feria Tabasco es un respiro para nuestro sector, por eso es que, en mi calidad de presidente de la Cámara Nacional de Comercio, Servicios y Turismo de Villahermosa, le solicito que analice la opción de realizr la máxima fiesta de los tabasqueños en el mes de octubre o noviembre de 2021 -, señalo Estrada Garrido.\r\n\r\nEl presidente del Comité Organizador indicó que la propuesta es con la intención de que, tanto la ciudadania como el sector de comercio puedan disfrutar de un momento de esparcimiento, confiando en que, para esas fechas, la pandemia ya esté controlada y que no se baje la guardia, por lo que estrarían tomando todas las medidas se seguridad sanitaria.\r\n\r\nEstrada Garrido recordó que la última feria lofro recaudar 29 millones de pesos, ocho más de los que se invirtieron; pero en este caso, los eventos serían virtuales, tales como la imposición de bandas y la elección; la inversión sería menor.\r\n\r\nLa Conaco Servytur Villahermosa, solicitó que la sede sea la misma, lo permitiría tener una sana distancia entre los asistentes; misma que aplicarían los comercios al interior de las naves.\r\n\r\nReiteraron que buscan que la ciudadania acuda con todas las medidas de seguridad posible.\r\n\r\n- Ponemos sobre la mesa dicha propuesta, ofreciéndonos también para ser parte de la organización de la misma, pues buscamos que la ciudadania acuda con todas las medidas de seguridad posibles -, finalizó. ', '2021-01-24', 1),
(33, 4, 16, 1, '32a522ff19b76e3a2a2c5e6c2c1a3de6.jpg', 'ANUNCIA GOBIERNO DE TABASCO NUEVOS SUBSIDIOS EN LA ENERGÍA ELÉCTRICA', 'TABASCO.- El gobernador Adán Augusto López Hernández anunció este martes 2 de febrero un nuevo subsidio -de manera automática- para la energía eléctrica tras un acuerdo con la Comisión Federal de Electricidad (CFE).\r\n\r\nCabe recordar que el mandatario adelantó ayer que HOY darían a conocer un “importante anuncio” para el bien de la entidad.', '2021-02-21', 1),
(41, 4, 11, 3, '6d5611a47492eff3ef8cbc8fb57ee637.jpg', '¿Qué pasará en Mundial de Clubes? Thomas Müller tiene covid-19; se pierde final ante Tigres', 'El mediapunta es considerado como uno de los jugadores claves del Bayern y ha jugado en esta temporada 28 de 29 partidos oficiales en los que ha marcado 12 goles y ha hecho 16 asistencias.\r\n\r\nEl Bayern no podrá contar este jueves con Thomas Müller en la final del Mundial de Clubes ante el Tigres debido a un positivo de coronavirus, según informaciones de medios alemanes que aseguran que en breve habrá una confirmación de la FIFA. \r\n\r\nMüller, según las informaciones, no se presenta síntomas y se encuentra bien. \r\n\r\nMüller, además, es una especie de mensajero del entrenador Hansi Flick en el campo, permanentemente está dando instrucciones a sus compañeros y suele liderar la presión alta para recuperar la pelota. Entre los candidatos a sustituirlo hoy están Jamal Musiala, Corentin Tolisso y Leroy Sané. Según la revista \"Sport Bild\" a Müller se le hicieron tres test. El primero dio positivo, el segundo negativo y el tercero volvió a dar positivo. \r\n\r\nEl resto de los test de los jugadores del Bayern dieron negativo. \r\n\r\nLos positivos de Javi Martínez y Leon Goretzka, que no viajaron a Catar, ya son de hace un tiempo por lo que el contagio por esa vía es improbable. ', '2021-02-11', 0),
(42, 4, 16, 1, 'aff924213ac2c994f7150e3f78ab8ac0.jpg', 'DISMINUYEN LOS CONTAGIOS DE COVID-19 EN LA ENTIDAD', 'En los ultimos días ha disminuido la hospitalización por contagios de covid-19', '2021-02-11', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodico`
--

CREATE TABLE `periodico` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodico`
--

INSERT INTO `periodico` (`id`, `fecha`) VALUES
(9, '2021-02-02'),
(11, '2021-02-03'),
(12, '2021-02-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodico_detalles`
--

CREATE TABLE `periodico_detalles` (
  `id` int(11) NOT NULL,
  `idPeriodico` int(11) NOT NULL,
  `idNota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodico_detalles`
--

INSERT INTO `periodico_detalles` (`id`, `idPeriodico`, `idNota`) VALUES
(1, 12, 27),
(2, 12, 42);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id`, `tipo`) VALUES
(1, 'Local'),
(2, 'Nacional'),
(3, 'Internacional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `membresia` varchar(30) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `password`, `nombre`, `apellidos`, `membresia`, `estado`) VALUES
(6, 'jesus@gmail.com', '1234', 'Jesús Raymundo', 'Hernández Zapata', '', 0),
(7, 'wendy@hotmail.com', '23456', 'Wendy Janet', 'Cahuich Garcia', '', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idCategoria` (`idCategoria`),
  ADD KEY `fk_tipo` (`idTipo`);

--
-- Indices de la tabla `periodico`
--
ALTER TABLE `periodico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `periodico_detalles`
--
ALTER TABLE `periodico_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPeriodico` (`idPeriodico`,`idNota`),
  ADD KEY `fk_nota` (`idNota`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `periodico`
--
ALTER TABLE `periodico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `periodico_detalles`
--
ALTER TABLE `periodico_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk-categoria` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`id`),
  ADD CONSTRAINT `fk_tipo` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`id`);

--
-- Filtros para la tabla `periodico_detalles`
--
ALTER TABLE `periodico_detalles`
  ADD CONSTRAINT `fk_nota` FOREIGN KEY (`idNota`) REFERENCES `notas` (`id`),
  ADD CONSTRAINT `fk_periodico` FOREIGN KEY (`idPeriodico`) REFERENCES `periodico` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
