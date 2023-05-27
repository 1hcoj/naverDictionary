<%@ page import="vocabulary.VocabularyDAO" %>
<%@ page import="vocabulary.VocabularyDTO" %>
<%@ page import="word.WordDAO" %><%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-26
  Time: 오후 4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>나의 단어장</title>
    <style>
        .wrapper {
            display: grid;
            place-items: center;
            min-height:  100vh;
        }
        .container {
            padding: 50px;
            font-weight: 900;
        }
        h4{
            color: gray;
            text-align: center;
        }
        a {
            text-decoration-line: none;
            color: gray;
        }
    </style>
</head>
<body>
<%--단어장 목록 출력하고 -> 각 단어장에 들어있는 단어의 개수 --> 각 단어장을 클릭 --> 단어장에 저장된 단어 목록 출력 !!--%>
    <div class="wrapper">
        <div class="container">
            <h1> <%=session.getAttribute("userName") + " 님 "%>단어장 리스트</h1>
            <%
                Integer userId = (Integer) session.getAttribute("id");
                VocabularyDAO vocabularyDAO = new VocabularyDAO();
                VocabularyDTO[] vocabularyDTOS = vocabularyDAO.getVocabulary(userId);
                WordDAO wordDAO = new WordDAO();
                for (int i = 0;i<vocabularyDTOS.length;i++){
                    // Todo : 링크 처리 -> 링크에 vocaId 정보 넘김
                    VocabularyDTO v = vocabularyDTOS[i];
                    int vId = Integer.parseInt(v.getId());
                    int count = wordDAO.countWord(vId);
                    String vocaName = v.getName();
                    String url = "MyVocabularyProcess.jsp?vocabularyId="+vId;
                    out.println("<h4><a href=\""+url+"\">"+vocaName + " "+count + " ></a> </h4>");
                }
            %>
        </div>

    </div>

</body>
</html>
