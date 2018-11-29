<%-- 
    Document   : Detalle_producto
    Created on : 22-11-2018, 17:03:14
    Author     : Neo Jigoku
--%>

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

        Producto producto = Models.ModeloProducto.Get_One_Producto(id);
        %>
        <div class="product-details"><!--product-details-->
            <center><h1>Detalle producto</h1></center>
            <hr>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
                                                            <table border="1">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Producto</th>
                                                                        <th>Código</th>
                                                                        <th>Precio</th>
                                                                        <th>Cantidad</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <th><%= producto.getNombre()%></th>
                                                                        <th>Web ID: <%= producto.getId()%></th>
                                                                <form action="addCarrito.jsp" method="post">
								<span>
                                                                    <th><span>US $<%= producto.getPrecio()%></span></th>
                                                                       <input type="hidden" value="<%= producto.getId()%>" name="idproducto">
                                                                       <th>    <input type="number" value="1" id="txt-cantidad" name="cantidad"/>
									<button type="submit" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
										Añadir al carrito
									</button>
                                                                       </th>
								</span>
                                                                </tr>
                                                                </tbody>
                                                                </form>
                                                                        </table>
            <hr>
                                                                        <a href="shop.jsp">Volver atrás</a>
                                                                        <a href="cerrarsesion.jsp">Cerrar sesión</a>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
                                        <%}%>
    </body>
</html>
