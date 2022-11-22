/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.base;

import interfaces.IOperation;
import java.util.List;
import model.dto.HibernateUtil;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.base.GeneratePDF;

/**
 *
 * @author duguz
 */

public abstract class BaseModel <T> extends GeneratePDF<T> implements IOperation<T>{

    private String modelName;
    
    // Variables para conectarse a la bd mediante Hibernate
    private static Session session;
    private static Transaction transaction;
    
    public String getModelName() {
        return modelName;
    }
    
    public Session getSession(){
        return this.session;
    }
    
    public Transaction getTransaction(){
        return this.transaction;
    }
    
    public void connect(){
        // Nos conectamos a la bd
        session = HibernateUtil.getSessionFactory().openSession();
        transaction = session.beginTransaction();
    }
    
    public void disconnect(){
        // Nos desconectamos de la bd
        session.close();
    }
    
    public void commit(){
        transaction.commit();
    }
    
    
    @Override
    public boolean create(T entity) {
        boolean valida = false;
        try {
            connect();
            session.save(entity);
            commit();
            valida = true;
        } catch (Exception ex) {
            System.out.println("Error al guardar " + ex.getMessage());
        }finally{
            disconnect();
        }
        return valida;
    }

    @Override
    public boolean delete(int pk) {
        boolean valida = false;
        try {
            T entidad = findById(pk);
            connect();
            session.delete(entidad);
            commit();
            valida = true;
        } catch (Exception ex) {
            System.out.println("Error al eliminar " + ex.getMessage());
        }finally{
            disconnect();
        }
        return valida;
    }

    @Override
    public T findById(int pk) {
        T entity = null;
        try {
            connect();
            String consulta = "select x from " + getModelName()+ " x where x.id = :id";
            Query query = session.createQuery(consulta);
            // Variable de sustitución
            query.setInteger("id", pk);
            entity = (T) query.list().get(0);
        } catch (Exception e) {
            System.out.println("Error al buscar " + e.getMessage());
        }finally{
            disconnect();
        }
        return entity;
    }

    @Override
    public boolean update(T entity) {
        boolean valida = false;
        try {
            connect();
            session.update(entity);
            commit();
            valida = true;
        } catch (Exception ex) {
            System.out.println("Error al modificar " + ex.getMessage());
        }finally{
            disconnect();
        }
        return valida;
    }

    @Override
    public List<T> list() {
        List<T> entities = null;
        try {
            connect();
            String rawQuery = "from " + getModelName();
            Query query = session.createQuery(rawQuery);
            entities = query.list();
        } catch (Exception e) {
            System.out.println("Error al listar " + e.getMessage());
        }finally{
            disconnect();
        }
        return entities;
    }
    
    public void testMessage(Boolean response){
        if(response){
            JOptionPane.showMessageDialog(null, "¡" + getModelName() + " Pasó la prueba!");
        }else{
           JOptionPane.showMessageDialog(null, "¡" + getModelName() + " No pasó la prueba =(!"); 
        }
    }

    @Override
    public abstract void addTable();

}
