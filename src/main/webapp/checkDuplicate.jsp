<%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-25
  Time: 오전 1:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.sql.*" %>

<%
  UserDAO userDAO = new UserDAO();

  String userId = request.getParameter("userId");
  Boolean isDuplicate = true;
  if (userId != null && !userId.isEmpty()){
    isDuplicate = userDAO.isUserIdDuplicate(userId);
  }

  response.setContentType("application/json");
  response.setCharacterEncoding("UTF-8");
  response.getWriter().write("{\"isDuplicate\": "+ isDuplicate + "}");
%>