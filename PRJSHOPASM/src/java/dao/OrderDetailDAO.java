/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Cart;
import entity.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {

    public boolean add(Cart obj, int orderId) {
        int check = 0;
        String sql = "INSERT INTO OrderDetail(orderId, productId, orderDetailProductImg, orderDetailProductName, orderDetailPriceProduct, orderDetailSizeValue, orderDetailQuantity)"
                + " VALUES(?, ?, ?, ?, ? ,? ,?)";
        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, orderId);
            ps.setObject(2, obj.getProductId());
            ps.setObject(3, obj.getOrderDetailProductImg());
            ps.setObject(4, obj.getOrderDetailProductName());
            ps.setObject(5, obj.getOrderDetailPriceProduct());
            ps.setObject(6, obj.getOrderDetailSizeValue());
            ps.setObject(7, obj.getOrderDetailQuantity());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

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
