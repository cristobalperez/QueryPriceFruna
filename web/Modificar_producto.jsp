<%-- 
    Document   : Modificar_producto
    Created on : 22-11-2018, 1:27:01
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
        <% }else{
  
     int id = Integer.parseInt(request.getParameter("id"));

        Producto producto = Models.ModeloProducto.Get_One_Producto(id);
       
        %>
        <h1>Administrador conectado: <%=sesions.getAttribute("nombre")%></h1>
        <hr>
                  <h1>Actualizar Producto</h1>
        <hr>
         <div>
         <h1>QueryPrice</h1>
        </div>
        <div>
            <form method="post" action="Update_producto.jsp" id="register-form">   
                <p><input name="id" type="text" value="<%=producto.getId()%>" hidden></p>
            <p>Nombre: <input name="nombre"  placeholder="Introduzca nombre producto" readonly type="text"value="<%=producto.getNombre()%>" ></p>
            <p>Descripción: <br><textarea name="descripcion" cols="40" rows="5" id="desc" > <%=producto.getDescripcion()%></textarea></p>
            <p>Precio: <input name="precio" placeholder="Introduzca el precio" type="text" value="<%=producto.getPrecio()%>"></p> 
            <p>Stock: <input name="stock" placeholder="Introduzca el stock" type="text" value="<%=producto.getStock()%>"></p> 
            <p><input  type="submit" value="Actualizar" onclick="validar_longitud(e)"></p>
        </form>
            <a href='gestor_producto.jsp'><--Volver atrás</a><br>
            <hr>
       <a href="cerrarsesion.jsp">Cerrar Sesión</a>
        </div>
            <%
                }
            %>
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
    </body>
    </body>
</html>
