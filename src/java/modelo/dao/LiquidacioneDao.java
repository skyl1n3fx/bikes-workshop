/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.MetodosCrud;
import java.util.List;
import modelo.dto.Liquidacione;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author duguz
 */
public class LiquidacioneDao implements MetodosCrud<Liquidacione>{
    
    private Session session;
    private Transaction Transaction;
    
    public void initOperaciones(){
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction = session.beginTransaction();
    }

    @Override
    public boolean agregar(Liquidacione generico) {
        try {
            initOperaciones();
            session.save(generico);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Liquidacion no creado");
        }
    }

    @Override
    public boolean eliminar(int idLiquidacion) {
        try {
            initOperaciones();
            Liquidacione aux = buscar(idLiquidacion);
            session.delete(aux);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Liquidacion no se elimino");
        }
    }

    @Override
    public List<Liquidacione> listar() {
        try {
            initOperaciones();
            List<Liquidacione> aux = session.createQuery("from Liquidacione").list();
            return aux;
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Liquidacion no se listo");
        }
    }

    @Override
    public Liquidacione buscar(int idLiquidacion) {
        try {
            initOperaciones();
            List<Liquidacione> aux = session.createQuery("from Liquidacione where idLiquidacion="+idLiquidacion).list();
            for (Liquidacione liquidacione : aux) {
                return liquidacione;
            }
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Liquidacion no se encontro");
        }
        return null;
    }
    
}
