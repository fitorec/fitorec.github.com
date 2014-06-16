Integridad en de datos
====================================================

El término integridad de datos se refiere a la corrección y complementación de los datos en una base de datos. 

Cuando los contenidos se modifican con sentencias `INSERT`, `DELETE` o `UPDATE`, la integridad de los datos almacenados puede perderse de muchas maneras diferentes, p.e :

 - _"Un pedido que especifica un producto no existente"_.
 - -"Se reasigna un vendedor a una oficina no existente"_.
 - _"Los cambios en la base de datos pueden perderse debido a un error del sistema o a un fallo en el suministro de energía"_.
 - Los cambios pueden ser aplicados parcialmente, p.e. _"Se añade un pedido de un producto sin ajustar la cantidad disponible para vender"_.

Una de las funciones importantes de un **DBMS** relacional es preservar la integridad de sus datos almacenados en la mayor medida posible.

## Tipos de restricciones de integridad
 - **Datos Requeridos:** establece que una columna tenga un valor no `NULL`. Se define efectuando la declaración de una columna es `NOT NULL` cuando la tabla que contiene las columnas se crea por primera vez, como parte de la sentencia `CREATE TABLE`.
 - **Chequeo de Validez:** cuando se crea una tabla cada columna tiene un tipo de datos y el **DBMS** asegura que solamente los datos del tipo especificado sean ingresados en la tabla.
 - **Integridad de entidad:** establece que la clave primaria de una tabla debe tener un valor único para cada fila de la tabla; si no, la base de datos perderá su integridad. Se especifica en la sentencia `CREATE TABLE`. El **DBMS** comprueba automáticamente la unicidad del valor de la clave primaria con cada sentencia `INSERT` Y `UPDATE`. Un intento de insertar o actualizar una fila con un valor de la clave primaria ya existente fallará.
 - **Integridad referencial:** asegura la integridad entre las llaves foráneas y primarias (relaciones padre/hijo). Existen cuatro actualizaciones de la base de datos que pueden corromper la integridad referencial:
   - La inserción de una fila hijo se produce cuando no coincide la llave foránea con la llave primaria del padre.
   - La actualización en la llave foránea de la fila hijo, donde se produce una actualización en la clave ajena de la fila hijo con una sentencia `UPDATE` y la misma no coincide con ninguna llave primaria.
   - La supresión de una fila padre, con la que, si una fila padre -que tiene uno o más hijos- se suprime, las filas hijos quedarán huérfanas.
La actualización de.

>Fuente: <http://es.wikipedia.org/wiki/Integridad_de_datos>


##  Integridad referencial en MySQL

MySQL soporta cinco tipos de tablas: `MyISAM`, `ISAM`, `HEAP`, `BDB` (Base de datos Berkeley), e `InnoDB`. `BDB` e `InnoDB` son ambas tipos de tablas transaccionales. Además de poder trabajar con transacciones en `MySQL`, las tablas del tipo **InnoDB** también tienen soporte para la definición de claves foráneas, por lo que se nos permite definir reglas o restricciones que garanticen la integridad referencial de los registros.

A partir de la versión **4.0**, **MySQL** ha agregado **InnoDB** a la lista de tipos de tablas soportados en una instalación típica.

### Comprobando soporte de InnoDB en Mysql.

Nota: para asegurarnos que tenemos soporte para el tipo de tablas **InnoDB** podemos ejecutar la siguiente sentencia:

	mysql> SHOW VARIABLES LIKE '%innodb%'

Si el resultado no es vacio entonces tenemos soporte para **innoDB**.



## Claves foráneas en MySQL

**InnoDB** no crea de manera automática índices en las claves foráneas o en las claves referenciadas, así que debemos crearlos de manera explícita. Los índices son necesarios para que la verificación de las claves foráneas sea más rápida.

### Ejemplo 1. creando tablas con clave foreneas
A continuación se muestra como definir las dos tablas de ejemplo con una clave foránea.

	CREATE TABLE cliente
	(
	    id_cliente INT NOT NULL,
	    nombre VARCHAR(30),
	    PRIMARY KEY (id_cliente)
	) ENGINE = INNODB;
	
	CREATE TABLE venta
	(
	    id_factura INT NOT NULL,
	    id_cliente INT NOT NULL,
	    cantidad   INT,
	    PRIMARY KEY(id_factura),
	    INDEX (id_cliente),
	    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
	) ENGINE = INNODB;

## Ejemplo 2. agregando clave forenea a tablas existentes:

	-- Base de datos: `padres_hijos`
	--
	-- Estructura de tabla para la tabla `padres`
	CREATE TABLE `padres` (
		`padre_ID` int(11) NOT NULL auto_increment,
		`padreNombre` varchar(25) NOT NULL,
		PRIMARY KEY  (`padre_ID`)
	) ENGINE=InnoDB ;
	-- Estructura de tabla para la tabla `hijos`
	CREATE TABLE `hijos` (
		`hijo_ID` int(11) NOT NULL auto_increment,
		`hijoNombre` varchar(25) NOT NULL,
		`hijoPadre_ID` int(11) NOT NULL,
		PRIMARY KEY  (`hijo_ID`),
		KEY `hijoPadre_ID` (`hijoPadre_ID`)
	) ENGINE=InnoDB ;
	
	-- Agregando referencia a posterior en la tabla `hijos`
	--
	ALTER TABLE `hijos`
		ADD CONSTRAINT `relacion_padre_hijos`
		FOREIGN KEY (`hijoPadre_ID`)
		REFERENCES `padres` (`padre_ID`)
		ON DELETE CASCADE ON UPDATE CASCADE;


Como se puede ver, la tabla hijos a cambiado su estructura, ahora, además de la llave primaria (`PRIMARY KEY`) **hijo_ID**, tenemos una llave externa o foránea (`KEY`) `hijoPadre_ID`.

Para mayor información consulte  el apartado [Claves foreaneas](claves-foreaneas.html) de este curso.


