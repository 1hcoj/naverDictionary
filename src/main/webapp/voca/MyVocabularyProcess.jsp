<%@ page import="word.WordDAO" %>
<%@ page import="word.WordDTO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Vector" %><%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-26
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>단어 목록</title>
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
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="container">
            <%
                request.setCharacterEncoding("UTF-8");
                // Todo : vocaId 정보를 받아와 단어목록 출력 !!
                String vId = request.getParameter("vocabularyId");
                Integer vocabularyId = Integer.parseInt(vId);

                WordDAO wordDAO = new WordDAO();
                WordDTO[] wordDTOS = wordDAO.getWord(vocabularyId);

                if (wordDTOS != null) {
                    int count = 1;
                    String beforeWord = wordDTOS[0].getWord();
                    String meaning = wordDTOS[0].getMeaning();
                    String pos = wordDTOS[0].getPart_of_speech();
                    out.println("<h2>" + beforeWord + "</h2>");
                    out.println("<h4>" +(count++) + ". " + pos + " " + meaning + "</h4>");

                    for (int i = 1; i < wordDTOS.length; i++) {
                        WordDTO w = wordDTOS[i];
                        String word = w.getWord();
                        meaning = wordDTOS[i].getMeaning();
                        pos = wordDTOS[i].getPart_of_speech();
                        if (!beforeWord.equals(word)){
                            count = 1;
                            beforeWord = word;
                            out.println("<h2>" + word + "</h2>");
                        }
                        out.println("<h4>" +(count++) + ". " + pos + " " + meaning + "</h4>");
                    }
                } else {
                    out.println("<h3> 단어장에 아직 단어가 없어요!! 단어를 추가해보세요 </h3>");
                }
            %>
        </div>
    </div>

</body>
</html>
