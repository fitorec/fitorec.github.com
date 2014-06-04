# Claves foreaneas con innoDB

## Sintaxis

    REFERENCES nombre_de_tabla (nombre_índice, ...)
    	[ON DELETE {RESTRICT | CASCADE | SET NULL | NO ACTION}]
    	[ON UPDATE {RESTRICT | CASCADE | SET NULL | NO ACTION}]



## Condiciones:

 - Ambas tablas deben ser **InnoDB** y no deben ser tablas temporales.

 - En la tabla que hace referencia, debe haber un índice donde las columnas de clave extranjera estén listadas en primer lugar, en el mismo orden.

 - En la tabla referenciada, debe haber un índice donde las columnas referenciadas se listen en primer lugar, en el mismo orden. En _MySQL/InnoDB 5.0_, tal índice se creará automáticamente en la tabla referenciada si no existe aún.

 - No están soportados los índices prefijados en columnas de claves foráneas. Una consecuencia de esto es que las columnas `BLOB` y `TEXT` no pueden incluirse en una clave foránea, porque los índices sobre dichas columnas siempre deben incluir una longitud prefijada.

 - Si se proporciona un `CONSTRAINT símbolo`, éste debe ser único en la base de datos. Si no se suministra, **InnoDB** crea el nombre automáticamente.

## Documentación:
 - [simular claves foraneas myIsam](http://dev.mysql.com/doc/refman/5.0/es/example-foreign-keys.html) 
- [Claves foraneas con innoDB](http://dev.mysql.com/doc/refman/5.0/es/innodb-foreign-key-constraints.html)