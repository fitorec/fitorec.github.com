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


## Netbeans y MySQL

	public Conexion() {
        if(Conexion.conexion != null) {
           try {
            String url = "jdbc:mysql://localhost/carniceria";
            Class.forName("org.gjt.mm.mysql.Driver");
            Conexion.conexion = DriverManager.getConnection(url, "password", "contraseña");
            if (Conexion.conexion != null)
            {
            System.out.println("Conexión a base de datos "+url+" ... Ok");
            }
            }
            catch(SQLException ex) {
                ex.getStackTrace();
                //System.out.println("Hubo un problema al intentar conectarse con la base de datos "+url);
            }
            catch(ClassNotFoundException ex) {
                System.out.println(ex);
            }
        }
    }
> <https://netbeans.org/kb/docs/ide/mysql.html>

### Clases necesarias:


 - <http://fragowb.wordpress.com/2008/05/01/conectar-java-con-mysql-en-netbeans/>

## Silk4J