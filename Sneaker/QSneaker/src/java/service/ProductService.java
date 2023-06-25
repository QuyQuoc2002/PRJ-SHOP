/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.ICommonDAO;
import dao.ProductDAO;
import entity.Product;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DELL
 */
public class ProductService implements ICommonService<Product>{
    
    ICommonDAO<Product> commonDAO = new ProductDAO();

    @Override
    public List<Product> getAll() throws SQLException{
        return commonDAO.getAll();
    }
    public List<Product> getAll(int idModel){
        return new ProductDAO().getAll(idModel);
    }
    

    @Override
    public Product getOne(int id) {
        return commonDAO.getOne(id);
    }
    
    public Product getOne(int idModelSneaker, int idSize) {
        return new ProductDAO().getOne(idModelSneaker, idSize);
    }

    @Override
    public boolean add(Product obj) {
        return commonDAO.add(obj);
    }

    @Override
    public boolean update(Product obj, int id) {
        return commonDAO.update(obj, id);
    }
    
    public boolean update(String name, int price , int id) {
        return new ProductDAO().update(name, price, id);
    }

    @Override
    public boolean delete(int id) {
        return commonDAO.delete(id);
    }
    
    public List<Product> getAllByIdOrder(int idOrder) {
        return new ProductDAO().getAllByIdOrder(idOrder);
    }
    
    public List<Integer> getSoldQuantityByIdBrand() {
        return new ProductDAO().getSoldQuantityByIdBrand();
    }
    
    public static void main(String[] args) {
        System.out.println(new ProductService().getSoldQuantityByIdBrand());
    }
}
