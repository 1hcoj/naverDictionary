<%@ page import="vocabulary.VocabularyDAO" %><%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-27
  Time: 오후 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  request.setCharacterEncoding("UTF-8");
  String name = request.getParameter("vocabularyName");
  Integer userId = (Integer) session.getAttribute("id");

  VocabularyDAO vocabularyDAO = new VocabularyDAO();
  vocabularyDAO.addVocabulary(userId,name);

  response.sendRedirect("../index.jsp");
%>