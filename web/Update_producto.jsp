<%-- 
    Document   : Update_producto
    Created on : 22-11-2018, 1:44:40
    Author     : Neo Jigoku
--%>

<%@page import="Clases.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
      try {
              int id = Integer.parseInt(request.getParameter("id"));
              String descripcion = request.getParameter("descripcion");
              float precio = Float.parseFloat(request.getParameter("precio"));
              int stock = Integer.parseInt(request.getParameter("stock"));
              Producto p = new Producto(descripcion, precio, stock, id);
              boolean res = Clases.Administrador.Modificar_producto(p);
              if (res!=false) {
                                                  %>
                             <script language="javascript" type="text/javascript">
                    function preguntar()
                       {
                             alert("Actualización exitosa");
                            setTimeout(function(){location.href = "gestor_producto.jsp";},0.01);
                           } 
                     document.writeln(preguntar());
                </script>
                            <% 
                  }else{
   %>
                             <script language="javascript" type="text/javascript">
                    function preguntar()
                       {
                                     alert("No se pudo completar la actualización con éxito");
                            setTimeout(function(){location.href = "gestor_producto.jsp";},0.01);
                           } 
                     document.writeln(preguntar());
                </script>
                            <% 



}
          } catch (Exception e) {
          }
      
      %>
    </body>
</html>
