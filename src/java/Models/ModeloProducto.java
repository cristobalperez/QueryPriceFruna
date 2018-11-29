/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Clases.Articulo;
import Clases.Producto;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Neo Jigoku
 */
public class ModeloProducto {
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
      public static Producto Get_One_Producto(int id) throws SQLException {
    query = "SELECT * FROM producto where id=?;";
Producto producto = null;
  try{
        con=datos.myConexion.Conexion();
       pstam= con.prepareStatement(query);
        pstam.setInt(1, id);
        rst = pstam.executeQuery();
        while(rst.next()){
             producto = new Producto(rst.getInt("id"), rst.getString("nombre"), rst.getString("descripcion"), rst.getFloat("precio"),rst.getInt("stock"));
        }
  }catch (SQLException ex){
      return null;
  }
    return producto;
}
      public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int idproducto = Integer.parseInt(request.getParameter("idproducto"));
        
        HttpSession sesion = request.getSession(true);
        ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? new ArrayList<>() : (ArrayList) sesion.getAttribute("carrito");
        
        boolean flag = false;        
        if(articulos.size() > 0){
            for(Articulo a : articulos){
                if(idproducto == a.getIdProducto()){
                    a.setCantidad(a.getCantidad() + cantidad);
                    flag = true;
                    break;
                }
            }
        }
        if(!flag){
            articulos.add(new Articulo(idproducto, cantidad));
        }
        
        sesion.setAttribute("carrito", articulos);  
        
        response.sendRedirect("carrito.jsp");
    }
    
}
