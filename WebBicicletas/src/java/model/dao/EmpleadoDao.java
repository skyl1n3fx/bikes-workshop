/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import java.util.List;
import model.base.BaseModel;
import model.dto.Empleado;
import org.hibernate.Query;

/**
 *
 * @author duguz
 */
public class EmpleadoDao extends BaseModel<Empleado> {
    
    @Override
    public String getModelName() {
        return Empleado.class.getSimpleName();
    }

   @Override
    public void addTable() {
        try {
            super.openDocument();
            List<Empleado> empleados = super.list();
            super.addParagraph("Listado de empleados");
            PdfPTable table = new PdfPTable(4);
            PdfPCell cell1 = new PdfPCell(new Paragraph("ID", FontFactory.getFont("Arial",12,Font.BOLD, BaseColor.BLACK.BLACK)));
            PdfPCell cell2 = new PdfPCell(new Paragraph("Nombre", FontFactory.getFont("Arial",12,Font.BOLD, BaseColor.BLACK.BLACK)));
            PdfPCell cell3 = new PdfPCell(new Paragraph("Apellido", FontFactory.getFont("Arial",12,Font.BOLD, BaseColor.BLACK.BLACK)));
            PdfPCell cell4 = new PdfPCell(new Paragraph("Sueldo", FontFactory.getFont("Arial",12,Font.BOLD, BaseColor.BLACK)));
            table.addCell(cell1);
            table.addCell(cell2);
            table.addCell(cell3);
            table.addCell(cell4);
           
            for (Empleado empleado : empleados) {
                table.addCell("" + empleado.getId());
                table.addCell(empleado.getNombre());
                table.addCell(empleado.getApellido());
                table.addCell(""+empleado.getSueldoBase());
                

            }

            
            super.addTable(table);
            
        } catch (Exception ex) {
            System.out.println("");
        }finally{
            super.closeDocument();
        }
        
    }
    
    
    public Empleado findUser(String email, String password){
        Empleado empleado = null;
        try {
            super.connect();
            String consulta = "select x from " + getModelName()+ " x where x.email = ? and x.contraEmp = ?";
            Query query = getSession().createQuery(consulta);
            // Variable de sustitución
            query.setParameter(0, email);
            query.setParameter(1, password);
            empleado = (Empleado) query.list().get(0);
            
        } catch (Exception e) {
            System.out.println("Error al buscar " + e.getMessage());
        }finally{
            super.disconnect();
        }
        return empleado;
    }

}
