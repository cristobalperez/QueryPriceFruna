<%-- 
    Document   : inicio
    Created on : 10-11-2018, 18:54:19
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
        <link REL="StyleSheet" HREF="css/styleload.css" TYPE="text/css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <title>JSP Page</title>
        <script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut("slow");
});
</script>
    </head>
    <body>
        <div class="loader"></div>
        <%
            HttpSession se = request.getSession();
                                     out.print("<H1>Bievenido Cliente"+se.getAttribute("nombre")+"</H1>");


        %>
            
    
        <a href="cerrarsesion.jsp">Cerrar Sesión</a>
        
    </body>
</html>
