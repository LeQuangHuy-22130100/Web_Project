package vn.edu.hcmuaf.fit.project.DAO.db;

import java.sql.*;


public class DBConnect {
    static String url = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port()+"/" + DBProperties.dbName()+"?"+DBProperties.option()   ;
    static Connection con;

    public static Statement get() throws ClassNotFoundException {
        try {
            if (con == null || con.isClosed()) {
                makeConnect();
            }
            return con.createStatement();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            return null;
        }
    }

    private static void makeConnect() throws ClassNotFoundException, SQLException {
        // TODO Auto-generated method stub
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url,DBProperties.userName(), DBProperties.userPass());
    }




    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        get();
    }
}
