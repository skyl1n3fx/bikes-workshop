/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.base.BaseModel;
import model.dto.ProductoVenta;

/**
 *
 * @author duguz
 */
public class ProductoVentaDao extends BaseModel<ProductoVenta>{
    
    @Override
    public String getModelName() {
        return ProductoVenta.class.getSimpleName();
    }

    @Override
    public void addTable() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
