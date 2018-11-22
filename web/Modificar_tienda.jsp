<%-- 
    Document   : modificar_tienda
    Created on : 21-11-2018, 16:22:44
    Author     : Neo Jigoku
--%>


<%@page import="java.util.List"%>
<%@page import="Clases.Tienda"%>
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
        <% }else{
        int id = Integer.parseInt(request.getParameter("id"));
Tienda ti = new Tienda(id);
        List<Tienda> tiendas = Clases.Tienda.Get_One_Tienda(ti);
         for(int i=0;i<tiendas.size();i++){
        %>
        <h1>Administrador conectado: <%=sesions.getAttribute("nombre")%></h1>
         <form action="Update_tienda.jsp" method="post">
     <table>
         <tbody>
                <tr>
                    <td><input type="text" name="id" readonly value="<%=tiendas.get(i).getId()%>" readonly hidden></td>
                </tr>
                <tr>
                    <td> Dirección:</td> <td><input type="text" name="direccion" readonly value="<%=tiendas.get(i).getDireccion()%>" required></td>
                </tr>
                <tr>
                    <td> Correo:</td> <td><input type="text" name="correo" value="<%=tiendas.get(i).getCorreo()%>" required></td> <br>
                </tr><tr>
                <td> Teléfono:</td>  <td>+562<input type="text" name="telefono" value="<%=tiendas.get(i).getTelefono()%>" id="cel" required></td> 
                </tr><tr>
                <tr><td></td>
                    <td><input type="submit" value="Actualizar"/></td>
                </tr>
        
     </tbody>
     </table>
        </form>
         <%}%>
     
     <a href="gestor_tienda.jsp"><--Volver atrás</a><br>
     <hr>
<a href="cerrarsesion.jsp">Cerrar Sesión</a>
     <%}%>
    </body>
</html>
