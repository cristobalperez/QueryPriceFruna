<%-- 
    Document   : Validar
    Created on : 30-10-2018, 10:45:26
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
        <title>JSP Page</title>
    </head>
    <body>
                <%
                        Persona p = new Persona(request.getParameter("Rut"),request.getParameter("Pass"));
                        HttpSession se = request.getSession();
                       boolean respuesta= Clases.Persona.iniciar_sesion(p);
                        if(respuesta!=false){
                                se.setAttribute("nombre", p.getNombre());
                                se.setAttribute("rut", p.getRut());   
                            if (p.getPerfil()==1) {
                                response.sendRedirect("iniciocliente.jsp");
                                }else{
                                response.sendRedirect("inicioadmin.jsp");
                            }
                            }else{
                            %>
                             <script language="javascript" type="text/javascript">
                    function preguntar()
                       {
                             alert("Usted no posee una cuenta en FrunaQueryPrice");
                            setTimeout(function(){location.href = "Login.jsp";},0.01);
                           } 
                     document.writeln(preguntar());
                </script>
                            <%
                        }
            %>
    </body>
</html>
