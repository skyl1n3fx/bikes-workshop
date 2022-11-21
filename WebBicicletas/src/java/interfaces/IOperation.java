/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;

/**
 *
 * @author duguz
 */
public interface IOperation <T>{
    // Generic crud
    public boolean create(T entity);
    public boolean delete(int pk);
    public boolean findById(int pk);
    public boolean update(T entity);
    public List<T> list();
}
