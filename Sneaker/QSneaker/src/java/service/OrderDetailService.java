/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.ICommonDAO;
import dao.OrderDetailDAO;
import entity.Cart;
import entity.OrderDetail;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DELL
 */
public class OrderDetailService implements ICommonService<OrderDetail>{
    
    ICommonDAO<OrderDetail> commonDAO = new OrderDetailDAO();

    @Override
    public List<OrderDetail> getAll() throws SQLException{
        return commonDAO.getAll();
    }

    @Override
    public OrderDetail getOne(int id) {
        return commonDAO.getOne(id);
    }

    @Override
    public boolean add(OrderDetail obj) {
        return commonDAO.add(obj);
    }

    @Override
    public boolean update(OrderDetail obj, int id) {
        return commonDAO.update(obj, id);
    }

    @Override
    public boolean delete(int id) {
        return commonDAO.delete(id);
    }
    
    public boolean addListCart(List<Cart> list, int orderId) {
        return new OrderDetailDAO().addListCart(list, orderId);
    }
    
    public List<OrderDetail> getAll(int idOrder){
        return new OrderDetailDAO().getAll(idOrder);
    }
}
