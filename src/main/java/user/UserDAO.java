package user;

import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLData;

/** 데이터베이스에 직접 접근하여 데이터 처리를 하는 클래스 */
public class UserDAO {
    Connection conn = DatabaseUtil.getConnection();
    /** 회원 가입  */
    public int join(String userID, String userPassword, String userName, String userEmail){
        /** SQL 문 */
        String SQL = "INSERT INTO USER VALUES (?,?,?,?)";

        try{
            /** 각각의 데이터를 실제로 넣는 인터페이스*/
            PreparedStatement pstms = conn.prepareStatement(SQL);
            /** Query 문의 ? 에 데이터를 삽입 */
            pstms.setString(1,userID);
            pstms.setString(2,userPassword);
            pstms.setString(3,userName);
            pstms.setString(4,userEmail);
            /** 반환값 : insert 가 된 데이터의 개수 */
            return pstms.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }
    /** Login */
    public boolean doLogin(String userId, String userPwd){
        boolean isAuthenticated = false;
        String SQL = "SELECT * FROM USER WHERE userId = ? AND userPwd = ? ";

        try{
            PreparedStatement pstms = conn.prepareStatement(SQL);
            pstms.setString(1,userId);
            pstms.setString(2,userPwd);

            ResultSet resultSet = pstms.executeQuery();
            if (resultSet.next()){
                /** 로그인 성공 */
                isAuthenticated = true;
            }else {
                /** 로그인 실패 */
            }
            resultSet.close();
            pstms.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return isAuthenticated;
    }
}
