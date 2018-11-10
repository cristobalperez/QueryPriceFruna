<%-- 
    Document   : ingresar
    Created on : 06-11-2018, 16:47:14
    Author     : Neo Jigoku
--%>


<%@page import="Clases.usuarios"%>
<%@page import="datos.Consultas"%>
<%@page import="Clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     
        
        <% 
        try{
            
        
         String pass = request.getParameter("pass");
   
       Persona pe = new Persona(request.getParameter("rut"), request.getParameter("nombre"),
               request.getParameter("apellido"), request.getParameter("sexo"),
               pass, request.getParameter("correo"),
               request.getParameter("telefono"),request.getParameter("direccion"),1);
             
      boolean respuesta=Clases.Persona.Registrar(pe);
      if(respuesta!=false){
      out.println("Dato ingresados");
      }
      else{
      out.println("Verifique... Username y/o Email Dublicado");
      }
        }catch (Exception e){
            out.print("<h1>"+e.getMessage()+"</h1>");

   
        }
      
        

        %>
    </body>
</html>
