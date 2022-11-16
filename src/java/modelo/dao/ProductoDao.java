/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.MetodosCrud;
import java.util.List;
import modelo.dto.Producto;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author duguz
 */
public class ProductoDao implements MetodosCrud<Producto>{
    
    private Session session;
    private Transaction Transaction;
    
    public void initOperaciones(){
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction = session.beginTransaction();
    }

    @Override
    public boolean agregar(Producto generico) {
        try {
            initOperaciones();
            session.save(generico);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Prodeucto no creado");
        }
    }

    @Override
    public boolean eliminar(int idProducto) {
        try {
            initOperaciones();
            Producto aux = buscar(idProducto);
            session.delete(aux);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Producto no se elimino");
        }
    }

    @Override
    public List<Producto> listar() {
        try {
            initOperaciones();
            List<Producto> aux = session.createQuery("from Producto").list();
            return aux;
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Producto no se listo");
        }
    }

    @Override
    public Producto buscar(int idProducto) {
        try {
            initOperaciones();
            List<Producto> aux = session.createQuery("from Producto where idProducto="+idProducto).list();
            for (Producto producto : aux) {
                return producto;
            }
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Producto no se encontro");
        }
        return null;
    }
    
}
