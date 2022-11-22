/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import model.dao.ClienteDao;

/**
 *
 * @author duguz
 */
public class ClienteTest {
    public static void main(String[] args) {
        ClienteDao dao = new ClienteDao();
        System.out.println(dao.findUser("jhon@gmail.com", "123"));
        
    }
}
