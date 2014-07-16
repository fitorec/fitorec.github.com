CREATE DATABASE
	IF NOT EXISTS
	prueba_transacciones;

USE prueba_transacciones;

-- Creamos la tabla adeudos
DROP TABLE IF EXISTS adeudos;
CREATE TABLE adeudos(
 id INT(5) PRIMARY KEY NOT NULL AUTO_INCREMENT,
 persona VARCHAR(100),
 monto FLOAT,
 monto_abonado FLOAT
) ENGINE=innoDB;

-- Creando tabla abonos.
DROP TABLE IF EXISTS abonos;
CREATE TABLE abonos(
  id INT(5) NOT NULL AUTO_INCREMENT,
  fecha_hora DATETIME NOT NULL,
  adeudo_id INT(5),
  PRIMARY KEY(id),
  UNIQUE KEY id(id)
) ENGINE=innoDB AUTO_INCREMENT=5;


BEGIN;
INSERT INTO adeudos
	VALUES(NULL,'Manuel',250.0,0);
	
SET @id_adeudo=(
	SELECT MAX(id) FROM adeudos
);
SELECT @id_adeudo;

INSERT INTO abonos
	VALUES(NULL, NOW(), @id_adeudo);

COMMIT;
