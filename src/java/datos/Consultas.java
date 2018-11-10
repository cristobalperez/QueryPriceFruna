/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;


import Clases.Persona;
import Clases.usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/**
 *
 * @author Neo Jigoku
 */
public class Consultas {
    static String query;
    static Connection con=null;
    static Statement stm = null;
    static ResultSet rst=null;
    static PreparedStatement pstam = null;
   
    
            public static boolean ingresar_datos(Persona p){
boolean respuesta=false;
/*  query=("INSERT INTO persona VALUES ('"+p.getRut()+"','"+p.getNombre()+"','"+p.getApellido()+"','"+p.getSexo()+"','"
              +p.getContraseña()+"','"+p.getCorreo()+"','"+p.getTelefono()+"','"+p.getDireccion()+"'," +p.getPerfil()+");");*/
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
        } catch (SQLException e) {
           respuesta=false;
        }
return respuesta;
}
}
