package user;

/** JSP 와 MYSQL 이 서로 데이터를 전달하기 위한 단위 */
public class UserDTO {
    private String userId;
    private String userPwd;
    private int id;

    public String getUserName() {
        return userName;
    }

    private String userName;

    public UserDTO(int id,String userId,String userName) {
        this.userId = userId;
        this.id = id;
        this.userName = userName;
    }
    // UserId -> Int 형으로 반환
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }


    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }



}
