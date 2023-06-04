/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Category;
import entity.Product;
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

    public List<Product> getListProductPerPage(int numberProductPerPage, int pageCur) {

        String sql = "  SELECT * FROM Product"
                + "	Order BY productId\n"
                + "OFFSET ? ROWS \n"
                + "FETCH NEXT ? ROWS ONLY";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(2, numberProductPerPage);
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product s = Product.builder()
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
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getListProductPerPageByCategoryId(int numberProductPerPage, int pageCur, int categoryId) {

        String sql = "  SELECT * FROM Product WHERE categoryId = ?"
                + "	Order BY productId\n"
                + "OFFSET ? ROWS \n"
                + "FETCH NEXT ? ROWS ONLY ";

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(2, pageCur * numberProductPerPage - numberProductPerPage);
            ps.setObject(3, numberProductPerPage);
            ps.setObject(1, categoryId);
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product s = Product.builder()
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
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int size() {

        String sql = "SELECT COUNT(productId) as total\n"
                + "  FROM Product";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            int total = 0;
            while (rs.next()) {
                total = rs.getInt("total");
            }
            return total;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }
    
    public int sizeByCategory(int categoryId) {

        String sql = "SELECT COUNT(productId) as total\n"
                + "  FROM Product WHERE categoryId = ?";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, categoryId);
            ResultSet rs = ps.executeQuery();
            int total = 0;
            while (rs.next()) {
                total = rs.getInt("total");
            }
            return total;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public List<Product> getAllByFeatured() {

        String sql = "SELECT * FROM Product Where productIsFeatured = 1";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product s = Product.builder()
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
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllByRecent() {

        String sql = "SELECT * FROM Product Where productIsRecent = 1";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product s = Product.builder()
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
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new ProductDAO().getListProductPerPageByCategoryId(9, 1, 2));
        System.out.println("");
    }
}
