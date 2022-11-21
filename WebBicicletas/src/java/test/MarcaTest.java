/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;
import model.dao.MarcaDao;
import model.dto.Marca;

/**
 *
 * @author duguz
 */
public class MarcaTest {
    public static void main(String[] args) {
        MarcaDao dao = new MarcaDao();
        Marca marca = new Marca("Prueba");
        
        // Crear marca
        dao.testMessage(dao.create(marca));
        
        // Buscar marcas
        System.out.println(dao.findById(3).getDescripcion());
        
        // Listar marcas
        System.out.println(dao.list().get(0));
        
        // Modificar marca
        marca.setDescripcion("uwu");
        dao.testMessage(dao.update(marca));
        
        // Eliminar 
        dao.testMessage(dao.delete(3));
    }
}
