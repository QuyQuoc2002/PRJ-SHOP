/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.ICommonDAO;
import dao.ModelSneakerDAO;
import entity.ModelSneaker;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author DELL
 */
public class ModelSneakerService implements ICommonService<ModelSneaker>{
    
    ICommonDAO<ModelSneaker> commonDAO = new ModelSneakerDAO();

    @Override
    public List<ModelSneaker> getAll() throws SQLException{
        return commonDAO.getAll();
    }

    @Override
    public ModelSneaker getOne(int id) {
        return commonDAO.getOne(id);
    }

    @Override
    public boolean add(ModelSneaker obj) {
        return commonDAO.add(obj);
    }

    @Override
    public boolean update(ModelSneaker obj, int id) {
        return commonDAO.update(obj, id);
    }

    @Override
    public boolean delete(int id) {
        return commonDAO.delete(id);
    }
    
    public List<ModelSneaker> getModelByIdStatus(int idStatus) {
        return new ModelSneakerDAO().getModelByIdStatus(idStatus);
    }
    
    public List<ModelSneaker> search(String text) {
        return new ModelSneakerDAO().search(text);
    }
    
    public List<ModelSneaker> sort(String col, String type) {
        return new ModelSneakerDAO().sort(col, type);
    }
    
    public List<ModelSneaker> filter(int priceFrom, int priceTo, int idSize, int idBrand) {
        return new ModelSneakerDAO().filter(priceFrom, priceTo, idSize, idBrand);
    }
    
    public List<ModelSneaker> getModelSneakerPerPage(int pageIndex, int numberModelSneaker) {
        return new ModelSneakerDAO().getModelSneakerPerPage(pageIndex, numberModelSneaker);
    }
}
