CREATE TABLE paises
(
    id  INT (2) NOT NULL,
    nombre VARCHAR(150),
    estado_actual ENUM('calificado', 'descalificado')
    PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE jugadores
(
    pais_id INT (3) NOT NULL,
    nombre VARCHAR(150),
    numero_camiseta INT (3),
    PRIMARY KEY (pais_id)
) ENGINE = INNODB;

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


ALTER TABLE `jugadores`
    ADD CONSTRAINT `pais_jugadores`
    FOREIGN KEY (`pais_id`)
    REFERENCES `paises` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `goles`
    ADD CONSTRAINT `jugador_goles`
   FOREIGN KEY (`jugador_id`)
   REFERENCES `jugadores` (`id`)
ADD CONSTRAINT `pais_goles`
    FOREIGN KEY (`pais_id`)
    REFERENCES `paises` (`id`)
ADD CONSTRAINT `partido_goles`
   FOREIGN KEY (`partido_id`)
    REFERENCES `partidos` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `partidos`
    ADD CONSTRAINT `partido_pais1`
			FOREIGN KEY (`pais_id1`)
			REFERENCES `paises` (`id`)
    ADD CONSTRAINT `partido_pais2`
			FOREIGN KEY (`pais_id2`)
			REFERENCES `paises` (`id`)
			ON DELETE CASCADE ON UPDATE CASCADE;
