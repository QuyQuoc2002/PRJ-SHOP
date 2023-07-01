/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Shado
 * @param <T>
 */
public interface ICommonDAO<T> {
    
    List<T> getAll() throws SQLException;
    
    T getOne(int id);
    
    boolean add(T obj);
    
    boolean update( T obj, int id);
    
    boolean delete(int id);
}
