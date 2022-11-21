/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.base.BaseModel;
import model.dto.Liquidacione;

/**
 *
 * @author duguz
 */
public class LiquidacioneDao extends BaseModel<Liquidacione>{
    
    @Override
    public String getModelName() {
        return Liquidacione.class.getSimpleName();
    }
}
