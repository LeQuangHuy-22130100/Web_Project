package vn.edu.hcmuaf.fit.project.DAO.dao;

import vn.edu.hcmuaf.fit.project.DAO.db.DBConnect;
import vn.edu.hcmuaf.fit.project.DAO.model.Product;
import vn.edu.hcmuaf.fit.project.DAO.model.Sizes;
import vn.edu.hcmuaf.fit.project.DAO.model.categories;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SizeDao {
    List<Sizes> Sizes = new ArrayList<>(); // Dùng cho danh sách
    static Statement stmt;
    static {
        try {
            stmt = DBConnect.get();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    ResultSet rs;

    public List<Sizes> getAll() throws SQLException, ClassNotFoundException {
        try (
                // Mở kết nối mới
                Statement stmt = DBConnect.get();
                ResultSet rs = stmt.executeQuery("SELECT * FROM sizes");
        ) {
            while (rs.next()) {
                Sizes size = new Sizes();
                size.setSizeID(rs.getInt("SizeID"));
                size.setSize(rs.getString("Size"));
                Sizes.add(size);
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return Sizes;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        SizeDao sizeDao = new SizeDao();
        List<Sizes> sizeList = sizeDao.getAll();
        for (Sizes size : sizeList) {
            System.out.println(size);
        }
    }
}
