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
import model.dao.ConsultaDao;
import model.dto.Consulta;
import model.dto.Usuario;

/**
 *
 * @author duguz
 */
@WebServlet(name = "consulta", urlPatterns = {"/consulta"})
public class servletConsulta extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

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

 
    private void consulta(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try {
            String descripcion = request.getParameter("txtDescripcion");
            Usuario user = (Usuario) request.getSession().getAttribute("userSession");
            Consulta consulta = new Consulta(descripcion, user.getId(), "PENDIENTE");
            ConsultaDao dao = new ConsultaDao();
            if(dao.create(consulta)){
                System.out.println("Enviado");
               
            }
            
        } catch (Exception e) {
            System.out.println("Error");
        }finally{
            response.sendRedirect("index.jsp");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("btnAction");
        
        if(option.equals("Consultar")){
            consulta(request,response);
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
