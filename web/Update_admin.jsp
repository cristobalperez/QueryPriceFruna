<%-- 
    Document   : Update_admin
    Created on : 26-11-2018, 22:10:01
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
            String telefono = request.getParameter("telefono");
            String direccion =request.getParameter("direccion");
              
       Persona pe = new Persona(nombre,apellido,sexo,pass,telefono,direccion, rut);
       Persona p = new Persona(correo); 
             boolean res=Clases.Administrador.Verificar_correo_admin(p);
             if (res==true) {
                                            %>
                             <script language="javascript" type="text/javascript">
                    function preguntar()
                       {
                             alert("Este correo electrónico ya posee una cuenta registrada");
                            setTimeout(function(){location.href = "Login.jsp";},0.1);
                           } 
                     document.writeln(preguntar());
                </script>
                            <% 
                 }else{
      boolean respuesta=Clases.Cliente.modificar_datos_personales(pe);
      if(respuesta!=false){
                                              %>
                             <script language="javascript" type="text/javascript">
                    function preguntar()
                       {
                             alert("Cuenta Actualizada");
                            setTimeout(function(){location.href = "iniciocliente.jsp";},5000);
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
