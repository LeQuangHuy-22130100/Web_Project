package vn.edu.hcmuaf.fit.project.DAO.dao;

import vn.edu.hcmuaf.fit.project.DAO.db.DBConnect;
import vn.edu.hcmuaf.fit.project.DAO.model.categories;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class categoriesDAO {
    List<categories> categories = new ArrayList<>(); // Dùng cho danh sách
     Statement stmt;
    {
        try {
            stmt = DBConnect.get();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    ResultSet rs;

    public List<categories> getAll() throws SQLException, ClassNotFoundException {
        rs = stmt.executeQuery(
                "SELECT c.* FROM categories c "
        );
        while (rs.next()) {
            categories category = new categories();
            category.setCategoryId(rs.getInt(1));
            category.setName(rs.getString(2));
            categories.add(category);
        }
        return categories;
    }


    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        categoriesDAO cateData = new categoriesDAO();
        List<categories> cateList = cateData.getAll();
        for (categories category : cateList) {
            System.out.println(category);
        }
    }
}

