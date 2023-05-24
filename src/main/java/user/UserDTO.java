package user;

/** JSP 와 MYSQL 이 서로 데이터를 전달하기 위한 단위 */
public class UserDTO {
    private String userId;
    private String userPwd;

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
