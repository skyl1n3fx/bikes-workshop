/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.MetodosCrud;
import java.util.List;
import modelo.dto.Venta;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author duguz
 */
public class VentaDao implements MetodosCrud<Venta>{
    
    private Session session;
    private Transaction Transaction;
    
    public void initOperaciones(){
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction = session.beginTransaction();
    }

    @Override
    public boolean agregar(Venta generico) {
        try {
            initOperaciones();
            session.save(generico);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Venta no creado");
        }
    }

    @Override
    public boolean eliminar(int idVenta) {
        try {
            initOperaciones();
            Venta aux = buscar(idVenta);
            session.delete(aux);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Venta no se elimino");
        }
    }

    @Override
    public List<Venta> listar() {
        try {
            initOperaciones();
            List<Venta> aux = session.createQuery("from Venta").list();
            return aux;
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Venta no se listo");
        }
    }

    @Override
    public Venta buscar(int idVenta) {
        try {
            initOperaciones();
            List<Venta> aux = session.createQuery("from Venta where idVenta="+idVenta).list();
            for (Venta venta : aux) {
                return venta;
            }
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Venta no se encontro");
        }
        return null;
    }
    
}
