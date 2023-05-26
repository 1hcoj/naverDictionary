package user;

import util.DatabaseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;

/** UserDAO 클래스의 주요 내용
 *
 * < PreparedStatement class >
 *  1. executeUpdate() : INT 타입의 값을 반환 ( SELECT 구문 제외한 다른 구문 수행 )
 *      - INSERT / DELETE / UPDATE 관련 구문 : 레코드 건수 반환
 *      - CREATE / DROP 관련 구문 : -1 반환
 *
 *  2. executeQuery() : ResultSet 객체의 값을 반환 ( SELECT 구문 수행 )
 *
 *  3. execute() : BOOLEAN 타입의 값을 반환 ( 모든 구문 수행 )
 *      - 리턴 타입이 ResultSet 인 경우 true ; Else false
 *
 * */

// 데이터베이스에 직접 접근하여 데이터 처리를 하는 클래스
public class UserDAO {
    Connection connection = DatabaseUtil.getConnection();

    public int join(String userID, String userPassword, String userName, String userEmail){

        // SQL
        String SQL = "INSERT INTO USER(userName,userId,userPwd,userEmail) VALUES (?,?,?,?)";

        try{
            // PreparedStatement Class : Statement 클래스의 기능 향상 ( SQL 구문을 실행하는 역할 )
            PreparedStatement statement = connection.prepareStatement(SQL,PreparedStatement.RETURN_GENERATED_KEYS);
            // setString ( 인덱스, 값 ) : 인덱스는 SQL 문의 ? 인덱스를 가리키고, 값을 대입하는 함수.
            statement.setString(1,userName);
            statement.setString(2,userID);
            statement.setString(3,userPassword);
            statement.setString(4,userEmail);

            return statement.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }
    /**
     * 함수명 : doLogin
     * 매개변수 : userId ( String ) , userPwd ( String )
     * 반환형 : boolean
     * 함수 설명 :
     *      - DB 에 userId 와 userPwd 가 동시에 일치하는 Tuple ( Record )이 있는지 확인
     *      - 존재하는 경우 true
     *      - 존재하지 않는 경우 false
     * */
    public UserDTO doLogin(String userId, String userPwd){
        String SQL = "SELECT * FROM USER WHERE userId = ? AND userPwd = ? ";
        Boolean isSuccess = false;
        UserDTO user;
        try{
            PreparedStatement statement = connection.prepareStatement(SQL);
            statement.setString(1,userId);
            statement.setString(2,userPwd);

            ResultSet resultSet = statement.executeQuery();
            // 로그인 성공
            if (resultSet.next()){
                String userName = resultSet.getString("userName");
                int id = resultSet.getInt("id");
                user = new UserDTO(id,userId,userName);
                return user;
            }
            resultSet.close();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    /**
     *  함수명 : isUserIdDuplicate
     *  매개변수 : String userId
     *  반환형 : boolean
     *  함수 설명 :
     *      - userId 를 입력받고 DB 에 검색
     *      - DB 에 userId 가 존재하는 경우 true
     *      - DB 에 userId 가 존재하지 않는 경우 false
     * */
    public boolean isUserIdDuplicate(String userId){
        String SQL = "SELECT COUNT(*) FROM USER WHERE userId = ?";
        try{
            PreparedStatement statement = connection.prepareStatement(SQL);
            statement.setString(1,userId);

            ResultSet resultSet = statement.executeQuery();
            resultSet.next(); // 커서가 첫 번째 레코드를 가리키게 함.
            int count = resultSet.getInt(1); //첫번 째 열의 값을 가져옴 ( 아이디의 개수 )
            return  count > 0;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
