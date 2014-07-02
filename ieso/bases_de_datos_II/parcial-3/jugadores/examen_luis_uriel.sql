-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2014 a las 18:15:18
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `examen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `ID` int(2) NOT NULL DEFAULT '0',
  `nombre` varchar(200) NOT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nombre` (`nombre`,`fecha_nacimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`Id`, `nombre`, `fecha_nacimiento`) VALUES
(20, 'Bohorquez gaspar luis uriel', '1994-03-24 00:00:00'),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_grupos`
--

CREATE TABLE IF NOT EXISTS `alumnos_grupos` (
  `id` int(5) NOT NULL,
  `alumno_id` int(3) NOT NULL,
  `grupo_id` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alumno_grupo` (`alumno_id`),
  KEY `grupo_alumnos` (`grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE IF NOT EXISTS `calificaciones` (
  `Id_Cal` int(6) NOT NULL,
  `Id` int(3) NOT NULL,
  `calificaciones` float NOT NULL,
  PRIMARY KEY (`Id_Cal`),
  KEY `Id` (`Id`,`calificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `Id_Grupos` int(6) NOT NULL,
  `nombre` int(50) NOT NULL,
  `cuatrimestre` int(2) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`Id_Grupos`),
  KEY `nombre` (`nombre`,`cuatrimestre`,`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Filtros para la tabla `alumnos_grupos`
--

ALTER TABLE `alumnos_grupos`
  ADD CONSTRAINT `alumnos_grupos_ibfk_2` FOREIGN KEY (`Id_Grupos`) REFERENCES `grupos` (`Id_Grupos`),
  ADD CONSTRAINT `alumnos_grupos_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `alumno` (`Id`);

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `alumno` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
