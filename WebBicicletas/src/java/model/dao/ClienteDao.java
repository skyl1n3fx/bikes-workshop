/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.base.BaseModel;
import model.dto.Cliente;
import org.hibernate.Query;

/**
 *
 * @author duguz
 */
public class ClienteDao extends BaseModel<Cliente> {
    
    @Override
    public String getModelName() {
        return Cliente.class.getSimpleName();
    }

    @Override
    public void addTable() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public Cliente findUser(String email, String password){
        Cliente cliente = null;
        try {
            super.connect();
            String consulta = "select x from " + getModelName()+ " x where x.email = ? and x.contrasena = ?";
            Query query = getSession().createQuery(consulta);
            // Variable de sustitución
            query.setParameter(0, email);
            query.setParameter(1, password);
            cliente = (Cliente) query.list().get(0);
            
        } catch (Exception e) {
            System.out.println("Error al buscar " + e.getMessage());
        }finally{
            super.disconnect();
        }
        return cliente;
    }
}
