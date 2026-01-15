package vn.edu.hcmuaf.fit.project.Service;

import vn.edu.hcmuaf.fit.project.DAO.dao.categoriesDAO;
import vn.edu.hcmuaf.fit.project.DAO.model.categories;

import java.sql.SQLException;
import java.util.List;

public class CategoryService {
    categoriesDAO categoryDAO= new categoriesDAO();

    public List<categories> getAll() throws SQLException, ClassNotFoundException {
        return categoryDAO.getAll();
    }

}
