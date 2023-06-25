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
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author DELL
 */
public class AccountDetailDAO implements ICommonDAO<AccountDetail>{

    @Override
    public List<AccountDetail> getAll() throws SQLException{

        String sql = "SELECT * FROM AccountDetail";//

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<AccountDetail> list = new ArrayList<>();//
            while (rs.next()) {
                AccountDetail obj = AccountDetail.builder()
                        .id(rs.getInt("id"))
                        .idAccount(rs.getInt("idAccount"))
                        .nickName(rs.getString("nickName"))
                        .dob(rs.getDate("dob"))
                        .doc(rs.getDate("doc"))
                        .build();
                list.add(obj);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public AccountDetail getOne(int id) {
        String sql = "SELECT * FROM AccountDetail WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                AccountDetail obj = AccountDetail.builder()
                        .id(rs.getInt("id"))
                        .idAccount(rs.getInt("idAccount"))
                        .nickName(rs.getString("nickName"))
                        .dob(rs.getDate("dob"))
                        .doc(rs.getDate("doc"))
                        .build();
                return obj;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    
    public AccountDetail getOneByIdAccount(int id) {
        String sql = "SELECT * FROM AccountDetail WHERE idAccount = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                AccountDetail obj = AccountDetail.builder()
                        .id(rs.getInt("id"))
                        .idAccount(rs.getInt("idAccount"))
                        .nickName(rs.getString("nickName"))
                        .dob(rs.getDate("dob"))
                        .doc(rs.getDate("doc"))
                        .build();
                return obj;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(AccountDetail obj) {
        int check = 0;
        String sql = "INSERT INTO AccountDetail(idAccount, nickName, dob, doc)"
                + " VALUES(?, ?, ?, GETDATE())";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getIdAccount());
            ps.setObject(2, obj.getNickName());
            ps.setObject(3, obj.getDob());

            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(AccountDetail obj, int id) {
        int check = 0;
        String sql = "UPDATE AccountDetail SET idAccount = ?, nickName = ?, dob = ?, doc = ? WHERE id = ?" ;

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getIdAccount());
            ps.setObject(2, obj.getNickName());
            ps.setObject(3, obj.getDob());
            ps.setObject(4, obj.getDoc());
            ps.setObject(5, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    
    public boolean update(String nickName, Date dob, int id) {
        int check = 0;
        String sql = "UPDATE AccountDetail SET nickName = ?, dob = ? WHERE id = ?" ;

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, nickName);
            ps.setObject(2, dob);
            ps.setObject(3, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean delete(int id) {
                int check = 0;
        String sql = "DELETE FROM AccountDetail Where id = ?" ;

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }


}
