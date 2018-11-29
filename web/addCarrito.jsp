<%-- 
    Document   : addCarrito
    Created on : 22-11-2018, 18:58:33
    Author     : Neo Jigoku
--%>

<%@page import="Models.ModeloProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
      ModeloProducto mp = new ModeloProducto();
      mp.processRequest(request, response);
      %>
    </body>
</html>
