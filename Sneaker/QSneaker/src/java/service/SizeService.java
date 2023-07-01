/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.ICommonDAO;
import dao.SizeDAO;
import entity.Size;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DELL
 */
public class SizeService implements ICommonService<Size>{
    
    ICommonDAO<Size> commonDAO = new SizeDAO();

    @Override
    public List<Size> getAll() throws SQLException {
        return commonDAO.getAll();
    }

    @Override
    public Size getOne(int id) {
        return commonDAO.getOne(id);
    }

    @Override
    public boolean add(Size obj) {
        return commonDAO.add(obj);
    }

    @Override
    public boolean update(Size obj, int id) {
        return commonDAO.update(obj, id);
    }

    @Override
    public boolean delete(int id) {
        return commonDAO.delete(id);
    }
    
    public List<Size> getAllByIdModel(int id) {
        return new SizeDAO().getAllByIdModel(id);
    }
}
