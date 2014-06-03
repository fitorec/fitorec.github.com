# El metodo main en Java

El método main en java es un estándar utilizado por la JVM para iniciar la ejecución de cualquier programa Java. Dicho método se conoce como punto de entrada de la aplicación java, pero no en el caso de contenedores gestionados por ambientes como Servlets, EJB o MIDlet ellos tienen métodos de ciclo de vida propios.

	 public class Basico {
	   public static void main(String args[]) {
		System.out.println("Un despliegue de Datos");
	    }
	}

El método principal main de una Clase Java es inalterable, es este sentido inalterable se refiere a sus características:
Siempre debe incluir los calificadores : public y static.
Nunca puede retornar un valor como resultado, por ende, siempre debe indicar el valor void como retorno.
Su parámetro de entrada siempre será un array de String's (String[]) el cual es tomado de la linea de comandos o una fuente alterna.
Aunque no es un requerimiento definir el método main dentro de toda Clase Java, dicho método representa el único mecanismo automático para realizar tareas al invocarse una Clase, esto es, al momento de ejecutarse determinada Clase siempre será ejecutado todo el contenido dentro de dicho método.

## Firma del método main()

Dicho método, se puede escribir de tres maneras diferentes sin que esto produzca un error.

	public static void main(String args[]) {}
	public static void main(String[] args){}
	public static void main(String... args){}

El método `main ()` en **Java** es estáticos, ya que puede ser invocado por el motor de tiempo de ejecución sin tener que crear una instancia de la clase padre.

Aunque se le suele dar el nombre de `args`, no es obligatorio que este parámetro se llame así  podemos darle el nombre que mas nos guste por ejemplo:

	public static void main(String[] parametros){
		//...
	}
