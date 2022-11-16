/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.dao.ClienteDao;
import modelo.dto.Cliente;
import modelo.dto.Tipocuenta;

/**
 *
 * @author duguz
 */
public class servletCliente extends HttpServlet {

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
        ClienteDao dao  = new ClienteDao(); 
        
        if (request.getParameter("btnAccion").equals("Agregar")){
            String nombre = request.getParameter("nombre_reg");
            String apellido = request.getParameter("apellido_reg");
            String direccion = request.getParameter("direccion_reg");
            int telefono = Integer.parseInt(request.getParameter("telefono_reg"));
            String email = request.getParameter("email_reg");
            String contrasena = request.getParameter("contra1_reg");
            int idTipoCuenta = Integer.parseInt(request.getParameter("cboTipo"));
            Tipocuenta tipocuenta = new Tipocuenta(idTipoCuenta);
            Cliente cliente = new Cliente(tipocuenta, nombre, apellido, direccion, telefono, email, contrasena);
            
            if (dao.agregar(cliente)){
                System.out.println("Agregado Correctamente");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else{
                System.out.println("Error al agregar");
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
