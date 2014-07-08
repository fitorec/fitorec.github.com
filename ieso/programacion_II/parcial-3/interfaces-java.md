# Interfaces en Java

Una interfaz en java es un conjunto de métodos abstractos y propiedades. En ellas se especifica qué se debe hacer pero no su implementación. Serán las clases que implementen estas interfaces las que describan la lógica del comportamiento de los métodos.

## Ventajas al utilizar interfaces:

 - Se organiza la programación.
 - Obligar a que ciertas clases utilicen los mismos métodos (nombres y parámetros).
 - Establecer relaciones entre clases que no estén relacionadas.
 - Permite que una clase implemente múltiples interfaces.

## Cómo usarlas?

Java utiliza dos palabras reservadas para trabajar con interfaces que son `interface` e  `implements`.

Para declarar una interfaz se debe seguir el siguiente orden:

	<modificador_acceso> interface <NombreInterfaz> {
	    // código de interfaz
	}

## Ejemplo completo:


	interface ProductoInterface {
		abstract public double stockActual();
		abstract public String descripcion();
	}
	
	class ProductoPorKilo implements ProductoInterface {
		private double kilogramos = 0;
		private String nombre = "";
	
		public ProductoPorKilo (String nombre, double kg) {
			this.kilogramos = kg;
			this.nombre = nombre;
		}
	
		public double stockActual() {
			return this.kilogramos;
		}
		public String descripcion() {
			return "Producto por kilos "+
					this.nombre + " Stock actual" +
					this.kilogramos + " Kilogramos";
		}
	}
	class ProductoPorPieza implements ProductoInterface {
		private double piezas = 0;
		private String nombre = "";
	
		public ProductoPorPieza (String nombre, double pz) {
			this.piezas = pz;
			this.nombre = nombre;
		}
	
		public double stockActual() {
			return this.piezas;
		}
		public String descripcion() {
			return "Producto por pieza"+
					this.nombre + " Stock actual" +
					this.piezas + " Piezas";
		}
	}
	public class pruebaInterfaces {
		public static void main(String a[]) {
			ProductoPorKilo manzanas = new ProductoPorKilo("Manzanas", 50.0);
			ProductoPorPieza autos = new ProductoPorPieza("Autos", 6);
		}
	}
