Mapeando Bases de datos a Objetos Java
==========================

![./java-core.png](./java-core.png)

**M**iguel **A**ngel **M**arcial **M**artínez

---------------------------------------------------------------

Problemática
-----------------------------
En la práctica del desarrollo de _software_ resulta muy difícil encontrarse un proyecto donde no se use una base de datos y es que en la mayoría de los casos, son los datos la parte más importante de una aplicación.

A pesar de esto, la mayoría de desarrolladores crean aplicaciones del tipo **_spaguetti code_**(código revuelto) agregando código **SQL** empotrado en distintas partes del proyecto, en el mejor de los casos se usa un  **ORM** (Mapeador de objetos relacionales, _object relational mapping_) como:

 - [Hibernate](http://hibernate.org/orm/)
 - [Apache Gora](http://gora.apache.org/)
 - [OrmLite](http://ormlite.com/)
 - [ActiveJDBC](http://javalite.io/activejdbc)

> **NOTA**:  La mayoria de estos **ORM** suelen ser complejos de configurar y por lo regular para cada campo en las tablas se tienen que agregar dos metodos: **get**(obtener) y **set**(truncar).


----------------------------------------------------------------------

Java Core
==========================

Una librería que le hace la vida feliz a un programador java.

Fundamentos del diseño
-------------------------

 - Inferir meta-datos directos de la BD(_base de datos_).
 - Configuración mínima.
 - Convención sobre configuración o código.
 - Manejo de persistencia.
 - Funciones CRUD(Create, Read, Update, Delete) y utilerias.
 - Alto grado de simplicidad y legibilidad del código.
 - Diseñado para probarse.
 - Eliminación de getter y setter.


--------------------------------------------------------------------------

Ejemplo práctico:
-----------------------------------------------------

Imaginemos que tenemos una base de datos con la que queremos interactuar, específicamente vamos a probar con un sistema escolar en donde necesitamos registrar alumnos. Ahora imaginemos que la tabla alumnos esta definida como se muestra a continuación:

	!sql
	CREATE TABLE alumnos (
		`id`  int(6) NOT NULL auto_increment PRIMARY KEY,
		`nombre` VARCHAR(56) NOT NULL,
		`apellido_paterno` VARCHAR(56),
		`apellido_materno` VARCHAR(56),
		`matricula` VARCHAR(40),
		`fecha_nacimiento` DATE,
		`created` DATETIME
	);

![base_datos.png](base_datos.png)

-------------------------------------------------------------


Accediendo a la tabla alumnos:
-------------------------------------------------------------

Lo primero que tenemos que hacer es conectarse con la base de datos:

Conexión con la base de datos:
-------------------------------------------------------------

	!java
	DataBase.config("bd"   , "mi_bd");
	DataBase.config("user" , "username");
	DataBase.config("password" , "secret");

Ahora solo necesitamos definir un **modelo** para la tabla **alumnos** que extienda la clase **ModelApp** como se muestra a continuación:

	!java
	public class AlumnoModel extends AppModel{
	}

> **Listo** Asi de fácil :)

-------------------------------------------------------------


Accediendo a la tabla alumnos:
-------------------------------------------------------------
Usando el modelo Alumno para interactuar con la base de datos:

## Agregando un nuevo registro en la base de datos:

	!Java
	AlumnoModel alumno = new AlumnoModel();
	alumno.set(
		"nombre", "Jon",
		"apellido_paterno", "Snow",
		"matricula", "IC2015-0191",
		"fecha_nacimiento", "1995/06/09"
	);

	alumno.save();

## Buscando un alumno y editándolo:

	!Java
	AlumnoModel alumno = new AlumnoModel();
	alumno.loadByField("matricula", "IC2015-0191");
	alumno.set("nombre", "Juan");
	alumno.set("apellido_paterno", "Nieves");

## Borrando el registro con clave primaria 1
	AlumnoModel alumno = new AlumnoModel();
	alumno.deleted("1");

----------------------------------------------

!Gracias!, <small>¿dudas y comentarios?</small>
========================================================
