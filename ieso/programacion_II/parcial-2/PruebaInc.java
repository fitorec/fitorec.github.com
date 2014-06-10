public class PruebaInc {

    public static void main(String S[]) {
        for(int i=0; i<10;) {
            System.out.printf(" %02d", ++i);
        }
        System.out.println("¿Que diferencia hay entre el código de arriba con el siguiente?");
        for(int i=0; i<10;) {
            System.out.printf(" %02d", i++);
        }
    }
}