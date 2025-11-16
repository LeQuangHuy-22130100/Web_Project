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

    public User checkPower(String isAdmin) throws ClassNotFoundException, SQLException {
        User user = null;
        String query =  "SELECT *\n" +
                        "FROM users_table\n" +
                        "WHERE users_table.isAdmin = ?";

        try (
                Connection con = DBConnect.get().getConnection();
                PreparedStatement pstmt = con.prepareStatement(query)
        ) {
            pstmt.setString(1,isAdmin);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt(1));
                    user.setUsername(rs.getString(2));
                    user.setPassword(rs.getString(3));
                    user.setIsAdmin(rs.getInt(4));
                    user.setIsClient(rs.getInt(5));
                    pstmt.executeUpdate();
                }
            }
        }
        return user;
    }


    public User resetPassword(String username, String currentPassword, String newPassword) throws SQLException, ClassNotFoundException {
        User user = null;
        String checkQuery = "SELECT * FROM users_table WHERE Name = ? AND Password = ?";
        String updateQuery = "UPDATE users_table SET Password = ? WHERE Name = ?";

        try (Connection con = DBConnect.get().getConnection()) {
            // First, verify current credentials
            try (PreparedStatement checkStmt = con.prepareStatement(checkQuery)) {
                checkStmt.setString(1, username);
                checkStmt.setString(2, currentPassword);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (!rs.next()) {
                        return null; // Current password is incorrect
                    }
                }
            }

            // Update password
            try (PreparedStatement updateStmt = con.prepareStatement(updateQuery)) {
                updateStmt.setString(1, newPassword);
                updateStmt.setString(2, username);
                int rowsAffected = updateStmt.executeUpdate();

                if (rowsAffected > 0) {
                    user = new User();
                    user.setUsername(username);
                    user.setPassword(newPassword);
                }
            }
        }
        return user;
    }

    public boolean emailPasswordRecovery(String email, String newPassword) throws ClassNotFoundException, SQLException {
        String query = "UPDATE users_table SET Password = ? WHERE Email = ?";

        try (Connection con = DBConnect.get().getConnection(); PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, newPassword);
            pstmt.setString(2, email);

            return pstmt.executeUpdate() > 0;
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
