/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.AddressContact;
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
public class AddressContactDAO implements ICommonDAO<AddressContact>{

    @Override
    public List<AddressContact> getAll() throws SQLException{

        String sql = "SELECT * FROM AddressContact";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<AddressContact> list = new ArrayList<>();
            while (rs.next()) {
                AddressContact obj = AddressContact.builder()
                        .id(rs.getInt("id"))
                        .idAccountDetail(rs.getInt("idAccountDetail"))
                        .address(rs.getString("address"))
                        .nameContact(rs.getString("nameContact"))
                        .phoneContact(rs.getString("phoneContact"))
                        .addressDefault(rs.getBoolean("addressDefault"))
                        .build();
                list.add(obj);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    
    public List<AddressContact> getAllByAccountDetailId(int idAccountDetail) {

        String sql = "SELECT * FROM AddressContact WHERE idAccountDetail = ? ORDER BY addressDefault DESC";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, idAccountDetail);
            ResultSet rs = ps.executeQuery();
            List<AddressContact> list = new ArrayList<>();
            while (rs.next()) {
                AddressContact obj = AddressContact.builder()
                        .id(rs.getInt("id"))
                        .idAccountDetail(rs.getInt("idAccountDetail"))
                        .address(rs.getString("address"))
                        .nameContact(rs.getString("nameContact"))
                        .phoneContact(rs.getString("phoneContact"))
                        .addressDefault(rs.getBoolean("addressDefault"))
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
    public AddressContact getOne(int xId) {
        String sql = "SELECT * FROM AddressContact WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, xId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                AddressContact obj = AddressContact.builder()
                        .id(rs.getInt("id"))
                        .idAccountDetail(rs.getInt("idAccountDetail"))
                        .address(rs.getString("address"))
                        .nameContact(rs.getString("nameContact"))
                        .phoneContact(rs.getString("phoneContact"))
                        .addressDefault(rs.getBoolean("addressDefault"))
                        .build();
                return obj;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(AddressContact obj) {
        int check = 0;
        String sql = "INSERT INTO AddressContact(idAccountDetail, address, nameContact, phoneContact, addressDefault)"
                + " VALUES(?, ?, ?, ?, ?)";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getIdAccountDetail());
            ps.setObject(2, obj.getAddress());
            ps.setObject(3, obj.getNameContact());
            ps.setObject(4, obj.getPhoneContact());
            ps.setObject(5, obj.isAddressDefault());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(AddressContact obj, int xId) {
        int check = 0;
        String sql = "UPDATE AddressContact SET idAccountDetail = ?, address = ?, nameContact = ?, phoneContact = ?, addressDefault = ? WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getIdAccountDetail());
            ps.setObject(2, obj.getAddress());
            ps.setObject(3, obj.getNameContact());
            ps.setObject(4, obj.getPhoneContact());
            ps.setObject(5, obj.isAddressDefault());
            ps.setObject(6, xId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    
    public boolean update(String nameContact, String phoneContact, String address, int xId) {
        int check = 0;
        String sql = "UPDATE AddressContact SET nameContact = ?, phoneContact = ?, address = ? WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, nameContact);
            ps.setObject(2, phoneContact);
            ps.setObject(3, address);
            ps.setObject(4, xId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    
    public boolean update(boolean addressDefault, int xId) {
        int check = 0;
        String sql = "UPDATE AddressContact SET addressDefault = ? WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, addressDefault);
            ps.setObject(2, xId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean delete(int xId) {
                int check = 0;
        String sql = "DELETE FROM AddressContact Where id = ?" ;

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, xId);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }
    
    public static void main(String[] args) {
        System.out.println(new AddressContactDAO().getAllByAccountDetailId(4));
    }
}
