-- betzadi
INSERT INTO alumno (Id,nombre,f_nacimiento) VALUES (20,'Vega Mtz. Betzadi',2014/09/21);

INSERT INTO grupos (idgrup,nombre,cuatrimestre,estado) VALUES (1,'5to',5,'activo'),(2,'6to',6,'inactivo');

--
-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 01-07-2014 a las 00:54:42
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `examen`
--
CREATE DATABASE IF NOT EXISTS `examen` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `examen`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `Id` int(3) NOT NULL DEFAULT '0',
  `nombre` varchar(150) NOT NULL,
  `f_nacimiento` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `nombre` (`nombre`,`f_nacimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`Id`, `nombre`, `f_nacimiento`) VALUES
(20, 'Vega Mtz. Betzadi', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos_grupos`
--

CREATE TABLE IF NOT EXISTS `alumnos_grupos` (
  `idalumnos_g` int(5) NOT NULL,
  `Id` int(3) NOT NULL,
  `idgrup` int(3) NOT NULL,
  PRIMARY KEY (`idalumnos_g`),
  UNIQUE KEY `Id` (`Id`),
  UNIQUE KEY `idgrup` (`idgrup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE IF NOT EXISTS `calificaciones` (
  `idcali` int(6) NOT NULL,
  `Id` int(3) NOT NULL,
  `calificacion` float NOT NULL,
  PRIMARY KEY (`idcali`),
  UNIQUE KEY `Id` (`Id`,`calificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE IF NOT EXISTS `grupos` (
  `idgrup` int(6) NOT NULL,
  `nombre` int(50) NOT NULL,
  `cuatrimestre` int(2) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  PRIMARY KEY (`idgrup`),
  UNIQUE KEY `nombre` (`nombre`,`cuatrimestre`,`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`idgrup`, `nombre`, `cuatrimestre`, `estado`) VALUES
(1, 5, 5, 'activo'),
(2, 6, 6, 'inactivo');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
