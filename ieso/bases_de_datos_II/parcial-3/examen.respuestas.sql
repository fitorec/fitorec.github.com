**1.-** En la variable `@mejor_cliente` y `@ventas_mejor_cliente` guarde los valores de la razón social y el numero de ventas del cliente que tenga mas **numero de ventas**, finalmente realice un select sobre ellos para mostrar estos datos (2 puntos):

SET @mejor_cliente='';
set @ventas_mejor_cliente=0;

SELECT count(ventas.id) AS num_ventas, ventas.cliente_id, clientes.razon_social
	FROM ventas, clientes
	WHERE ventas.cliente_id = cliente.id
	GROUP BY ventas.cliente_id
	ORDER BY num_ventas DESC;
--
SELECT count(ventas.id) AS num_ventas, ventas.cliente_id
	FROM ventas, clientes
	GROUP BY ventas.cliente_id
	ORDER BY num_ventas DESC
	LIMIT 5;

808 	1800 	GENERAL PUBLICO
618 	51 	TACOS DE CAZUELA LA GUERITA
563 	144 	MISC ARAGON
423 	47 	LA RANITA PLAZA V


**2.-** Escriba una transacción que agregue un nuevo abono con la cantidad de 100.00 pesos a la venta con id `60263` y que al ejecutarla altere la cantidad que tiene en pagos la tabla ventas(3 puntos):

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


**3.-** Obtenga la venta con mayor monto(total) del dia 2013-11-20 (2 puntos):

-- SELECT MAX(total) as total
SELECT MAX(total) as total
	FROM ventas
	WHERE ventas.fecha_hora > '2013-11-20'
	and ventas.fecha_hora < '2013-11-21';

**4.-** Obtenga la fecha en la que se realizaron abonos tal que la suma de sus cantidades sea mayor(3 puntos):

