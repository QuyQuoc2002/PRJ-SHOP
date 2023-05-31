/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import enity.Product;
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
public class ProductDAO {

    public int getSize() {

        String sql = "SELECT COUNT(productId) FROM Product";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public List<Product> getAllPerPage(int pageCur, int numberProductPerPage) {

        String sql = "SELECT * FROM Product ORDER BY productId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY; ";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, (pageCur - 1) * numberProductPerPage);
            ps.setObject(2, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product p = Product.builder()
                        .productId(rs.getInt("productId"))
                        .productName(rs.getString("productName"))
                        .productImg(rs.getString("productImg"))
                        .productPrice(rs.getInt("productPrice"))
                        .productDescription(rs.getString("productDescription"))
                        .categoryId(rs.getInt("categoryId"))
                        .productIsFeatured(rs.getBoolean("productIsFeatured"))
                        .productIsRecent(rs.getBoolean("productIsRecent"))
                        .productDeleted(rs.getBoolean("productDeleted"))
                        .build();
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllByRecent() {

        String sql = "SELECT * FROM Product WHERE productIsRecent = 1";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product p = Product.builder()
                        .productId(rs.getInt("productId"))
                        .productName(rs.getString("productName"))
                        .productImg(rs.getString("productImg"))
                        .productPrice(rs.getInt("productPrice"))
                        .productDescription(rs.getString("productDescription"))
                        .categoryId(rs.getInt("categoryId"))
                        .productIsFeatured(rs.getBoolean("productIsFeatured"))
                        .productIsRecent(rs.getBoolean("productIsRecent"))
                        .productDeleted(rs.getBoolean("productDeleted"))
                        .build();
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllByFeatured() {

        String sql = "SELECT * FROM Product WHERE productIsFeatured = 1";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product p = Product.builder()
                        .productId(rs.getInt("productId"))
                        .productName(rs.getString("productName"))
                        .productImg(rs.getString("productImg"))
                        .productPrice(rs.getInt("productPrice"))
                        .productDescription(rs.getString("productDescription"))
                        .categoryId(rs.getInt("categoryId"))
                        .productIsFeatured(rs.getBoolean("productIsFeatured"))
                        .productIsRecent(rs.getBoolean("productIsRecent"))
                        .productDeleted(rs.getBoolean("productDeleted"))
                        .build();
                list.add(p);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
