SET FOREIGN_KEY_CHECKS=0;
-- Borrando tabla paises
DROP TABLE IF EXISTS paises;
CREATE TABLE paises (
    id  INT (2) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(150),
    estado_actual ENUM('calificado', 'descalificado'),
    CONSTRAINT pais_id PRIMARY KEY (id),
    UNIQUE KEY `id` (`id`)
) ENGINE = INNODB;

DROP TABLE IF EXISTS jugadores;
CREATE TABLE IF NOT EXISTS jugadores(
    pais_id INT (3) NOT NULL,
    nombre VARCHAR(150),
    numero_camiseta INT (3),
    PRIMARY KEY (pais_id)
) ENGINE = INNODB;

DROP TABLE IF EXISTS goles;
CREATE TABLE goles(
    id INT (4) NOT NULL,
    jugador_id INT(5),
    pais_id INT (2),
    partido_id INT (3),
    hora_minuto DATETIME,
    PRIMARY KEY (id)
) ENGINE = INNODB;


DROP TABLE IF EXISTS partidos;
CREATE TABLE partidos(
    id  INT (3) NOT NULL,
    pais_id1 INT(2),
    pais_id2 INT (2),
    fecha_hora DATETIME,
    goles_pais_id1 INT (2),
    goles_pais_id2 INT (2),
    PRIMARY KEY (id)
) ENGINE = INNODB;

SET FOREIGN_KEY_CHECKS=1;