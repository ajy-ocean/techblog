package com.weebtech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

    public static boolean deleteFile(String path) {

        boolean flag = false;
        
        try{
            File file = new File(path);
            flag = file.delete();

        }catch (Exception e){
            e.printStackTrace();
        }

        return flag;
    }

    public static boolean saveFile(InputStream inputStream, String path){
        boolean flag = false;

        try(FileOutputStream fos = new FileOutputStream(path)){
            byte[] byteRead = new byte[inputStream.available()];
            inputStream.read(byteRead);
            fos.write(byteRead);
            fos.flush();
            flag = true;

        }catch(Exception e){
            e.printStackTrace();
        }

        return flag;
    }

}
