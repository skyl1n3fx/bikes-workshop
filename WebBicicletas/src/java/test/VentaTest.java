/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import model.dao.ProductoVentaDao;
import model.dao.VentaDao;

/**
 *
 * @author dufguz
 */
public class VentaTest {
    public static void main(String[] args) {
        ProductoVentaDao dao = new  ProductoVentaDao();
        
        System.out.println(dao.filterByIdVenta(1).get(0).getProducto().getPrecio());
    }
}
