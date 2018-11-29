<%-- 
    Document   : Modificar_datos_cliente
    Created on : 23-11-2018, 11:09:12
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
              <% HttpSession sesions = request.getSession();
                    if(sesions.getAttribute("nombre")==null&&sesions.getAttribute("rut")==null){
         out.println("<h1>Acceso denegado</h1>");%>
         <a href="Login.jsp">Volver al inicio</a>
        <% }else{
  
        String rut = request.getParameter("rut");
Persona cliente = Clases.Persona.Datos_cliente(rut);
        out.print("<H1>Bievenido Cliente "+sesions.getAttribute("nombre")+"</H1>");
        %>
        
         <div>
             <h1>Modifique sus datos</h1>
            <form method="post" action="Update_cliente.jsp" id="register-form">   
                <p>Rut: <input name="rut"  value="<%=cliente.getRut()%>" type="text" readonly></p>
                <p>Nombre: <input name="nombre" value="<%=cliente.getNombre()%>" type="text" ></p>
                <p>Apellidos: <input name="apellido" value="<%=cliente.getApellido()%>" type="text" ></p> 
            <p>Sexo:  <input name="sexo" type="text" value="<%=cliente.getSexo()%>" required>
            <p>Contraseña: <input name="pass" id="contraseña" value="<%=cliente.getContraseña()%>" type="text" size="30" pattern="[A-Za-z0-9]{5,10}" title="Letras y números. Tamaño mínimo: 5. Tamaño máximo: 30"required></p>
            <p>Repetir contraseña: <input name="contraseña2"  id="txtPass2" type="password" required></p>
            <p>Correo electrónico: <input name="correo" value="<%=cliente.getCorreo()%>" type="text" readonly></p>
            <p>Celular:<input name="telefono"  value="<%=cliente.getTelefono()%>" type="text" id="cel"></p>
            <p>Dirección: <input name="direccion"  value="<%=cliente.getDireccion()%>" type="text" ></p>
            <p><input  type="submit" value="Actualizar" onclick="validar_clave(e)"></p>
           
        </form>
            <a href='iniciocliente.jsp'><--Volver atrás</a><br>
            <hr>
       <a href="cerrarsesion.jsp">Cerrar Sesión</a>
        </div>
         <%}%>
         <script type="text/javascript">
    
    function validar_clave(e) {

      var caract_invalido = " ";
      var caract_longitud = 4;
      var caract_longitudmax = 15;
      var cla1 = $('#register-form #contraseña').val();
      var cla2 = $('#register-form #txtPass2').val();
      if (cla1 == '' || cla2 == '') {
        alert('Debes introducir tu clave en los dos campos.');
        //document.registro
        e.preventDefault();
        return false;
      }
      if (cla1.length < caract_longitud) {
        alert('Tu clave debe constar de ' + caract_longitud + ' carácteres.');
        //document.registro
        e.preventDefault();
        return false;
      }
      if(cla1.length > caract_longitudmax){
                  alert('La clave es demasiado larga, debe constar con a lo más'+caract_longitudmax);
        //document.registro
        e.preventDefault();
        return false;
      }
      if (cla1.indexOf(caract_invalido) > -1) {
        alert("Las claves no pueden contener espacios");
        //document.registro
        e.preventDefault();
        return false;
      } else {
        if (cla1 != cla2) {
          alert("Las claves introducidas no son iguales");
          //document.registro
          e.preventDefault();
          return false;
        } else {
          
          //$('#register-form').trigger('submit');
          return true;
        }
      }
    }
      $(function() {

      $('#login-form-link').click(function(e) {
        $("#login-form").delay(100).fadeIn(100);
        $("#register-form").fadeOut(100);
        $('#register-form-link').removeClass('active');
        $(this).addClass('active');
        e.preventDefault();
      });
      $('#register-form-link').click(function(e) {
        $("#register-form").delay(100).fadeIn(100);
        $("#login-form").fadeOut(100);
        $('#login-form-link').removeClass('active');
        $(this).addClass('active');
        e.preventDefault();
      });

      $('#register-form').submit(function(e) {
        validar_clave(e);
      });
    }
            );

  </script>
    </body>
</html>
