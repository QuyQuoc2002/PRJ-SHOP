/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.ICommonDAO;
import dao.OrderDAO;
import entity.Order;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DELL
 */
public class OrderService implements ICommonService<Order>{
    
    ICommonDAO<Order> commonDAO = new OrderDAO();

    @Override
    public List<Order> getAll() throws SQLException{
        return commonDAO.getAll();
    }
    
    public List<Order> getAll(int idStatus){
        return new OrderDAO().getAll(idStatus);
    }

    @Override
    public Order getOne(int id) {
        return commonDAO.getOne(id);
    }

    @Override
    public boolean add(Order obj) {
        return commonDAO.add(obj);
    }

    @Override
    public boolean update(Order obj, int id) {
        return commonDAO.update(obj, id);
    }

    @Override
    public boolean delete(int id) {
        return commonDAO.delete(id);
    }
    
    public int addOrderReturnId(Order obj) {
        return new OrderDAO().addOrderReturnId(obj);
    }
    
    public int getIncome() {
        return new OrderDAO().getIncome();
    }
    
    public boolean updateStatus(int idOrder, int idStatus) {  
        return new OrderDAO().updateStatus(idOrder, idStatus);
    }  
}

