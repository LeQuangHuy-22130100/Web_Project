package vn.edu.hcmuaf.fit.project.DAO.db;
import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;


public class jdbiConnect {
    static String url = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port()+"/" + DBProperties.dbName()+"?"+DBProperties.option()   ;
    static Jdbi jdbi;

    public static Jdbi get(){
        if(jdbi == null){
            makeConnect();
        }
        return jdbi;
    }

    private static void makeConnect() {
        MysqlDataSource src = new MysqlDataSource();
        src.setUrl(url);
        src.setUser(DBProperties.userName());
        src.setPassword(DBProperties.userPass());

        try {
            src.setUseCompression(true);
            src.setAutoReconnect(true);
        } catch (SQLException e) {
        }
        jdbi = Jdbi.create(src);
    }

    public static void main(String[] args) {
        get();
    }

}
