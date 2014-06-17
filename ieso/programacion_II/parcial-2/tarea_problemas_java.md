# Lista de problemas.

## Uso de javadoc

Usando la sintaxis de `javadoc` para defininir metodos:

	 /**
	  * Descripcion del metodo
	  *
	  * @param <nombre_argumento>  descripcion del parametro
	  * @throws nomreException descripcion de los casos de excepcion.
	  * @return 
	  */

## conversión fecha a entero.

Realice un programa que lea del teclado una fecha en formato `YYYY-MM-DD` y devuelva el valor en segundos representado.

>Nota: para esto realice la función [`split`](http://docs.oracle.com/javase/6/docs/api/java/lang/String.html#split(java.lang.String)) del objeto String.
>
> Nota2: Utilice el método main para recibir los argumentos. 


## Jugador

Se Realice una clase con el nombre `Jugador`, que tenga los atributos.

 - `String` pais;
 - `Integer` numero_camiseta;
 - `String` posicion;
 - `float` velocidad; // en kilometros por hora.


## Constructores:

Agregue un constructor vacio y constructor que reciba los valores de los atributos que tendra dicho objeto.

## esMasRapido

Agregue un método con el nombre esMasRapido que reciba como argumento otro Objeto del tipo `Jugador`  y devuelva un `boolean` `true` si la velocidad del Jugador que es enviado como argumento es mayor que la actual `false` caso contrario, como se muestra en el prototipo actual.

	public boolean esMasRapido(Jugador otroJuador){
		//...
	}


## esDeMiEquipo


Agregue un método con el nombre esDeMiEquipo que reciba como argumento otro Objeto del tipo `Jugador`  y devuelva un `boolean` `true` si coinciden en el pais y `false` en el caso contrario.

	public boolean esDeMiEquipo(Jugador otroJuador){
		//...
	}


## esRival


Agregue un método con el nombre esRival que reciba como argumento otro Objeto del tipo `Jugador`  y devuelva un `boolean` `true` si **NO** coinciden en el pais y `false` en el caso contrario.

	public boolean esRival(Jugador otroJuador){
		//...
	}

>**Nota:** Observe que esRival es la función inversa de esDeMiEquipo.

