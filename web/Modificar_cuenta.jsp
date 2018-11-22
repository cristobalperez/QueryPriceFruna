<%-- 
    Document   : Modificar_perfil
    Created on : 22-11-2018, 0:09:17
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
        <a href="Modificar_cuenta.jsp"> Modificar perfil</a>
        <a href="Cerrar_cuenta.jsp"> Cerrar cuenta</a>
        <a href="cerrarsesion.jsp">Cerrar</a>
    </body>
</html>
