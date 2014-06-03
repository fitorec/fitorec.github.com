## CONVENCIONES DE ESCRITURA DE PROGRAMAS JAVA

Para escribir código en el lenguaje Java se usan convenciones que están definidas como un estandard a la hora de fabricar programas:


### Paquetes:
los nombres de paquetes se escriben en minúsculas:

	package conjunto_universal.subconjunto.clases;
	package conjuntouniversal.subconjunto.*;

### Clases:

los nombres de clases deben empezar con mayúsculas,  si el nombre de la clase esta formado por un conjunto de palabras todas ellas su primera letra de cada palabra en mayúscula, esta forma de nomenclatura también es llamada lomo de camello o CamelCase en ingles:

	public class Barcos;
	class ContabilidadEmpresarial;
	class RecursosHumanos;

### Métodos
Los métodos deben ser verbos escritas con la palabra inicial en minúscula y las siguientes palabras con la inicial en Mayúscula:

	balanceCuenta();
	insertarBuque();
	mostrarCuadricula();
	listarContenedores();
	insertarFactura();
	borrarFactura();

### Variables:

Deben escribirse en mayúsculas y minúsculas, con la inicial en minúscula, con la siguiente palabra con la inicial en mayúscula. Casi no se usan los signos de subrayado (_) y evite el signo de dolar ($).

	clienteActual;
	contenedorNombre;
	nombreEmpleado;
	cargoEmpleado;
	deptoEmpleado;

### Constantes:

Las constantes deben escribirse enteramente en mayusculas y separando las palabras mediante underscore (subrayado).

	MAX_NUM_CONTENEDORES;
	MAX_PESO_PANAMAXMAX;
	MAX_NUDOS;

### Estructuras de Control:

cuando las sentencias forman parte de una estructura de control de flujo  como un for, while, es necesario incluirlas en un paquete de sentencias con los corchetes ({}) aunque solo tengan una linea de código:

	for ( i=0; i<MAX_NUM_CONTENEDORES; i++) {
		sentencia;
		sentencia;
	}

### Espacios y sangrias:

La sangria sera por tabs, para entender mejor el código y distinguir el principio y el fin de las estructuras de control usese de acuerdo a la estructura de control las separaciones por sangria necesarias.



### Comentarios:

Use comentarios de una linea o varias, puede inclusive usar JAVADOC. No hay restricción de acuerdo a la forma en que deben estar escritos los comentarios.