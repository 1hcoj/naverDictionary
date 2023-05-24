<%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-24
  Time: 오전 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%
  request.setCharacterEncoding("UTF-8");
  String userId = null;
  String userPwd = null;

  if (request.getParameter("userId") != null) {
    userId = (String)request.getParameter("userId");
  }
  if (request.getParameter("userPwd") != null){
    userPwd = (String) request.getParameter("userPwd");
  }
  if (userId != null && userPwd != null){
    UserDAO userDAO = new UserDAO();

  }
%>
<html>
<head>
    <title>로그인 확인</title>
</head>
<body>

</body>
</html>
