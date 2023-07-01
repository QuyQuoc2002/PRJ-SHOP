/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.BrandDAO;
import dao.ICommonDAO;
import entity.Brand;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DELL
 */
public class BrandService implements ICommonService<Brand>{
    
    ICommonDAO<Brand> commonDAO = new BrandDAO();

    @Override
    public List<Brand> getAll() throws SQLException{
        return commonDAO.getAll();
    }

    @Override
    public Brand getOne(int id) {
        return commonDAO.getOne(id);
    }

    @Override
    public boolean add(Brand obj) {
        return commonDAO.add(obj);
    }

    @Override
    public boolean update(Brand obj, int id) {
        return commonDAO.update(obj, id);
    }

    @Override
    public boolean delete(int id) {
        return commonDAO.delete(id);
    }
    
}
