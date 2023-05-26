<%@ page import="vocabulary.VocabularyDAO" %>
<%@ page import="vocabulary.VocabularyDTO" %><%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-26
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");

  Integer id = (Integer)session.getAttribute("id");
  String name = (String)session.getAttribute("userName");
  String word = request.getParameter("word");
  VocabularyDAO vocabularyDAO = new VocabularyDAO();

%>
<%  if (id != null) {
     // Todo : 단어장 리스트 가져오기
     /** 단어장 페이지 구성
     *  단어 정보 -> getParameter
     *  id 를 이용해서 vocaList 출력 + Word table에서 vocaId 이용하여 단어 개수 count
     *  각 vocaList의 이름을 radioButton 형식으로 출력 -> 저장 버튼 클릭 -> Word table에서 단어 검색하여 vocaId를 저장
     * */
     VocabularyDTO[] vocabularyDTOS = vocabularyDAO.getVocabulary(id); %>
     <h1><%=name%> 님의 단어장</h1>
    <h3>"<%=word%>"를 어떤 단어장에 저장할까요 ? </h3>
     <form action="VocabularyProcess.jsp?word=<%=word%>>" method="post">

     <% for (int i = 0;i<vocabularyDTOS.length;i++) { %>
         <input type="radio" name="voca" value="<%=vocabularyDTOS[i].getName()%>"><%=vocabularyDTOS[i].getName()%><br>
     <% } %>
         <input type="submit" value="저장">
     </form>
<%}
  else if (word != null && !word.isEmpty()){
     // Todo :  Alert 를 이용해 사용자에게 선택권 주기
     response.sendRedirect("../login/loginPage.jsp");
  } else {
      // Todo : Error 문 표시
  }
%>
</body>
</html>
