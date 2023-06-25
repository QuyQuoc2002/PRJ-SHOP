/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.ModelSneaker;
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
public class ModelSneakerDAO implements ICommonDAO<ModelSneaker> {

    @Override
    public List<ModelSneaker> getAll() throws SQLException{

        String sql = "SELECT * FROM ModelSneaker";//

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<ModelSneaker> list = new ArrayList<>();//
            while (rs.next()) {
                ModelSneaker obj = ModelSneaker.builder()
                        .id(rs.getInt("id"))
                        .name(rs.getString("name"))
                        .img(rs.getString("img"))
                        .price(rs.getInt("price"))
                        .idBrand(rs.getInt("idBrand"))
                        .description(rs.getString("description"))
                        .idStatus(rs.getInt("idStatus"))
                        .build();
                list.add(obj);
            }
            return list;
        } catch (SQLException e) {
            throw new SQLException();
        }
    }

    public List<ModelSneaker> search(String text) {

        String sql = "SELECT * FROM ModelSneaker WHERE name LIKE ?";//

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, "%" + text + "%");
            ResultSet rs = ps.executeQuery();

            List<ModelSneaker> list = new ArrayList<>();//
            while (rs.next()) {
                ModelSneaker obj = ModelSneaker.builder()
                        .id(rs.getInt("id"))
                        .name(rs.getString("name"))
                        .img(rs.getString("img"))
                        .price(rs.getInt("price"))
                        .idBrand(rs.getInt("idBrand"))
                        .description(rs.getString("description"))
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

    public List<ModelSneaker> sort(String col, String type) {

        String sql = "SELECT * FROM ModelSneaker ORDER BY " + col + " " + type;

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ResultSet rs = ps.executeQuery();

            List<ModelSneaker> list = new ArrayList<>();//
            while (rs.next()) {
                ModelSneaker obj = ModelSneaker.builder()
                        .id(rs.getInt("id"))
                        .name(rs.getString("name"))
                        .img(rs.getString("img"))
                        .price(rs.getInt("price"))
                        .idBrand(rs.getInt("idBrand"))
                        .description(rs.getString("description"))
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

    public List<ModelSneaker> filter(int priceFrom, int priceTo, int idSize, int idBrand) {
        String sql = "SELECT DISTINCT ms.id, ms.name, ms.img, ms.price, ms.idBrand, ms.description, ms.idStatus FROM ModelSneaker ms JOIN Product p ON ms.id = p.idModelSneaker "
                + "Where ms.price BETWEEN ? AND ?";
        if (idSize != 0) {
            sql = sql + " AND p.idSize = ?";
        }

        if (idBrand != 0) {
            sql = sql + " AND ms.idBrand = ?";
        }
        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, priceFrom);
            ps.setObject(2, priceTo);
            if (idSize != 0) {
                ps.setObject(3, idSize);
            }

            if (idBrand != 0) {
                if (idSize != 0) {
                    ps.setObject(4, idBrand);
                } else {
                    ps.setObject(3, idBrand);
                }
            }

            ResultSet rs = ps.executeQuery();

            List<ModelSneaker> list = new ArrayList<>();//
            while (rs.next()) {
                ModelSneaker obj = ModelSneaker.builder()
                        .id(rs.getInt("id"))
                        .name(rs.getString("name"))
                        .img(rs.getString("img"))
                        .price(rs.getInt("price"))
                        .idBrand(rs.getInt("idBrand"))
                        .description(rs.getString("description"))
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
    
        public List<ModelSneaker> getModelSneakerPerPage(int pageIndex, int numberModelSneaker) {
        String sql = "SELECT * FROM ModelSneaker ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROW ONLY";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, pageIndex);
            ps.setObject(2, numberModelSneaker);
            ResultSet rs = ps.executeQuery();

            List<ModelSneaker> list = new ArrayList<>();//
            while (rs.next()) {
                ModelSneaker obj = ModelSneaker.builder()
                        .id(rs.getInt("id"))
                        .name(rs.getString("name"))
                        .img(rs.getString("img"))
                        .price(rs.getInt("price"))
                        .idBrand(rs.getInt("idBrand"))
                        .description(rs.getString("description"))
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

    @Override
    public ModelSneaker getOne(int id) {
        String sql = "SELECT * FROM ModelSneaker WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ModelSneaker obj = ModelSneaker.builder()
                        .id(rs.getInt("id"))
                        .name(rs.getString("name"))
                        .img(rs.getString("img"))
                        .price(rs.getInt("price"))
                        .idBrand(rs.getInt("idBrand"))
                        .description(rs.getString("description"))
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
    public boolean add(ModelSneaker obj) {
        int check = 0;
        String sql = "INSERT INTO ModelSneaker(name, img, price, idBrand, description, idStatus)"
                + " VALUES(?, ?, ?, ?, ?, ?)";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getName());
            ps.setObject(2, obj.getImg());
            ps.setObject(3, obj.getPrice());
            ps.setObject(4, obj.getIdBrand());
            ps.setObject(5, obj.getDescription());
            ps.setObject(6, obj.getIdStatus());
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean update(ModelSneaker obj, int id) {
        int check = 0;
        String sql = "UPDATE ModelSneaker SET name = ?, price = ?, idBrand = ?, description = ?, idStatus = ? WHERE id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, obj.getName());
//            ps.setObject(2, obj.getImg());
            ps.setObject(2, obj.getPrice());
            ps.setObject(3, obj.getIdBrand());
            ps.setObject(4, obj.getDescription());
            ps.setObject(5, obj.getIdStatus());
            ps.setObject(6, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    @Override
    public boolean delete(int id) {
        int check = 0;
        String sql = "DELETE FROM ModelSneaker Where id = ?";

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, id);
            check = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }
        return check > 0;
    }

    public List<ModelSneaker> getModelByIdStatus(int idStatus) {

        String sql = "SELECT * FROM ModelSneaker WHERE idStatus = ?";//

        try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
            ps.setObject(1, idStatus);
            ResultSet rs = ps.executeQuery();

            List<ModelSneaker> list = new ArrayList<>();//
            while (rs.next()) {
                ModelSneaker obj = ModelSneaker.builder()
                        .id(rs.getInt("id"))
                        .name(rs.getString("name"))
                        .img(rs.getString("img"))
                        .price(rs.getInt("price"))
                        .idBrand(rs.getInt("idBrand"))
                        .description(rs.getString("description"))
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

    public static void main(String[] args) {
//        System.out.println(new ModelSneakerDAO().getAll().get(1));
//        System.out.println(new ModelSneakerDAO().getOne(3));
//        System.out.println(new ModelSneakerDAO().add(new ModelSneaker(1, "Le Man", "Le Man", "Le Man")));
//        System.out.println(new ModelSneakerDAO().update(new ModelSneaker(1, "Le Man", "sadasd", "Le Man"),22));
//        System.out.println(new ModelSneakerDAO().delete(23));
//        
    }
}
