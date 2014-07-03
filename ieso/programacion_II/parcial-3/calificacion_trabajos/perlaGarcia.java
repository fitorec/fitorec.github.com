/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * 
 */
public class
Calificacion {
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
    
    public float CalificacionExam(){
        float resultado = 0;
        resultado = (
                (float)this.examen_puntos_obtenidos 
                / (float)this.examen_reactivos
                ) * 100;
        return resultado;           
    }
    
    
    
    
    public static void main (String args [])
 {
    Calificacion miCalificacion = new Calificacion();
 //
    miCalificacion .setExamenpuntosObtenidos(6);
    
    
      System.out.println("Seteando examen es="+ 
              miCalificacion.CalificacionExamen()
              +" "
     );
 }
}

