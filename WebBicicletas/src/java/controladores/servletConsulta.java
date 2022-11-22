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


    private void loadQuery(HttpServletRequest request, HttpServletResponse response) throws IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        ConsultaDao dao = new ConsultaDao();
        Consulta consulta = dao.findById(id);
        request.getSession().setAttribute("queryData", consulta);
        response.sendRedirect("detalle-consulta.jsp");
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getParameter("id")!=null){
            loadQuery(request, response);
            return;
        }
        
        
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
    
    
    private void responder(HttpServletRequest request, HttpServletResponse response) throws IOException{
        try {
            String descripcion = request.getParameter("txtDescripcion");
            int id = Integer.parseInt(request.getParameter("txtId"));
            ConsultaDao dao = new ConsultaDao();
            Consulta consulta = dao.findById(id);
            consulta.setDescripcion(descripcion);
            consulta.setEstado("REVISADO");
            dao.update(consulta);
        } catch (Exception e) {
            System.out.println("Error");
        }finally{
            response.sendRedirect("responder.jsp");
        }
    }
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String option = request.getParameter("btnAction");
        
        if(option.equals("Consultar")){
            consulta(request,response);
            return;
        }
        if(option.equals("Responder")){
            responder(request,response);
            return;
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
