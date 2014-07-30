CREATE DATABASE prueba_triggers;
USE prueba_triggers;

-- Borramos(si existe) y Creamos tabla alumnos
DROP TABLE IF EXISTS alumnos;
CREATE TABLE alumnos(
	id INT(3)
		PRIMARY KEY NOT
		NULL AUTO_INCREMENT,
	equipo INT(2),
	nombre VARCHAR(150),
	fecha_registro DATETIME
);

-- Borramos(si existe) y creamos la tabla logs para guardar
-- los eventos de la tabla
DROP TABLE IF EXISTS logs;
CREATE TABLE logs(
	id INT(5)
		PRIMARY KEY NOT NULL
		AUTO_INCREMENT,
	msg VARCHAR(200)
);

-- Creando un disparador
-- previo a insertar alumnoS
-- genere el campo
-- fecha_registro con el valor NOW()
DROP TRIGGER IF EXISTS auto_gen_fecha_reg;
DROP TRIGGER IF EXISTS despues_de_add_user;
DROP TRIGGER IF EXISTS borrando_alumno;
DROP TRIGGER IF EXISTS antes_de_edit_user;
DROP TRIGGER IF EXISTS despues_de_edit_user;

delimiter //
CREATE TRIGGER auto_gen_fecha_reg
	BEFORE INSERT ON alumnos
	 FOR EACH ROW
	  BEGIN
		SET NEW.fecha_registro = (SELECT NOW());
		SET NEW.equipo = (SELECT ROUND(RAND()*3));
		INSERT INTO logs VALUES(
			NULL,
			CONCAT('Previo a guardar alumno: ', NEW.nombre)
		);
	  END;//

CREATE TRIGGER despues_de_add_user
	AFTER INSERT ON alumnos
	FOR EACH ROW
	  BEGIN
		INSERT INTO logs VALUES(
			NULL,
			CONCAT('Despues de guardar alumno: ', NEW.nombre)
		);
	 END;//


CREATE TRIGGER antes_de_edit_user
	AFTER UPDATE ON alumnos
	FOR EACH ROW
	BEGIN
		SET @tam_nombre = LENGTH(NEW.nombre);
		IF @tam_nombre < 6
		THEN
			SIGNAL SQLSTATE '45000';
			SET @MESSAGE_TEXT = 'El nombre del alumno no puede ser menor a 6 caracteres';
		END IF;
	END;//
-- Agregar un after update.

CREATE TRIGGER despues_de_edit_user
	AFTER UPDATE ON alumnos
	FOR EACH ROW
	BEGIN
		INSERT INTO logs VALUES(
			NULL,
			CONCAT(
				'Se modifico el usuario: ', OLD.nombre
				,' Su nuevo nombre es:', NEW.nombre
			)
		);
	END;//
-- Agregar un after update.

CREATE TRIGGER borrando_alumno
	AFTER DELETE ON alumnos
	FOR EACH ROW BEGIN
		-- CODIGO CUANDO SE BORRA UN ALUMNO
		INSERT INTO logs VALUES(
			NULL,
			CONCAT('Se a borrado el alumno: ', OLD.nombre)
		);
	END;//

-- Agregar un before delete

delimiter ;
-- numeros aleatorios
SELECT RAND();


-- abonos

SHOW TRIGGERS;
-- vaciando tabla alumnos
truncate alumnos;

-- Probando el disparador
INSERT INTO alumnos VALUES
(NULL, NULL, 'ANGELES MARTINEZ REYNALDO ALFONSO', ''),
(NULL, NULL, 'BENITEZ LUIS EDER IVAN', ''),
(NULL, NULL, 'BOHORQUEZ GASPAR LUIS URIEL', ''),
(NULL, NULL, 'CARRERA CARRERA CRISTOBAL', ''),
(NULL, NULL, 'CORONADO CASTILLO ADRIAN IGNACIO', ''),
(NULL, NULL, 'GARCIA ENRIQUEZ MIRIAM', ''),
(NULL, NULL, 'GARCIA MARTINEZ KEVIN EDUARDO', ''),
(NULL, NULL, 'JIMENEZ RIOS GERMAN', ''),
(NULL, NULL, 'LOPEZ MORALES DIEGO DAVID', ''),
(NULL, NULL, 'MELCHOR RODRIGUEZ REYNA ANGELICA', ''),
(NULL, NULL, 'MENDEZ CRUZ LAMBERTO', ''),
(NULL, NULL, 'PERALTA ROSALES JULIO CESAR', ''),
(NULL, NULL, 'PEREZ JIMENEZ IVAN', ''),
(NULL, NULL, 'VARGAS NAVA RICARDO', ''),
(NULL, NULL, 'VEGA MARTINEZ JOSE BETZADI', '');

-- Realizamos una modificación para disparar
-- el trigger after update
UPDATE `alumnos`
	SET `nombre` = 'Angeles Martinez Reynaldo Alfonso'
	WHERE `id` = 1;

SELECT * alumnos;


