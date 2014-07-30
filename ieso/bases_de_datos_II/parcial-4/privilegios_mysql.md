# Usuarios y privilegios en Mysql.


Los comandos **GRANT** y **REVOKE** permiten a los adminitradores de sistemas crear cuentas de usuario **MySQL** y darles permisos y quitarlos de las cuentas.

La información de cuenta de **MySQL** se almacena en las tablas de la base de datos **mysql**.

Si las tablas de permisos tienen registros de permisos que contienen nombres de tablas o bases de datos con mayúsculas y minúsculas y la variable de sistema **lower_case_table_names** está activa, **REVOKE** no puede usarse para quitar los permisos. Es necesario manipular las tablas de permisos directamente. (**GRANT** no creará estos registros cuando está activo **lower_case_table_names** , pero tales registros pueden haberse creado préviamente a activar la variable.)

--------------------------------------------------------------

# Ejemplo básico.

Lo mas común es crear un usuario con todos los privilegios sobre determinada base de datos, como se muestra a continuación:

	!sql

	-- Creamos la tabla alguna_bd;
	CREATE DATABASE alguna_bd;
	-- Vamos agregar el usuario x
	CREATE USER 'user_x'@'localhost'
		IDENTIFIED BY 'password_user_x';

	-- Le asignamos todos los permisos sobre la bd 'alguna_bd'
	GRANT ALL PRIVILEGES ON 'alguna_bd'.*
		TO 'user_x'@'localhost';

	-- Revisando los permisos para el usuario_x
	SHOW GRANTS FOR 'usuario_x'@'localhost';

	-- Actualizamos los permisos
	FLUSH PRIVILEGES;

## Quitando privilegios:

	!sql
	REVOKE ALL PRIVILEGES ON alguna_bd.* FROM 'usuario_x'@'localhost';

--------------------------------------------------------------

# Asignación de permisos.

La sintaxis GRANT nos permite otorgar diversos permisos para un usuarios a diversas tablas en una base de datos, veamos su sintaxis básica:

	!sql
	GRANT [Tipo permiso(s)]
		ON [baseDatosNombre].[tabla]
		TO [UserName]@[Host];


## Lista de permisos
 - ALL PRIVILEGES
 - CREATE
 - DROP
 - DELETE
 - INSERT
 - UPDATE

> Para ver la lista de permisos completa consulte el siguiente enlace: <http://dev.mysql.com/doc/refman/5.1/en/privileges-provided.html>


--------------------------------------------------------------
# Algunos ejemplos:

Imaginemos que la **empresax** en su servidor tenemos un sistema que en su base de datos `sistema` maneja el stock de sus productos donde deseamos que en la tabla productos, tenga el siguiente comportamiento.




## Usuario bodega

Este usuario solo puede leer la tabla productos y sera el único que podrá agregar nuevos productos conforme lleguen dichos productos a la bodega de la empresa:

 - Permiso de lectura (`SELECT`)
 - Permiso para agregar (`INSERT`)

## Usuario punto_venta

Este usuario podrá leer y podrá borrar los productos conforme vallan saliendo los productos en el punto de venta:

 - Permiso de lectura (`SELECT`)
 - Permiso para borrar (`DELETE`)


------------------------------------------------------------------

# Agregando usuarios y permisos

Una vez que definimos la lógica en los acceso para los usuarios vamos agregar los usuarios y sus permisos como se muestra a continuación:

	!sql
	-- Creando el usuario bodega
	CREATE USER 'bodega'@'empresax'
		IDENTIFIED BY 'secret_pass';
	-- Le damos permisos solamente para leer y agregar productos
	GRANT SELECT,INSERT,UPDATE ON sistema.productos
		TO 'bodega'@'empresax';

	-- Creando el usuario punto_venta
	CREATE USER 'punto_venta'@'empresax'
		IDENTIFIED BY 'secret_pass';
	-- Le damos permisos solamente para leer y agregar productos
	GRANT SELECT,DELETE ON sistema.productos
		TO 'punto_venta'@'empresax';


--------------------------------------------------------------

# MySQL y la base mysql

Mysql guarda la información de los usuarios y sus permisos en la base de datos **mysql**, usted puede comprobar esta información