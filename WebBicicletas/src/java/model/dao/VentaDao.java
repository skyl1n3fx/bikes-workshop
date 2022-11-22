/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import model.base.BaseModel;
import model.dto.ProductoVenta;
import model.dto.Venta;
import org.hibernate.Query;

/**
 *
 * @author duguz
 */
public class VentaDao extends BaseModel<Venta>{
    
    @Override
    public String getModelName() {
        return Venta.class.getSimpleName();
    }

    @Override
    public void addTable() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List<ProductoVenta> filterByIdVenta(Integer pk){
        List<ProductoVenta> detail = null;
        try {
            super.connect();
            String consulta = "select x from " + getModelName()+ " x where x.idVenta = ?";
            Query query = getSession().createQuery(consulta);
            // Variable de sustitución
            query.setParameter(0, pk);
            detail = (List<ProductoVenta>) query.list();
            
        } catch (Exception e) {
            System.out.println("Error al buscar " + e.getMessage());
        }finally{
            super.disconnect();
        }
        return detail;
    }
}
