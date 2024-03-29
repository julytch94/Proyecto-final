-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-03-2017 a las 17:15:07
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `policlinco`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cita` (IN `_codcita` INT(10))  BEGIN
	DELETE from cita WHERE codcita=_codcita;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_todo_cita` ()  BEGIN
    DELETE from cita;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_cita` (IN `_codcita` VARCHAR(10), IN `_refEsp` VARCHAR(20), IN `_refturno` VARCHAR(15), IN `_refDoc` VARCHAR(25))  BEGIN
	UPDATE cita set refEsp=_refEsp, refturno=_refturno, refDoc=_refDoc WHERE codcita=_codcita;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_citas` ()  BEGIN
	SELECT *FROM cita;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nueva_cita` (IN `_codcita` INT(10), IN `_refEsp` VARCHAR(20), IN `_refcodpac` INT(10), IN `_refturno` VARCHAR(15), IN `_refDoc` VARCHAR(25))  BEGIN
	INSERT INTO cita VALUES('_codcita','_refEsp','_refcodpac','_refturno','_refDoc'); 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `codcita` int(10) NOT NULL,
  `refEsp` varchar(20) NOT NULL,
  `refcodpac` int(10) NOT NULL,
  `hora_atenc` time NOT NULL,
  `refDoc` varchar(25) NOT NULL,
  `refFecha` varchar(20) NOT NULL,
  `refDia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `codigodoc` int(7) NOT NULL,
  `nombredoc` varchar(75) NOT NULL,
  `turnodoc` varchar(15) NOT NULL,
  `especialidadoc` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`codigodoc`, `nombredoc`, `turnodoc`, `especialidadoc`) VALUES
(1, 'Dr. Maya', 'MCirugia', 'k'),
(2, 'Dr Trujillo', 'TCirugia', 'k'),
(3, 'Dr Loo', 'MCardiologia', 'a'),
(4, 'Dra Paredes', 'TCardiologia', 'a'),
(5, 'Dr Curbelo', 'MEcografia', 'aa'),
(6, 'Dr Quiroga', 'TEcografia', 'aa'),
(7, 'Dr Bendezu', 'mDermatologia', 'b'),
(8, 'Dr Garibay', 'TDermatologia', 'b'),
(9, 'Dr Obregon', 'MEndocrinologia', 'c'),
(10, 'Dr Ruiz', 'TEndicronologia', 'c'),
(11, 'Dr Astocondor', 'MGeriatria', 'd'),
(12, 'Dr Oyola', 'TGeriatria', 'd'),
(13, 'Dr Linares C', 'MGinecologia', 'e'),
(14, 'Dra Silva', 'TgGinecologia', 'e'),
(15, 'Dra Martinez', 'MHematologia', 'f'),
(16, 'Dr Carrion', 'THematologia', 'f'),
(17, 'Dra Ruiz', 'MMedGeneral', 'g'),
(18, 'Dra Polo', 'TMedGeneral', 'g'),
(19, 'Dr Escobar', 'MMedInterna', 'h'),
(20, 'Dra Palacios', 'TMedInterna', 'h'),
(21, 'Dr Martinez', 'MMedIntegral', 'i'),
(22, 'Dra Linares', 'TMedIntegral', 'i'),
(23, 'Dr Thomas', 'MNeumologia', 'j'),
(24, 'Dra Cristina', 'TNeumologia', 'l'),
(25, 'Dr Mires', 'MNutricionista', 'l'),
(26, 'Dra Gomez', 'TNutricionista', 'k'),
(27, 'Dr Toledo', 'MOdontologia', 'm'),
(28, 'Dra Pino', 'TOdontologia', 'm'),
(29, 'Dr Edgar', 'MOftalmologia', 'n'),
(30, 'Dra Elena', 'TOftalmologia', 'n'),
(31, 'Dra Efrain', 'MPediatria', 'o'),
(32, 'Dra Elizabeth', 'TPediatria', 'o'),
(33, 'Dr Eloy', 'MPodologia', 'p'),
(34, 'Dra Elvira', 'TPodologia', 'p'),
(35, 'Dr Emilio', 'MPsicologia', 'q'),
(36, 'Dra Emma', 'TPsicologia', 'q'),
(37, 'Dr Emanuel', 'MPsiquiatria', 'r'),
(38, 'Dra Erica', 'TPsiquiatria', 'r'),
(39, 'Dr Ernesto', 'MTraumatologia', 's'),
(40, 'Dra Sofia', 'TTraumatologia', 's');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `codesp` varchar(6) NOT NULL,
  `nomesp` varchar(20) NOT NULL,
  `consultorio` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`codesp`, `nomesp`, `consultorio`) VALUES
('a', 'Cardiología', 'A-21'),
('aa', 'Ecografia', 'A-33'),
('b', 'Dermatología', 'B-12'),
('c', 'Endocrinología', 'B-13'),
('d', 'Geriatría', 'C-23'),
('e', 'Ginecología', 'C-24'),
('f', 'Hematología', 'D-15'),
('g', 'Medicina General', 'D-22'),
('h', 'Medicina Interna', 'E-15'),
('i', 'Medicina Integral', 'E-21'),
('j', 'Neumología', 'A-25'),
('k', 'Cirugía', 'B-24'),
('l', 'Nutrición', 'C-11'),
('m', 'Odontogía', 'D-14'),
('n', 'Oftalmología', 'D-16'),
('o', 'Pediatría', 'D-15'),
('p', 'Podología', 'A-27'),
('q', 'Psicología', 'B-12'),
('r', 'Psiquiatría', 'C-11'),
('s', 'Traumatologia', 'C-56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha`
--

CREATE TABLE `fecha` (
  `Dia` varchar(20) NOT NULL,
  `Fec` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fecha`
--

INSERT INTO `fecha` (`Dia`, `Fec`) VALUES
('Jueves', ''),
('Lunes', ''),
('Martes', ''),
('Miercoles', ''),
('Sábado', ''),
('Viernes', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialcitas`
--

CREATE TABLE `historialcitas` (
  `CodCitapas` int(10) NOT NULL,
  `refpac` int(20) NOT NULL,
  `refesp` varchar(25) NOT NULL,
  `refFecha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `CodHorario` int(7) NOT NULL,
  `Turno` varchar(25) NOT NULL,
  `refDoc` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`CodHorario`, `Turno`, `refDoc`) VALUES
(1, '7:00am. - 12:00m.', 1),
(4, '1:30pm. - 4:00pm.', 2),
(5, '7:00am. - 12:00m.', 3),
(6, '1:30pm. - 4:00pm.', 4),
(7, '7:00am. - 12:00m.', 5),
(8, '1:30pm. - 4:00pm.', 6),
(9, '7:00am. - 12:00m.', 7),
(10, '1:30pm. - 4:00pm.', 8),
(11, '7:00am. - 12:00m.', 9),
(12, '1:30pm. - 4:00pm.', 10),
(13, '7:00am. - 12:00m.', 11),
(14, '1:30pm. - 4:00pm.', 12),
(15, '7:00am. - 12:00m.', 13),
(16, '1:30pm. - 4:00pm.', 14),
(17, '7:00am. - 12:00m.', 15),
(18, '1:30pm. - 4:00pm.', 16),
(19, '7:00am. - 12:00m.', 17),
(20, '1:30pm. - 4:00pm.', 18),
(21, '7:00am. - 12:00m.', 19),
(22, '1:30pm. - 4:00pm.', 20),
(23, '7:00am. - 12:00m.', 21),
(24, '1:30pm. - 4:00pm.', 22),
(25, '7:00am. - 12:00m.', 23),
(26, '1:30pm. - 4:00pm.', 24),
(27, '7:00am. - 12:00m.', 25),
(28, '1:30pm. - 4:00pm.', 26),
(29, '7:00am. - 12:00m.', 27),
(30, '1:30pm. - 4:00pm.', 28),
(31, '7:00am. - 12:00m.', 29),
(32, '1:30pm. - 4:00pm.', 30),
(33, '7:00am. - 12:00m.', 31),
(34, '1:30pm. - 4:00pm.', 32),
(35, '7:00am. - 12:00m.', 33),
(36, '1:30pm. - 4:00pm.', 34),
(37, '7:00am. - 12:00m.', 35),
(38, '1:30pm. - 4:00pm.', 36),
(39, '7:00am. - 12:00m.', 37),
(40, '1:30pm. - 4:00pm.', 38),
(41, '7:00am. - 12:00m.', 39),
(42, '1:30pm. - 4:00pm.', 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `Codmens` int(10) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `Asunto` varchar(50) NOT NULL,
  `Mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientegeneral`
--

CREATE TABLE `pacientegeneral` (
  `codigo` int(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `appaterno` varchar(25) NOT NULL,
  `apmaterno` varchar(25) NOT NULL,
  `sexo` varchar(5) NOT NULL,
  `dni` int(11) NOT NULL,
  `edad` int(3) NOT NULL,
  `peso` decimal(3,1) NOT NULL,
  `talla` decimal(3,2) NOT NULL,
  `nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pacientegeneral`
--

INSERT INTO `pacientegeneral` (`codigo`, `nombre`, `appaterno`, `apmaterno`, `sexo`, `dni`, `edad`, `peso`, `talla`, `nacimiento`) VALUES
(1, 'July ', 'Torres', 'Chavez', 'F', 48533198, 23, '55.0', '1.65', '1994-01-04'),
(2, 'Vannesa', 'Alvarado', 'Figueroa', 'F', 54677839, 20, '65.0', '1.70', '1997-11-28'),
(3, 'Sebastian ', 'Vargas', 'Canepa', 'M', 76789956, 56, '78.0', '1.82', '1960-04-06'),
(4, 'Jose Carlos', 'Montes', 'Rojas', 'M', 89776493, 34, '76.0', '1.78', '1982-07-08'),
(5, 'Cristopher', 'Venegas', 'Garibay', 'M', 46753688, 25, '67.0', '1.68', '1991-09-17'),
(6, 'Luis', 'Garcia', 'Cajavilca', 'M', 47865213, 45, '72.0', '1.70', '1971-11-03'),
(7, 'Sandra', 'Paola', 'Alvarez', 'F', 36748594, 28, '59.0', '1.70', '1989-06-25'),
(8, 'Alexandra', 'Mendiola', 'Flores', 'F', 34567353, 32, '60.0', '1.72', '1957-02-13'),
(9, 'Edgar', 'Murga', 'Orellana', 'M', 54677865, 26, '75.0', '1.72', '1990-09-04'),
(10, 'Camila', 'Trujillo', 'Vidal', 'F', 54678354, 12, '49.0', '1.58', '2005-01-19'),
(11, 'Macarena', 'Veles', 'Samaniego', 'F', 34453467, 35, '67.0', '1.72', '1981-12-16'),
(12, 'Lorena', 'Carrillo', 'Rojas', 'F', 45673856, 56, '65.0', '1.69', '1951-05-23'),
(13, 'Francisco', 'Toledo', 'Ramirez', 'M', 65676489, 32, '78.0', '1.73', '1985-01-24'),
(14, 'Lucia', 'Paima', 'Contreras', 'F', 5645376, 28, '65.0', '1.74', '1988-06-09'),
(15, 'Sonia', 'Estrada', 'Privat', 'F', 65678753, 50, '74.0', '1.72', '1966-08-12'),
(16, 'Rodrigo', 'Garcia', 'Miró', 'M', 34567895, 34, '80.0', '1.76', '1983-02-02'),
(17, 'Nicola', 'Zavaleta', 'Chavez', 'M', 45698789, 23, '62.0', '1.68', '1992-01-30'),
(18, 'Federico', 'Basalar', 'Monterico', 'M', 67645387, 19, '56.0', '1.65', '1997-10-21'),
(19, 'Yahayra', 'Arteaga', 'Quelopana', 'F', 45678946, 22, '58.0', '1.73', '1994-09-12'),
(20, 'Kasandra', 'Mendez', 'Lopez', 'F', 45637545, 25, '62.0', '1.72', '1991-06-18');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`codcita`),
  ADD KEY `refEsp` (`refEsp`),
  ADD KEY `refcodpac` (`refcodpac`),
  ADD KEY `refturno` (`hora_atenc`),
  ADD KEY `refhorario` (`refDoc`),
  ADD KEY `refcodpac_2` (`refcodpac`),
  ADD KEY `refFecha` (`refFecha`),
  ADD KEY `refDia` (`refDia`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`codigodoc`),
  ADD UNIQUE KEY `nombredoc` (`nombredoc`),
  ADD KEY `especialidadoc` (`especialidadoc`),
  ADD KEY `turnodoc` (`turnodoc`),
  ADD KEY `turnodoc_2` (`turnodoc`),
  ADD KEY `turnodoc_3` (`turnodoc`),
  ADD KEY `turnodoc_4` (`turnodoc`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`codesp`);

--
-- Indices de la tabla `fecha`
--
ALTER TABLE `fecha`
  ADD PRIMARY KEY (`Dia`),
  ADD KEY `Fec` (`Fec`),
  ADD KEY `Fec_2` (`Fec`),
  ADD KEY `Fec_3` (`Fec`);

--
-- Indices de la tabla `historialcitas`
--
ALTER TABLE `historialcitas`
  ADD PRIMARY KEY (`CodCitapas`),
  ADD KEY `refpac` (`refpac`),
  ADD KEY `refesp` (`refesp`),
  ADD KEY `refFecha` (`refFecha`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`CodHorario`),
  ADD KEY `refDoc` (`refDoc`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`Codmens`);

--
-- Indices de la tabla `pacientegeneral`
--
ALTER TABLE `pacientegeneral`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `codcita` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `historialcitas`
--
ALTER TABLE `historialcitas`
  MODIFY `CodCitapas` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `CodHorario` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `Codmens` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pacientegeneral`
--
ALTER TABLE `pacientegeneral`
  MODIFY `codigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`refEsp`) REFERENCES `especialidad` (`codesp`),
  ADD CONSTRAINT `cita_ibfk_4` FOREIGN KEY (`refcodpac`) REFERENCES `pacientegeneral` (`codigo`),
  ADD CONSTRAINT `cita_ibfk_5` FOREIGN KEY (`refDoc`) REFERENCES `doctor` (`nombredoc`),
  ADD CONSTRAINT `cita_ibfk_6` FOREIGN KEY (`refDia`) REFERENCES `fecha` (`Dia`),
  ADD CONSTRAINT `cita_ibfk_7` FOREIGN KEY (`refFecha`) REFERENCES `fecha` (`Fec`);

--
-- Filtros para la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`especialidadoc`) REFERENCES `especialidad` (`codesp`);

--
-- Filtros para la tabla `historialcitas`
--
ALTER TABLE `historialcitas`
  ADD CONSTRAINT `historialcitas_ibfk_1` FOREIGN KEY (`refpac`) REFERENCES `pacientegeneral` (`codigo`),
  ADD CONSTRAINT `historialcitas_ibfk_2` FOREIGN KEY (`refesp`) REFERENCES `especialidad` (`codesp`),
  ADD CONSTRAINT `historialcitas_ibfk_3` FOREIGN KEY (`refFecha`) REFERENCES `fecha` (`Fec`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`refDoc`) REFERENCES `doctor` (`codigodoc`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
