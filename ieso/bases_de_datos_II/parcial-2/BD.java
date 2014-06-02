/*
 * @Author: fitorec

 */

package aplicacion_bd2.core;

import java.sql.ResultSet;
import org.junit.After;
import org.junit.Test;
//import static org.junit.Assert.*;

/**
 *
 * @author fitorec
 */
public class BDTest {
    @After
    public void tearDown() {
        BD.finalizar();
    }

    /**
     * Probando el metodo consulta.
     */
    @Test
    public void consultaTest() {
        ResultSet result = BD.consulta("SELECT * FROM alumnos WHERE 1");
    }

}
