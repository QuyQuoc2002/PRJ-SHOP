/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.AccountDAO;
import dao.ICommonDAO;
import entity.Account;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DELL
 */
public class AccountService implements ICommonService<Account>{
    
    ICommonDAO<Account> commonDAO = new AccountDAO();

    @Override
    public List<Account> getAll() throws SQLException{
        return commonDAO.getAll();
    }

    @Override
    public Account getOne(int id) {
        return commonDAO.getOne(id);
    }

    @Override
    public boolean add(Account obj) {
        return commonDAO.add(obj);
    }
    
    public int addReturnId(Account obj) {
        return new AccountDAO().addReturnId(obj);
    }

    @Override
    public boolean update(Account obj, int id) {
        return commonDAO.update(obj, id);
    }

    @Override
    public boolean delete(int id) {
        return commonDAO.delete(id);
    }
    
    public Account login(String phoneNumber, String password) {
        return new AccountDAO().login(phoneNumber, password);
    }
    
    public boolean isCheckDuplicatePhone(String phoneNumber) {
        return new AccountDAO().isCheckDuplicatePhone(phoneNumber);
    }
    
    public boolean changePW(String newPass, int id) {
        return new AccountDAO().changePW(newPass, id);
    }
    
}
