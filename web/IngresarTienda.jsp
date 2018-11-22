<%-- 
    Document   : IngresarTienda
    Created on : 15-11-2018, 12:41:19
    Author     : Neo Jigoku
--%>

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
        <title>JSP Page</title>
    </head>
    <body>
<%
             try{
             String direccion = request.getParameter("Direccion");
             String telefono = "+562"+request.getParameter("Telefono");
             String correo = request.getParameter("Correo");
                 Tienda t = new Tienda (direccion, telefono, correo);
                 Tienda ti = new Tienda(direccion);
                 boolean res= Clases.Tienda.Verificar_tienda(ti);
                 if (res==true) {
%>
                             <script language="javascript" type="text/javascript">
                                 function preguntar(){
                             alert("Dirección y/o correo electrónico ya poseen una tienda ingresada");
                            setTimeout(function(){location.href = "nueva_tienda.jsp";},0.01);
                           } 
                     document.writeln(preguntar()); 
                                      </script>
<%           
                     }else{
             boolean respuesta=Clases.Administrador.Agregar_tienda(t);
             if(respuesta!=false){
                                            %>
                             <script language="javascript" type="text/javascript">
                    function preguntar()
                       {
                             alert("Tienda ingresada con éxito");
                            setTimeout(function(){location.href = "gestor_tienda.jsp";},0.01);
                           } 
                     document.writeln(preguntar());
                </script>
                            <% 
             }
             else{
                                            %>
                             <script language="javascript" type="text/javascript">
                    function preguntar()
                       {
                             alert("No se pudo completar la acción con éxito");
                            setTimeout(function(){location.href = "gestor_tienda.jsp";},0.01);
                           } 
                     document.writeln(preguntar());
                </script>
                            <% 
             }
}
                 }catch (Exception e){
             out.print("<h1>"+e.getMessage()+"</h1>");
        }
%>
    </body>
</html>
