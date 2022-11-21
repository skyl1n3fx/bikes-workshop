/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import model.base.BaseModel;
import model.dto.Cliente;

/**
 *
 * @author duguz
 */
public class ClienteDao extends BaseModel<Cliente> {
    
    @Override
    public String getModelName() {
        return Cliente.class.getSimpleName();
    }
}
