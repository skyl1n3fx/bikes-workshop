/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.base;
import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author duguz
 */
public abstract class GeneratePDF <T>{
    private Font font = new Font (Font. FontFamily.COURIER, 16, Font. BOLD, BaseColor.BLACK);
    private Document document = new Document();
    private String dateTime = DateTimeFormatter.ofPattern("dd MMM, yyyy hh:mm:ss a").format(LocalDateTime.now());
    
    public Document getDocument(){
        return this.document;
    }
    
    public void openDocument() throws DocumentException{
        this. document.open();
        Paragraph p = new Paragraph ();
        p.add(new Phrase("Archivo autogenerado el " + this.dateTime,new Font (Font. FontFamily.COURIER, 12, Font. BOLD, BaseColor.BLACK)));
        p.setAlignment(Element.ALIGN_TOP);
        p.add(new Phrase(Chunk.NEWLINE));
        p.add(new Phrase(Chunk.NEWLINE));
        p.add(new Phrase(Chunk.NEWLINE));
        this.document.add(p);   
    }    
            
    public void addParagraph(String text) throws DocumentException{
      Paragraph p = new Paragraph ();
      p.add(new Phrase(text,this.font));
      p.setAlignment(Element.ALIGN_CENTER);
      p.add(new Phrase(Chunk.NEWLINE));
      p.add(new Phrase(Chunk.NEWLINE));
      this.document.add(p);
    }

    public void addImage(String url) throws DocumentException, IOException{
      Image img = Image.getInstance(url);
      img.setAlignment(Element.ALIGN_CENTER);
      document.add(img);
    }
    
    public Image imageTable(String url) throws DocumentException, IOException{
      Image img = Image.getInstance(url);
      img.setAlignment(Element.ALIGN_CENTER);
      return img;
    }
    
    public abstract void addTable();
    
    public void addTable(PdfPTable table) throws DocumentException{
        this.document.add(table);
    }

    public void closeDocument(){
      this.document.close();
    }
    


  }
