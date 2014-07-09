
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
