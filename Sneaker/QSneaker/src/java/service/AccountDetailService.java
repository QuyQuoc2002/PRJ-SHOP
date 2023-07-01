/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.AccountDetailDAO;
import entity.AccountDetail;
import java.util.List;
import dao.ICommonDAO;
import java.sql.Date;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class AccountDetailService implements ICommonService<AccountDetail>{
    
    ICommonDAO<AccountDetail> commonDao = new AccountDetailDAO();

    @Override
    public List<AccountDetail> getAll() throws SQLException{
        return commonDao.getAll();
    }

    @Override
    public AccountDetail getOne(int id) {
        return commonDao.getOne(id);
    }

    @Override
    public boolean add(AccountDetail obj) {
        return commonDao.add(obj);
    }

    @Override
    public boolean update(AccountDetail obj, int id) {
        return commonDao.update(obj, id);
    }

    @Override
    public boolean delete(int id) {
        return commonDao.delete(id);
    }
    
   public AccountDetail getOneByIdAccount(int id) {
       return new AccountDetailDAO().getOneByIdAccount(id);
   }
   
   public boolean update(String nickName, Date dob, int id) {
       return new AccountDetailDAO().update(nickName, dob, id);
   }
    
}
