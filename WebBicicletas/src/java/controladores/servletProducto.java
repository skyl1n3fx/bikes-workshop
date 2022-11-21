/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import static java.time.Clock.system;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.ProductoDao;
import model.dto.Categoria;
import model.dto.Marca;
import model.dto.Producto;

/**
 *
 * @author duguz
 */
public class servletProducto extends HttpServlet {
    
    ProductoDao dao  = new ProductoDao();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if  (request.getParameter("btnAccion").equals("Agregar")){
            int precio = Integer.parseInt(request.getParameter("txtPrecio"));
            int stock = Integer.parseInt(request.getParameter("txtStock"));
            String descripcion = request.getParameter("txtDescripcion");
            String imagen = request.getParameter("txtImagen");
            int descuento = Integer.parseInt(request.getParameter("txtDescuento"));
            int idMarca = Integer.parseInt(request.getParameter("cboMarca"));
            int idCategoria = Integer.parseInt(request.getParameter("cboCategoria"));
            
            
            Marca marca = new Marca(idMarca);
            Categoria categoria = new Categoria(idCategoria);
            Producto producto = new Producto(categoria, marca, precio, stock, descripcion, imagen, descuento);
            if (dao.create(producto)){
                System.out.println("Agregado Correctamente");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else{
                System.out.println("Error al agregar");
            }
            
        }
        
        if (request.getParameter("btnAccion").equals("Eliminar")) {
            int idProducto = Integer.parseInt(request.getParameter("txtId"));;
           
            if ( dao.delete(idProducto) ) {
                System.out.println("ELIMINADO CORRECIAMENTE");
                request.getRequestDispatcher("index.jsp").forward(request, response);

            } else {
                System.out.println("Error en ELIMINAR");          

            }
  
        }
        
        
        if (request.getParameter("btnAccion").equals("Listar")) {
            for (Producto aux : dao.list()) {
         
             System.out.println("User: " + aux.getDescripcion()); 
             System.out.println("Pass: " + aux.getCategoria().getDescripcion()); 
             System.out.println("Tipo: " + aux.getPrecio()); 

        }

     }
    }
    
    private void detailProduct(HttpServletRequest request, HttpServletResponse response) throws IOException{
        // Muestra los datos en un pagina
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Producto product = dao.findById(id);
            request.getSession().setAttribute("productDetail", product);
        } catch (Exception e) {
            request.getSession().setAttribute("msgAdminProduct", "Error al cargar");
        }finally{
            response.sendRedirect("admin/products/update-product.jsp");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        // Eliminar producto
        if(request.getParameter("pk")!=null){
            int pk = Integer.parseInt(request.getParameter("pk"));
            if(dao.delete(pk)){
                //request.getRequestDispatcher("admin/products/products.jsp").forward(request, response);
                response.sendRedirect("admin/products/products.jsp");
            }
            
        }
        
        // Detail Product
        if(request.getParameter("id")!=null){
            detailProduct(request, response);
        }
        
        
        if(request.getParameter("pk")==null && request.getParameter("id")==null){
            processRequest(request, response);
        }
        
        
        
    }
    
    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try{
            Producto product = new Producto();
            product.setPrecio(Integer.parseInt(request.getParameter("txtPrecio")));
            product.setStock(Integer.parseInt(request.getParameter("txtStock")));
            product.setDescripcion(request.getParameter("txtDescripcion"));
            product.setImagen(request.getParameter("txtImagen"));
            product.generatePromotion(Integer.parseInt(request.getParameter("cboPromotion")));
            Marca marca = new Marca(Integer.parseInt(request.getParameter("cboMarca")));
            Categoria categoria = new Categoria(Integer.parseInt(request.getParameter("cboCategoria")));
            product.setMarca(marca);
            product.setCategoria(categoria);
            if(dao.create(product)){
                request.getSession().setAttribute("msgCreateProduct", "Creado correctamente");
            }else{
                request.getSession().setAttribute("msgCreateProduct", "No se pudo crear");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msgCreateProduct", "Error:" + e.getMessage());
        }finally{
            response.sendRedirect("admin/products/products.jsp");
        }    
    
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try {
            int pk = Integer.parseInt(request.getParameter("txtId"));
            Producto product = dao.findById(pk);
            product.setPrecio(Integer.parseInt(request.getParameter("txtPrecio")));
            product.setStock(Integer.parseInt(request.getParameter("txtStock")));
            product.setDescripcion(request.getParameter("txtDescripcion"));
            product.setImagen(request.getParameter("txtImagen"));
            product.generatePromotion(Integer.parseInt(request.getParameter("cboPromotion")));
            Marca marca = new Marca(Integer.parseInt(request.getParameter("cboMarca")));
            Categoria categoria = new Categoria(Integer.parseInt(request.getParameter("cboCategoria")));
            product.setMarca(marca);
            product.setCategoria(categoria);
            if(dao.update(product)){
                request.getSession().setAttribute("msgUpdateProduct", "Actualizado correctamente");
            }else{
                request.getSession().setAttribute("msgUpdateProduct", "No se pudo actualizar");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msgUpdateProduct", "Error:" + e.getMessage());
        }finally{
            response.sendRedirect("admin/products/products.jsp");
        }
    }
            
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String option = request.getParameter("btnAction");
        
        if(option.equals("Actualizar")){
            updateProduct(request,response);
        }

        if(option.equals("Crear")){
            createProduct(request,response);
        }
        
        //processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
