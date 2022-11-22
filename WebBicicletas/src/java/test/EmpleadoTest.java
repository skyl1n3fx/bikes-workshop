/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import model.dao.EmpleadoDao;
import model.dto.Empleado;

/**
 *
 * @author duguz
 */
public class EmpleadoTest {
    public static void main(String[] args) {
        EmpleadoDao dao = new EmpleadoDao();
        Empleado emp = dao.findUser("fifer@duoc.cl", "123");
        System.out.println(emp.getNombre());
    }
}
