/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package examen;

/**
 *
 * @author Miguel Angel Marcial Martinez
 */
public class Calificacion {
    
    private int examen_puntos_obtenidos;
    private int examen_reactivos;
    
    public int getExamenPuntosObtenidos() {
        return this.examen_puntos_obtenidos;
    }
    
    public int getExamenReactivos() {
        return this.examen_reactivos;
    }
    //
    public int setExamenPuntosObtenidos(int puntos_obtenidos) {
        this.examen_puntos_obtenidos = puntos_obtenidos;
        return this.getExamenPuntosObtenidos();
    }
  
    public int setExamenReactivos(int examen_reactivos) {
        this.examen_reactivos = examen_reactivos;
        return this.getExamenReactivos();
    }
 
    /**
     * Devuelve el resultado de la calificación del examen
     * en un tanto porsentual[0-100]
     * 
     * @return resultado el valor del examen. 
     */
    public float calificacionExamen( ){
        float resultado = 0;
        resultado = (
                    (float)this.examen_puntos_obtenidos
                        / (float)this.examen_reactivos
                    ) * 100;
        return resultado;
    }

    /**
     * Haciendo una prueba de mi objeto Calificacion
     * 
     * @param args
     */
        public static void main(String args[]) {
        Calificacion miCalificacion = new Calificacion();
        //Mandar a pedir el dato desde la consola
        miCalificacion.setExamenPuntosObtenidos(6);
        System.out.println(
          "Seteando examen_reactivos = " +
          miCalificacion.setExamenReactivos(7)
        );
        System.out.println(
          "mi calificacion de examen es= " +
          miCalificacion.calificacionExamen()
          +" %"
        );
    }
}
