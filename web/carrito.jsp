<%-- 
    Document   : carrito
    Created on : 22-11-2018, 18:04:43
    Author     : Neo Jigoku
--%>

<%@page import="Clases.Producto"%>
<%@page import="Clases.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.ModeloProducto"%>
<%
     HttpSession sesion = request.getSession(true);
     ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/cssCarrito.css" rel="stylesheet">
                 <script src="js/jquery.js"></script>
        <script src="js/carrito.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">

			</div>
			<div class="table-responsive cart_info" id="cart-container">
                            <table class="table table-condensed" border="1" id="shop_table">
					<thead>
						<tr class="cart_menu">
							<td class="image">Código</td>
							<td class="image">Producto</td>
							<td class="price">Precio</td>
							<td class="quantity">Cantidad</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
                                            
                                            
                                                <%
                                                    ModeloProducto mp = new ModeloProducto();
                                                    double total = 0;
                                                    if(articulos != null){
                                                    for(Articulo a: articulos){
                                                        Producto producto = mp.Get_One_Producto(a.getIdProducto());
                                                        total += a.getCantidad() * producto.getPrecio();
                                                        
                                                                                                            
                                                %>
                                            
						<tr>    
                                                    <td>
								<p>Web ID: <%= producto.getId()%></p>
                                                    </td>
							<td class="cart_description">
								<h4><%= producto.getNombre()%></a></h4>
							</td>
							<td class="cart_price">
						 		<p>$<%= producto.getPrecio()%></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
                                                                        <input class="cart_quantity_input" type="number" name="quantity" value="<%= a.getCantidad()%>" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$<%= Math.round(producto.getPrecio()*a.getCantidad()*100.0) / 100.0%></p>
							</td>
							<td class="cart_delete">
                                                            <span id="id_articulo" style="display:none;"><%= producto.getId()%></span>
                                                            <a href="" id="delete_item"><i class="fa fa-times"></i></a>
							</td>
						</tr>
                                                <%}}%>
					</tbody>
				</table>
                                <% if (articulos == null){%>
                                <h4>No hay Articulos en el carro</h4>
                                <%}%>
			</div> 
                                                <a href="javascript:window.history.go(-2);">Seguir Comprando</a>
		</div>
	</section> <!--/#cart_items-->
        				<div class="col-sm-6">
					<div class="total_area">
						<ul>
                                                    <li>Sub Total Carrito <span id="txt-subtotal">$<%= Math.round(total*100.0)/100.0%></span></li>
                                                        <li>Total <span id="txt-total"><%= Math.round(total*100.0)/100.0%></span></li>
						</ul>
					</div>
				</div>
                                                <a href="iniciocliente.jsp">Salir del carrito</a>
                                                <a href="cerrarsesion.jsp">Cerrar sesión</a>
    </body>
</html>
