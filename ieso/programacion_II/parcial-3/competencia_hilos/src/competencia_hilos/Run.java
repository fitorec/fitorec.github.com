/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package competencia_hilos;

/**
 *
 * @author fitorec
 */
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
 
/* FrameDemo.java requires no other files. */
public class Run extends JFrame{
    /**
     * Create the GUI and show it.  For thread safety,
     * this method should be invoked from the
     * event-dispatching thread.
     */
    JPanel[] paneles = new JPanel[3];
    JLabel[] etiquetas = new JLabel[3];
    String[] imgs = {"644.gif", "612.gif", "545.gif", "643.gif"};
    String[] nombres = {"644.gif", "612.gif", "545.gif", "643.gif"};
    
    public void createAndShowGUI() {
        //Create and set up the window.
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        for(int index = 0; index< 3; index++) {
            paneles[index] = new JPanel();
            this.add(paneles[index]);
            etiquetas[index] = new JLabel(nombres[index]);
            etiquetas[index].setIcon(new ImageIcon(getClass().getResource("644.gif")));
            //emptyLabel.setPreferredSize(new Dimension(175, 100));
            this.getContentPane().add(etiquetas[0], BorderLayout.EAST);
            //Display the window.
        }
        pack();
        setVisible(true);
        
    }
 
    public static void main(String[] args) {
        //Schedule a job for the event-dispatching thread:
        //creating and showing this application's GUI.
        Run run = new Run();
        run.createAndShowGUI();
    }
}
