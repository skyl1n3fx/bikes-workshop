/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.MetodosCrud;
import java.util.List;
import modelo.dto.Anticipo;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author duguz
 */
public class AnticipoDao implements MetodosCrud<Anticipo>{
    
    private Session session;
    private Transaction Transaction;
    
    public void initOperaciones(){
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction = session.beginTransaction();
    }

    @Override
    public boolean agregar(Anticipo generico) {
        try {
            initOperaciones();
            session.save(generico);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Anticipo no creado");
        }
    }

    @Override
    public boolean eliminar(int idAnticipo) {
        try {
            initOperaciones();
            Anticipo aux = buscar(idAnticipo);
            session.delete(aux);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Anticipo no se elimino");
        }
    }

    @Override
    public List<Anticipo> listar() {
        try {
            initOperaciones();
            List<Anticipo> aux = session.createQuery("from Anticipo").list();
            return aux;
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Anticipo no se listo");
        }
    }

    @Override
    public Anticipo buscar(int idAnticipo) {
        try {
            initOperaciones();
            List<Anticipo> aux = session.createQuery("from Anticipo where idAnticipo="+idAnticipo).list();
            for (Anticipo anticipo : aux) {
                return anticipo;
            }
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Anticipo no se encontro");
        }
        return null;
    }
    
}
