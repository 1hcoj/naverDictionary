<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-27
  Time: 오후 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  request.setCharacterEncoding("UTF-8");
  String userId = request.getParameter("id");
  UserDAO userDAO = new UserDAO();
  Boolean isDuplicate = userDAO.isUserIdDuplicate(userId);
  String result = userId;
  String regex = "^[0-9a-z]*$";
  if (result.matches(regex)){
    if (isDuplicate){
      result = "true";
    }
  }else {
    result = "regex";
  }

  response.sendRedirect("joinPage.jsp?result="+result);
%>