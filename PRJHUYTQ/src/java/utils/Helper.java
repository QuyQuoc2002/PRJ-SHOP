/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.Random;
//11092002
/**
 *
 * @author DELL
 */
public class Helper {

    private Helper() {
    }

    ;
    public static String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }
    
    public static Properties getPropertiesByFileName(String fileName) {
        Properties properties = new Properties();
        try ( InputStream inputStream = Helper.class.getClassLoader().getResourceAsStream(fileName)) {
            properties.load(inputStream);
        } catch (IOException e) {
            System.out.println(e);
        }
        return properties;
    }
    
    public static void main(String[] args) {
        System.out.println(getRandomNumberString());
        Properties pro = getPropertiesByFileName("const/const.properties");
        System.out.println(pro.getProperty("admin.email"));
    }
}
