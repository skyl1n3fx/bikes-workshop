/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.ProductoVentaDao;
import model.dao.VentaDao;
import model.dto.Cliente;
import model.dto.Empleado;
import model.dto.ProductoVenta;
import model.dto.Usuario;
import model.dto.Venta;
import java.time.Instant;
import java.util.Date;
import java.time.LocalDateTime;  
import java.time.format.DateTimeFormatter;  
import model.dto.Producto;

/**
 *
 * @author duguz
 */
@WebServlet(name = "compra", urlPatterns = {"/compra"})
public class servletCompra extends HttpServlet {

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
        
        if(request.getParameter("id")!=null){
            ProductoVentaDao dao = new ProductoVentaDao();
            List<ProductoVenta> detail = dao.filterByIdVenta(Integer.parseInt(request.getParameter("id")));
            request.getSession().setAttribute("listDetail", detail);
            response.sendRedirect("detalle-compra.jsp");
            return;
        }
        
        if(request.getParameter("producto")!=null){
            ProductoVentaDao dao = new ProductoVentaDao();
            VentaDao daoV = new VentaDao();
            Usuario usuario = (Usuario) request.getSession().getAttribute("userSession");
            Cliente cliente = new Cliente();
            cliente.setId(usuario.getId());
            Empleado empleado = new Empleado();
            empleado.setId(1);
            Date date = new Date();
            Venta venta = new Venta(cliente, empleado, date);
            
            daoV.create(venta);
            Producto p = new Producto();
            p.setId(Integer.parseInt(request.getParameter("producto")));
            ProductoVenta detalle = new ProductoVenta(p, venta, 1, 1);
            dao.create(detalle);
            response.sendRedirect("catalogo.jsp");
            return;
        }
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
