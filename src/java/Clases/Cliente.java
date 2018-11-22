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
import java.sql.Statement;
import java.sql.SQLException;

/**
 *
 * @author Neo Jigoku
 */
public class Cliente{

        static String query;
    static Connection con=null;
    static Statement stm = null;
    static ResultSet rst=null;
    static PreparedStatement pstam = null;

public static boolean Verificar_cliente(Persona p){
                    boolean encontrado=false;
                 query= "SELECT rut FROM persona WHERE rut=? OR correo=?;" ;        
                try {
                    con=myConexion.Conexion();
                    pstam=con.prepareStatement(query);
                    pstam.setString(1, p.getRut());
                    pstam.setString(2, p.getCorreo());
                    rst=pstam.executeQuery();
                    if(rst.next()){
                        encontrado=true;
                    }else{
                        encontrado=false;
                    }
                } catch (Exception e) {
                }
               return encontrado;
  
}
            public static boolean modificar_datos_personales(Persona p){
boolean respuesta=false;
       query= "UPDATE persona SET nombre=?, apellido=?, sexo=?, password=?, telefono=?, direccion=?;";
        try {
      con=myConexion.Conexion();
           pstam= con.prepareStatement(query);
  
            pstam.setString(1, p.getNombre());
            pstam.setString(2, p.getApellido());
            pstam.setString(3, p.getSexo());
            pstam.setString(4, p.getContraseña());
            pstam.setString(5, p.getTelefono());
            pstam.setString(6, p.getDireccion());
            pstam.executeUpdate();
           respuesta=true;
            con.close();
            pstam.close();
        } catch (SQLException e) {
           respuesta=false;
        }
return respuesta;
}
}
