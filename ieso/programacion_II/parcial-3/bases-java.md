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

