
# Instalación y configuración de Netbeans 8.x

### Descargando Netbeans


## Estandarización de nuestro código:

### Instalación:

Open Netbeans and go to Tools > Plugins. Once in the plugins dialog click the tab Downloaded and click on Add Plugins...

Browse your filesystem and find the .nbm file. Once it is displayed in the list make sure it's checked. Then click Install button.

Maybe you will be prompted to restart Netbeans. 


> <https://code.google.com/p/nb-coding-standard-validator/downloads/detail?name=org-superruzafa-codingstandardvalidator-0.2.nbm&can=2&q=>

## Agregando Estilo a nuestro Netbeans:

> <http://netbeansthemes.com/>

### Funcion config - modo Get

Nos ayuda a establecer parametros de configuracion

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
            if(BD.baseBD == null) {
                return BD.baseBDDefault;
            }
            return BD.baseBD;
        }
        if (campo.equalsIgnoreCase("host")) {
            if(BD.host == null) {
                return BD.hostDefault;
            }
            return BD.host;
        }
        return campo;
    }

### Formas de usarse


    BD.config("login");
     ...
    BD.config("host");

### Funcion config - modo Set


    public static String config(String field, String valor) {
        if (field.equals("login") && BD.login == null) {
            BD.login = valor;
            return valor;
        }
        if (field.equals("password") && BD.password == null) {
            BD.password = valor;
            return BD.password;
        }
        if (field.equalsIgnoreCase("baseBD") && BD.baseBD == null) {
            BD.baseBD = valor;
            return BD.baseBD;
        }
        if (field.equalsIgnoreCase("host") && BD.host == null) {
            BD.host = valor;
            return BD.host;
        }
        System.out.println("Campo incorrecto de configuración : " + field);
        return field;
    }

### Funcion conexión


    public static Connection conexion() {
        if(BD.conexion != null) {
           try {
            String url = "jdbc:mysql://" +
                BD.config("host") +
                "/" + BD.config("baseBD");
            Class.forName("org.gjt.mm.mysql.Driver");
            BD.conexion = DriverManager.getConnection(
                url,
                BD.config("password"),
                BD.config("contraseña")
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
    

> <https://netbeans.org/kb/docs/ide/mysql.html>

### Funcion query

	public static ResultSet query(String strQuery) {
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