/*
 * Administra la conexion con nuestra base de datos
 */

package aplicacion_bd2.core;

import java.sql.*;

/**
 *
 * @author fitorec
 */
public class BD {
    private static String login;
    private static final String loginDefault = "root";
    private static String password = null;
    private static final String passwordDefault = "";
    private static String baseNombre   = null;
    private static final String baseBDDefault = "clase_bd_2";
    private static String host     = null;
    private static final String hostDefault = "localhost";
    private static Connection conexion = null;
    private static String url;

    public static String config(String campo) {
        if (campo.equalsIgnoreCase("login")) {
            if(BD.login == null) {
                return BD.loginDefault;
            }
            return BD.login;
        }
        if (campo.equalsIgnoreCase("password")) {
            if(BD.password == null) {
                return BD.passwordDefault;
            }
            return BD.password;
        }
        if (campo.equalsIgnoreCase("baseBD")) {
            if(BD.baseNombre == null) {
                return BD.baseBDDefault;
            }
            return BD.baseNombre;
        }
        if (campo.equalsIgnoreCase("host")) {
            if(BD.host == null) {
                return BD.hostDefault;
            }
            return BD.host;
        }
        return campo;
    }

    public static String config(String field, String valor) {
        if (field.equals("login") && BD.login == null) {
            BD.login = valor;
            return valor;
        }
        if (field.equals("password") && BD.password == null) {
            BD.password = valor;
            return BD.password;
        }
        if (field.equalsIgnoreCase("baseBD") && BD.baseNombre == null) {
            BD.baseNombre = valor;
            return BD.baseNombre;
        }
        if (field.equalsIgnoreCase("host") && BD.host == null) {
            BD.host = valor;
            return BD.host;
        }
        System.out.println("Campo incorrecto de configuración : " + field);
        return field;
    }

    /**
     * Se conecta a la base de datos con la configuración previa
     *
     * @return BD.conexion;
     */
    public static Connection conexion() {
        if(BD.conexion == null) {
            BD.url = "jdbc:mysql://" +
                BD.config("host") +
                "/" + BD.config("baseBD");
            try {
                DriverManager.registerDriver(new org.gjt.mm.mysql.Driver());
                BD.conexion = DriverManager.getConnection(BD.url,"root", "");
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        return BD.conexion;
    }

    public static ResultSet consulta(String strQuery) {
        Connection c = BD.conexion();
        ResultSet result = null;
        if(c != null) {
            try {
                Statement stmt = c.createStatement();
                result = stmt.executeQuery( strQuery );
            } catch (SQLException e ) {
                System.out.println("Error en procesar la consulta "+ strQuery);
            }
        }
        return result;
    }

    public static void finalizar() {
    	if(BD.conexion != null ) {
	        try {
	            BD.conexion.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
    	}
    }

    public void finalize() {
    	BD.finalizar();
    }

    /**
     * Regresa un String que nos muestra el objeto BD
     * y el estado de la conexión que maneja
     */
    public static String status() {
        String out =
            "Login    : " + BD.config("login") +  "\n" +
            "Password : " + BD.config("password") +  "\n" +
            "host     : " + BD.config("host") +  "\n" +
            "Base     : " + BD.config("baseBD") +  "\n\n";
        if(BD.conexion != null ) {
            out += "Conexión abierta, url: \n" +  BD.url;
        } else {
             out += "Conexión cerrada";
        }
        return out;
    }
    public String toString() {
        return BD.status();
    }
}