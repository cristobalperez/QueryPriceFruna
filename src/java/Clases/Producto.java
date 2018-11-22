/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Neo Jigoku
 */
public class Producto {

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
     * @return the stock
     */
    public int getStock() {
        return stock;
    }
    /**
     * @param stock the stock to set
     */
    public void setStock(int stock) {
        this.stock = stock;
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
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }
    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the imagen
     */
    public String getImagen() {
        return imagen;
    }
    /**
     * @param imagen the imagen to set
     */
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    /**
     * @return the precio
     */
    public float getPrecio() {
        return precio;
    }
    /**
     * @param precio the precio to set
     */
    public void setPrecio(float precio) {
        this.precio = precio;
    }
    private int stock;
    private String nombre;
    private String descripcion;
    private String imagen;
    private float precio;
    private int id;
    //Bobs
    public Producto(String nombre, String descripcion, float precio, int stock){
        this.nombre=nombre;
        this.descripcion=descripcion;
        this.precio= precio;
        this.stock=stock;
    }
    public Producto(int id){
    this.id=id;
    }
    public Producto(String nombre){
    this.nombre=nombre;
    }
      public Producto(int id,String nombre, String descripcion, float precio, int stock){
          this.id=id;
        this.nombre=nombre;
        this.descripcion=descripcion;
        this.precio= precio;
        this.stock=stock;
    }
      public Producto(String descripcion, float precio, int stock, int id){
        this.descripcion=descripcion;
        this.precio= precio;
        this.stock=stock;
          this.id=id;
    }
      //Fin Bobs
         static String query;
    static Connection con=null;
    static Statement stm = null;
    static ResultSet rst=null;
    static PreparedStatement pstam = null;
      //Métodos
      public static boolean Verificar_producto(Producto p){
                              boolean encontrado=false;
                 query= "SELECT * FROM producto WHERE nombre=?;" ;        
                try {
                    con=datos.myConexion.Conexion();
                    pstam=con.prepareStatement(query);
                    pstam.setString(1, p.getNombre());
                    rst=pstam.executeQuery();
                    if(rst.next()){
                        encontrado=true;
                    }else{
                        return encontrado;
                    }
                } catch (Exception e) {
               return encontrado;
                }
               return encontrado;
      }
      public static List<Producto> Get_All_Producto() throws SQLException {
    query = "SELECT * FROM producto;";
  List<Producto> productos  = new ArrayList<Producto>();
  try{
        con=datos.myConexion.Conexion();
        stm= con.createStatement();
        rst = stm.executeQuery(query);
        while(rst.next()){
            Producto p = new Producto(rst.getInt("id"), rst.getString("nombre"), rst.getString("descripcion"), rst.getFloat("precio"),rst.getInt("stock"));
            productos.add(p);
        }
  }catch (SQLException ex){
      return null;
  }
    return productos;
}
      public static List<Producto> Get_One_Producto(Producto pr) throws SQLException {
    query = "SELECT * FROM producto where id=?;";
  List<Producto> productos  = new ArrayList<Producto>();
  try{
        con=datos.myConexion.Conexion();
       pstam= con.prepareStatement(query);
        pstam.setInt(1, pr.getId());
        rst = pstam.executeQuery();
        while(rst.next()){
            Producto p = new Producto(rst.getInt("id"), rst.getString("nombre"), rst.getString("descripcion"), rst.getFloat("precio"),rst.getInt("stock"));
            productos.add(p);
        }
  }catch (SQLException ex){
      return null;
  }
    return productos;
}
}
