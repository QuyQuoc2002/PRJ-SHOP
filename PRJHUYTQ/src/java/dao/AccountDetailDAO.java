/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.AccountDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class AccountDetailDAO {

    public AccountDetail getOne(int accountId) {
        String sql = "select * from AccountDetail where accountId = ?";//

        try ( Connection connection = SQLServerConnection.getConnection();  PreparedStatement ps = connection.prepareStatement(sql);) {
            ps.setObject(1, accountId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                AccountDetail s = AccountDetail.builder()
                        .accountId(rs.getInt("accountId"))
                        .accountDetailName(rs.getString("accountDetailName"))
                        .accountDetailAvatar(rs.getString("accountDetailAvatar"))
                        .accountDetailDob(rs.getDate("accountDetailDob"))
                        .accountDetailDoc(rs.getDate("accountDetailDoc"))
                        .build();
                return s;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    
    public boolean add(AccountDetail obj) {
        int check = 0;
        String sql = "INSERT INTO AccountDetail(accountId, accountDetailName, accountDetailDoc)"
                + " VALUES(?, ?, GETDATE())";
        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getAccountId());
            ps.setObject(2, obj.getAccountDetailName());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    
    public boolean update(AccountDetail account, int accountId) {
        int check = 0;
        String sql = "UPDATE AccountDetail SET accountDetailName = ?, accountDetailAvatar = ?, accountDetailDob = ? WHERE accountId = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, account.getAccountDetailName());
            ps.setObject(2, account.getAccountDetailAvatar());
            ps.setObject(3, account.getAccountDetailDob());
            ps.setObject(4, accountId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    
    public static void main(String[] args) {
        System.out.println(new AccountDetailDAO().getOne(3));
    }
}
