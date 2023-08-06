/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Account;
import entity.Order;
import entity.OrderStatus;
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
public class OrderStatusDAO {
        public List<OrderStatus> getAll() {

        String sql = "Select * from OrderStatus";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<OrderStatus> list = new ArrayList<>();
            while (rs.next()) {
                OrderStatus s = OrderStatus.builder()
                        .orderStatusId(rs.getInt("orderStatusId"))
                        .orderStatusName(rs.getString("orderStatusName"))
                        .build();
                list.add(s);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
        
           public List<Order> getAllByOrderStatusIdForAdmin(int pageCur, int numberOrderPerPage, int orderStatusId) {
        String sql = "select * from [order] o join account a ON o.accountId = a.accountId WHERE o.orderStatusId = ?\n"
                + "ORDER BY o.orderId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY; ";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, orderStatusId);
            ps.setObject(2, (pageCur - 1) * numberOrderPerPage);
            ps.setObject(3, numberOrderPerPage);
            ResultSet rs = ps.executeQuery();
            List<Order> list = new ArrayList<>();//
            while (rs.next()) {
                Order obj = Order.builder()
                        .orderId(rs.getInt("orderId"))
                        .account(Account.builder()
                                .accountId(rs.getInt("accountId"))
                                .accountEmail(rs.getString("accountEmail"))
                                .accountPassword(rs.getString("accountPassword"))
                                .accountDeleted(rs.getBoolean("accountDeleted"))
                                .build())
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

    public int getSizeByOrderStatusIdForAdmin(int orderStatusId) {

        String sql = ""
                + "Select count (orderId) as total FROM \n"
                + "(\n"
                + "	select orderId from [order] o join account a ON o.accountId = a.accountId WHERE o.orderStatusId = ?\n"
                + ") as a;";
        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, orderStatusId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }
}
