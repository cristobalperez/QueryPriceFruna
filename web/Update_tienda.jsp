<%-- 
    Document   : Update_tienda
    Created on : 22-11-2018, 0:55:55
    Author     : Neo Jigoku
--%>

<%@page import="Clases.Tienda"%>
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
              String correo = request.getParameter("correo");
              String telefono = request.getParameter("telefono");
              Tienda t = new Tienda(correo,telefono, id);
              boolean res = Clases.Administrador.Modificar_tienda(t);
              if (res!=false) {
                                                  %>
                             <script language="javascript" type="text/javascript">
                    function preguntar()
                       {
                             alert("Actualización exitosa");
                            setTimeout(function(){location.href = "gestor_tienda.jsp";},0.01);
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
                            setTimeout(function(){location.href = "gestor_tienda.jsp";},0.01);
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
