/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.AddressContactDAO;
import dao.ICommonDAO;
import entity.AddressContact;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DELL
 */
public class AddressContactService implements ICommonService<AddressContact>{
    
    ICommonDAO<AddressContact> commonDAO = new AddressContactDAO();

    @Override
    public List<AddressContact> getAll() throws SQLException{
        return commonDAO.getAll();
    }

    @Override
    public AddressContact getOne(int id) {
        return commonDAO.getOne(id);
    }

    @Override
    public boolean add(AddressContact obj) {
        return commonDAO.add(obj);
    }

    @Override
    public boolean update(AddressContact obj, int id) {
        return commonDAO.update(obj, id);
    }

    @Override
    public boolean delete(int id) {
        return commonDAO.delete(id);
    }
    
    public List<AddressContact> getAllByAccountDetailId(int idAccountDetail) {
        return new AddressContactDAO().getAllByAccountDetailId(idAccountDetail);
    }
    
    public boolean update(String nameContact, String phoneContact, String address, int xId) {
        return new AddressContactDAO().update(nameContact, phoneContact, address, xId);
    }
    
    public boolean update(boolean addressDefault, int xId) {
        return new AddressContactDAO().update(addressDefault, xId);
    }
    
}
