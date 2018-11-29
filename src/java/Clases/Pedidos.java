package Clases;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Neo Jigoku
 */
public class Pedidos {

    /**
     * @return the id_pedido
     */
    public int getId_pedido() {
        return id_pedido;
    }

    /**
     * @param id_pedido the id_pedido to set
     */
    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    /**
     * @return the fecha_pedido
     */
    public String getFecha_pedido() {
        return fecha_pedido;
    }

    /**
     * @param fecha_pedido the fecha_pedido to set
     */
    public void setFecha_pedido(String fecha_pedido) {
        this.fecha_pedido = fecha_pedido;
    }

    /**
     * @return the fecha_retiro
     */
    public String getFecha_retiro() {
        return fecha_retiro;
    }

    /**
     * @param fecha_retiro the fecha_retiro to set
     */
    public void setFecha_retiro(String fecha_retiro) {
        this.fecha_retiro = fecha_retiro;
    }

    /**
     * @return the rut_persona
     */
    public int getRut_persona() {
        return rut_persona;
    }

    /**
     * @param rut_persona the rut_persona to set
     */
    public void setRut_persona(int rut_persona) {
        this.rut_persona = rut_persona;
    }

    /**
     * @return the id_tienda
     */
    public int getId_tienda() {
        return id_tienda;
    }

    /**
     * @param id_tienda the id_tienda to set
     */
    public void setId_tienda(int id_tienda) {
        this.id_tienda = id_tienda;
    }

    /**
     * @return the total_compra
     */
    public int getTotal_compra() {
        return total_compra;
    }

    /**
     * @param total_compra the total_compra to set
     */
    public void setTotal_compra(int total_compra) {
        this.total_compra = total_compra;
    }
  
private int id_pedido;
private String fecha_pedido;
private String fecha_retiro;
private int rut_persona;
private int id_tienda;
private int total_compra;
}

