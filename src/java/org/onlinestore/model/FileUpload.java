/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.onlinestore.model;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Random;
import org.apache.commons.fileupload.FileItemStream;
/**
 *
 * @author Nabin
 */
public class FileUpload {
    public static void processFile(String path,FileItemStream item,String newFileName,String ext)
    {            
        try{
        File f=new File(path+File.separator+"images");
        if(!f.exists())
            f.mkdir();
        File savedFile=new File(f.getAbsoluteFile()+File.separator+newFileName+ext);
        FileOutputStream fos=new FileOutputStream(savedFile);
        InputStream is=item.openStream();
        int x=0;
        byte[] b=new byte[1024];
        while((x=is.read(b))!=-1)
        {
            fos.write(b,0,x);
        }
        fos.flush();
        fos.close();
        
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
