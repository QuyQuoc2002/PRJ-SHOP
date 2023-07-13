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
import java.sql.Statement;

/**
 *
 * @author Admin
 */
public class OrderDAO {
    public int add(Order obj) {
        int check = 0;
        String sql = "INSERT INTO [Order](accountId, orderCreateDate, orderExpectedDate, orderNameContact, orderPhoneContact, orderAddressContact, orderStatusId)"
                + " VALUES(?, GETDATE(), GETDATE() + 5, ?, ?, ?, 1)";
        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = (con != null) ? con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS) : null;) {
            ps.setObject(1, obj.getAccount().getAccountId());
            ps.setObject(2, obj.getOrderNameContact());
            ps.setObject(3, obj.getOrderPhoneContact());
            ps.setObject(4, obj.getOrderAddressContact());

            check = ps.executeUpdate();
            if (check > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }
}
