-- Mostramos el número de paises (32)
SELECT COUNT(id) AS num_paises
	FROM paises
	WHERE 1;

-- Actualizando los paises calificados
UPDATE paises
	SET estado_actual = 'calificado'
	WHERE acronimo IN(
		'ger', 'arg', 'ned'
	);

-- Seleccionamos los paises calificados
SELECT *
	FROM paises
	WHERE
		estado_actual = 'calificado';

-- seleccionamos todos los jugadores
-- de los paises calificados
SELECT *
	FROM jugadores
	WHERE jugadores.pais_id IN (
	 SELECT id AS pais_id
		FROM paises
		WHERE estado_actual = "calificado"
	)
	ORDER BY
		pais_id ASC
		,nombre ASC;

-- Ejemplo selecionando la camiseta con
-- valor mas pequeño
SELECT 	MIN(num_camiseta)
	FROM jugadores;

-- Ejemplo selecionando la camiseta cn
-- valor mayor en los jugadores
SELECT MAX(num_camiseta)
	FROM jugadores;

-- Mostrando los nombres de los jugadores
-- que tengan el numero de camiseta mayor
SET @max_camiseta = (
	SELECT MAX(num_camiseta) FROM jugadores
);
SELECT * FROM jugadores
	WHERE num_camiseta = @max_camiseta;

-- Número de jugadores
-- en el grupo A
SELECT COUNT(jugadores.id) AS num_jugs
	FROM jugadores, paises
	WHERE
		jugadores.pais_id = paises.id
		AND paises.grupo = "A";

-- Contamos el número de paises
-- en el grupo a
SELECT COUNT(id) AS num_paises_grup_a
	FROM paises
	WHERE grupo = 'A';

-- Obtenemos la suma de los
-- ids del grupo A (69)
SELECT SUM(id) AS suma_ids_grup_a
	FROM paises
	WHERE grupo = 'A';

-- Obtenemos la media aritmetica
-- de los ids del grupo A (17.25)
SELECT AVG(id) AS promedio_ids_grup_a
	FROM paises
	WHERE paises.grupo = "A";
