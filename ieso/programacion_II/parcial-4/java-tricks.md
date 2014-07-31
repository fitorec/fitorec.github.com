# Java trucos y buenas practicas.

Observe el siguiente código:

	!java
	Object instance = new Object();

Esto es equivalente ha:

	!java
	Object instance = new Object();

Ahora teniendo el nombre de la clase:

	!java
	Class c= Class.forName(className);
	return c.newInstance();

> Fuente: <http://stackoverflow.com/questions/3170159/difference-between-calling-new-and-getinstance>
>
>Fuente: <http://docs.oracle.com/javase/tutorial/reflect/member/ctorInstance.html>

------------------------------------------------

# En java todo objeto heredan de Object

 Todas las clases son en realidad subclases de una clase más amplia: la clase Object. Esta clase incluye todos los objetos (los lectores de archivos, las tortuga, los arreglos, los glyphs, etc.). Por lo tanto siempre es posible colocar cualquier objeto en donde se espera un expresión de tipo Object. Por ejemplo:

	!java
	Object o1= "Hola";
    Object o2= new TextReader("datos.txt");
    Object o3= new Nodo(3, "hola", null, null);
    Object o4= new Box( ... );

Recuerde que la relación ser subclase de es transitiva: como Box es subclase de Glyph y Glyph es subclase de Object entonces Box es subclase de Object también y por eso es válido realizar la última operación del ejemplo.

El único problema es que no hay muchas operaciones que se puedan realizar con una variable de tipo Object. Quizas la más importante es que se puede obtener un string que describa el objeto:

	!java
    println(o1.toString());  // despliega "Hola" en pantalla
    println(o3.toString());  // despliega un mensaje no muy útil


------------------------------------

# Constructor dinamico

	!java
	 public static Object createObject(Constructor constructor,
	      Object[] arguments) {
	
	    System.out.println("Constructor: " + constructor.toString());
	    Object object = null;
	
	    try {
	      object = constructor.newInstance(arguments);
	      System.out.println("Object: " + object.toString());
	      return object;
	    } catch (InstantiationException e) {
	      //handle it
	    } catch (IllegalAccessException e) {
	      //handle it
	    } catch (IllegalArgumentException e) {
	      //handle it
	    } catch (InvocationTargetException e) {
	      //handle it
	    }
	    return object;
	  }
	}