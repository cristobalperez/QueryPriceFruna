<%-- 
    Document   : Validar
    Created on : 30-10-2018, 10:45:26
    Author     : Neo Jigoku
--%>


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
                        Persona p = new Persona(request.getParameter("Rut"),request.getParameter("Pass"));
                        HttpSession se = request.getSession();
                       boolean respuesta= Clases.Persona.iniciar_sesion(p);
                        if(respuesta!=false){
                            if (p.getPerfil()==1) {
                                se.setAttribute("nombre", p.getNombre());
                                se.setAttribute("rut", p.getRut());   
                                out.print("<H1>Bievenido "+se.getAttribute("nombre")+"</H1>");
                                }else{
                                se.setAttribute("nombre", p.getNombre());
                                se.setAttribute("rut", p.getRut());   
                                out.print("<H1>Bievenido "+se.getAttribute("nombre")+"</H1>");
                                
                            }
                            }else{
                             out.println("Sesión no iniciada");
                        }
            %>
    </body>
</html>
