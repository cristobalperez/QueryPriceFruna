/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author Neo Jigoku
 */
public class usuarios {

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

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
    private int id;
        private String rut;
    private String nombre;
    private String apellido;
    private String sexo;
    private String contraseña;
    private String correo;
    private String telefono;
    private String direccion;
      public usuarios(String rut,String nombre, String apellido, String sexo, String contraseña, String correo, String telefono, String direccion){
       this.rut=rut;
       this.nombre=nombre;
       this.apellido = apellido;
       this.sexo = sexo;
       this.contraseña=contraseña;
       this.correo=correo;
       this.telefono=telefono;
       this.direccion=direccion;
      
    }
      
        public usuarios(int id,String rut,String nombre, String apellido, String sexo, String contraseña, String correo, String telefono, String direccion){
       this.id=id;
            this.rut=rut;
       this.nombre=nombre;
       this.apellido = apellido;
       this.sexo = sexo;
       this.contraseña=contraseña;
       this.correo=correo;
       this.telefono=telefono;
       this.direccion=direccion;
      
    }
}
