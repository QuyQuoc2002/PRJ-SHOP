/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.AccountContact;
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
public class AccountContactDAO {

    public List<AccountContact> getAll(int accountId) {
        String sql = "select * from AccountContact where accountId = ? ORDER BY accountContactDefault DESC";

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, accountId);
            ResultSet rs = ps.executeQuery();
            List<AccountContact> list = new ArrayList<>();//
            while (rs.next()) {
                AccountContact obj = AccountContact.builder()
                        .accountContactId(rs.getInt("accountContactId"))
                        .accountId(rs.getInt("accountId"))
                        .accountContactAddress(rs.getString("accountContactAddress"))
                        .accountContactName(rs.getString("accountContactName"))
                        .accountContactMobile(rs.getString("accountContactMobile"))
                        .accountContactDefault(rs.getBoolean("accountContactDefault"))
                        .build();
                list.add(obj);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public boolean setAccountContactDefaut(int accountContactId) {
        int check = 0;
        String sql = "UPDATE AccountContact SET accountContactDefault = '0' WHERE accountContactDefault = '1'\n"
                + "UPDATE AccountContact SET accountContactDefault = '1' WHERE accountContactId= ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, accountContactId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean add(AccountContact obj) {
        int check = 0;
        String sql = "INSERT INTO AccountContact(accountId, accountContactAddress, accountContactName, accountContactMobile, accountContactDefault)"
                + " VALUES(?, ?, ?, ?, '0')";
        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getAccountId());
            ps.setObject(2, obj.getAccountContactAddress());
            ps.setObject(3, obj.getAccountContactName());
            ps.setObject(4, obj.getAccountContactMobile());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean update(String accountContactAddress, String accountContactName, String accountContactMobile, int accountContactId) {
        int check = 0;
        String sql = "UPDATE AccountContact SET accountContactAddress = ?, accountContactName = ?, accountContactMobile = ? WHERE accountContactId = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, accountContactAddress);
            ps.setObject(2, accountContactName);
            ps.setObject(3, accountContactMobile);
            ps.setObject(4, accountContactId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean delete(int accountContactId) {
        int check = 0;
        String sql = "DELETE FROM AccountContact Where accountContactId = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, accountContactId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
}
