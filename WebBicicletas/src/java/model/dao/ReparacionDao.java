/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.base.BaseModel;
import model.dto.Reparacion;

/**
 *
 * @author duguz
 */
public class ReparacionDao extends BaseModel<Reparacion> {
    
    @Override
    public String getModelName() {
        return Reparacion.class.getSimpleName();
    }  
}
