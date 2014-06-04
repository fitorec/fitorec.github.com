/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
     * Constructor
     * @return BD.conexion;
     */
    public static Connection conexion() {
        if(BD.conexion == null) {
            String url = "jdbc:mysql://" +
                BD.config("host") +
                "/" + BD.config("baseBD");
            System.out.println("Conexiion" + url);
            System.out.println("Login : " + BD.config("login"));
            System.out.println("Password : " + BD.config("password"));
           try {
            Class.forName("org.gjt.mm.mysql.Driver");
            BD.conexion = DriverManager.getConnection(
                url,
                BD.config("login"),
                BD.config("password")
           );
            } catch(SQLException ex) {
                ex.getStackTrace();
            }
            catch(ClassNotFoundException ex) {
                System.out.println(ex);
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
}