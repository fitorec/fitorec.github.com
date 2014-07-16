/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package competencia_hilos;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author fitorec
 */
public class Competidor extends Thread implements competidorPlantilla {
    private int porcentajeAvanzado = 0;
    private int fin = 80;

    //@SuppressWarnings("CallToThreadYield")
    public void run() {
        this.porcentajeAvanzado = Math.round((this.porcentajeAvanzado / 100) * this.fin);
        if (this.porcentajeAvanzado >= 100) {
            return;
        }
        this.porcentajeAvanzado++;
        try {
            sleep(200);
        } catch (InterruptedException ex) {
            Logger.getLogger(Competidor.class.getName()).log(Level.SEVERE, null, ex);
        }
        yield();
    }

    public String nombre(String str) {
        String $result = str;
        return $result;
    }
    
    public String posicion() {
        String result = null;
        return result;
    }
}
