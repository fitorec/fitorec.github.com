# <del>Tiggers</del> Triggers en SQL

<br><br>
<center>
![Tigger](img/tigger.gif)
</center>

------------------------------------------------
# Disparadores :

Un **_trigger_** (o disparador) en una Base de datos, es un procedimiento que se ejecuta cuando se cumple una condición establecida al realizar una operación. en **MySQL** los **triggers** pueden procesar eventos en determinados momentos:

![Disparadores](img/disparadores.png)


----------------------------------------------------------

#Eventos y momentos

A continuación mostramos la lista de eventos que podemos disparar en determinado momento:


## Eventos disponibles en Triggers:

 - **Inserción** (`INSERT`)
 - **Actualización** (`UPDATE`)
 - **Borrado** (`DELETE`)

A su vez podemos procesar estos eventos en dos momentos:

## Momentos disponibles para los Eventos:

 - **Antes** `BEFORE`
 - **Después** `AFTER`

En otras palabras podemos atrapar **3 eventos** en **2 momentos** por cada tabla en nuestra base de datos.


------------------------------------------------

# Sintaxis Básica:

	!sql
	CREATE TRIGGER nombre_disp
		momento_disp evento_disp ON nombre_tabla
		FOR EACH ROW sentencia_disp;

 El disparador queda asociado a la tabla **nombre_tabl**a. Esta debe ser una tabla permanente, no puede ser una tabla _TEMPORARY_ ni una vista.

**momento_disp** es el momento en que el disparador entra en acción. Puede ser **BEFORE** (antes) o **AFTER** (después), para indicar que el disparador se ejecute antes o después que la sentencia que lo activa.


**sentencia_disp** es la sentencia que se ejecuta cuando se activa el disparador.

## Borrar un disparador

	!sql
	DROP TRIGGER nombre_disp;

> La sentencia **DROP TRIGGER** necesita que se posea el privilegio **SUPER**.

## Viendo las disparadores existentes:

	!sql
	SHOW TRIGGERS;

-------------------------------------------------------------------

## Restricciones En Disparadores:

Si se desean ejecutar múltiples sentencias, deben colocarse entre **BEGIN ... END**, el constructor de sentencias compuestas.

Para esto es necesario modifcar el delimitador de fin de instrucción (`DELIMITER`) y al final restaurar por el delimitador por defecto `;`.

## Ejemplo disparador con multiples instrucciones:

	!sql
	DELIMITER |
	CREATE TRIGGER testref BEFORE INSERT ON test1
	  FOR EACH ROW BEGIN
	    INSERT INTO test2 SET a2 = NEW.a1;
	    DELETE FROM test3 WHERE a3 = NEW.a1;
	    UPDATE test4 SET b4 = b4 + 1 WHERE a4 = NEW.a1;
	  END
	|
	DELIMITER ;

No puede haber dos disparadores en una misma tabla que correspondan al mismo momento y sentencia. Por ejemplo, no se pueden tener dos disparadores **BEFORE UPDATE**. Pero sí es posible tener los disparadores **BEFORE UPDATE** y **BEFORE INSERT** o **BEFORE UPDATE** y **AFTER UPDATE**.


-------------------------------------------------

# Ejemplo completo:

Vamos a crear una base de datos con el nombre `prueba_triggers`, y nos seleccionamos para usar dicha base de datos, como se muestra a continuación:

	!sql
	CREATE DATABASE prueba_triggers;
	USE prueba_triggers;


-------------------------------------------------
# Creando tablas:

Posteriormente creamos dos tablas: alumnos y logs, donde en alumnos vamos a agregar un conjunto de disparadores que van a guardar registros en la tabla logs:

	!sql
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

-------------------------------------------------
## Disparador `BEFORE INSERT`

## Ejemplo agregando un disparados sobre la tabla alumnos

Vamos a crear un disparador que se va a encargar en generar la **fecha de registro** al agregar(insert) un nuevo alumno, ademas agregamos un registro en la tabla logs indicando que se va a guardar un determinado alumno:


	!sql
	-- Borramos el disparador si es que existe
	DROP TRIGGER IF EXISTS auto_gen_fecha_reg;
	-- Cambiamos el delimitador
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
	delimiter ;


-------------------------------------------------

## Disparador `AFTER INSERT`

Vamos a crear un disparador que se va a encargar agregar un registro en la tabla logs indicando que se guardo un determinado alumno:


	!sql
	-- Borramos el disparador si es que existe
	DROP TRIGGER IF EXISTS despues_de_add_user;
	-- Cambiamos el delimitador
	delimiter //
	CREATE TRIGGER despues_de_add_user
		AFTER INSERT ON alumnos
		FOR EACH ROW
		  BEGIN
			INSERT INTO logs VALUES(
				NULL,
				CONCAT('Despues de guardar alumno: ', NEW.nombre)
			);
		 END;//
	delimiter ;

-------------------------------------------------

## Disparador `AFTER UPDATE`

De forma análoga podemos agregar los disparadores `after update` y el `after delete`, como se muestra a continuación:


	!sql
	-- Borramos el disparador si es que existe
	DROP TRIGGER IF EXISTS despues_de_edit_user;

	-- Cambiamos el delimitador
	delimiter //
	CREATE TRIGGER despues_de_edit_user
		AFTER UPDATE ON alumnos
		FOR EACH ROW BEGIN
			INSERT INTO logs VALUES(
			NULL,
				CONCAT(
					'Se modifico el usuario: ', OLD.nombre
					,' Su nuevo nombre es:', NEW.nombre
				)
			);
		END;//
	delimiter ;

-------------------------------------------------

## Disparador `AFTER DELETE`

	!sql
	-- Borramos el disparador si es que existe
	DROP TRIGGER IF EXISTS borrando_alumno;

	-- Cambiamos el delimitador
	delimiter //
	CREATE TRIGGER borrando_alumno
		AFTER DELETE ON alumnos
		FOR EACH ROW BEGIN
			INSERT INTO logs VALUES(
				NULL,
				CONCAT('Se a borrado el alumno: ', OLD.nombre)
			);
		END;//
	delimiter ;

A continuación veremos a ver algunas otras cosas que podemos hacer con los disparadores.

-------------------------------------------------


# Uso de señales en disparadores:


Una señal (**SIGNAL**) es una forma de regresar un "error" al motor de **MySQL**, este error lo podemos manejar por medio de:

 - Un numero de error
 - Un estado SQL(SQLSTATE)
 - Y/o un mensaje.

Usted puede ocupar el `SQLSTATE` con el valor `'45000'` para generar un error genérico, esto resulta muy útil en el momento de querer alterar el comportamiento del motor de MySQL como lo vamos a ver a continuación:

> **Nota**: El lector puede abundar mas en el tema: <http://dev.mysql.com/doc/refman/5.5/en/signal.html>

---------------------------------------------------------------------

## Ejemplo disparador de validación:

Vamos a agregar un disparador que al modificar un alumno valide que el campo nombre no sea menor a 6 caracteres, en caso contrario vamos a generar un error genérico (`SQLSTATE 45000`) y vamos a generar un mensaje para informar al cliente o a nuestra aplicación el motivo del error:


	!sql
	CREATE TRIGGER antes_de_edit_user
		AFTER UPDATE ON alumnos
		FOR EACH ROW
		BEGIN
			SET @tam_nombre = LENGTH(NEW.nombre);
			IF @tam_nombre < 6
			THEN
				SIGNAL SQLSTATE '45000';
				SET @MESSAGE_TEXT = 'El nombre no puede ser menor a 6 caracteres';
			END IF;
		END

De esta forma impedimos que se inserten valores no deseados y/o que no comparten la lógica deseada a la vez que generamos un mecanismo para detectar este tipo de errores para poderlos manejar desde nuestra aplicación en cuestión.

----------------------------------------------------------------------

## Recursos :

 - [Archivo SQL ejemplo de disparadores](./ejemplo_disparadores.sql)
 - [Sitio oficial Mysql Disparadores](http://dev.mysql.com/doc/refman/5.0/es/triggers.html)
