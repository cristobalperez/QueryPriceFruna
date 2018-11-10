<%-- 
    Document   : cerrarsesion
    Created on : 10-11-2018, 19:19:00
    Author     : Neo Jigoku
--%>

<%@page import="Clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
            <%
            Persona p = new Persona();
            p.cerrarsesion(request, response);
            %>
            <h1>Sesión cerrada</h1> <a href="Login.jsp">Volver al login</a>
    </body>
</html>
