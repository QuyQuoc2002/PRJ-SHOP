/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Brand;
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
public class BrandDAO implements ICommonDAO<Brand>{

    @Override
    public List<Brand> getAll() throws SQLException{
        
        String sql = "SELECT * FROM Brand";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Brand> list = new ArrayList<>();
            while (rs.next()) {
                Brand obj = Brand.builder()
                        .id(rs.getInt("id"))
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
    public Brand getOne(int id) {
        String sql = "SELECT * FROM Brand Where id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Brand obj = Brand.builder()
                        .id(rs.getInt("id"))
                        .name(rs.getString("name"))
                        .build();
                return obj;
             }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;    }

    @Override
    public boolean add(Brand obj) {
                int check = 0;
        String sql = "INSERT INTO Brand(name)"
                + " VALUES( ? )";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getName());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(Brand obj, int id) {
        int check = 0;
        String sql = "UPDATE Brand SET name = ? WHERE id = ?" ;

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getName());
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
        String sql = "DELETE FROM Brand Where id = ?" ;

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    
}
