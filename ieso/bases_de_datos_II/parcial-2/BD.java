/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package aplicacion_bd2.core;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BD {
static {
    try {
        Class.forName("org.gjt.mm.mysql.Driver").newInstance();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

public static Connection conexion() {
    try {
        Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost/clase_bd_2","root", "");
        return conn;
    } catch (Exception e) {
       e.printStackTrace();
        return null;
    }
}

public static void cerrar(Connection conn) {
try {
conn.close();
} catch (SQLException e) {
e.printStackTrace();
}
}
}