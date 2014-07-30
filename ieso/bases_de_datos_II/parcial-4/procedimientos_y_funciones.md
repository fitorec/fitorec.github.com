# Funciones y procedimientos en MySQL

	!sql
	CREATE PROCEDURE sp_name ([parameter[,...]])
	    [characteristic ...] routine_body
	
	CREATE FUNCTION sp_name ([parameter[,...]])
	    RETURNS type
	    [characteristic ...] routine_body


Estos comandos crean una rutina almacenada. Desde MySQL 5.0.3, para crear una rutina, es necesario tener el permiso CREATE ROUTINE , y los permisos ALTER ROUTINE y EXECUTE se asignan automáticamente a su creador

Por defecto, la rutina se asocia con la base de datos actual. Para asociar la rutina explícitamente con una base de datos, especifique el nombre como db_name.sp_name al crearlo. 

------------------------------------------------------

# Funciones

	!sql
	delimiter //
	CREATE FUNCTION hola (s CHAR(20)) RETURNS CHAR(50)
		RETURN CONCAT('Hola, ',s,'!');
	delimiter ;

	-- Ejecutamos la función.
	SELECT hola('Mundo');
	
 La cláusula RETURNS puede especificarse sólo con FUNCTION, donde es obligatorio. Se usa para indicar el tipo de retorno de la función, y el cuerpo de la función debe contener un comando RETURN value.

La lista de parámetros entre paréntesis debe estar siempre presente. Si no hay parámetros, se debe usar una lista de parámetros vacía () . Cada parámetro es un parámetro IN por defecto. Para especificar otro tipo de parámetro, use la palabra clave OUT o INOUT antes del nombre del parámetro. Especificando IN, OUT, o INOUT sólo es valido para una PROCEDURE.

# Borrando

	!sql
	DROP FUNCTION hola;

--------------------------------------------------------------

# Procedimientos

	!sql
	delimiter //	
	CREATE PROCEDURE simple_procedimiento (param1 INT)
	    BEGIN
	    	SET @x = param1;
	    END
	 //
	delimiter ;
	CALL simple_procedimiento(9);
	SELECT @x;

------------------------------------------------------------

# Recursos:

	- <http://dev.mysql.com/doc/refman/5.0/es/show-create-procedure.html>