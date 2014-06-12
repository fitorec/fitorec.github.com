Java Básica 2
================================================================

 - **3.1** Instrucciones de programa
 - **3.2** Variables, literales y tipos de datos
 - **3.3** Expresiones y operadores
 - **3.4** Arreglos y cadenas
 - **3.5** Ciclos y condiciones


--------------------------------------------------------

# Entorno Java.

 - **javac:** compilador Java -> bytecodes
 - **java:** intérprete Java
 - **jdb:** depurador
 - **javah:** crea ficheros de cabecera y stubs para conectividad con C
 - **javap:** desensamblador bytecodes -> Java
 - **javadoc:** genera documentación de API en formato HTML a partir de código fuente Java
 - **appletviewer:** permite ejecutar applets sin un navegador
 - **jar:** combina varios ficheros en un fichero Java Archive (JAR).
 - **javakey:** genera firmas digitales

--------------------------------------------------------

# Cuestiones de java.

## java es sensibles a mayusculas/minusculas

Por lo cual tanto las palabras reservadas, las variables, constantes, etc... Por lo cual hay que tener cuidado de no provocar algun error como el siguiente:

	!java
	int miNumero = 5;
	System.out.println("Valor del número" + minumero);

En este caso nuestro código tendrá un error ya que la variable `mimumero` que se manda a llamar en la linea 2, no es la misma que `miNumero` de la linea 1.

## Conversión entre tipos de datos.

Pruebe el siguiente código y trate de explicar su comportamiento.

	!java
	int ent = 10;
	double d = ent; // asignamos un tipo entero a un double
	System.out.println(d);

El valor de 10.0 es mostrado en la pantalla, resulta algo evidente la conversión de enteros a _doubles_ ahora observe el siguiente código y trate de predecir su comportamiento:

	!java
	double d = 10;
	int ent  = d; // asignamos un double a un entero
	System.out.println(ent);


--------------------------------------------------------

# Palabras reservadas:

	!java
	abstract continue for new switch assert default goto
	package synchronized boolean do if private this break
	double implements protected throw byte else import
	public throws  case enum instanceof return transient
	catch extends int short try char final interface static
	class finally const long strictfp float native super void
	volatile while

Fuente: <http://java.sun.com/docs/books/tutorial/java/nutsandbolts/_keywords.html>

--------------------------------------------------------

# Instancia de variables:
La instancia de variables a atributos primitivo y referencias de objetos, estas pueden cambiar su valor en tiempo de ejecución:

## Declaración simple:

	!java
	String nombre;
	String apellidos;
	String login;
	String password;
	TargetaMiembro targeta;

## Declaración inicializada:

	!java
	private String password = "xxx";

En este caso hemos declarado un el atributo `password` con el valor `"xxx"`, una característica en esta segunda declaración es que lo hemos declarado con un acceso **privado**.
 
--------------------------------------------------------

# Encapsulamiento y métodos de accesos

Consiste en la ocultación(`private`, `protected`) del estado o de los datos miembro de un objeto, de forma que sólo es posible modificar los mismos mediante los métodos definidos para dicho objeto.

Cada objeto está aislado del exterior, de forma que la aplicación es un conjunto de objetos que colaboran entre sí mediante el paso de mensajes invocando sus operaciones o métodos. De esta forma, los detalles de implementación permanecen "ocultos" a las personas que usan las clases, evitando así modificaciones o accesos indebidos a los datos que almacenan las clases.

Además, el usuario de la clase no se tiene que preocupar de cómo están implementados los métodos y propiedades, concentrándose sólo en cómo debe usarlos.

La encapsulación es una de las principales ventajas que proporciona la programación orientada a objetos.


	!java
	public class Usuario {
		private String password = "xxx";
		//...
    }

--------------------------------------------------------

# Encapsulamiento y metodos de accesos

En la practica es común hacer uso de los metodos _get_ y _set_ para obtener o setear respectivamente algún valor a un campo privado revise el siguiente ejemplo:
 
	!java
	public class Usuario {
		private String password = "xxx";
		/**
		 * Metodo get, nos sirve para obtener el valor del password
		 */
		public String getPassword() {
			return this.password;
		}

		/**
		 * Metodo set, nos sirve para setear el valor del password
		 */
		public void setPassword(String valorPassword) {
			this.password = valorPassword;
		}
    }

--------------------------------------------------------

http://java.sun.com/docs/books/tutorial/java/nutsandbolts/index.html
