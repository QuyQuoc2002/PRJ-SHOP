/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Order;
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
public class OrderDAO {
        public List<Order> getAllByOrderStatusIdForUser(int accountId, int orderStatusId) {
        String sql = "select * from [Order] where accountId = ? And orderStatusId = ?";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, accountId);
            ps.setObject(2, orderStatusId);
            ResultSet rs = ps.executeQuery();
            List<Order> list = new ArrayList<>();//
            while (rs.next()) {
                Order obj = Order.builder()
                        .orderId(rs.getInt("orderId"))
                        .accountId(rs.getInt("accountId"))
                        .orderCreateDate(rs.getDate("orderCreateDate"))
                        .orderExpectedDate(rs.getDate("orderExpectedDate"))
                        .orderDoneDate(rs.getDate("orderDoneDate"))
                        .orderNameContact(rs.getString("orderNameContact"))
                        .orderPhoneContact(rs.getString("orderPhoneContact"))
                        .orderAddressContact(rs.getString("orderAddressContact"))
                        .orderStatusId(rs.getInt("orderStatusId"))
                        .build();
                list.add(obj);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
        
        public static void main(String[] args) {
            System.out.println(new OrderDAO().getAllByOrderStatusIdForUser(3, 2));
    }
}
