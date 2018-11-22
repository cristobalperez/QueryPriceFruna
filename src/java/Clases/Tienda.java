/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import datos.myConexion;
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
public class Tienda {

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
    private int id;
    private String direccion;
    private String telefono;
    private String correo;
    //Bobs
    //insert
    public Tienda (String direccion, String telefono, String correo){
       this.direccion = direccion;
       this.telefono = telefono;
       this.correo = correo;
    }
    //verifica
    public Tienda (String direccion){
       this.direccion = direccion;
    }
    //delete
    public Tienda (int id){
       this.id=id;
    }
    //select
    public Tienda (int id, String direccion, String correo, String telefono){
        this.id=id;
        this.direccion=direccion;
        this.correo=correo;
        this.telefono=telefono;
    }
    //update
    public Tienda (String correo, String telefono, int id){
        this.correo=correo;
        this.telefono=telefono;
        this.id=id;
    }
    //Fin Bobs
    static String query;
    static Connection con=null;
    static Statement stm = null;
    static ResultSet rst=null;
    static PreparedStatement pstam = null;
    

public static boolean Verificar_tienda(Tienda t){
                    boolean encontrado=false;
                 query= "SELECT * FROM tienda WHERE direccion=?;" ;        
                try {
                    con=myConexion.Conexion();
                    pstam=con.prepareStatement(query);
                    pstam.setString(1, t.getDireccion());
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
public static List<Tienda> Get_All_Tienda() throws SQLException {
    query = "SELECT * FROM tienda;";
  List<Tienda> tiendas  = new ArrayList<Tienda>();
  try{
        con=datos.myConexion.Conexion();
        stm= con.createStatement();
        rst = stm.executeQuery(query);
        while(rst.next()){
            Tienda t = new Tienda(rst.getInt("id"), rst.getString("direccion"), rst.getString("correo"), rst.getString("telefono"));
            tiendas.add(t);
        }
  }catch (SQLException ex){
      return null;
  }
    return tiendas;
}
public static List<Tienda> Get_One_Tienda( Tienda ti) throws SQLException {
    query = "SELECT * FROM tienda WHERE id=?;";
  List<Tienda> tiendas  = new ArrayList<Tienda>();
  try{
        con=datos.myConexion.Conexion();
        pstam= con.prepareStatement(query);
        pstam.setInt(1, ti.getId());
        rst = pstam.executeQuery();
        while(rst.next()){
            Tienda t = new Tienda(rst.getInt("id"), rst.getString("direccion"), rst.getString("correo"), rst.getString("telefono"));
            tiendas.add(t);
        }
  }catch (SQLException ex){
      return null;
  }
    return tiendas;
}
}
