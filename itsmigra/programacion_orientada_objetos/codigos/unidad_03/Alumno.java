public class Alumno {
	private String nombre;
	// Constructor
	public Alumno(String name) {
		this.nombre = name;
	}
	protected void setNombre(String n) {
		nombre = n;
	}
	public String getNombre() {
	  return nombre;
	}
	//Test
	public static void main(String args[]) {
		Alumno j = new Alumno("Juan");
		Alumno p = new Alumno("Pedro");
		System.out.println(j.getNombre());
		System.out.println(p.getNombre());
	}
}
