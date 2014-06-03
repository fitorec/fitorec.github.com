## CONVENCIONES DE PROGRAMACIÓN EN JAVA

Para escribir código en el lenguaje **Java** se usaran convenciones, que definen nuestro estándar a la hora de desarrollar software:

### Clases:

Los nombres de **clases** deben empezar con mayúsculas,  si el nombre de la clase esta formado por un conjunto de palabras, entonces para la primera letra de cada palabra deberá estar en mayúscula y se eliminaran los espacios en blancos que las separan, esta forma de nomenclatura también es llamada **lomo de camello** o **CamelCase** en ingles:

	public class Barcos;
	class ContabilidadEmpresarial;
	class RecursosHumanos;

### Métodos & atributos públicos

 - La letra inicial deberá estar en minúscula.
 - Si el nombre es un conjunto de palabras usar la forma **camelCase** con minúscula inicial.
 - Los nombres de métodos deben ser a la medida de los posibles verbos.

**Algunos Ejemplos de métodos:**

	balanceCuenta();
	insertarBuque();
	mostrarCuadricula();
	listarContenedores();
	insertarFactura();
	borrarFactura();

**Algunos Ejemplos de atributos**

	clienteActual;
	contenedorNombre;
	nombreEmpleado;
	cargoEmpleado;
	deptoEmpleado;

### Métodos & atributos privados

 - Deberán seguir la misma convención que lo nombres de métodos y atributos públicos.
 - La variante es que la letra inicial deberá ser un guión bajo para denotar que es un método privado durante el flujo del programa.

**Algunos Ejemplos de métodos privados:**

	_balanceCuenta();
	_insertarBuque();
	_mostrarCuadricula();
	_listarContenedores();
	_insertarFactura();
	_borrarFactura();

**Algunos Ejemplos de atributos privados**

	_clienteActual;
	_contenedorNombre;
	_nombreEmpleado;
	_cargoEmpleado;
	_deptoEmpleado;


### Paquetes:

Los nombres de **paquetes** se escriben en minúsculas, si el nombre del paquete se compone por un conjunto de palabras p.e. `conjunto universal` los espacios serán remplazados por guiones bajos (`_` _undescore mode_):

	package conjunto_universal.subconjunto.clases;
	package conjunto_universal.subconjunto.*;


### Constantes:

El nombre de las **constantes** deben escribirse completamente en mayúsculas y separando las palabras mediante un guión bajo (similar a los paquetes).

	MAX_NUM_CONTENEDORES;
	MAX_PESO_PANAMAX_MAX;
	MAX_NUDOS;

### Estructuras de Control:

cuando las sentencias forman parte de una estructura de control de flujo  como un for, while, es necesario incluirlas en un conjunto de instrucciones delimitadas con los corchetes ({}) aunque solo tengan una linea de código:

**Ejemplo Incorrecto:**

	if(condicion)
		//... acción a realizar
	//.. más acciones

**Forma Correcta**

	if (condicion) {
		//... acción a realizar
	}
	//.. más acciones

### Espacios y sangrias:

Para entender mejor el código y distinguir el principio y el fin de las estructuras de control úsese de acuerdo a la estructura de control las separaciones por sangría necesarias. Quedando la sangría definida por tabulaciones.

### Comentarios:

Use comentarios de una linea o varias, puede inclusive usar JAVADOC.
No hay restricción de acuerdo a la forma en que deben estar escritos los comentarios.