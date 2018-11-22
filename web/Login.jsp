<%-- 
    Document   : Login
    Created on : 30-10-2018, 10:39:54
    Author     : Neo Jigoku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link REL="StyleSheet" HREF="css/stylelogin.css" TYPE="text/css" >
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
                <script src="lib/jquery-1.9.0.min.js" type="text/javascript" charset="utf-8"></script>
<script src="src/jquery.maskedinput.js" type="text/javascript"></script>
        <title>Fruna QueryPrice</title>
                    <script type="text/javascript">
            jQuery(function($){
     $("#cel").mask("99999999");
});

        </script>      
    </head>
    <body>
        <h1>Inicio de sesión</h1>
        
        <form method="post" action="Validar.jsp" id="login">
                    <div class='wrapper'>
            <div class="titulo">Contraseña</div>
            <div class="titulo">Rut</div>
        </div>      
            <div class='wrapper'>
            <div class="formulario"><input type="password" name="Pass" ></div>
            <div class="formulario"><input type="text" name="Rut"></div>
            <div class="button"><input name="btnEnviar" type="submit" value="Ingresar"></div>
        </div>            
       </form>
        
                <center>
        <h1>Registrate gratis</h1>
         <div>
         <h1>QueryPrice</h1>
        </div>
        <div>

            <form method="post" action="ingresar.jsp" id="register-form">   
            
          
                <p>Rut: <input name="rut"  placeholder="Introduzca su RUT" type="text" oninput="ValidaRut(this)" size="12"></p>
            <p>Nombre: <input name="nombre" placeholder="Introduzca su nombre" type="text" ></p>
            <p>Apellidos: <input name="apellido" placeholder="Introduzca su apellido" type="text" ></p> 
            <p>Sexo:  <input name="sexo" type="radio" value="Femenino" required>Femenino
            <input name="sexo" type="radio" value="Masculino">Masculino
            <input name="sexo" type="radio" value="Otro"> Sin especificar</p>
            <p>Contraseña: <input name="pass" id="contraseña" placeholder="Introduzca contraseña" type="password" size="30" pattern="[A-Za-z0-9]{5,10}" title="Letras y números. Tamaño mínimo: 5. Tamaño máximo: 30"required></p>
            <p>Repetir contraseña: <input name="contraseña2"  id="txtPass2"placeholder="Repetir Contraseña" type="password" required></p>
            <p>Correo electrónico: <input name="correo" placeholder="Introduzca su correo" type="text" ></p>
            <p>Celular: +569<input name="telefono"  placeholder="Introduzca su N° de celular" type="text" id="cel"></p>
            <p>Dirección: <input name="direccion"  placeholder="Introduzca su dirección" type="text" ></p>
            <p><input  type="submit" value="Registrarse" onclick="validar_clave(e)"></p>
           
        </form>
        </div>
        
    </center>
        <script src="js/ValidarRut.js"></script>
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
