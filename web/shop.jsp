<%-- 
    Document   : shop
    Created on : 22-11-2018, 17:07:30
    Author     : Neo Jigoku
--%>

<%@page import="java.util.List"%>
<%@page import="Clases.Producto"%>
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
        <% }else{%>
        <h1>Cliente conectado: <%=sesions.getAttribute("nombre")%></h1>
        <hr>
        <h1>Selección de producto</h1>
        <hr>
    <center>
  <table border="1">
            <thead>
            <th>Producto</th>
            <th>Descripción</th>
            <th>Precio</th>
            <th>Stock</th>
            </thead>
            <tbody>     
        <%
        List<Producto> productos = Models.ModeloProducto.Get_All_Producto(); 
           for(int i=0;i<productos.size();i++){%>
       <tr>
           <td><%=productos.get(i).getNombre()%></td>
           <td><%=productos.get(i).getDescripcion()%></td>
           <td>$<%=productos.get(i).getPrecio()%></td>
           <td><%=productos.get(i).getStock()%> unidades</td>
           <td><a href="Detalle_producto.jsp?id=<%=productos.get(i).getId()%>">Ver detalles</a></td>
       </tr>
       <%
       }
       %>
        </table>
    </center>
        <hr>
        <a href='iniciocliente.jsp'><--Volver atrás</a>
        <a href="cerrarsesion.jsp">Cerrar Sesión</a>
            <%}%>
    </body>
</html>
