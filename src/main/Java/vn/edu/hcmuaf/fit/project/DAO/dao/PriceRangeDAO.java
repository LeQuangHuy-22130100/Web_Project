package vn.edu.hcmuaf.fit.project.DAO.dao;

import vn.edu.hcmuaf.fit.project.DAO.db.DBConnect;
import vn.edu.hcmuaf.fit.project.DAO.model.PriceRange;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PriceRangeDAO {
    List<PriceRange> listPriceRange = new ArrayList<>(); // Dùng cho danh sách
    Statement stmt;
    {
        try {
            stmt = DBConnect.get();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    ResultSet rs;
    public List<PriceRange> getAll() throws SQLException {
        rs = stmt.executeQuery(
                "SELECT price_range.*\n" +
                        "FROM price_range;"
        );
        while (rs.next()) {
            PriceRange priceRange = new PriceRange();
            priceRange.setPriceID(rs.getInt("priceID"));
            priceRange.setPriceMin(rs.getString("priceMin"));
            priceRange.setPriceMax(rs.getString("priceMax"));
            listPriceRange.add(priceRange);
        }
        return listPriceRange;
    }


    public static void main(String[] args) throws SQLException {
        PriceRangeDAO priceRangeDAO = new PriceRangeDAO();
        List<PriceRange> price = priceRangeDAO.getAll();
        for (PriceRange priceRange : price) {
            System.out.println(priceRange);
        }

    }
}
