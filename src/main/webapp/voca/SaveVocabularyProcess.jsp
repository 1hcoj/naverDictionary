<%@ page import="vocabulary.VocabularyDAO" %><%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-26
  Time: 오후 4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");

    String word = request.getParameter("word");
    String vI = request.getParameter("vocabularyId");
    Integer vocabularyId = Integer.parseInt(vI);
    VocabularyDAO vocabularyDAO = new VocabularyDAO();
    out.println(vocabularyId);
    out.println(word);
    vocabularyDAO.saveWord(vocabularyId,word);

    response.sendRedirect("../index.jsp");
%>