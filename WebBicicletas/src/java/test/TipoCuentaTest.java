/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;
import model.dao.TipoCuentaDao;
import model.dto.Tipocuenta;

/**
 *
 * @author duguz
 */
public class TipoCuentaTest {
    public static void main(String[] args) {
        TipoCuentaDao dao = new TipoCuentaDao();
        Tipocuenta generic = new Tipocuenta();
        
        // Crear 
        dao.testMessage(dao.create(generic));
        
        // Buscar 
        System.out.println(dao.findById(1).getDescripcion());
        
        // Listar 
        System.out.println(dao.list().get(0));
        
        // Modificar 
        //generic.setDescripcion("uwu");
        //dao.testMessage(dao.update(generic));
        
        // Eliminar 
        //dao.testMessage(dao.delete(3));
    }
}
