/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DELL
 */
public class AccountDAO {

    public int register(Account obj) {
        int check = 0;
        String sql = "INSERT INTO Account(accountEmail, accountPassword, roleId, accountDeleted)"
                + " VALUES(?, ?, 2, 0)";
        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = (con != null) ? con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS) : null;) {
            ps.setObject(1, obj.getAccountEmail());
            ps.setObject(2, obj.getAccountPassword());
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
    
    public static void main(String[] args) {
        System.out.println(new AccountDAO().register(Account.builder().accountEmail("dsa").accountPassword("sadad").build()));
    }
}
