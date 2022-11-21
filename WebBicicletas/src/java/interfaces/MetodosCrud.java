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
public interface MetodosCrud<Generico> {
    public boolean agregar(Generico generico);
    public boolean eliminar(int id);
    public List<Generico> listar();
    public Generico buscar(int id);
    
}
