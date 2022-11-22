/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import model.dao.ConsultaDao;
import model.dto.Consulta;

/**
 *
 * @author duguz
 */
public class ConsultaTest {
    public static void main(String[] args) {
        ConsultaDao dao = new ConsultaDao();
        Consulta c = new Consulta("fdsfds", 1, "PENDIENTE");
        dao.testMessage(dao.create(c));
    }
}
