#MysqlDump Exportando bases de datos

mysqldump es parte de los "MySQL Client Programs" programas de cliente de MySQL, que puede ser utilizado para generar respaldos de bases de datos y ser usados incluso para ser transferidos a otro servidor de base datos SQL (No estrictamente tiene que ser un servidor MySQL).

## formas básicas:

	!sh
	mysqldump [opciones] nombre_bd [nombre_tabla1 nombre_tabla2 ...] > respaldo.sql

	mysqldump [opciones] --databases nombre_bd1 nombre_bd2 > respaldo.sql

	mysqldump [opciones] --all-databases > respaldo.sql


------------------------------------------------


#Ayuda y opciones basicas:

**mysqldump** es un comando con decenas de opciones, para verlas todas utiliza la ayuda en línea que se proporciona a través de `--help`:

	!sh
	mysqldump --help

## Respaldo de una sola base de datos completa

	!sh
	mysqldump clientes > clientes.sql   

## Respaldo de una sola base de datos con dos tablas

	!sh
	mysqldump clientes saldos facturas  > clientes.sql   


## Respaldo completo de base de datos clientes y ventas

	!sh
	mysqldump --databases clientes ventas > respaldo_cli_ven_sep_2011.sql   

------------------------------------------

#Respaldo por partes:

## Respaldamos solo el esquema de clientes sin registros

	!sh
	mysqldump --no-data clientes > respaldo_esquema_clientes_2011.sql   

## Respaldando solamente datos:

	!sh
	mysqldump -u [user] -p[pass] --no-create-info mydb > mydb.sql

Si se estan usando disparadores hay que escaparlos agregando la opcion  `--skip-triggers`:

	!sh
	mysqldump -u [user] -p[pass] --skip-triggers --no-create-info mydb > mydb.sql


----------------------------------------

# Importando datos:

	!sh
	mysql -u root -ptmppassword clientes < respaldo_clientes.sql

## Referencias:

 - <http://dev.mysql.com/doc/refman/5.1/en/mysqldump.html>
 - <http://www.linuxtotal.com.mx/index.php?cont=info_admon_021>