SET FOREIGN_KEY_CHECKS=0;
--
-- Estructura de tabla para la tabla `padres`
DROP TABLE IF EXISTS  `padres`;
CREATE TABLE `padres` (
	`id` int(11) NOT NULL auto_increment,
	`nombre` varchar(25) NOT NULL,
	PRIMARY KEY  (`id`)
) ENGINE=InnoDB;

-- Estructura de tabla para la tabla `hijos`
DROP TABLE IF EXISTS  `hijos`;
CREATE TABLE `hijos` (
	`id` int(11) NOT NULL auto_increment,
	`nombre` varchar(25) NOT NULL,
	`padre_id` int(11) NOT NULL,
	PRIMARY KEY  (`id`),
	KEY `padre_id` (`padre_id`)
) ENGINE=InnoDB;

SET FOREIGN_KEY_CHECKS=1;

-- Agregando referencia a posterior en la tabla `hijos`
--
ALTER TABLE `hijos`
	ADD CONSTRAINT `relacion_padre_hijos`
		FOREIGN KEY (`padre_id`)
		REFERENCES `padres` (`id`)
		ON DELETE CASCADE ON UPDATE CASCADE;
