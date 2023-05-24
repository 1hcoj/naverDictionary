package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
    /** 데이터베이스와 연결 상태 관리*/
    public static Connection getConnection(){
        try {
            String dbURL = "jdbc:mysql://localhost:3308/dictionarydb?useUnicode=true&characterEncoding=utf8";
            String dbId = "201901604user";
            String dbPwd = "201901604pw";

            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(dbURL,dbId,dbPwd);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
