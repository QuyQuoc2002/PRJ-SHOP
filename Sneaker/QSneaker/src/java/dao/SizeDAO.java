/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Size;
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
public class SizeDAO implements ICommonDAO<Size> {

    @Override
    public List<Size> getAll() throws SQLException{

        String sql = "SELECT * FROM Size";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Size> list = new ArrayList<>();
            while (rs.next()) {
                Size obj = Size.builder()
                        .id(rs.getInt("id"))
                        .sizeValue(rs.getInt("sizeValue"))
                        .build();
                list.add(obj);
            }
            return list;
        } catch (SQLException e) {
            throw new SQLException();
        }
    }

    public List<Size> getAllByIdModel(int id) {

        String sql = "SELECT s.id, s.sizeValue FROM Product p JOIN Size s ON p.idSize = s.id "
                + "JOIN ModelSneaker ms ON p.idModelSneaker = ms.id "
                + "WHERE ms.id = ? "
                + "ORDER BY sizeValue";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            List<Size> list = new ArrayList<>();
            while (rs.next()) {
                Size obj = Size.builder()
                        .id(rs.getInt("id"))
                        .sizeValue(rs.getInt("sizeValue"))
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
    public Size getOne(int id) {
        String sql = "SELECT * FROM Size Where id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Size obj = Size.builder()
                        .id(rs.getInt("id"))
                        .sizeValue(rs.getInt("sizeValue"))
                        .build();
                return obj;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(Size obj) {
        int check = 0;
        String sql = "INSERT INTO Size(sizeValue)"
                + " VALUES( ? )";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getSizeValue());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(Size obj, int id) {
        int check = 0;
        String sql = "UPDATE Size SET sizeValue = ? WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getSizeValue());
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
        String sql = "DELETE FROM Size Where id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }


}
