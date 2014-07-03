/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Juls.Meltol
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
//
public int setExamenPuntosObtenidos(int puntos_obtenidos){
   this.examen_puntos_obtenidos = puntos_obtenidos;
   return this.getExamenPuntosObtenidos();
}
public int setExamenReactivos(int examen_reactivos){
   this.examen_reactivos = examen_reactivos;
   return this.getExamenReactivos();
  
}
/*devuelve el resultaod de la calificaicon del examen en un tanto porsentuak [0-100]
*
*
*@return resultado el valor del examen .
*/
    
    public float calificacionExam(){
        float resultado = 0;
        resultado = (this.examen_puntos_obtenidos / this.examen_reactivos) * 100;
        return resultado;           
    }
    
    
    
    
    public static void main (String args [])
 {
     Calificacion miCalificacion = new Calificacion();
      System.out.println("Seteando examen_reactivos"+miCalificacion.setExamenReactivos(7)
     );
 }
}
