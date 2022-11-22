/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.ClienteDao;
import model.dao.EmpleadoDao;
import model.dto.Cliente;
import model.dto.Empleado;
import model.dto.Usuario;



/**
 *
 * @author duguz
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class servletLogin extends HttpServlet {

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
        
        // Recibimos la data para iniciar sesión
        String email = request.getParameter("email_log");
        String password = request.getParameter("contra_log");
        Cliente cliente = null;
        Empleado empleado = null;
        // Intente buscar si encuentra el empleado por correo y contraseña
        try {
            EmpleadoDao daoE = new EmpleadoDao();
            empleado =  daoE.findUser(email, password);
            
            if(empleado != null){
                Usuario usuario = new Usuario(email,password,3);
                request.getSession().setAttribute("userSession", usuario);
                response.sendRedirect("index.jsp");
                return;
            }
        } catch (Exception e) {
            
        }
        
        try {
            ClienteDao daoC = new ClienteDao();  
            cliente = daoC.findUser(email, password);
            if(cliente != null){
                Usuario usuario = new Usuario(email,password,3);
                request.getSession().setAttribute("userSession", usuario);
                response.sendRedirect("index.jsp");
                return;
            }
        } catch (Exception e) {
        }
        
        if(cliente == null || empleado == null){
            response.sendRedirect("login.jsp");
        }
        
        
        
        
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
