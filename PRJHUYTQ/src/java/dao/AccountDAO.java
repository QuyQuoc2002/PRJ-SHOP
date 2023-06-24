/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Account;
import entity.Role;
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

    public Account authenticate(String username, String password) {

        String sql = "Select "
                + " a.accountId,"
                + " a.accountEmail,"
                + " a.accountPassword,"
                + " a.roleId,"
                + " a.accountDeleted,"
                + " r.roleName"
                + " From Account a join Role r on a.roleId = r.roleId "
                + " Where a.accountEmail = ? And a.accountPassword = ? AND a.accountDeleted = 0";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, username);
            ps.setObject(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = Account.builder()
                        .accountId(rs.getInt("accountId"))
                        .accountEmail(rs.getString("accountEmail"))
                        .accountPassword(rs.getString("accountPassword"))
                        .role(Role.builder()
                                .roleId(rs.getInt("roleId"))
                                .roleName(rs.getString("roleName"))
                                .build())
                        .accountDeleted(rs.getBoolean("accountDeleted"))
                        .build();
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public int register(Account obj) {
        int check = 0;
        String sql = "INSERT INTO Account(accountEmail, accountPassword, roleId, accountDeleted)"
                + " VALUES(?, ?, ?, ?)";
        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
            ps.setObject(1, obj.getAccountEmail());
            ps.setObject(2, obj.getAccountPassword());
            ps.setObject(3, 2);
            ps.setObject(4, false);
            check = ps.executeUpdate();
            if (check > 0) {
                try ( ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        int accountId = rs.getInt(1);
                        return accountId;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public Account getOneByEmail(String email) {

        String sql = "Select * FROM Account WHERE accountEmail = ?";

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = Account.builder().accountEmail(rs.getString("accountEmail")).build();
                return a;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new AccountDAO().register(Account.builder().accountEmail("asd").accountPassword("asd").build()));
    }

    public boolean changePassword(int accountId, String password) {
        int check = 0;
        String sql = "UPDATE Account SET accountPassword = ? WHERE accountId = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, password);
            ps.setObject(2, accountId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    
}
