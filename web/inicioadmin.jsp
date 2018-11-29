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
              <% HttpSession sesions = request.getSession();
                    if(sesions.getAttribute("nombre")==null&&sesions.getAttribute("rut")==null){
         out.println("<h1>Acceso denegado</h1>");%>
         <a href="Login.jsp">Volver al inicio</a>
        <% }else{
out.print("<H1>Bievenido administrador "+sesions.getAttribute("nombre")+"</H1>");
        %>
    <center><h1>Menú Administrador</h1></center>
    
        <a href="gestor_tienda.jsp"> Gestionar tienda</a>
        <hr>
        <a href="gestor_producto.jsp"> Gestionar producto</a>
        <hr>
        <a href="Modificar_datos_admin.jsp?rut=<%=sesions.getAttribute("rut")%>"> Modificar perfil</a>
        <hr>
        <a href="cerrarsesion.jsp">Cerrar sesión</a>
        <%}%>
    </body>
</html>
