<%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-25
  Time: 오후 1:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 50vh; /* 컨테이너의 높이를 조절하세요 */
        }

        .centeredSearch {
            text-align: center;
            line-height: 1;
        }

        #searchText{
            width: 500px;
            height: 60px;
        }
        #submitBtn{
            height: 60px;
            width: 80px;
            background-color: #03c75a;
            color: #FFFFFF;
            border: transparent;
        }
    </style>
</head>
<body>
    <div id="search">
        <form action="main/SearchResult.jsp" method="post" name="search">
            <div class="container">
                <div class="centeredSearch">
                    <input type = "text" id="searchText" placeholder="단어를 입력하세요" name="word">
                    <input type="submit" value="검색" id="submitBtn">
                </div>
            </div>

        </form>
    </div>
</body>
</html>
