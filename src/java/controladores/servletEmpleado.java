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
import modelo.dao.EmpleadoDao;
import modelo.dto.Afp;
import modelo.dto.Empleado;
import modelo.dto.Salud;
import modelo.dto.Tipocuenta;

/**
 *
 * @author duguz
 */
public class servletEmpleado extends HttpServlet {

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
        EmpleadoDao dao  = new EmpleadoDao(); 
        
        if (request.getParameter("btnAccion").equals("Agregar")){
            
            String nombre = request.getParameter("txtNombre");
            String apellido = request.getParameter("txtApellido");
            String rut = request.getParameter("txtRut");
            String email = request.getParameter("txtEmail");
            int sueldoBase = Integer.parseInt(request.getParameter("txtSueldo"));
            int idAfp = Integer.parseInt(request.getParameter("cboAfp"));
            int idSalud = Integer.parseInt(request.getParameter("cboSalud"));
            String userEmpe = request.getParameter("txtUsuario");
            String contraEmp = request.getParameter("txtContrasena");
            int idTipoCuenta = Integer.parseInt(request.getParameter("cboTipo"));
            
            Afp afp = new Afp(idAfp);
            Salud salud = new Salud(idSalud);
            Tipocuenta tipocuenta = new Tipocuenta(idTipoCuenta);
            Empleado empleado = new Empleado(afp, salud, tipocuenta, rut, nombre, apellido, email, sueldoBase, userEmpe, contraEmp);
            
            if (dao.agregar(empleado)){
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
