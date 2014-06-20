# Examen de programación II, [2do Parcial](index.html)

> Lea detenidamente y responda lo que se te indica:
>
> [**ExamenSoluciones.java (problemas 5, 6, 7 y 8)**](https://gist.github.com/fitorec/e9d1b096569bc8f1a74f)

**1.** ¿Qué método hay que invocar para ejecutar un programa en Java?:

  - do
  - exec
  - dispatcher
  - <strong style='color:red;'>main</strong>
  - callable
  - start
  - run

**2.** Subraye los [**tipos de datos primitivos**](file:///C:/Users/fitorec/codes/fitorec.github.com/ieso/programacion_II/parcial-2/java-basico.html#slide5) en Java en la lista que se muestra a continuación:

  - small
  - Integer
  - bool,
  - character
  - bit
  - <strong style='color:red;'>long</strong>
  - Float
  - <strong style='color:red;'>double</strong>

**3.-** [Del entorno de programas en java](file:///C:/Users/fitorec/codes/fitorec.github.com/ieso/programacion_II/parcial-2/java-basico.html#slide5), **indique el nombre de el programa que nos ayuda a generar documentación** de nuestro código a partir de nuestros comentarios:

 - java
 - java-doc-gen
 - java-dump-doc
 - java-doc</strong>
 - java-gen-doc
 - <strong style='color:red;'>javadoc</strong>
 - javaLibDoc
 - jdoc

**4.-** [Del entorno de programas en java](file:///C:/Users/fitorec/codes/fitorec.github.com/ieso/programacion_II/parcial-2/java-basico.html#slide5), **indique el nombre de el programa que nos ayuda a compilar** nuestro código generando archivos con extensión `.class`:

 - java
 - java-compiler
 - <strong style='color:red;'>javac</strong>
 - jar
 - java-class-gen
 - javadoc
 - javah
 - javap



**5.-** **¿cual es sucesión generada?** por el siguiente código en java:

	for (int k = -5; k < 0;) {
        System.out.print("," + k++);
    }

<pre style='color:red'>
,-5,-4,-3,-2,-1
</pre>
**6.-** **¿cual es sucesión generada?** por el siguiente código en java:

	for (int h = 5; h > 0;) {
		System.out.print(--h + ",");
	}
<pre style='color:red'>
4,3,2,1,0,
</pre>

**7.-** Observe detenidamente el siguiente código y escriba **el valor de result**:

	int f = 9, b = 3;
	int result = f++ + ++b - 4;
<pre style='color:red'>
result = 9
</pre>

**8.-** **escriba el valor de `result`** al final de la ejecución del código que se te presenta:

	Boolean result = ((1 > 1) == false);
<pre style='color:red'>
result = true;
</pre>

**9.-** Siguiendo el código que se te muestra **subraye la respuesta correcta**:

	public class Principal {
	 public void main() {
	     System.out.println("ejecutando el metodo main");
	 }
	}

  - El código no se ejecuta ya que no existe constructor para la clase Principal.
  - El código genera error ya que la función main debe recibir un arreglo de Strings.
  - El código se ejecuta correctamente e imprime `"ejecutando el metodo main"`
  - <strong style='color:red;'>El código se ejecuta correctamente, pero no imprime nada.</strong>
  - El código genera un error ya que la función main debe devolver el **errnor** como en c.

> En otras palabras el código es correcto pero la clase no puede ser llamada desde el exterior ya que no tiene el método **main** con el prototipo  adecuado. Esto es que sea estático no devuelve nada(void) y recibe como argumentos un arreglo de **strings**:
> 
> `public static void main(String args[]){...}` 

**10.-** Observe el siguiente código y escriba el resultado, de su ejecución:

	public class ObjetoK {
	    public ObjetoK() {
	        System.out.println("OK");
	    }
	    public static void main(String s[]) {
	        ObjetoK ok = new ObjetoK();
	        System.out.print("Hola mundo");
	    }
	}
