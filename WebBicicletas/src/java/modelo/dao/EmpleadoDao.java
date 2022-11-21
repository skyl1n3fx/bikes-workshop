/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.MetodosCrud;
import java.util.List;
import modelo.dto.Empleado;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author duguz
 */
public class EmpleadoDao implements MetodosCrud<Empleado>{
    
    private Session session;
    private Transaction Transaction;
    
    public void initOperaciones(){
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction = session.beginTransaction();
    }

    @Override
    public boolean agregar(Empleado generico) {
        try {
            initOperaciones();
            session.save(generico);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Empleado no creado");
        }
    }

    @Override
    public boolean eliminar(int idEmpleado) {
        try {
            initOperaciones();
            Empleado aux = buscar(idEmpleado);
            session.delete(aux);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Empleado no se elimino");
        }
    }

    @Override
    public List<Empleado> listar() {
        try {
            initOperaciones();
            List<Empleado> aux = session.createQuery("from Empleado").list();
            return aux;
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Empleado no se listo");
        }
    }

    @Override
    public Empleado buscar(int idEmpleado) {
        try {
            initOperaciones();
            List<Empleado> aux = session.createQuery("from Empleado where idEmpleado="+idEmpleado).list();
            for (Empleado empleado : aux) {
                return empleado;
            }
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Empleado no se encontro");
        }
        return null;
    }
    
}
