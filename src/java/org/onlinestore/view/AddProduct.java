/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.onlinestore.controller.ProductDAO;
import org.onlinestore.model.FileUpload;
import org.onlinestore.model.Product;

/**
 *
 * @author Nabin
 */

/*@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
   maxFileSize=1024*1024*10,      // 10MB
   maxRequestSize=1024*1024*50)
*/

public class AddProduct extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         HttpSession session = request.getSession();
        response.setContentType("text/html");
        String productname="",oldprice="",newprice="",unit="",description="",scategory="" ,mcategory="";
        String newFileName="";
        String ext="";
        
        //uploading image into folder
        boolean isMultiPart=ServletFileUpload.isMultipartContent(request);
        if(isMultiPart)
        {
            ServletFileUpload upload=new ServletFileUpload();
            try{
                FileItemIterator itr=upload.getItemIterator(request);
                while(itr.hasNext())
                {
                    FileItemStream item=itr.next();             
                                      
                    if(item.isFormField()){
                    String fieldName=item.getFieldName();
                    InputStream is=item.openStream();
                    byte[]b=new byte[is.available()];
                    is.read(b);
                    String value=new String(b);
                    if(fieldName.equals("productname"))
                        productname=value;
                    else if(fieldName.equals("oldprice")) 
                        oldprice=value;
                    else if(fieldName.equals("newprice")) 
                        newprice=value;
                     else if(fieldName.equals("unit"))
                        unit=value;
                    else if(fieldName.equals("description"))
                        description=value;
                    else if(fieldName.equals("maincategory"))
                        mcategory=value;
                    else if(fieldName.equals("subcategory"))
                        scategory=value;
                    }
                      else
                    {
                        String fileName=item.getName().trim();
                        int pos=fileName.indexOf(".");
                         ext=fileName.substring(pos);
                        Random random=new Random();
                        newFileName=String.valueOf(random.nextDouble());
                    
                        String path=getServletContext().getRealPath("/");
                        FileUpload.processFile(path,item,newFileName,ext);                                               
                        
                    }
                }
                  
                
            }
            catch(FileUploadException e)
            {
                e.printStackTrace();
            }
        }
           
        //inserting product into database
        Product ob=new Product();
        ob.setProductname(productname);
        ob.setOldprice(Double.parseDouble(oldprice));
        ob.setNewprice(Double.parseDouble(newprice));
        ob.setUnit(Integer.parseInt(unit));
        ob.setDescription(description);
        ob.setMainCategoryID(Integer.parseInt(mcategory));
        ob.setCategoryID(Integer.parseInt(scategory));
        ob.setImage(newFileName+ext);        
          
        ProductDAO prodDAO=new ProductDAO();
        int status = prodDAO.insertProduct(ob); 
        if (status > 0) {
            session.setAttribute("updateResultSuccess", "Update Success");
            response.sendRedirect("viewProduct.jsp");
        } else {
            session.setAttribute("updateResultFail", "Update Failed");
                    response.sendRedirect("product.jsp");
        }
        
            
//        response.sendRedirect("AddProduct.jsp");
////just for check
//try (PrintWriter out = response.getWriter()) 
//{
// out.println(ob.getCategoryID());
// out.println(ob.getProductname());
// out.println(ob.getNewprice());
// out.println(ob.getOldprice());
// out.println(ob.getUnit());
// out.println(ob.getDescription());
// out.println(ob.getCategoryID());
// out.println(ob.getImage());
//}
  }
}
