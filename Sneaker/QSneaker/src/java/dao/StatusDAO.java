/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Status;
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
public class StatusDAO implements ICommonDAO<Status>{

    @Override
    public List<Status> getAll() throws SQLException{

        String sql = "SELECT * FROM Status";//

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Status> list = new ArrayList<>();//
            while (rs.next()) {
                Status obj = Status.builder()
                        .id(rs.getInt("id"))
                        .key(rs.getString("key"))
                        .value(rs.getInt("value"))
                        .name(rs.getString("name"))
                        .build();
                list.add(obj);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }
    
        public List<Status> getAll(String key) throws SQLException{

        String sql = "SELECT * FROM Status WHERE [key] = ?";//

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, key);
            ResultSet rs = ps.executeQuery();

            List<Status> list = new ArrayList<>();//
            while (rs.next()) {
                Status obj = Status.builder()
                        .id(rs.getInt("id"))
                        .key(rs.getString("key"))
                        .value(rs.getInt("value"))
                        .name(rs.getString("name"))
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
    public Status getOne(int id) {
        String sql = "SELECT * FROM Status WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Status obj = Status.builder()
                        .id(rs.getInt("id"))
                        .key(rs.getString("key"))
                        .value(rs.getInt("value"))
                        .name(rs.getString("name"))
                        .build();
                return obj;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(Status obj) {
        int check = 0;
        String sql = "INSERT INTO Status(key, value, name)"
                + " VALUES(?, ?, ?)";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getKey());
            ps.setObject(2, obj.getValue());
            ps.setObject(3, obj.getName());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(Status obj, int id) {
        int check = 0;
        String sql = "UPDATE Status SET key = ?, value = ?, name = ? WHERE id = ?" ;

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getKey());
            ps.setObject(2, obj.getValue());
            ps.setObject(3, obj.getName());
            ps.setObject(4, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean delete(int id) {
                int check = 0;
        String sql = "DELETE FROM Status Where id = ?" ;

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }


}
