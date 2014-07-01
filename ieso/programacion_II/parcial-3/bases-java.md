# Java Intermedio.

## Scanner, lectura desde la consola

	import java.util.Scanner;

	class PruebaScanner {
	     public static void main(String args[]){
	                Scanner scanner = new Scanner(System.in);
	                int num_1, num_2;
	                String cadena;
	                System.out.println("Inserte un entero:");
	                num_1=scanner.nextInt();
	                scanner.nextLine(); //Leemos el salto de linea
	                System.out.println("Inserte un String:");
	                cadena=scanner.nextLine();
	                System.out.println("Inserte otro Entero:");
	                num_2=(scanner.nextInt());
	        }
	}

<H3 id='trabajo-1'>Trabajo 1.- Objeto calificación</H3>

> **Ver: [Calificacion.java](Calificacion.java)**


Construya un objeto con el nombre **Calificacion**, que tenga como atributos(privados):

- examen_puntos_obtenidos
- examen_reactivos

Agregue los métodos de acceso(get,set) para estos atributos.

Agregue el metodo publico **calificacionExamen**, que devuelva la calificacion del examen la cual esta dada por la siguiente formula:

 	calificacion_examen = (examen_puntos_obtenidos / examen_reactivos) * 100;  

Implemente la función principal _main_, donde obtenga la calificación obteniendo los parámetros desde la consola:
 

<H2 id='instanciar-inicializar'>Instanciar e inicializar objetos</H2>
