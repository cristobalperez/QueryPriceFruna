<%-- 
    Document   : inicio
    Created on : 10-11-2018, 18:54:19
    Author     : Neo Jigoku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession se = request.getSession();
                                     out.print("<H1>Bievenido "+se.getAttribute("nombre")+"</H1>");


        %>
        <a href="cerrarsesion.jsp">Cerrar Sesión</a>
    </body>
</html>
