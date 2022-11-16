/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.MetodosCrud;
import java.util.List;
import modelo.dto.Renuncia;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author duguz
 */
public class RenunciaDao implements MetodosCrud<Renuncia>{
    
    private Session session;
    private Transaction Transaction;
    
    public void initOperaciones(){
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction = session.beginTransaction();
    }

    @Override
    public boolean agregar(Renuncia generico) {
        try {
            initOperaciones();
            session.save(generico);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Renuncia no creada");
        }
    }

    @Override
    public boolean eliminar(int idRenuncia) {
        try {
            initOperaciones();
            Renuncia aux = buscar(idRenuncia);
            session.delete(aux);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Renuncia no se elimino");
        }
    }

    @Override
    public List<Renuncia> listar() {
        try {
            initOperaciones();
            List<Renuncia> aux = session.createQuery("from Renuncia").list();
            return aux;
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Renuncia no se listo");
        }
    }

    @Override
    public Renuncia buscar(int idRenuncia) {
        try {
            initOperaciones();
            List<Renuncia> aux = session.createQuery("from Renuncia where idRenuncia="+idRenuncia).list();
            for (Renuncia renuncia : aux) {
                return renuncia;
            }
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Renuncia no se encontro");
        }
        return null;
    }
    
}
