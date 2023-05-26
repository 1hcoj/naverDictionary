<%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-25
  Time: 오후 8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="word.WordDAO" %>
<%@ page import="word.WordDTO" %>

<head>

    <style>
        a {
            text-decoration-line: none;
            color: gray;
            font-size: 16px;
        }
    </style>
</head>
<%
    request.setCharacterEncoding("UTF-8");

    String word = request.getParameter("word");

    WordDAO wordDAO = new WordDAO();
    WordDTO[] wordList;
    if (word != null && !word.isEmpty()){
        String url = "\"../voca/VocabularyPage.jsp?word=" + word + "\"";
        // 한글 검색
        if (word.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*")){
            wordList = wordDAO.searchKToE(word);
            if (wordList != null) {
                out.println("<h1>" + word + " <a href="+url +">단어장에 추가 </a></h1>");
                for (int i = 0; i < wordList.length; i++) {
                    String en = wordList[i].getWord();
                    String pos = wordList[i].getPart_of_speech();
                    out.println("<h3>" + (i+1) + "." + pos + " " + en + "</h3>");

                }
            }else {
                out.println("아직은 준비되지 않은 단어입니다!!");
            }
        }
        // 영단어 검색
        else {
            wordList = wordDAO.searchEToK(word);
            if (wordList != null) {
                out.println("<h1>" + word + " <a href="+url +">단어장에 추가 </a></h1>");
                for (int i = 0; i < wordList.length; i++) {
                    String ko = wordList[i].getMeaning();
                    String pos = wordList[i].getPart_of_speech();
                    out.println("<h3>" + (i+1) + "." + pos + " " + ko + "</h3>");

                }
            }
            else {
                out.println("아직은 준비되지 않은 단어입니다!!");
            }
        }
    } else {
        out.println("단어를 입력해주세요 !!");
    }
%>
