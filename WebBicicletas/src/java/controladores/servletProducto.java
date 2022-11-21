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
import modelo.dao.ProductoDao;
import modelo.dto.Categoria;
import modelo.dto.Marca;
import modelo.dto.Producto;

/**
 *
 * @author duguz
 */
public class servletProducto extends HttpServlet {

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
        ProductoDao dao  = new ProductoDao();
        
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
            if (dao.agregar(producto)){
                System.out.println("Agregado Correctamente");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else{
                System.out.println("Error al agregar");
            }
            
        }
        
        if (request.getParameter("btnAccion").equals("Eliminar")) {
            int idProducto = Integer.parseInt(request.getParameter("txtId"));;
           
            if ( dao.eliminar(idProducto) ) {
                System.out.println("ELIMINADO CORRECIAMENTE");
                request.getRequestDispatcher("index.jsp").forward(request, response);

            } else {
                System.out.println("Error en ELIMINAR");          

            }
  
        }
        
        
        if (request.getParameter("btnAccion").equals("Listar")) {
            for (Producto aux : dao.listar()) {
         
             System.out.println("User: " + aux.getDescripcion()); 
             System.out.println("Pass: " + aux.getCategoria().getDescripcion()); 
             System.out.println("Tipo: " + aux.getPrecio()); 

        }

     }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
