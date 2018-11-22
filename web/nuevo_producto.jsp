<%-- 
    Document   : nuevo_producto
    Created on : 21-11-2018, 21:29:57
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
        <% }else{%>
        <h1>Administrador conectado: <%=sesions.getAttribute("nombre")%></h1>
                  <h1>Ingresa Nuevo Producto</h1>
         <div>
         <h1>QueryPrice</h1>
        </div>
        <div>
            <form method="post" action="IngresarProducto.jsp" id="register-form">   
            <p>Nombre: <input name="nombre"  placeholder="Introduzca nombre producto" type="text" ></p>
            <p>Descripción: <br><textarea name="descripcion" cols="40" rows="5" id="desc"></textarea></p>
            <p>Precio: <input name="precio" placeholder="Introduzca el precio" type="text" ></p> 
            <p>Stock: <input name="stock" placeholder="Introduzca el stock" type="text" ></p> 
            <p><input  type="submit" value="Agregar" onclick="validar_longitud(e)"></p>
        </form>
            <a href='gestor_producto.jsp'><--Volver atrás</a><br>
            <hr>
       <a href="cerrarsesion.jsp">Cerrar Sesión</a>
        </div>
                  <script type="text/javascript">
                      function validar_longitud(e){
                                var caract_longitud = 10;
      var caract_longitudmax = 100;
      var desc = $('#register-form #desc').val();
      if (desc.length < caract_longitud) {
        alert('La descripción debe constar de ' + caract_longitud + ' carácteres.');
        //document.registro
        e.preventDefault();
        return false;
      }
      if(desc.length > caract_longitudmax){
                  alert('La descripción es demasiado larga, debe constar con a lo más'+caract_longitudmax);
        //document.registro
        e.preventDefault();
        return false;
      }
                      }
                  </script>
                    <%}%>
    </body>
</html>
