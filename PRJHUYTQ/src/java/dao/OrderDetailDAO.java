/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.OrderDetail;
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
public class OrderDetailDAO {

    public List<OrderDetail> getAllOrderDetail(int orderId) {
        String sql = "select * from [OrderDetail] where orderId = ? ";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, orderId);
            ResultSet rs = ps.executeQuery();
            List<OrderDetail> list = new ArrayList<>();//
            while (rs.next()) {
                OrderDetail obj = OrderDetail.builder()
                        .orderId(rs.getInt("orderId"))
                        .productId(rs.getInt("productId"))
                        .orderDetailProductImg(rs.getString("orderDetailProductImg"))
                        .orderDetailProductName(rs.getString("orderDetailProductName"))
                        .orderDetailPriceProduct(rs.getInt("orderDetailPriceProduct"))
                        .orderDetailSizeValue(rs.getString("orderDetailSizeValue"))
                        .orderDetailQuantity(rs.getInt("orderDetailQuantity"))
                        .build();
                list.add(obj);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
}
