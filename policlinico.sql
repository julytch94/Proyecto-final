-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2017 a las 21:57:51
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `policlinico`
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
  `refturno` varchar(15) NOT NULL,
  `refDoc` varchar(25) NOT NULL
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
('l', 'Nutricionista', 'C-11'),
('m', 'Odontogía', 'D-14'),
('n', 'Oftalmología', 'D-16'),
('o', 'Pediatría', 'D-15'),
('p', 'Podología', 'A-27'),
('q', 'Psicología', 'B-12'),
('r', 'Psiquiatría', 'C-11'),
('s', 'Traumatologia', 'C-56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `refDoc` int(25) NOT NULL,
  `Turno` varchar(30) NOT NULL
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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`codcita`),
  ADD KEY `refEsp` (`refEsp`),
  ADD KEY `refcodpac` (`refcodpac`),
  ADD KEY `refturno` (`refturno`),
  ADD KEY `refhorario` (`refDoc`),
  ADD KEY `refcodpac_2` (`refcodpac`);

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
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`Turno`),
  ADD KEY `refDoc` (`refDoc`);

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
-- AUTO_INCREMENT de la tabla `pacientegeneral`
--
ALTER TABLE `pacientegeneral`
  MODIFY `codigo` int(10) NOT NULL AUTO_INCREMENT;
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
  ADD CONSTRAINT `cita_ibfk_6` FOREIGN KEY (`refturno`) REFERENCES `horario` (`Turno`);

--
-- Filtros para la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`especialidadoc`) REFERENCES `especialidad` (`codesp`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`refDoc`) REFERENCES `doctor` (`codigodoc`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
