SET NAMES utf8;

DROP TABLE IF EXISTS jugadores;
CREATE TABLE IF NOT EXISTS jugadores(
		id INT(5) NOT NULL AUTO_INCREMENT,
    pais_id INT (3) NOT NULL,
    nombre VARCHAR(150),
    num_camiseta INT (3),
    PRIMARY KEY (id)
) ENGINE = INNODB;

SET @pais_id = (SELECT id FROM paises WHERE nombre = 'Suiza');
-- SELECT @pais_id;

INSERT INTO `jugadores`(`id`, `pais_id`, `nombre`, `num_camiseta`) VALUES
(null, @pais_id, 'Diego Benaglio', 1),
(null, @pais_id, 'Stephan Lichtsteiner',2);

-- ------------------------------------------------------------------ --
-- Insertando los jugadores del segundo pais.                         --
-- ------------------------------------------------------------------ --
SET @pais2_id = (
	SELECT id
	FROM paises
	WHERE nombre = 'Otro pais'
);
-- SELECT @pais2_id;

INSERT INTO `jugadores`(`id`, `pais_id`, `nombre`, `num_camiseta`) VALUES
(null, @pais2_id, 'Diego Benaglio', 1),
(null, @pais2_id, 'Stephan Lichtsteiner',2);