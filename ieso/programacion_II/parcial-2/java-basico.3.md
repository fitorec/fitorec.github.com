# Java Básico 3

--------------------------------------------

# Constructor y valores iniciales

Los objetos en java pueden contar con un constructor, para esto se agrega un método publico con el mismo nombre que el objeto y no se especifica el tipo de dato devuelvo, ya que implícitamente devuelve el objeto, veamos un par de ejemplos:

	!java
	public class Suma {
		Integer numero;
	    /**
		* Constructor del objeto suma
		**/
	    public Suma() {
	    }
	}

Tambien podemos pasarle valores que definan las características del nuevo objeto, p.e.

		public Suma(Integer num) {
			this.numero = num;
	    } 
## Uso:

	!java
	Suma sum1 = new Suma();  // Constructor sin argumentos
	Suma sum2 = new Suma(5); // Constructor con argumentos

--------------------------------------------

# Sobre carga de métodos.


En un objeto puede haber mas de un método con el mismo nombre siempre y cuando cada prototipo del método sean diferente, esto implica que cada método deberá tener es los argumentos distintos y/o el tipo de dato que devuelven dichos métodos. 

Por ejemplo el objeto `System.out`(_PrintStream_) tiene sobre cargado el método `print`, como se puede ver a continuación:

	!java
	void print(boolean b)  //Imprime un valor booleano.
	void print(char c)     //Imprime un carácter
	void print(char[] s)   //Imprime un arreglo de caracteres
	void print(double d)   //Imprime un numero del tipo double.
	void print(float f)    //Imprime un valor del tipo flotante.
	void print(int i)      //Imprime un valor entero.
	void print(long l)     //Imprime un valor long
	void print(Object obj) //Imprime un objeto (ejecuta toString).
	void print(String s)   //Imprime un String.

> En el los ejemplos anteriores se vio como el objeto Suma, tenia dos constructores uno con argumentos y otro sin argumentos, a esto se le conoce como **sobre carga de constructor**.

--------------------------------------------

## Bloque de inicialización:

Cuando vimos el constructor agregamos un constructor con argumentos, existe otra forma de instanciar valores por defecto, esto es definiendo el bloque de inicialización, observe el siguiente ejemplo:

	!java
	public class Suma {
	    public Integer numero;
	    { //Inicio bloque de inicializacion
	        numero = 5;
	    } //Fin bloque de inicializacion
	 	
		/**
		* Constructor del objeto suma
		**/
	    public Suma() {
	    }

	    // Constructor del objeto suma
	    public Suma(int num) {
	        this.numero = num;
	    }
	}

## Prueba:

	!java
	Suma sum1 = new Suma();  // Constructor sin argumentos
	System.out.println(sum1.numero);
	Suma sum2 = new Suma(5); // Constructor con argumentos
	System.out.println(sum2.numero);

