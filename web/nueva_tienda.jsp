<%-- 
    Document   : nueva_tienda
    Created on : 15-11-2018, 12:37:34
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
                <script src="lib/jquery-1.9.0.min.js" type="text/javascript" charset="utf-8"></script>
<script src="src/jquery.maskedinput.js" type="text/javascript"></script>        
        <title>JSP Page</title>
                            <script type="text/javascript">
            jQuery(function($){
     $("#cel").mask("99999999");
});

        </script>  
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
        <% }else{ %>
        <h1>Administrador conectado: <%=sesions.getAttribute("nombre")%></h1>
                <h1>Ingresa Nueva Tienda</h1>
         <div>
         <h1>QueryPrice</h1>
        </div>
        <div>
            <form method="post" action="IngresarTienda.jsp" id="IngresarTienda-form">   
            <p>Dirección: <input name="Direccion"  placeholder="Introduzca la dirección" type="text" ></p>
            <p>Celular: +562<input name="Telefono" placeholder="Introduzca su N° de celular" type="text" id="cel"></p>
            <p>Correo: <input name="Correo" placeholder="Introduzca el correo" type="text" ></p> 
            <p><input  type="submit" value="Agregar" ></p>
        </form>
             <a href='gestor_tienda.jsp'><--Volver atrás</a><br>
            <hr>
            <a href="cerrarsesion.jsp">Cerrar</a>
        </div>
                <%}%>
    </body>
</html>
