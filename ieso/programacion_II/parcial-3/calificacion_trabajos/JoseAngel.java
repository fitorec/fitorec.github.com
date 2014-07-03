/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Alexander Betanzos Lopez
 */
public class Calificacion {
    private int examen_puntos_obtenidos;
    private int examen_reactivos;
    
    
    public int getExamenPuntosObtenidos(){
        return this.examen_puntos_obtenidos;
    }
    public int getExamenReactivos(){
        return this.examen_reactivos;
     }
    
    public int setExamenPntosObtenidos(int puntos_obtenidos){
        this.examen_puntos_obtenidos = puntos_obtenidos;
        return this.getExamenPuntosObtenidos();
    }
    
    public int setExamenReactivos(int examen_reactivos) {
        this.examen_reactivos = examen_reactivos;
        return this.getExamenReactivos();
    }
   
    
    
    public float calificacionExamen(){
        float resultado = 0;
        return resultado = (this.examen_puntos_obtenidos/this.examen_reactivos)*100;
    }
    
    public static void main(String args[]){
        Calificacion miCalificacion = new Calificacion();
        System.out.println(
           "Seteando reactivos = "+ miCalificacion.setExamenReactivos(7)     
                );
    }
}