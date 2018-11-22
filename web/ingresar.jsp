<%-- 
    Document   : ingresar
    Created on : 06-11-2018, 16:47:14
    Author     : Neo Jigoku
--%>


<%@page import="Clases.Persona"%>
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
        <%   
        try{
            String rut=request.getParameter("rut");
            String nombre =request.getParameter("nombre");
            String apellido =request.getParameter("apellido");
            String sexo =request.getParameter("sexo");
            String pass =request.getParameter("pass");
            String correo =request.getParameter("correo");
            String telefono ="+569" + request.getParameter("telefono");
            String direccion =request.getParameter("direccion");
              
       Persona pe = new Persona(rut,nombre,apellido,sexo,pass,correo,telefono,direccion,1);
       Persona p = new Persona(rut,correo); 
             boolean res=Clases.Cliente.Verificar_cliente(p);
             if (res==true) {
                                            %>
                             <script language="javascript" type="text/javascript">
                    function preguntar()
                       {
                             alert("Rut y/o correo electrónico ya poseen una cuenta registrada");
                            setTimeout(function(){location.href = "Login.jsp";},0.01);
                           } 
                     document.writeln(preguntar());
                </script>
                            <% 
                 }else{
      boolean respuesta=Clases.Persona.Registrar(pe);
      if(respuesta!=false){
                                              %>
                             <script language="javascript" type="text/javascript">
                    function preguntar()
                       {
                             alert("Cuentra registrada, bienvenido a FrunaQueryPrice");
                            setTimeout(function(){location.href = "Login.jsp";},5000);
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
