<%-- 
    Document   : inicioadmin
    Created on : 13-11-2018, 12:04:13
    Author     : Neo Jigoku
--%>

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
        <a href="gestor_tienda.jsp"> Gestionar tienda</a>
        <a href="gestor_producto.jsp"> Gestionar producto</a>
        <a href="Modificar_cuenta.jsp"> Modificar perfil</a>
        <a href="cerrarsesion.jsp">Cerrar</a>
    </body>
</html>
