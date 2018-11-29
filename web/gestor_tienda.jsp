<%-- 
    Document   : gestor_tienda
    Created on : 20-11-2018, 15:10:31
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
        <title>Gestor de Tiendas</title>

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
        <hr>
        <h1>Gestión de tienda</h1>
        <hr>
    <center>
  <table border="1">
            
            <thead>
            <th>Dirección</th>
            <th>Correo</th>
            <th>Teléfono</th>
            </thead>
            <tbody>     
        <%
 
        List<Tienda> tiendas = Clases.Tienda.Get_All_Tienda(); 
           for(int i=0;i<tiendas.size();i++){%>
       <tr>
           <td><%=tiendas.get(i).getDireccion()%></td>
           <td><%=tiendas.get(i).getCorreo()%></td>
           <td><%=tiendas.get(i).getTelefono()%></td>

           <td><a href="Modificar_tienda.jsp?id=<%=tiendas.get(i).getId()%>">Editar</a></td>
           <td><a href="Eliminar_tienda.jsp?id=<%=tiendas.get(i).getId()%>">Eliminar</a></td>
               
       </tr>
       <%
       }
       %>
        </table>
    </center>
        <a href="nueva_tienda.jsp"> Ingresar nueva tienda</a>
        <hr>
        <a href="inicioadmin.jsp"> <-- volver atrás</a>
        <%}%>
    </body>
</html>
