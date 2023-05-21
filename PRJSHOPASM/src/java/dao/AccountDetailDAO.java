/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.AccountDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class AccountDetailDAO {
    public boolean add(AccountDetail obj) {
        int check = 0;
        String sql = "INSERT INTO AccountDetail(accountId, accountDetailName, accountDetailDob, accountDetailDoc)"
                + " VALUES(?, ?, ?, GETDATE())";
        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getAccountId());
            ps.setObject(2, obj.getAccountDetailName());
            ps.setObject(3, obj.getAccountDetailDob());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
}
