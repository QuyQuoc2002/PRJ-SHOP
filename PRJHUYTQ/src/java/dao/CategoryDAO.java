/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class CategoryDAO {

    public List<Category> getAll() {

        String sql = "Select *,(SELECT COUNT(productId) FROM Product WHERE categoryId = c.categoryId) as numberProduct  from Category c";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Category> list = new ArrayList<>();//
            while (rs.next()) {
                Category s = Category.builder()
                        .categoryId(rs.getInt("categoryId"))
                        .categoryName(rs.getString("categoryName"))
                        .categoryIcon(rs.getString("categoryIcon"))
                        .numberProduct(rs.getInt("numberProduct"))
                        .build();
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new CategoryDAO().getAll());
        System.out.println("");
    }
}
