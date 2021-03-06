package Clases;


import datos.myConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public void setRut(String rut) {
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
    //constructor registro
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
    public Persona(String nombre, String apellido, String sexo, String contraseña, String telefono, String direccion){
       this.nombre=nombre;
       this.apellido = apellido;
       this.sexo = sexo;
       this.contraseña=contraseña;
       this.telefono=telefono;
       this.direccion=direccion;
    }
    public Persona(String nombre, String apellido, String sexo, String contraseña, String telefono, String direccion, String rut){
       this.nombre=nombre;
       this.apellido = apellido;
       this.sexo = sexo;
       this.contraseña=contraseña;
       this.telefono=telefono;
       this.direccion=direccion;
       this.rut=rut;
    }
    static String query;
    static Connection con=null;
    static Statement stm = null;
    static ResultSet rst=null;
    static PreparedStatement pstam = null;
    
    public Persona(String rut, String contraseña){
        this.rut=rut;
        this.contraseña=contraseña;
    }
    public Persona(String correo){
        this.correo=correo;
    }
    public Persona(){
        
    }
 
   // fin contructor
   
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
    public void cerrarsesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession(true);
        sesion.invalidate();
        response.sendRedirect("Login.jsp");
    }
    public static Persona Datos_cliente(String rut){
            query = "SELECT * FROM persona WHERE rut=?;";
Persona cliente = null;
  try{
        con=datos.myConexion.Conexion();
       pstam= con.prepareStatement(query);
        pstam.setString(1, rut);
        rst = pstam.executeQuery();
        while(rst.next()){
             cliente = new Persona (rst.getString("rut"), rst.getString("nombre"), rst.getString("apellido"), rst.getString("sexo"),rst.getString("password"),rst.getString("correo"),rst.getString("telefono"),rst.getString("direccion"),rst.getInt("id_perfil"));
        }
  }catch (SQLException ex){
      return null;
  }
    return cliente;
    }
}

