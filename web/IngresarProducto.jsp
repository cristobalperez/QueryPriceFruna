<%-- 
    Document   : ingresar_producto
    Created on : 21-11-2018, 21:25:17
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
        <title>JSP Page</title>
    </head>
    <body>
   <%
             try{
             String nombre = request.getParameter("nombre");
             String descripcion = request.getParameter("descripcion");
             float precio = Float.valueOf(request.getParameter("precio"));
             int stock= Integer.parseInt(request.getParameter("stock"));
             Producto p = new Producto(nombre, descripcion,precio,stock);
                 boolean res= Clases.Producto.Verificar_producto(p);
                 if (res==true) {
%>
                             <script language="javascript" type="text/javascript">
                                 function preguntar(){
                             alert("Ya existe un producto con ese nombre");
                            setTimeout(function(){location.href = "nuevo_producto.jsp";},0.01);
                           } 
                     document.writeln(preguntar()); 
                                      </script>
<%           
                     }else{
             boolean respuesta=Clases.Administrador.Agregar_producto(p);
             if(respuesta!=false){
            response.sendRedirect("gestor_producto.jsp");
             }
             else{
             out.println("Verifique datos válidos");
             }
}
                 }catch (Exception e){
             out.print("<h1>"+e.getMessage()+"</h1>");
        }
%>
    </body>
</html>
