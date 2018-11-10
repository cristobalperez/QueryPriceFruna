/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import Clases.Persona;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Neo Jigoku
 */
public class Sesion extends HttpServlet {

    /**
     * @return the request
     */
    public HttpServletRequest getRequest() {
        return request;
    }

    /**
     * @param request the request to set
     */
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    /**
     * @return the response
     */
    public HttpServletResponse getResponse() {
        return response;
    }

    /**
     * @param response the response to set
     */
    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }
    private HttpServletRequest request;
    private HttpServletResponse response;

   HttpSession session = getRequest().getSession();
    public void Sesiones(Persona p){
        
   session.setAttribute("rut", p.getRut());
   session.setAttribute("clave", p.getContraseña());
   session.setMaxInactiveInterval(20*60);
}
    public void Mostrarsesion(){
        session.getAttribute("rut");
        session.getAttribute("clave");
    }
}
