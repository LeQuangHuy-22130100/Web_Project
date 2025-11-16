package vn.edu.hcmuaf.fit.project.DAO.db;

import java.util.Properties;

public class DBProperties {
    private static Properties prop = new Properties();

    static {
        try {
            prop.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String host() {
        return prop.get("db.host").toString();
    }

    public static int port() {
        try {
            return Integer.parseInt(prop.get("db.port").toString());
        } catch (Exception e) {
            // TODO: handle exception
            return 3306;
        }

    }

    public static String userName() {
        return prop.get("db.username").toString();
    }

    public static String userPass() {
        return prop.get("db.password").toString();
    }

    public static String dbName() {
        return prop.get("db.dbname").toString();
    }

    public static String option() {
        return prop.get("db.option").toString();
    }

}
