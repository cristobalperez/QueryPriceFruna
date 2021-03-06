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

/**
 *
 * @author Neo Jigoku
 */
public class Administrador{

    /**
     * @return the id_admin
     */
        static String query;
    static Connection con=null;
    static Statement stm = null;
    static ResultSet rst=null;
    static PreparedStatement pstam = null;
    // Clase tienda
public static boolean Agregar_tienda(Tienda t){
    
boolean respuesta=false;
       query = "INSERT INTO tienda (direccion, correo, telefono)VALUES (?,?,?);";
          
        try {
      con = datos.myConexion.Conexion();
           pstam = con.prepareStatement(query);
            pstam.setString(1, t.getDireccion());
            pstam.setString(2, t.getCorreo());
            pstam.setString(3, t.getTelefono());
            pstam.executeUpdate();
           respuesta = true;
            con.close();
            pstam.close();
        } catch (SQLException e) {
           respuesta = false;
        }
return respuesta;
}
public static boolean Modificar_tienda(Tienda t){
    
boolean respuesta=false;
       query = "UPDATE tienda SET correo=?, telefono=? WHERE id=?;";
          
        try {
      con = datos.myConexion.Conexion();
           pstam = con.prepareStatement(query);
            pstam.setString(1, t.getCorreo());
            pstam.setString(2, t.getTelefono());
            pstam.setInt(3, t.getId());
            pstam.executeUpdate();
           respuesta = true;
            con.close();
            pstam.close();
        } catch (SQLException e) {
           respuesta = false;
        }
return respuesta;
}
public static boolean Eliminar_tienda(Tienda t) throws SQLException{
    query="DELETE FROM tienda WHERE id=?;";
    boolean respuesta=false;
    try {
    con=datos.myConexion.Conexion();
    pstam=con.prepareStatement(query);
    pstam.setInt(1, t.getId());
    pstam.executeUpdate();
    respuesta = true;        
    con.close();
    pstam.close();
    } catch (Exception e) {
        return respuesta;
    }
    return respuesta;
}

// Fin Clase Tienda
//Clase Producto
public static boolean Agregar_producto(Producto p){
 boolean respuesta=false;
       query = "INSERT INTO producto (nombre, descripcion, precio, stock) VALUES (?,?,?,?);";
        try {
      con = datos.myConexion.Conexion();
           pstam = con.prepareStatement(query);
            pstam.setString(1, p.getNombre());
            pstam.setString(2, p.getDescripcion());
            pstam.setFloat(3, p.getPrecio());
            pstam.setInt(4, p.getStock());
            pstam.executeUpdate();
           respuesta = true;
            con.close();
            pstam.close();
        } catch (SQLException e) {
           respuesta = false;
        }
return respuesta;   
}
public static boolean Modificar_producto(Producto p){
    boolean respuesta=false;
       query = "UPDATE producto SET descripcion=?, precio=?, stock=? WHERE id=?;";
          
        try {
      con = datos.myConexion.Conexion();
           pstam = con.prepareStatement(query);
            pstam.setString(1, p.getDescripcion());
            pstam.setFloat(2, p.getPrecio());
            pstam.setInt(3, p.getStock());
            pstam.setInt(4, p.getId());
            pstam.executeUpdate();
           respuesta = true;
            con.close();
            pstam.close();
        } catch (SQLException e) {
           respuesta = false;
        }
return respuesta;
    
}
public static boolean Eliminar_producto(int id){
      query="DELETE FROM producto WHERE id=?;";
    boolean respuesta=false;
    try {
    con=datos.myConexion.Conexion();
    pstam=con.prepareStatement(query);
    pstam.setInt(1, id);
    pstam.executeUpdate();
    respuesta = true;        
    con.close();
    pstam.close();
    } catch (Exception e) {
        return respuesta;
    }
    return respuesta; 
}
public static boolean modificar_datos_admin(Persona p){
    boolean respuesta=false;
       query= "UPDATE persona SET nombre=?, apellido=?, sexo=?, password=?, telefono=?, direccion=? where rut=?;";
        try {
      con=myConexion.Conexion();
           pstam= con.prepareStatement(query);
  
            pstam.setString(1, p.getNombre());
            pstam.setString(2, p.getApellido());
            pstam.setString(3, p.getSexo());
            pstam.setString(4, p.getContraseña());
            pstam.setString(5, p.getTelefono());
            pstam.setString(6, p.getDireccion());
            pstam.setString(7, p.getRut());
            pstam.executeUpdate();
           respuesta=true;
            con.close();
            pstam.close();
        } catch (SQLException e) {
           respuesta=false;
        }
return respuesta;
}
public static boolean Verificar_correo_admin(Persona p){
                    boolean encontrado=false;
                 query= "SELECT rut FROM persona WHERE correo=?;" ;        
                try {
                    con=myConexion.Conexion();
                    pstam=con.prepareStatement(query);
                    pstam.setString(1, p.getRut());
                    pstam.setString(2, p.getCorreo());
                    rst=pstam.executeQuery();
                    if(rst.next()){
                        if(p.getRut().equals(rst.getString("rut"))){
                        encontrado=false;
                        }else{
                        encontrado=true;
                        }
                    }else{
                        encontrado=false;
                    }
                } catch (Exception e) {
                }
               return encontrado;
  
}
}
