package Clases;


import datos.Sesion;
import datos.myConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

 
public class Persona {
// inicio get y set atributos

    /**
     * @return the Perfil
     */
    public int getPerfil() {
        return Perfil;
    }

    /**
     * @param Perfil the Perfil to set
     */
    public void setPerfil(int Perfil) {
        this.Perfil = Perfil;
    }

    /**
     * @return the Perfil
     */
    /**
     * @return the rut
     */
    public String getRut() {
        return rut;
    }

    /**
     * @param rut the rut to set
     */
    public void setRut(String rut) throws Exception {
        this.rut = rut;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * @return the sexo
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * @param sexo the sexo to set
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    /**
     * @return the contraseña
     */
    public String getContraseña() {
        return contraseña;
    }

    /**
     * @param contraseña the contraseña to set
     */
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the telefono
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * @return the direccion
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * @param direccion the direccion to set
     */
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    //fin get y set atributos
    //inicio atributos
    private String rut;
    private String nombre;
    private String apellido;
    private String sexo;
    private String contraseña;
    private String correo;
    private String telefono;
    private String direccion;
    private int Perfil;
    //fin atributos
    // inicio contructor
    public Persona(String rut,String nombre, String apellido, String sexo, String contraseña, String correo, String telefono, String direccion, int Perfil){
       this.rut=rut;
       this.nombre=nombre;
       this.apellido = apellido;
       this.sexo = sexo;
       this.contraseña=contraseña;
       this.correo=correo;
       this.telefono=telefono;
       this.direccion=direccion;
      this.Perfil=Perfil;
    }
    static String query;
    static Connection con=null;
    static Statement stm = null;
    static ResultSet rst=null;
    static PreparedStatement pstam = null;
   // fin contructor
    public Persona(String rut, String contraseña){
        this.rut=rut;
        this.contraseña=contraseña;
    }
   
    //metodos
            public static boolean Registrar(Persona p){
boolean respuesta=false;
       query= "INSERT INTO persona values (?,?,?,?,?,?,?,?,?)";
          
        try {
      con=myConexion.Conexion();
           pstam= con.prepareStatement(query);
            pstam.setString(1, p.getRut());
            pstam.setString(2, p.getNombre());
            pstam.setString(3, p.getApellido());
            pstam.setString(4, p.getSexo());
            pstam.setString(5, p.getContraseña());
            pstam.setString(6, p.getCorreo());
            pstam.setString(7, p.getTelefono());
            pstam.setString(8, p.getDireccion());
            pstam.setInt(9, p.getPerfil());
           
            pstam.executeUpdate();
           respuesta=true;
            con.close();
            pstam.close();
        } catch (SQLException e) {
           respuesta=false;
        }
return respuesta;
}
            
            public static boolean  iniciar_sesion(Persona p){
                boolean encontrado=false;
                 query= "SELECT nombre,id_perfil FROM persona WHERE rut=? AND password=?;" ;        
                try {
                    con=myConexion.Conexion();
                    pstam=con.prepareStatement(query);
                                pstam.setString(1, p.getRut());
            pstam.setString(2, p.getContraseña());
                    rst=pstam.executeQuery();
                    if(rst.next()){
                        p.setNombre(rst.getString("nombre"));
                        p.setPerfil(rst.getInt("id_perfil"));
                        encontrado=true;
                    }else{
                        encontrado=false;
                    }
                } catch (Exception e) {
                }
               return encontrado;
            }

}

