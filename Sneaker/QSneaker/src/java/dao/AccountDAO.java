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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class AccountDAO implements ICommonDAO<Account> {

    public Account login(String phoneNumber, String password) {
        String query = "SELECT * FROM account WHERE phoneNumber = ? AND password = ?";
        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
            if (ps != null) {
                ps.setObject(1, phoneNumber);
                ps.setObject(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs != null && rs.next()) {
                    Account obj = Account.builder()
                            .id(rs.getInt("id"))
                            .phoneNumber(rs.getString("phoneNumber"))
                            .password(rs.getString("password"))
                            .idStatus(rs.getInt("idStatus"))
                            .idRole(rs.getInt("idRole"))
                            .build();
                    return obj;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    
    public boolean isCheckDuplicatePhone(String phoneNumber) {
        String sql = "SELECT * FROM Account WHERE phoneNumber = ?";
        try( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setString(1, phoneNumber);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        } 
        return false;
    }

    @Override
    public List<Account> getAll() throws SQLException{

        String sql = "SELECT * FROM Account";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Account> list = new ArrayList<>();
            while (rs.next()) {
                Account obj = Account.builder()
                        .id(rs.getInt("id"))
                        .phoneNumber(rs.getString("phoneNumber"))
                        .password(rs.getString("password"))
                        .idStatus(rs.getInt("idStatus"))
                        .idRole(rs.getInt("idRole"))
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
    public Account getOne(int id) {
        String sql = "SELECT * FROM Account WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account obj = Account.builder()
                        .id(rs.getInt("id"))
                        .phoneNumber(rs.getString("phoneNumber"))
                        .password(rs.getString("password"))
                        .idStatus(rs.getInt("idStatus"))
                        .idRole(rs.getInt("idRole"))
                        .build();
                return obj;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(Account obj) {
        int check = 0;
        String sql = "INSERT INTO Account(phoneNumber, password, idStatus, idRole)"
                + " VALUES( ?, ?, ?, ?)";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getPhoneNumber());
            ps.setObject(2, obj.getPassword());
            ps.setObject(3, obj.getIdStatus());
            ps.setObject(4, obj.getIdRole());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    
    public int addReturnId(Account obj) {
        int check = 0;
        String sql = "INSERT INTO Account(phoneNumber, password, idStatus, idRole)"
                + " VALUES( ?, ?, ?, ?)";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = (con != null) ? con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS) : null;) {
            ps.setObject(1, obj.getPhoneNumber());
            ps.setObject(2, obj.getPassword());
            ps.setObject(3, obj.getIdStatus());
            ps.setObject(4, obj.getIdRole());
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

    @Override
    public boolean update(Account obj, int id) {
        int check = 0;
        String sql = "UPDATE Account SET phoneNumber = ?, password = ?, idStatus = ?, idRole = ? WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getPhoneNumber());
            ps.setObject(2, obj.getPassword());
            ps.setObject(3, obj.getIdStatus());
            ps.setObject(4, obj.getIdRole());
            ps.setObject(5, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    
    public boolean changePW(String newPass, int id) {
        int check = 0;
        String sql = "UPDATE Account SET password = ? WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, newPass);
            ps.setObject(2, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean delete(int id) {
        int check = 0;
        String sql = "UPDATE Account SET idStatus = 7 Where id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }


}
