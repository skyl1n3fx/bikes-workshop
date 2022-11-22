/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.base.BaseModel;
import model.dto.Afp;

/**
 *
 * @author duguz
 */
public class AfpDao extends BaseModel<Afp>{
    @Override
    public String getModelName() {
        return Afp.class.getSimpleName();
    }

    @Override
    public void addTable() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
