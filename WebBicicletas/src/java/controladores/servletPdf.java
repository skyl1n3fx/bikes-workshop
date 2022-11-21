/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
/**
 *
 * @author duguz
 */
@WebServlet(name = "servletPdf", urlPatterns = {"/servletPdf"})
public class servletPdf extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        OutputStream out  = response.getOutputStream();
        
        try {
            Document document = new Document();
            PdfWriter.getInstance(document,out);
            
            document.open();
            
            Paragraph parl= new Paragraph (); 
            Font fonttitulo = new Font (Font. FontFamily.COURIER, 16, Font. BOLD, BaseColor.BLACK);
            parl.add(new Phrase("x4leqxinn <33",fonttitulo));
            parl.setAlignment(Element.ALIGN_CENTER);
            parl.add(new Phrase(Chunk.NEWLINE));
            parl.add(new Phrase(Chunk.NEWLINE));
            document.add(parl);
            
            // Código para imagen
            Image imagen = Image.getInstance("https://data.whicdn.com/images/331936951/original.jpg");
            imagen.setAlignment(Element.ALIGN_CENTER);
            document.add(imagen);
            
            // Code para tabla
            PdfPTable table = new PdfPTable(3);
            PdfPCell cell1 = new PdfPCell(new Paragraph("Código", FontFactory.getFont("Arial",12,Font.BOLD, BaseColor.BLACK)));
            PdfPCell cell2 = new PdfPCell(new Paragraph("Código", FontFactory.getFont("Arial",12,Font.BOLD, BaseColor.BLACK)));
            PdfPCell cell3 = new PdfPCell(new Paragraph("Código", FontFactory.getFont("Arial",12,Font.BOLD, BaseColor.BLACK)));
            
            table.addCell(cell1);
            table.addCell(cell2);
            table.addCell(cell3);
            
            table.addCell("1");
            table.addCell("w");
            table.addCell("r");
            
            //document.add(table);
            document.close();
            
            
        } catch (Exception e) {
        }finally {
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
