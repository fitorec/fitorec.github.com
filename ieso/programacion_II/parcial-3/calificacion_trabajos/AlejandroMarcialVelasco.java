/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package examen_;

/**
 *
 * @author ALEJANDRO MARCIAL VELASCO
 */
public class Calificacion{
    
    private int ExamenPuntosObtenidos;
    private int examen_reactivos;
    
    //crear get y set para cada uno
    public int getExamenPuntosObtenidos(){
        return this.ExamenPuntosObtenidos;
    }
    public int getExamenReactivos(){
        return this.examen_reactivos;
    }
    public int setExamenPuntosObtenidos(int puntos_obtenidos){
        this.ExamenPuntosObtenidos = puntos_obtenidos;
        return this.getExamenPuntosObtenidos();
    }
    public int setExamenReactivos(int examen_reactivos){
        this.examen_reactivos = examen_reactivos;
        return this.getExamenReactivos();
    }
    /**
     * Devuelve el resultado de la calificacion del examen
     * en un tanto porcentual (0-100)
     * 
     * @return resultado el valor del examen
     */
    public float calificacionExamen(){
        float resultado = 0;
        resultado = (this.ExamenPuntosObtenidos/ this.examen_reactivos)*100;
        return resultado;
    }
    public static void main(String args[]){
        Calificacion miCalificacion = new Calificacion();
        System.out.println(
          "Seteando examen_reactivos = " +
          miCalificacion.setExamenReactivos(7)
        );
    }
}
