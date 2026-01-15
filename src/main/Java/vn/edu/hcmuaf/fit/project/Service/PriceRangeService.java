package vn.edu.hcmuaf.fit.project.Service;

import vn.edu.hcmuaf.fit.project.DAO.dao.PriceRangeDAO;
import vn.edu.hcmuaf.fit.project.DAO.model.PriceRange;

import java.sql.SQLException;
import java.util.List;

public class PriceRangeService {
    PriceRangeDAO priceRangeDAO = new PriceRangeDAO();
    public List<PriceRange> getAllPriceRange() throws SQLException {
        return priceRangeDAO.getAll();
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException{
        PriceRangeService priceRangeService = new PriceRangeService();
        List<PriceRange> priceRanges = priceRangeService.getAllPriceRange();
        System.out.println(priceRanges);
    }
}
