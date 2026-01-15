package vn.edu.hcmuaf.fit.project.Service;

import vn.edu.hcmuaf.fit.project.DAO.dao.SizeDao;
import vn.edu.hcmuaf.fit.project.DAO.model.Product;
import vn.edu.hcmuaf.fit.project.DAO.model.Sizes;

import java.sql.SQLException;
import java.util.List;

public class SizeService {
    SizeDao sizeDao = new SizeDao();
    public List<Sizes> getAllSize() throws SQLException, ClassNotFoundException {
        return sizeDao.getAll();
    }
}
