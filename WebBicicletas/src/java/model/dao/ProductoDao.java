/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.base.BaseModel;
import model.dto.Producto;

/**
 *
 * @author duguz
 */
public class ProductoDao extends BaseModel<Producto>{
    
    @Override
    public String getModelName() {
        return Producto.class.getSimpleName();
    }

    @Override
    public void addTable() {
        try {
            super.openDocument();
            List<Producto> products = super.list();
            super.addParagraph("Listado de productos");
            PdfPTable table = new PdfPTable(4);
            PdfPCell cell1 = new PdfPCell(new Paragraph("ID", FontFactory.getFont("Arial",12,Font.BOLD, BaseColor.BLACK.BLACK)));
            PdfPCell cell2 = new PdfPCell(new Paragraph("Descripcion", FontFactory.getFont("Arial",12,Font.BOLD, BaseColor.BLACK)));
            PdfPCell cell3 = new PdfPCell(new Paragraph("Precio", FontFactory.getFont("Arial",12,Font.BOLD, BaseColor.BLACK)));
            PdfPCell cell4 = new PdfPCell(new Paragraph("Foto", FontFactory.getFont("Arial",12,Font.BOLD, BaseColor.BLACK)));
            table.addCell(cell1);
            table.addCell(cell2);
            table.addCell(cell3);
            table.addCell(cell4);
           
            for (Producto product : products) {
                table.addCell("" + product.getId());
                table.addCell(product.getDescripcion());
                table.addCell("$"+product.getPrecio());
                try {
                    table.addCell(super.imageTable(product.getImagen()));
                } catch (IOException ex) {
                    Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
                }
                

            }

            
            super.addTable(table);
            
        } catch (DocumentException ex) {
            Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            super.closeDocument();
        }
        
    }
    
    
}
