<%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-24
  Time: 오전 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%
  request.setCharacterEncoding("UTF-8");
  String userId = null;
  String userPwd = null;
  UserDTO userInfor;
  if (request.getParameter("userId") != null) {
    userId = (String)request.getParameter("userId");
  }
  if (request.getParameter("userPwd") != null){
    userPwd = (String) request.getParameter("userPwd");
  }
  if (userId != null && userPwd != null){
    UserDAO userDAO = new UserDAO();

    userInfor = userDAO.doLogin(userId,userPwd);
    if (userInfor != null){
        session.setAttribute("id", userInfor.getId());
        session.setAttribute("userName",userInfor.getUserName());
        session.setMaxInactiveInterval(1800); // 30분간 세션유지

        response.sendRedirect("../index.jsp");
    } else {
        out.println("<script>alert('아이디 또는 비밀번호가 잘못되었습니다.');</script>");
        response.sendRedirect("loginPage.jsp");
    }
  }
%>