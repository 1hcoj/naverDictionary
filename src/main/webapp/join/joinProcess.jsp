<%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-24
  Time: 오후 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<html>
<head>
    <title>회원가입 체크</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        /**
         * 1. DB와 연동하여 이미 회원이 존재하는지 확인
         * 2. 회원이 존재하지 않는다면 -> 회원가입 성공 ( DB에 저장 ) loginPage.jsp 로 Redirection
         * 3. 회원이 존재한다면 -> 회원가입 실패 JoinPage.jsp 로 Redirection
         * */
        UserDAO userDAO = new UserDAO();
        String userId = request.getParameter("userId");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPwd = request.getParameter("userPwd");
        String url = "joinPage.jsp";

        int count = userDAO.join(userId,userPwd,userName,userEmail);

        if (count == 1){
            url = "login/loginPage.jsp";
        }
        response.sendRedirect(url);
    %>
</body>
</html>
