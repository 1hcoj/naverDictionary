<%@ page import="vocabulary.VocabularyDAO" %><%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-27
  Time: 오후 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    #submitButton{
      margin-top: 16px;
      width: 300px;
      height: 30px;

    }
    #nameText{
      width: 300px;
      height: 40px;
    }
  </style>
</head>
<body>
  <div class="wrapper">
    <div class = "container">
      <form action="AddVocabularyProcess.jsp" method="post" name="addForm">
        <input type="text"  id="nameText" name="vocabularyName" placeholder="단어장 이름"><br>
        <input type="submit" value="추가" id="submitButton">
      </form>
    </div>
  </div>

</body>
</html>