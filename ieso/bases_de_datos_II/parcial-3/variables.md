# Variables en mysql
> Fuente: <http://dev.mysql.com/doc/refman/5.0/es/variables.html>

-----------------------------------------------------

# Variables en mysql

MySQL 5.0 soporta variables de usuario, las cuales permiten almacenar un valor y hacer referencia a él más tarde; esto posibilita pasar valores de una sentencia a otra. Las variables de usuario son específicas de la conexión. Esto significa que una variable definida por un cliente no puede ser vista o utilizada por otros clientes. Todas las variables de un cliente son automáticamente liberadas cuando ese cliente abandona la conexión.

Las variables de usuario se escriben como **`@nombre_var`**, donde el nombre de variable **`nombre_var`** puede consistir de caracteres alfanuméricos tomados del conjunto de caracteres actual, `.`, `_`, y `$`. El conjunto de caracteres predeterminado es `ISO-8859-1` (_Latin1_).

Esto puede cambiarse con la opción de `mysqld --default-character-set`. Consulte Sección 5.9.1, “El conjunto de caracteres utilizado para datos y ordenación”. Los nombres de variables de usuario no son sensibles a mayúsculas en MySQL 5.0.

-----------------------------------------------------

 Una forma de establecer una variable de usuario es empleando una sentencia SET:

	!sql
	SET @nombre_var = expr [, @nombre_var = expr] ...

Con `SET`, tanto `=` como `:=` pueden usarse como operadores de asignación.
La `expr` asignada a cada variable puede evaluarse a un valor entero, real, cadena, o `NULL`. 

 Una variable de usuario también puede recibir valores en otras sentencias que no sean SET. En este caso, el operador de asignación debe ser := y no = porque = se considera operador de comparación en otras sentencias que no sean SET:
	
	!sql
	SET @t1=0, @t2=0, @t3=0;
	SELECT @t1:=(@t2:=1)+@t3:=4,@t1,@t2,@t3;
	+----------------------+------+------+------+
	| @t1:=(@t2:=1)+@t3:=4 | @t1  | @t2  | @t3  |
	+----------------------+------+------+------+
	|                    5 |    5 |    1 |    4 |
	+----------------------+------+------+------+


-----------------------------------------------------

**Nota:** en una sentencia `SELECT`, cada expresión se evalúa solamente cuando se envía al cliente. Esto significa que en una cláusula `HAVING`, `GROUP BY`, u `ORDER BY`, no es posible hacer referencia a una expresión que comprenda variables que reciben su valor en la lista del `SELECT`.Por ejemplo, la siguiente sentencia no funcionará como se espera:

	SELECT (@aa:=id) AS a, (@aa+3) AS b FROM tbl_name HAVING b=5;


 La referencia a **b** en la cláusula **HAVING** hace referencia al alias de una expresión de la lista **SELECT** que hace uso de la variable **@aa**. Esto no funciona como se esperaría: **@aa** no contiene el valor de la fila actual, sino el valor del id de la fila anteriormente seleccionada.

La regla general es que nunca se asigne un valor a una variable de usuario en una parte de una sentencia y se use la misma variable en otra parte de la misma sentencia. Se podrían obtener los resultados esperados, pero esto no está garantizado.

-----------------------------------------------------

## Ejemplo:

	!sql
	DROP TABLE IF EXISTS jugadores;
	CREATE TABLE IF NOT EXISTS jugadores(
			id INT(5) NOT NULL AUTO_INCREMENT,
	    pais_id INT (3) NOT NULL,
	    nombre VARCHAR(150),
	    num_camiseta INT (3),
	    PRIMARY KEY (id)
	) ENGINE = INNODB;
	
	SET @pais_id = (SELECT id FROM paises WHERE nombre = 'Suiza');
	
	INSERT INTO `jugadores` (`id`, `pais_id`, `nombre`, `num_camiseta`) VALUES
	(null, @pais_id, 'Diego Benaglio', 1),
	(null, @pais_id, 'Stephan Lichtsteiner',2);

> esquema mundial: [bd_mundial](bd_mundial.sql)
> Archivo fuente: [ejemplo-insert.jugadores](ejemplo-insert.jugadores.sql)

