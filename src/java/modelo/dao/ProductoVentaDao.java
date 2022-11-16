/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import interfaces.MetodosCrud;
import java.util.List;
import modelo.dto.ProductoVenta;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author duguz
 */
public class ProductoVentaDao implements MetodosCrud<ProductoVenta>{
    
    private Session session;
    private Transaction Transaction;
    
    public void initOperaciones(){
        session = HibernateUtil.getSessionFactory().openSession();
        Transaction = session.beginTransaction();
    }

    @Override
    public boolean agregar(ProductoVenta generico) {
        try {
            initOperaciones();
            session.save(generico);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Producto Vents no creado");
        }
    }

    @Override
    public boolean eliminar(int idProductoVenta) {
        try {
            initOperaciones();
            ProductoVenta aux = buscar(idProductoVenta);
            session.delete(aux);
            Transaction.commit();
            session.close();
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Producto Venta no se elimino");
        }
    }

    @Override
    public List<ProductoVenta> listar() {
        try {
            initOperaciones();
            List<ProductoVenta> aux = session.createQuery("from ProductoVenta").list();
            return aux;
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Producto Venta no se listo");
        }
    }

    @Override
    public ProductoVenta buscar(int idProductoVenta) {
        try {
            initOperaciones();
            List<ProductoVenta> aux = session.createQuery("from ProductoVenta where idProductoVenta="+idProductoVenta).list();
            for (ProductoVenta productoVenta : aux) {
                return productoVenta;
            }
        } catch (Exception e) {
            session.close();
            throw new RuntimeException("Producto Venta no se encontro");
        }
        return null;
    }
    
}
