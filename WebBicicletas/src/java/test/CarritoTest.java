/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import model.dao.CarritoDao;
import model.dto.Carrito;

/**
 *
 * @author duguz
 */
public class CarritoTest {
    public static void main(String[] args) {
        CarritoDao dao = new CarritoDao();
        Carrito carrito = new Carrito(1,1,1);
        
        dao.testMessage(dao.create(carrito));
        
    }
}
