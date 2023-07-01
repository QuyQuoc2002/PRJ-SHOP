/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import connection.SQLServerConnection;
import entity.Cart;
import entity.OrderDetail;
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
public class OrderDetailDAO implements ICommonDAO<OrderDetail> {

  @Override
  public List<OrderDetail> getAll() throws SQLException {

    String sql = "SELECT * FROM OrderDetail";//

    try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
      ResultSet rs = ps.executeQuery();

      List<OrderDetail> list = new ArrayList<>();//
      while (rs.next()) {
        OrderDetail obj = OrderDetail.builder()
                .id(rs.getInt("id"))
                .idOrder(rs.getInt("idOrder"))
                .idProduct(rs.getInt("idProduct"))
                .nameProduct(rs.getString("nameProduct"))
                .priceProduct(rs.getInt("priceProduct"))
                .size(rs.getInt("sizeValue"))
                .quantity(rs.getInt("quantity"))
                .discount(rs.getInt("discount"))
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

  public List<OrderDetail> getAll(int idOrder) {

    String sql = "SELECT * FROM OrderDetail Where idOrder = ?";//

    try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
      ps.setObject(1, idOrder);
      ResultSet rs = ps.executeQuery();

      List<OrderDetail> list = new ArrayList<>();//
      while (rs.next()) {
        OrderDetail obj = OrderDetail.builder()
                .id(rs.getInt("id"))
                .idOrder(rs.getInt("idOrder"))
                .idProduct(rs.getInt("idProduct"))
                .nameProduct(rs.getString("nameProduct"))
                .priceProduct(rs.getInt("priceProduct"))
                .size(rs.getInt("size"))
                .quantity(rs.getInt("quantity"))
                .discount(rs.getInt("discount"))
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
  public OrderDetail getOne(int id) {
    String sql = "SELECT * FROM [OrderDetail] WHERE id = ?";

    try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
      ps.setObject(1, id);
      ResultSet rs = ps.executeQuery();
      if (rs.next()) {
        OrderDetail obj = OrderDetail.builder()
                .id(rs.getInt("id"))
                .idOrder(rs.getInt("idOrder"))
                .idProduct(rs.getInt("idProduct"))
                .nameProduct(rs.getString("nameProduct"))
                .priceProduct(rs.getInt("priceProduct"))
                .size(rs.getInt("sizeValue"))
                .quantity(rs.getInt("quantity"))
                .discount(rs.getInt("discount"))
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
  public boolean add(OrderDetail obj) {
    int check = 0;
    String sql = "INSERT INTO [OrderDetail](idOrder, idProduct, nameProduct, priceProduct, idSize, quantity, discount, total)"
            + " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

    try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
      ps.setObject(1, obj.getIdOrder());
      ps.setObject(2, obj.getIdProduct());
      ps.setObject(3, obj.getNameProduct());
      ps.setObject(4, obj.getPriceProduct());
      ps.setObject(5, obj.getSize());
      ps.setObject(6, obj.getQuantity());
      ps.setObject(7, obj.getDiscount());
      ps.setObject(8, obj.getTotal());
      check = ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace(System.out);
    }
    return check > 0;
  }

  public boolean addListCart(List<Cart> list, int orderId) {
    String query = "INSERT INTO OrderDetail(idOrder, idProduct, nameProduct, priceProduct, size, quantity, discount, total)"
            + " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
    int[] arr = {};
    try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = (con != null) ? con.prepareStatement(query) : null;) {
      if (ps != null) {
        for (Cart c : list) {
          ps.setObject(1, orderId);
          ps.setObject(2, c.getProductId());
          ps.setObject(3, c.getName());
          ps.setObject(4, c.getUnitPrice());
          ps.setObject(5, c.getSizeValue());
          ps.setObject(6, c.getQuantity());
          ps.setObject(7, 0);
          ps.setObject(8, (c.getQuantity() * c.getUnitPrice() * (100 - 0)) / 100);
          ps.addBatch();
        }
        arr = ps.executeBatch();
      }
    } catch (SQLException e) {
      e.printStackTrace(System.out);
    }
    return arr.length > 0;
  }

  @Override
  public boolean update(OrderDetail obj, int id) {
    int check = 0;
    String sql = "UPDATE [OrderDetail] SET idOrder = ?, idProduct = ?, nameProduct = ?, priceProduct = ?,"
            + "idSize = ?, quantity = ?, discount = ?, total = ? WHERE id = ?";

    try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
      ps.setObject(1, obj.getIdOrder());
      ps.setObject(2, obj.getIdProduct());
      ps.setObject(3, obj.getNameProduct());
      ps.setObject(4, obj.getPriceProduct());
      ps.setObject(5, obj.getSize());
      ps.setObject(6, obj.getQuantity());
      ps.setObject(7, obj.getDiscount());
      ps.setObject(8, obj.getTotal());
      ps.setObject(9, id);
      check = ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace(System.out);
    }
    return check > 0;
  }

  @Override
  public boolean delete(int id) {
    int check = 0;
    String sql = "DELETE FROM [OrderDetail] Where id = ?";

    try ( Connection con = SQLServerConnection.getConnection();  PreparedStatement ps = con.prepareStatement(sql);) {
      ps.setObject(1, id);
      check = ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace(System.out);
    }
    return check > 0;
  }

}
