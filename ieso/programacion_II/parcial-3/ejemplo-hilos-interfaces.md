## Competencia de Hilos, la carrera.

## Hilos Threads

### Método yield()

El método yield() tiene la función de hacer que un hilo que se está ejecutando de regreso al estado en “listo para ejecutar” para permitir que otros hilos de la misma prioridad puedan ejecutarse. Sin embargo, el funcionamiento de este método (al igual que de los hilos en general) no está garantizado, puede que después de que se establezca un hilo por medio del método yield() a su estado “listo para ejecutar”, éste vuelva a ser elegido para ejecutarse. El método yield() nunca causará que un hilo pase a estado de espera/bloqueado/dormido, simplemente pasa de ejecutándose(running) a  “listo para ejecutar”.

Generando un número aleatorio:

	public int randInt(int min, int max) {
	    Random rand = new Random();
	    int randomNum = rand.nextInt((max - min) + 1) + min;
	
	    return randomNum;
	}

### El método sleep()

El método `sleep()` simplemente le dice al **Thread** que duerma durante los **milisegundos específicos**. Se debería utilizar `sleep()` cuando se pretenda retrasar la ejecución del **Thread**, `sleep()` no consume recursos del sistema mientras el **Thread** duerme. De  esta forma otros **Threads** seguir funcionando:

	hilo.sleep(1000) //Duerme al hilo 1 seg

### método currentThread()

Para saber qué hilo se encuentra en ejecución en un momento determinado, existe el método estático Thread.currentThread().
Thread.currentThread().getName() te devuelve un valor de tipo cadena con el nombre del hilo en ejecución, si no has definido un nombre con el método setName(), de igual manera el proceso lo tendrá, algo muy parecido a Thread-0, Thread-1, etc



## Lista de Recursos:

 - [juego_imgs.zip](juego_imgs.zip)
 - [JFrame oracle](http://docs.oracle.com/javase/tutorial/uiswing/components/frame.html)
 - [JFrame tutorial](http://www.dreamincode.net/forums/topic/206344-basic-gui-in-java-using-jframes/)
 - [JFrame tuturial español](http://codejavu.blogspot.mx/2013/08/jframe-y-jdialog.html)
 - [Imgs con Asscii](http://www.geocities.com/spunk1111/transp.htm)