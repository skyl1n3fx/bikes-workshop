/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.MetodosCrud;
import java.util.List;
import modelo.dto.Cliente;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author duguz
 */
public class ClienteDao implements MetodosCrud<Cliente>{
    
    private Session session;
    private Transaction Transaction;
    
    //deja abierta la conexion y prepara la consulta
    public void initOperaciones(){
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction = session.beginTransaction();
    }

    @Override
    public boolean agregar(Cliente generico) {
        try {
            initOperaciones();
            session.save(generico);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Usuario no creado");
        }
    }

    @Override
    public boolean eliminar(int idCliente) {
        try {
            initOperaciones();
            Cliente aux = buscar(idCliente);
            session.delete(aux);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Usuario no se elimino");
        }
    }

    @Override
    public List<Cliente> listar() {
        try {
            initOperaciones();
            List<Cliente> aux = session.createQuery("from Cliente").list();
            return aux;
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Usuario no se listo");
        }
    }

    @Override
    public Cliente buscar(int idCliente) {
        try {
            initOperaciones();
            List<Cliente> aux = session.createQuery("from Cliente where idCliente="+idCliente).list();
            for (Cliente cliente : aux) {
                return cliente;
            }
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Usuario no se encontro");
        }
        return null;
    }
    
    public void modificar(Cliente cliente) {
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            sesion.beginTransaction();
            sesion.update(cliente);
            sesion.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            sesion.getTransaction().rollback();
        } finally {
            if (sesion != null) {
                sesion.close();
            }
        }
    }
    
}
