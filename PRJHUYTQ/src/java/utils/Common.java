/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author DELL
 */
public class Common {
    public static boolean contains(String[] arrays, String e) {
        if (arrays == null) {
            arrays = new String[0];
        }
        for (String a : arrays) {
            if (e.equals(a)) {
                return true;
            }
        }
        return false;
    }
}
