/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Order;
import java.sql.Connection;
import java.sql.Date;
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
public class OrderDAO implements ICommonDAO<Order> {

    @Override
    public List<Order> getAll() throws SQLException {

        String sql = "SELECT * FROM [Order]";//

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Order> list = new ArrayList<>();//
            while (rs.next()) {
                Order obj = Order.builder()
                        .id(rs.getInt("id"))
                        .nameContact(rs.getString("nameContact"))
                        .phoneContact(rs.getString("phoneContact"))
                        .address(rs.getString("address"))
                        .idAccountDetail(rs.getInt("idAccountDetail"))
                        .orderDate(rs.getDate("orderDate"))
                        .expectedDate(rs.getDate("expectedDate"))
                        .doneDate(rs.getDate("doneDate"))
                        .idStatus(rs.getInt("idStatus"))
                        .total(rs.getLong("total"))
                        .build();
                list.add(obj);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Order> getAll(int idStatus) {

        String sql = "SELECT * FROM [Order] Where idStatus = ?";//

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, idStatus);
            ResultSet rs = ps.executeQuery();

            List<Order> list = new ArrayList<>();//
            while (rs.next()) {
                Order obj = Order.builder()
                        .id(rs.getInt("id"))
                        .nameContact(rs.getString("nameContact"))
                        .phoneContact(rs.getString("phoneContact"))
                        .address(rs.getString("address"))
                        .idAccountDetail(rs.getInt("idAccountDetail"))
                        .orderDate(rs.getDate("orderDate"))
                        .expectedDate(rs.getDate("expectedDate"))
                        .doneDate(rs.getDate("doneDate"))
                        .idStatus(rs.getInt("idStatus"))
                        .total(rs.getLong("total"))
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
    public Order getOne(int id) {
        String sql = "SELECT * FROM [Order] WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Order obj = Order.builder()
                        .id(rs.getInt("id"))
                        .nameContact("nameContact")
                        .phoneContact("phoneContact")
                        .address("address")
                        .idAccountDetail(rs.getInt("idAccountDetail"))
                        .orderDate(rs.getDate("orderDate"))
                        .expectedDate(rs.getDate("expectedDate"))
                        .doneDate(rs.getDate("doneDate"))
                        .idStatus(rs.getInt("idStatus"))
                        .total(rs.getLong("total"))
                        .build();
                return obj;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(Order obj) {
        int check = 0;
        String sql = "INSERT INTO [Order](nameContact, phoneContact, address, idAccountDetail, orderDate, expectedDate, doneDate, idStatus, total)"
                + " VALUES(?, ?, ?, ?, GETDATE(), (GETDATE()+5), ?, ?, ?)";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getNameContact());
            ps.setObject(2, obj.getPhoneContact());
            ps.setObject(3, obj.getAddress());
            ps.setObject(4, obj.getIdAccountDetail());
            ps.setObject(5, obj.getDoneDate());
            ps.setObject(6, obj.getIdStatus());
            ps.setObject(7, obj.getTotal());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public int addOrderReturnId(Order obj) {
        int check = 0;
        String sql = "INSERT INTO [Order](nameContact, phoneContact, address, idAccountDetail, orderDate, expectedDate, doneDate, idStatus, total)"
                + " VALUES(?, ?, ?, ?, GETDATE(), (GETDATE()+5), ?, ?, ?)";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = (con != null) ? con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS) : null;) {
            ps.setObject(1, obj.getNameContact());
            ps.setObject(2, obj.getPhoneContact());
            ps.setObject(3, obj.getAddress());
            ps.setObject(4, obj.getIdAccountDetail());
            ps.setObject(5, obj.getDoneDate());
            ps.setObject(6, obj.getIdStatus());
            ps.setObject(7, obj.getTotal());
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
    public boolean update(Order obj, int id) {
        int check = 0;
        String sql = "UPDATE[Order] SET nameContact = ?, phoneContact =?, address = ?, idAccountDetail = ?, orderDate = ?, expectedDate = ?, doneDate = ?, idStatus = ?, total = ? WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getNameContact());
            ps.setObject(2, obj.getPhoneContact());
            ps.setObject(3, obj.getAddress());
            ps.setObject(1, obj.getIdAccountDetail());
            ps.setObject(5, obj.getOrderDate());
            ps.setObject(6, obj.getExpectedDate());
            ps.setObject(7, obj.getDoneDate());
            ps.setObject(8, obj.getIdStatus());
            ps.setObject(9, obj.getTotal());
            ps.setObject(10, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    
    public boolean updateStatus(int idOrder, int idStatus) {
        int check = 0;
        String sql;
        if(idStatus == 2)
            sql = "UPDATE[Order] SET idStatus = ? WHERE id = ?";
        else {
            sql = "UPDATE[Order] SET idStatus = ?, doneDate = GETDATE() WHERE id = ?";
        }

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, idStatus);
            ps.setObject(2, idOrder);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean delete(int id) {
        int check = 0;
        String sql = "DELETE FROM [Order] Where id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    
    public int getIncome() {
        String sql = "Select SUM(total)/1000000 from [order] Where doneDate is not null ";
        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return 0;
    }

    public boolean setTotal(int id, long xTotal) {
        int check = 0;
        String sql = "UPDATE[Order] SET total = ? WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, xTotal);
            ps.setObject(2, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

}
