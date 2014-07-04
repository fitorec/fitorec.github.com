
import java.lang.Math;

/**
 * Ejemplo de clases abstractas, polimorfismo
 *
 * @author Miguel Angel Marcial Mártinez
 */
abstract class GeoBase {
   abstract public double area();
   abstract public String info();
}

/**
 * Clase Cuadrado
 */
class Cuadrado extends GeoBase {
	private double lado;
    public String info() {
        return "Clase: Cuadrado\n" +
                "Lado:" + this.lado();
    }
    public Cuadrado(double lado) {
    	this.lado(lado);
    }
    public double lado() { // Devuelve el lado del cuadrado
        return this.lado;
    }
    public double lado(double lado) { //setea y devuelve el lado
        this.lado = lado;
        return this.lado();
    }
    public double area() { //Devuelve el area del cuadrado
        return this.lado() * this.lado();
    }
}

/**
 * Clase Rectangulo
 */
class Rectangulo extends GeoBase {
    private double ancho;
    private double alto;
    public String info() {
        return "Clase: Rectangulo\n" +
                "Ancho:" + this.ancho + "\n" +
                "Alto: " + this.alto;
    }
    public Rectangulo(double ancho, double alto) {
        this.ancho = ancho;
        this.alto = alto;
    }
    public double area() {
        return this.ancho * this.alto;
    }
}

/**
 * Clase Circunferencia
 */
class Circunferencia extends GeoBase {
    private double radio;
    public String info() {
        return "Clase: Circunferencia\n" +
                "Radio: " + this.radio;
    }
    public Circunferencia(double radio) {
        this.radio = radio;
    }
    public double area() {
        return Math.PI * Math.pow((double)this.radio,  (double)2);
    }
}

/**
 * Clase Geometria, se encarga de probar el comportamiento de la clase abstracta y de las que heredan de el
 */
public class Geometria {
    public static void main(String args[]) {
        GeoBase[] objetosGeometricos = new GeoBase[3];
        int index = 0;
        objetosGeometricos[index++] = new Cuadrado(5);
        objetosGeometricos[index++] = new Rectangulo(3, 4);
        objetosGeometricos[index++] = new Circunferencia((float)3.5);
        for (index = 0; index < objetosGeometricos.length; index++) {
            System.out.println("\n"+objetosGeometricos[index].info());
            System.out.println("Area: " + objetosGeometricos[index].area());
        }
    }
}
