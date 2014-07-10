# Hilos en Java

A veces necesitamos que nuestro programa **Java** realice varias cosas simultáneamente. Otras veces tiene que realizar una tarea muy pesada, por ejemplo, consultar en la agenda telefónica de todos los nombres en minúscula que tengan la letra n, que tarda mucho y no deseamos que todo se quede parado mientras se realiza dicha tarea. Para conseguir que Java haga varias cosas a la vez o que el programa no se quede parado mientras realiza una tarea compleja, tenemos los hilos (**_Threads_**).
Crear un Hilo

Crear un hilo en java es una tarea muy sencilla. Basta **heredar de la clase Thread** y **definir** el **método `run()`**. Luego **se instancia esta clase y se llama al método `start()`** para que arranque el hilo. Más o menos esto

	public MiHilo extends Thread
	{
	   public void run()
	   {
	      // Aquí el código pesado que tarda mucho
	   }
	};
	...
	MiHilo elHilo = new MiHilo();
	elHilo.start();
	System.out.println("Yo sigo a lo mio");

Listo. Hemos creado una clase MiHilo que hereda de Thread y con un método run(). En el método run() pondremos el código que queremos que se ejecute en un hilo separado. Luego instanciamos el hilo con un new MiHilo() y lo arrancamos con elHilo.start(). El System.out que hay detrás se ejecutará inmediatamente después del start(), haya terminado o no el código del hilo.
Detener un hilo

Suele ser una costumbre bastante habitual que dentro del método run() haya un bucle infinito, de forma que el método run() no termina nunca. Por ejemplo, supongamos un chat. Cuando estás chateando, el programa que tienes entre tus manos está haciendo dos cosas simultáneamente. Por un lado, lee el teclado para enviar al servidor del chat todo lo que tú escribas. Por otro lado, está leyendo lo que llega del servidor del chat para escribirlo en tu pantalla. Una forma de hacer esto es "por turnos"

	while (true) {
	   leeTeclado();
	   enviaLoLeidoAlServidor();
	   leeDelServidor();
	   muestraEnPantallaLoLeidoDelServidor();
	}

Esta, desde luego, es una opción, pero sería bastante "cutre", tendríamos que hablar por turnos. Yo escribo algo, se le envía al servidor, el servidor me envía algo, se pinta en pantalla y me toca a mí otra vez. Si no escribo nada, tampoco recibo nada. Quizás sea buena opción para los que no son ágiles leyendo y escribiendo, pero no creo que le guste este mecanismo a la mayoría de la gente.

Lo normal es hacer dos hilos, ambos en un bucle infinito, leyendo (del teclado o del servidor) y escribiendo (al servidor o a la pantalla). Por ejemplo, el del teclado puede ser así
	
	public void run() {
	   while (true) {
	      String texto = leeDelTeclado();
	      enviaAlServidor(texto);
	   }
	}

Esta opción es mejor, dos hilos con dos bucles infinitos, uno encargado del servidor y otro del teclado.

Ahora viene la pregunta del millón. Si queremos detener este hilo, ¿qué hacemos?. Los Thread de java tienen muchos métodos para parar un hilo: detroy(), stop(), suspend() ... Pero, si nos paramos a mirar la API de Thread, nos llevaremos un chasco. Todos esos métodos son inseguros, están obsoletos, desaconsejados o las tres cosas juntas.

¿Cómo paramos entonces el hilo?

La mejor forma de hacerlo es implementar nosotros mismos un mecanismo de parar, que lo único que tiene que hacer es terminar el método run(), saliendo del bucle.

Un posible mecanismo es el siguiente
	
	public class MiHilo extends Thread {
	   // boolean que pondremos a false cuando queramos parar el hilo
	   private boolean continuar = true;
	
	   // metodo para poner el boolean a false.
	   public void detenElHilo() {
	      continuar=false;
	   }
	
	   // Metodo del hilo
	   public void run() {
	      // mientras continuar ...
	      while (continuar) {
	          String texto = leeDelTeclado();
	          enviaAlServidor(texto);
	      }
	   }
	}

Simplemente hemos puesto en la clase un boolean para indicar si debemos seguir o no con el bucle infinito. Por defecto a true. Luego hemos añadido un método para cambiar el valor de ese boolean a false. Finalmente hemos cambiado la condición del bucle que antes era true y ahora es continuar.

Para parar este hilo, es sencillo
	
	MiHilo elHilo = new MiHilo();
	elHilo.start();
	// Ya tenemos el hilo arrancado
	...
	// Ahora vamos a detenerlo
	elHilo.detenElHilo();

> Fuente: <http://www.chuidiang.com/java/hilos/hilos_java.php>
> 