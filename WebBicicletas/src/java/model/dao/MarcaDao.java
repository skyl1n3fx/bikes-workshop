package model.dao;

import model.dto.Marca;
import model.base.BaseModel;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author duguz
 */
public class MarcaDao extends BaseModel<Marca>{

    @Override
    public String getModelName() {
        return Marca.class.getSimpleName();
    }

    @Override
    public void addTable() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
