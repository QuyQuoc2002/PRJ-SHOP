/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Product;
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
public class ProductDAO implements ICommonDAO<Product> {

    @Override
    public List<Product> getAll() throws SQLException {

        String sql = "SELECT * FROM Product";//

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product obj = Product.builder()
                        .id(rs.getInt("id"))
                        .idModelSneaker(rs.getInt("idModelSneaker"))
                        .name(rs.getString("name"))
                        .unitPrice(rs.getInt("unitPrice"))
                        .img(rs.getString("img"))
                        .idSize(rs.getInt("idSize"))
                        .quantity(rs.getInt("quantity"))
                        .idStatus(rs.getInt("idStatus"))
                        .build();
                list.add(obj);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAll(int idModel) {

        String sql = "SELECT * FROM Product Where idModelSneaker = ?";//

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, idModel);
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product obj = Product.builder()
                        .id(rs.getInt("id"))
                        .idModelSneaker(rs.getInt("idModelSneaker"))
                        .name(rs.getString("name"))
                        .unitPrice(rs.getInt("unitPrice"))
                        .img(rs.getString("img"))
                        .idSize(rs.getInt("idSize"))
                        .quantity(rs.getInt("quantity"))
                        .idStatus(rs.getInt("idStatus"))
                        .build();
                list.add(obj);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public List<Product> getAllByIdOrder(int idOrder) {

        String sql = "Select p.img, p.id FROM OrderDetail od Join Product p ON od.idProduct = p.id Where idOrder = ?";//

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, idOrder);
            ResultSet rs = ps.executeQuery();

            List<Product> list = new ArrayList<>();//
            while (rs.next()) {
                Product obj = Product.builder()
                        .id(rs.getInt("id"))
                        .img(rs.getString("img"))
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
    public Product getOne(int id) {
        String sql = "SELECT * FROM Product WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product obj = Product.builder()
                        .id(rs.getInt("id"))
                        .idModelSneaker(rs.getInt("idModelSneaker"))
                        .name(rs.getString("name"))
                        .unitPrice(rs.getInt("unitPrice"))
                        .img(rs.getString("img"))
                        .idSize(rs.getInt("idSize"))
                        .quantity(rs.getInt("quantity"))
                        .idStatus(rs.getInt("idStatus"))
                        .build();
                return obj;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    public Product getOne(int idModelSneaker, int idSize) {
        String sql = "SELECT * FROM Product WHERE idModelSneaker = ? AND idSize = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, idModelSneaker);
            ps.setObject(2, idSize);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product obj = Product.builder()
                        .id(rs.getInt("id"))
                        .idModelSneaker(rs.getInt("idModelSneaker"))
                        .name(rs.getString("name"))
                        .unitPrice(rs.getInt("unitPrice"))
                        .img(rs.getString("img"))
                        .idSize(rs.getInt("idSize"))
                        .quantity(rs.getInt("quantity"))
                        .idStatus(rs.getInt("idStatus"))
                        .build();
                return obj;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

    @Override
    public boolean add(Product productDetail) {
        int check = 0;
        String sql = "INSERT INTO Product(idModelSneaker, name, unitPrice, img, idSize, quantity, idStatus)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?)";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, productDetail.getIdModelSneaker());
            ps.setObject(2, productDetail.getName());
            ps.setObject(3, productDetail.getUnitPrice());
            ps.setObject(4, productDetail.getImg());
            ps.setObject(5, productDetail.getIdSize());
            ps.setObject(6, productDetail.getQuantity());
            ps.setObject(7, productDetail.getIdStatus());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(Product productDetail, int id) {
        int check = 0;
        String sql = "UPDATE Product SET idModelSneaker = ?, name = ?, unitPrice = ?, img = ?, idSize = ?, quantity = ?, idStatus WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, productDetail.getIdModelSneaker());
            ps.setObject(2, productDetail.getName());
            ps.setObject(3, productDetail.getUnitPrice());
            ps.setObject(4, productDetail.getImg());
            ps.setObject(5, productDetail.getIdSize());
            ps.setObject(6, productDetail.getQuantity());
            ps.setObject(7, productDetail.getIdStatus());
            ps.setObject(8, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public boolean update(String name, int price, int id) {
        int check = 0;
        String sql = "UPDATE Product SET name = ?, unitPrice = ?  WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, name);
            ps.setObject(2, price);
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
        String sql = "DELETE FROM Product Where id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public List<Integer> getSoldQuantityByIdBrand() {
        String sql = "Select SUM(quantity), idBrand FROM\n"
                + "(\n"
                + "	Select od.quantity, m.idBrand From [Order] o join [OrderDetail] od ON o.id = od.idOrder\n"
                + "							join Product p On p.id = od.idProduct\n"
                + "							join ModelSneaker m ON p.idModelSneaker = m.id\n"
                + "	Where o.idStatus = 3 \n"
                + ") tb1\n"
                + "\n"
                + "Group By idBrand\n"
                + "ORDER BY idBrand";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();
            List<Integer> list = new ArrayList<>();//
            while (rs.next()) {
                int quan = rs.getInt(1);
                list.add(quan);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return null;
    }

}
