package vn.edu.hcmuaf.fit.project.DAO.dao;
import vn.edu.hcmuaf.fit.project.DAO.db.DBConnect;
import vn.edu.hcmuaf.fit.project.DAO.model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class userDAO {
     Statement stmt;
     {
        try {
            stmt = DBConnect.get();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    ResultSet rs;

    public User login(String username, String password) throws ClassNotFoundException, SQLException {
        User user = null;
        String query =  "SELECT * FROM users_table\n" +
                        "WHERE users_table.`Name` = ? \n" +
                        "AND users_table.`Password` = ?";

        try (
                Connection con = DBConnect.get().getConnection();
                PreparedStatement pstmt = con.prepareStatement(query)
        ) {
            pstmt.setString(1,username);
            pstmt.setString(2,password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt(1));
                    user.setUsername(rs.getString(2));
                    user.setPassword(rs.getString(3));
                    user.setIsAdmin(rs.getInt(4));
                    user.setIsClient(rs.getInt(5));
                }
            }
        }
        return user;
    }

    public User checkUser(String username) throws ClassNotFoundException, SQLException {
        User user = null;
        String query =  "SELECT * FROM users_table\n" +
                "WHERE users_table.`Name` = ? \n";

        try (
                Connection con = DBConnect.get().getConnection();
                PreparedStatement pstmt = con.prepareStatement(query)
        ) {
            pstmt.setString(1,username);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt(1));
                    user.setUsername(rs.getString(2));
                    user.setPassword(rs.getString(3));
                    user.setIsAdmin(rs.getInt(4));
                    user.setIsClient(rs.getInt(5));
                }
            }
        }
        return user;
    }

    public void signin(String username, String password) throws ClassNotFoundException, SQLException {
        String query = "INSERT INTO users_table (Name, Password, isAdmin, isClient) " +
                        "VALUES (?, ?, 0, 1);";

        try (
                Connection con = DBConnect.get().getConnection();
                PreparedStatement pstmt = con.prepareStatement(query)
        ) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.executeUpdate();
            }
        }

    public User findByEmail(String email) throws ClassNotFoundException, SQLException {
        User user = null;
        String query = "SELECT * FROM users_table WHERE Email = ?";

        try (Connection con = DBConnect.get().getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt(1));
                    user.setUsername(rs.getString(2));
                    user.setEmail(rs.getString(4));
                }
            }
        }
        return user;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        userDAO userDAO = new userDAO();
//        User users = userDAO.login("Nguyễn Văn A", "123");
//        User user1 = userDAO.checkUser("Nguyễn Văn A");
        userDAO.signin("test","123");
        User user1 = userDAO.checkUser("test");
        System.out.println(user1);
    }
}
