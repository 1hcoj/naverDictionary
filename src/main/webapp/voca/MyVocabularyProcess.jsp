<%@ page import="word.WordDAO" %>
<%@ page import="word.WordDTO" %><%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-26
  Time: 오후 4:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        // Todo : vocaId 정보를 받아와 단어목록 출력 !!
        String vId = request.getParameter("vocabularyId");
        Integer vocabularyId = Integer.parseInt(vId);

        WordDAO wordDAO = new WordDAO();
        WordDTO[] wordDTOS = wordDAO.getWord(vocabularyId);

        if (wordDTOS != null){
            for (int i = 0;i<wordDTOS.length;i++){
                WordDTO w = wordDTOS[i];
                String word = w.getWord();
                WordDTO[] words = wordDAO.getWord(vocabularyId, word);
                out.println("<h2>"  + word + "</h2>");
                if (words != null){
                    for (int j= 0; j<words.length;j++){
                        String meaning = words[j].getMeaning();
                        String pos = words[j].getPart_of_speech();
                        out.println(" <h4>" + pos + " " + meaning + "</h4>");
                    }
                }
            }
        }
    %>
</body>
</html>
