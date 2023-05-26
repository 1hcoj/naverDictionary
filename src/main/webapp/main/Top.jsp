<%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-25
  Time: 오후 1:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

  <style>

    .logBtn{
      width: 86px;
      height: 32px;
      background-color: #03c75a;
      border-color: #d2cccc;
    }
    #memberInfor{
      float:right;
      margin-right: 16px;
      margin-top: 8px;
    }
    #userName{
      margin-right: 16px;
    }
  </style>
</head>
<body>
  <%
    String userName = (String)session.getAttribute("userName");
    String center = request.getParameter("center");
  %>
  <div id="memberInfor">
    <%
      if (userName!=null){
    %>

    <label id = userName><%=userName%> 님</label>
    <button class="logBtn" onclick="location.href='index.jsp?logout=1'">로그아웃</button>

    <%
    }else if (center == null){
    %>
    <button class= "logBtn" onclick="location.href='login/loginPage.jsp'">로그인</button>
    <%
    }
    else{
    %>
    <%}
    %>
  </div>

</body>
</html>
