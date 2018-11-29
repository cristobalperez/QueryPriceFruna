<%-- 
    Document   : Eliminar_producto
    Created on : 21-11-2018, 23:35:13
    Author     : Neo Jigoku
--%>

<%@page import="Clases.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
response.setHeader( "Pragma", "no-cache" );
response.addHeader( "Cache-Control", "must-revalidate" );
response.addHeader( "Cache-Control", "no-cache" );
response.addHeader( "Cache-Control", "no-store" );
response.setDateHeader("Expires", 0);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
    int id= Integer.parseInt(request.getParameter("id"));
    boolean res= Clases.Administrador.Eliminar_producto(id);
    if (res!=false){
                                                 %>
                             <script language="javascript" type="text/javascript">
                    function preguntar()
                       {
                             alert("Producto eliminado con éxito");
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
                             alert("No se pudo completar la acción con éxito");
                            setTimeout(function(){location.href = "gestor_producto.jsp";},0.01);
                           } 
                     document.writeln(preguntar());
                </script>
                            <% 
        
    }
    
    
%>
    </body>
</html>
