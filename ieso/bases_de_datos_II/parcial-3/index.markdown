Base de datos parcial III
=========================================

![tarea_claves_foraneas](../parcial-2/tarea_claves_foraneas.png)

 > **Archivo base:** [mundial_esquema.sql](mundial_esquema.sql)
 > 
 > **Esquema:** [bd_mundial](bd_mundial.sql)

 
## Variables en mysql

Podemos definir una variable en una declaración y luego utilizarla en otra.

Para declarar variables utilizando la sintaxis

    SET @var_name = value;

Al crear las variables, puedes utilizar cualquiera de los tipos de datos enteros, decimales, punto flotante, binarios, cadena o nulos.

MySQL convierte otros tipos de datos, como Boolean, a los tipos permisibles. Al salir de MySQL, las variables definidas son liberadas.

### Paso 1

Abre MySQL y accede a la herramienta de consulta.

### Paso 2

Escribe y ejecuta las siguientes consultas:

	SET @var1=5;
	SET @var2='Hello';
	SET @var3=True;
	SELECT @var1, @var2, @var3;

MySQL muestra todas las variables en su propia columna debido a los tipos de datos diferentes. Ten en cuenta que la tercera variable utiliza un valor booleano, pero MySQL la convierte en "1", el equivalente entero de la "true" (verdadero).

### Paso 3

Escribe y ejecuta las siguientes consultas:

	SET @var1=2;
	SET @var2=3;
	SET @var3=4;

	SELECT @var1+@var2+@var3;

MySQL muestra los resultados en una sola columna y muestra "9", la suma de los tres valores de la variable.

### Paso 4

Escribe y ejecuta las siguientes consultas

	SET @var1 = b'1000011';

	SELECT @var1;

Esta consulta convierte el número binario en un número decimal, luego devuelve el valor ASCII, en este caso, el carácter "C" en mayúscula.

### Paso 5

Escribe y ejecuta las siguientes consultas:
	
	SET @var1 = CAST(b'10001' AS UNSIGNED), @var2 = b'10001'+10;

	SELECT @var1, @var2;

MySQL utiliza la función de conversión para convertir el parámetro binario a un entero sin signo, que en este caso es igual a 17 y lo asigna a la primera variable. También convierte la segunda variable de binario a un entero y luego agrega 10 para el total de 27.

### Paso 6

Escribe y ejecuta las siguientes consultas:
	
	SET @pais_nombre='México';

	SELECT *
		FROM paises AS Pais
		WHERE Pais.nombre = @pais_nombre;

Esta consulta utiliza la variable en la cláusula "where" para filtrar los resultados de la instrucción SELECT.

### Paso 7

	SET @pais_id = (
		SELECT id
		FROM paises
		WHERE nombre = 'México'
	);
	
	SELECT @pais_id;


Referencias

<http://www.ehowenespanol.com/utilizar-variables-instruccion-select-mysql-como_201199/>

### [variables](variables.html);
