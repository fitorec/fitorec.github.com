-- Lista de paises y sus grupos en el mundial Brasil 2014
-- ----------------------------------------------------------
-- Author: Miguel Angel Marcial Martinez
--
-- Equipos del mundial:
-- Fuente: http://es.fifa.com/worldcup/teams/
--
-- Obtener images de las banderas de los paises:
-- 		http://img.fifa.com/images/flags/[num_tamanio]/[ACRONIMO].png
--	 P.e. la bandera de México con acronimo mex
-- las imagenes de las banderas estan dadas por:
--  la más pequeña: http://img.fifa.com/images/flags/1/mex.png
--  la más grande : http://img.fifa.com/images/flags/5/mex.png

DROP TABLE IF EXISTS `paises`;

CREATE TABLE `paises` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `acronimo` char(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `grupo` char(1) NOT NULL DEFAULT 'X',
  `estado_actual` ENUM('calificado','descalificado') NOT NULL DEFAULT 'calificado',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acronimo` (`acronimo`,`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

INSERT INTO `paises` (`acronimo`, `nombre`) VALUES
	('alg', 'Argelia'),
	('cmr', 'Camerún'),
	('civ', 'Costa de Marfil'),
	('gha', 'Ghana'),
	('nga', 'Nigeria'),
	('aus', 'Australia'),
	('irn', 'Irán'),
	('jpn', 'Japón'),
	('kor', 'República de Corea'),
	('ger', 'Alemania'),
	('bel', 'Bélgica'),
	('bih', 'Bosnia y Herzegovina'),
	('cro', 'Croacia'),
	('esp', 'España'),
	('fra', 'Francia'),
	('gre', 'Grecia'),
	('eng', 'Inglaterra'),
	('ita', 'Italia'),
	('ned', 'Países Bajos'),
	('por', 'Portugal'),
	('rus', 'Rusia'),
	('sui', 'Suiza'),
	('crc', 'Costa Rica'),
	('usa', 'EEUU'),
	('hon', 'Honduras'),
	('mex', 'México'),
	('arg', 'Argentina'),
	('bra', 'Brasil'),
	('chi', 'Chile'),
	('col', 'Colombia'),
	('ecu', 'Ecuador'),
	('uru', 'Uruguay');

-- ------------------------------------------------------------------ --
-- Cambiando el nombre del grupo a los equpos:
-- Fuente: http://es.fifa.com/worldcup/groups/
-- ------------------------------------------------------------------ --

 -- Grupo A
UPDATE  `paises` SET `grupo` = 'A' WHERE `nombre` IN(
	'Brasil',
	'México',
	'Croacia',
	'Camerún'
);

 -- Grupo B
UPDATE  `paises` SET `grupo` = 'B' WHERE `nombre` IN(
	'Países Bajos',
	'Chile',
	'Australia',
	'España'
);

 -- Grupo C
UPDATE  `paises` SET `grupo` = 'C' WHERE `nombre` IN(
	'Colombia',
	'Costa de Marfil',
	'Japón',
	'Grecia'
);

 -- Grupo D
UPDATE  `paises` SET `grupo` = 'D' WHERE `nombre` IN(
	'Costa Rica',
	'Italia',
	'Uruguay',
	'Inglaterra'
);

 -- Grupo E
UPDATE  `paises` SET `grupo` = 'E' WHERE `nombre` IN(
	'Francia',
	'Suiza',
	'Ecuador',
	'Honduras'
);

 -- Grupo F
UPDATE  `paises` SET `grupo` = 'F' WHERE `nombre` IN(
	'Argentina',
	'Irán',
	'Nigeria',
	'Bosnia y Herzegovina'
);

 -- Grupo G
UPDATE  `paises` SET `grupo` = 'G' WHERE `nombre` IN(
	'Alemania',
	'EEUU',
	'Ghana',
	'Portugal'
);

 -- Grupo H
UPDATE  `paises` SET `grupo` = 'H' WHERE `nombre` IN(
	'Bélgica',
	'República de Corea',
	'Rusia',
	'Argelia'
);

-- Obteniendo los partidos:
-- Basado en: http://as.com/especiales/futbol/mundial/2014/calendario.html
