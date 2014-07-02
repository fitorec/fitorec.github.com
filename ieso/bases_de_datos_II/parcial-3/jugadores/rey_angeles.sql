-- rey angeles
CREATE DATABASE MUNDIAL_BRASIL3;

USE MUNDIAL_BRASIL3;

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



UPDATE  `paises` SET `grupo` = 'A' WHERE `nombre` INT(
	'Brasil',
	'México',
	'Croacia',
	'Camerún'
);

 -- Grupo B
UPDATE  `paises` SET `grupo` = 'B' WHERE `nombre` INT(
	'Países Bajos',
	'Chile',
	'Australia',
	'España'
);

 -- Grupo C
UPDATE  `paises` SET `grupo` = 'C' WHERE `nombre` INT(
	'Colombia',
	'Costa de Marfil',
	'Japón',
	'Grecia'
);

 -- Grupo D
UPDATE  `paises` SET `grupo` = 'D' WHERE `nombre` INT(
	'Costa Rica',
	'Italia',
	'Uruguay',
	'Inglaterra'
);

 -- Grupo E
UPDATE  `paises` SET `grupo` = 'E' WHERE `nombre` INT(
	'Francia',
	'Suiza',
	'Ecuador',
	'Honduras'
);

 -- Grupo F
UPDATE  `paises` SET `grupo` = 'F' WHERE `nombre` INT(
	'Argentina',
	'Irán',
	'Nigeria',
	'Bosnia y Herzegovina'
);

 -- Grupo G
UPDATE  `paises` SET `grupo` = 'G' WHERE `nombre` INT(
	'Alemania',
	'EEUU',
	'Ghana',
	'Portugal'
);

 -- Grupo H
UPDATE  `paises` SET `grupo` = 'H' WHERE `nombre` INT(
	'Bélgica',
	'República de Corea',
	'Rusia',
	'Argelia'
);


CREATE TABLE jugadores
(
    id INT (3) NOT NULL AUTO_INCREMENT,
    pais_id INT (3) ,
    nombre VARCHAR(150) ,
    numero_camiseta INT (3) ,
    posicion VARCHAR(150),
    PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

CREATE TABLE goles
(
    id INT (4) NOT NULL,
    jugador_id INT(5),
    pais_id INT (2),
    partido_id INT (3),
    hora_minuto DATETIME,
    PRIMARY KEY (id)
) ENGINE = INNODB;


CREATE TABLE partidos
(
    id  INT (3) NOT NULL,
    pais_id1 INT(2),
    pais_id2 INT (2),
    fecha_hora DATETIME,
    goles_pais_id1 INT (2),
    goles_pais_id2 INT (2),
    PRIMARY KEY (id)
) ENGINE = INNODB;





ALTER TABLE `partidos`
    ADD CONSTRAINT `partido_pais1`
			FOREIGN KEY (`pais_id1`)
			REFERENCES `paises` (`id`)
    ADD CONSTRAINT `partido_pais2`
			FOREIGN KEY (`pais_id2`)
			REFERENCES `paises` (`id`)
			ON DELETE CASCADE ON UPDATE CASCADE;



//JUGADORES ARGELIA
INSERT INTO jugadores VALUES
("1","13","Cédric Si Mohamed","1","Portero"),
("2","13","Mohamed Lamine Zemmamouch","16","Portero"),
("3","13","Adi Rais Cobos Adrien MBolhi","23","Portero"),
("4","13","Hassan Yebda","7","Mediocampista"),
("5","13","Medhi Gregory Guiseppe Lacen","8","Mediocampista"),
("6","13","Sofiane Feghouli","10","Mediocampista"),
("7","13","Madjid Bougherra","2","Defensa"),
("8","13","Faouzi Ghoulam","3","Defensa"),
("9","13","Essaïd Belkalem","4","Defensa"),
("10","13","Rafik Halliche","5","Defensa"),
("11","13","Djamel Eddine Mesbah","6","Defensa"),
("12","13","Sime Vrsaljko","2","Defensa"),
("13","13","Nabil Ghilas","9","Delantero"),
("14","13","Yacine Brahimi","11","Mediocampista");

//JUGADORES CAMERUN
INSERT INTO jugadores VALUES
("15","14","Loic FEUDJOU","1","Portero"),
("16","14","Benoit ASSOU EKOTTO","2","Defensa"),
("17","14","Nicolas NKOULOU","3","Defensa"),
("18","14","Cedric DJEUGOUE","4","Defensa"),
("19","14","Dany NOUNKEU","5","Defensa"),
("20","14","Alexandre SONG","6","Defensa"),
("21","14","Landry NGUEMO","7","Mediocampista"),
("22","14","Benjamin MOUKANDJO","8","Mediocampista"),
("23","14","Samuel ETOO","9","Delantero"),
("24","14","Vincent ABOUBAKAR","10","Delantero"),
("25","14","Jean MAKOUN","11","Delantero"),
("26","14","Henri BEDIMO","12","Defensa"),
("27","14","Pedro","11","Delantero"),
("28","14","Xavi Hernández","8","Mediocampista");