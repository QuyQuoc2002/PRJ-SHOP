/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.ICommonDAO;
import dao.StatusDAO;
import entity.Status;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DELL
 */
public class StatusService implements ICommonService<Status>{
    
    ICommonDAO<Status> commonDAO = new StatusDAO();

    @Override
    public List<Status> getAll() throws SQLException{
        return commonDAO.getAll();
    }

    @Override
    public Status getOne(int id) {
        return commonDAO.getOne(id);
    }

    @Override
    public boolean add(Status obj) {
        return commonDAO.add(obj);
    }

    @Override
    public boolean update(Status obj, int id) {
        return commonDAO.update(obj, id);
    }

    @Override
    public boolean delete(int id) {
        return commonDAO.delete(id);
    }
    
    public List<Status> getAll(String key) throws SQLException{
        return new StatusDAO().getAll(key);
    }
    
}
