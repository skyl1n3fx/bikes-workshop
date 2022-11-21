/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import model.dto.Producto;

/**
 *
 * @author duguz
 */
public class ProductoTest {
    public static void main(String[] args) {
        Producto producto = new Producto();
        producto.setPrecio(10000);
        producto.generatePromotion(5);
        System.out.println(producto.getDescuento());
    }
}
