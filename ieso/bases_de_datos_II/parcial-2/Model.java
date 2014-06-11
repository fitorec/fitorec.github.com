package Core;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

/**
 * Clase Abstracta Model, Modela una abstracción de la Base de datos.
 * 
 */
public abstract class Model {

    /**
     * id, contiene la index de la clave primaria 
     */
    protected int id = -1;
    
    /**
     * Campos existentes en la tabla
     */
    protected String campos[];

    /**
     * Nombre de la tabla que vamos a mapear
     */
    protected String tabla_nombre = "";

    /** The limit. */
    protected int limit = 30;
 
    //Manejo de errores
    /** The errors. */
    @SuppressWarnings("FieldMayBeFinal")
    private Vector<String> errors = new Vector<>();

    /** The error_index. */
    private int error_index = 0;

    //Datos propios de la BD
    /**
     * Instantiates a new model.
     *
     * @param table_name the table_name
     */
    public Model(String table_name) {
        this.tabla_nombre = table_name;
    }
    // Funciones para el manejo de errores
    /**
     * Append error.
     *
     * @param error the error
     */
    public void appendError(String error) {
        this.errors.add(error);
    }

    /**
     * Errors.
     *
     * @return the vector
     */
    public Vector<String> errors() {
        return this.errors;
    }

    /**
     * Next error.
     *
     * @return the string
     */
    public String nextError() {
        if ((this.error_index+1) >= this.errors.size()) {
            return null;
        }
        this.error_index++;
        return this.errors.get(this.error_index);
    }

    /**
     * Current error.
     *
     * @return the string
     */
    public String currentError() {
        if (this.error_index >= this.errors.size()) {
            return null;
        }
        return this.errors.get(this.error_index);
    }

    /**
     * Prints the errors.
     */
    public void printErrors() {
        for( int i = 0, n_errors = this.errors.size(); i<n_errors; i++) {
            System.out.println(this.errors.get(i));
        }
    }
    //funciones get
    /**
     * Gets the id.
     *
     * @return the id
     */
    public int getId() {
        return this.id;
    }

    /**
     * Sets the id.
     *
     * @param id the new id
     */
    public void setId(int id) {
        this.id = id;
    }
    //funciones limit
    /**
     * Gets the limit.
     *
     * @return the limit
     */
    public int getLimit() {
        return this.limit;
    }

    /**
     * Sets the limit.
     *
     * @param limit the new limit
     */
    public void setLimit(int limit) {
        this.limit = limit;
    }

    /**
     * Sets the un limit.
     */
    public void setUnLimit() {
        this.limit = 1000000;
    }

    /**
     * Existe.
     *
     * @param id the id
     * @return the boolean
     */
    public Boolean existe(Integer id) {
        String sql  = "SELECT id FROM "+
                this.tabla_nombre+
                " WHERE id="+ id+
                " LIMIT 1";
        try {
            ResultSet rs = BD.consulta(sql);
            return rs.first();
        } catch (SQLException e) {
            e.printStackTrace();
            this.appendError("No se pudo ejecutar existosamente la consulta \n" + sql);
            return false;
        }
    }

    /**
     * Ultima insercion.
     *
     * @return the integer
     */
    public Integer ultimaInsercion() {
        String sql  = "SELECT MAX(id) as id FROM "+this.tabla_nombre;
        try {
            ResultSet rs = BD.conexion().createStatement().executeQuery(sql);
            if( rs.first() ) {
                return rs.getInt("id");
            } else {
                this.appendError("No se pudo ejecutar existosamente la consulta \n" + sql);
                return (Integer)(-1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.appendError("No se pudo ejecutar existosamente la consulta \n" + sql);
            return (Integer)0;
        }
    }

    /**
     * Borrar.
     *
     * @param id the id
     * @return the boolean
     */
    public Boolean borrar(int id) {
        if(!this.existe(id)) {
            return false;
        }
        String sql  = "DELETE FROM "+this.tabla_nombre+" WHERE "+this.tabla_nombre+".id = " + id;
        try {
            PreparedStatement preparedStmt = BD.conexion().prepareStatement(sql);
            preparedStmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            this.appendError("No se pudo ejecutar existosamente la consulta \n" + sql);
            return false;
        }
    }

    /**
     * Borrar.
     *
     * @return the boolean
     */
    public Boolean borrar() {
        return this.borrar(this.getId());
    }

    /**
     * Read.
     *
     * @param id the id
     * @return the result set
     */
    public ResultSet read(int id) {
        String sql = "SELECT * FROM "+this.tabla_nombre+" WHERE id=" + this.getId() + " LIMIT 1";
        try {
            Statement s = BD.conexion().createStatement();
            return s.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            this.appendError("No se pudo ejecutar existosamente la consulta \n" + sql);
            return null;
        }
    }
    /* Paginación */
    /**
     * Gets the pagine ids.
     *
     * @param pagine the pagine
     * @return the pagine ids
     */
    public Vector<Integer> getPagineIds(int pagine) {
        Vector<Integer> ids = new Vector<>();
        int limit_number = 30*pagine;
        String sql = "SELECT id FROM "+this.tabla_nombre+
                     " LIMIT "+limit_number+" , 30";
        try {
            Statement s = BD.conexion().createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                ids.add(rs.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.appendError("Error en getIdsUsersPagine con \n"+pagine);
        }
        return ids;
    }

    /**
     * Gets the pagine ids.
     *
     * @return the pagine ids
     */
    public Vector<Integer> getPagineIds() {
        return this.getPagineIds(1);
    }

    /*
     * Funcion util para buscar apartir de un field
     */
    /**
     * Buscar por field.
     *
     * @param field the field
     * @param c_buscada the c_buscada
     * @return the vector
     */
    public Vector<Integer> buscarPorField(String field, String c_buscada) {
        Vector<Integer> ids = new Vector<Integer>();
        String sql = "SELECT id FROM " + this.tabla_nombre + " "+
                    "WHERE "+field+" LIKE '%"+c_buscada+"%' LIMIT "+this.limit+"";
        try {
            Statement s = BD.conexion().createStatement();
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                ids.add(rs.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.appendError("Error en BuscarPorField, consulta \n" + sql);
        }
        return ids;
    }

    /**
     * Gets the field by id.
     *
     * @param id the id
     * @param field the field
     * @return the field by id
     */
    public String getFieldById(int id, String field) {
        String sql = "SELECT "+field+" FROM " + this.tabla_nombre + " "+
                    "WHERE id = " + id;
        String result = null;
        try {
            Statement s = BD.conexion().createStatement();
            ResultSet rs = s.executeQuery(sql);
            if (rs.next()) {
                result = rs.getString(field);
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.appendError("Error en fieldById, consulta \n" + sql);
        }
        return result;
    }

    /**
     * Gets the field.
     *
     * @param field the field
     * @return the field
     */
    public String getField(String field) {
        return this.getFieldById(this.getId(), field);
    }


    /**
     * Setea una campo en la tabla dada.
     *
     * @param id del registro
     * @param field El campo a cambiar p.e. nombre
     * @param value El valor deseao por ejemplo "tasajo de res"
     * @return true, si lo pudo guardar de forma correcta
     */
    public boolean setField(int id, String field, String value) {
        String sql = "UPDATE "+ this.tabla_nombre +" SET `"+field+"` = ? WHERE `id` = ? ";
        try {
            PreparedStatement preparedStmt = BD.conexion().prepareStatement(sql);
            //Agregando datos
            preparedStmt.setString(1, value);
            preparedStmt.setInt(2, id);
            preparedStmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            this.appendError("Error al ejecutar "+ sql);
            return  false;
        }
    }

    /**
     * Sets the field.
     *
     * @param field the field
     * @param value the value
     * @return true, if successful
     */
    public boolean setField(String field, String value) {
        if (this.id>0) {
            return this.setField(this.id, field, value);
        }
        return false;
    }

    /**
     * Lista de ids.
     *
     * @param consultaSQL the consulta sql
     * @return the vector
     */
    protected Vector <Integer> listaDeIds(String consultaSQL) {
        Vector <Integer> ids = new Vector <Integer>();
        try {
            Statement s = BD.conexion().createStatement();
            ResultSet result = s.executeQuery(consultaSQL);
            while (result.next()) {
                ids.add(result.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.appendError("Error en Model.listaDeIds sobre la consulta \n"+consultaSQL);
        }
        return ids;
    }

    /**
     * Maximo.
     *
     * @param consultaSQL the consulta sql
     * @return the int
     */
    protected int maximo(String consultaSQL) {
        int maximo = 0;
        try {
            Statement s = BD.conexion().createStatement();
            ResultSet result = s.executeQuery(consultaSQL);
            while (result.next()) {
                maximo = result.getInt("maximo");
            }
        } catch (Exception e) {
            e.printStackTrace();
            this.appendError("Error en Model.listaDeIds sobre la consulta \n"+consultaSQL);
        }
        return maximo;
    }
    
    public String toString() {
        String out = "Configuracion: "
                + "tabla " + this.tabla_nombre;
        if( campos != null ) {
            out += "\n Campos:";
            for (int i=0; i<campos.length; i++) {
                out += "\n -> " + campos[i];
            }
        }
        return out;
    }

}
