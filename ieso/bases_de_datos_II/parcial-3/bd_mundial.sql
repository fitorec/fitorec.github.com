SET FOREIGN_KEY_CHECKS=0;

-- Borrando tabla paises
DROP TABLE IF EXISTS `paises`;
CREATE TABLE `paises` (
  `id` INT(2) NOT NULL AUTO_INCREMENT,
  `acronimo` CHAR( 3 ) NOT NULL,
  `nombre` VARCHAR( 50 ) NOT NULL,
  `grupo` CHAR( 1 ) NOT NULL DEFAULT 'X',
  `estado_actual` ENUM('calificado','descalificado') NOT NULL DEFAULT 'calificado',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acronimo` (`acronimo`,`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS jugadores;
CREATE TABLE IF NOT EXISTS jugadores(
		id INT(5) NOT NULL AUTO_INCREMENT,
    pais_id INT (3) NOT NULL,
    nombre VARCHAR(150),
    num_camiseta INT (3),
    PRIMARY KEY (id)
) ENGINE = INNODB;

DROP TABLE IF EXISTS goles;
CREATE TABLE goles(
    id INT (4) NOT NULL AUTO_INCREMENT,
    jugador_id INT(5),
    pais_id INT (2),
    partido_id INT (3),
    hora_minuto DATETIME,
    PRIMARY KEY (id)
) ENGINE = INNODB;


DROP TABLE IF EXISTS partidos;
CREATE TABLE partidos(
    id  INT (3) NOT NULL AUTO_INCREMENT,
    pais_id1 INT(2),
    pais_id2 INT (2),
    goles_pais_id1 INT (2),
    goles_pais_id2 INT (2),
    fecha_hora DATETIME,
    estadio VARCHAR( 150 ),
    PRIMARY KEY (id)
) ENGINE = INNODB;

SET FOREIGN_KEY_CHECKS=1;