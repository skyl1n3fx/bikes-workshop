/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.MetodosCrud;
import java.util.List;
import modelo.dto.Reparacion;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author duguz
 */
public class ReparacionDao implements MetodosCrud<Reparacion>{
    
    private Session session;
    private Transaction Transaction;
    
    public void initOperaciones(){
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction = session.beginTransaction();
    }

    @Override
    public boolean agregar(Reparacion generico) {
        try {
            initOperaciones();
            session.save(generico);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Reparacion no creado");
        }
    }

    @Override
    public boolean eliminar(int idReparacion) {
        try {
            initOperaciones();
            Reparacion aux = buscar(idReparacion);
            session.delete(aux);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Reparacion no se elimino");
        }
    }

    @Override
    public List<Reparacion> listar() {
        try {
            initOperaciones();
            List<Reparacion> aux = session.createQuery("from Reparacion").list();
            return aux;
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Reparacion no se listo");
        }
    }

    @Override
    public Reparacion buscar(int idReparacion) {
        try {
            initOperaciones();
            List<Reparacion> aux = session.createQuery("from Reparacion where idReparacion="+idReparacion).list();
            for (Reparacion reparacion : aux) {
                return reparacion;
            }
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Reparacion no se encontro");
        }
        return null;
    }
    
}
