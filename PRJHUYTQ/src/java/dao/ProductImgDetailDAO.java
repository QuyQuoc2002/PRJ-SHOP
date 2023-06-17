/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.ProductImgDetail;
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
public class ProductImgDetailDAO {

    public List<ProductImgDetail> getAll(int productId) {

        String sql = "select * from ProductImgDetail Where productId = ?";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, productId);
            ResultSet rs = ps.executeQuery();

            List<ProductImgDetail> list = new ArrayList<>();//
            while (rs.next()) {
                ProductImgDetail s = ProductImgDetail.builder()
                        .productImgDetailId(rs.getInt("productImgDetailId"))
                        .productId(rs.getInt("productId"))
                        .productImgDetailPath(rs.getString("productImgDetailPath"))
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
        System.out.println(new ProductImgDetailDAO().getAll(12));
    }
}
