<%@ page import="user.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: sagok
  Date: 2023-05-24
  Time: 오전 1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입 페이지</title>
    <style>

      .wrapper {
        display: grid;
        place-items: center;
        min-height:  100vh;
      }
      #container {
        padding: 50px;
        font-weight: 900;
      }
      #buttonJoin {
        margin-top: 16px;
        width: 240px;
        height: 40px;
        background-color: #03c75a;
        color: white;
        border-radius: 8px 8px 8px 8px;
        border-color: transparent;
      }

      .input{
        width: 240px;
        height: 40px;
        font-size: 8px;
      }
      #header{
        margin: 16px;
        font-weight: bolder;
      }
      a {
        text-decoration-line: none;
        color: #000000;
      }
    </style>
</head>


<script>
  function checkForm(){
    let form = document.joinForm;
    let userName = form.userName.value;
    let userId = form.userId.value;
    let userPwd = form.userPwd.value;
    let userEmail = form.userEmail.value;

    /** 정규 표현식
     *  ID : 영문 + 숫자 조합
     *  PWD : 숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
     * */
    let regExpId = /^[0-9a-z]+$/;
    let regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
    const urlParams = new URL(location.href).searchParams;
    const result = urlParams.get('result');
    if (!result || result === 'true' || result === 'regex') {
      alert("중복검사를 먼저 실행해주세요!!");
      return;
    }
    if (!userName){
      alert("사용자 이름을 입력해주세요!!");
      return;
    }
    if (!userEmail){
      alert("이메일을 입력해주세요!!");
      return;
    }
    if (!regExpId.test(userId)){
      alert("아이디 양식을 확인해주세요!!");
      return;
    }
    if (!regExpPw.test(userPwd)){
      alert("비밀번호 양식을 확인해주세요!!");
      return;
    }
    form.submit();
  }

  function checkDuplicate(){
    let form = document.joinForm;
    let userId = form.userId.value;
    location.href = "DuplicateProcess.jsp?id=" + userId;

  }
</script>

<%! Boolean toggle = false;
    String result;
%>
<body>
  <div id="header" role="banner">
    <p><a href="../index.jsp">Home</a></p>
  </div>

  <div class="wrapper">
    <div id="container" role="main">
      <form name="joinForm" method="post" action="joinProcess.jsp">
        <div id="joinName" role="inputName">
          <p>사용자 이름</p>
          <input type="text" name="userName" class="input">
        </div>
        <div id="joinId" role="inputId">
          <p>아이디</p>
          <input type="text" name="userId" placeholder="영문,숫자 조합"  class="input" id="userId"  /><br>
          <%
            //String result;
            result = request.getParameter("result");
            if (result != null && !result.isEmpty()){
              if (result.equals("true")){
                out.println("<span style=\"color : red \" >이미 존재하는 아이디입니다!!</span><br>");
                toggle = false;
              }
              else if(result.equals("regex")){
                out.println("<span style=\"color : red \" >형식에 맞지않는 아이디입니다!!</span><br>");
                toggle = false;
              }
              else {
                out.println("<span style=\"color : green \">사용가능한 아이디입니다!!</span><br>");
                toggle = true;
          %>
                <script>
                  let userIdElement = document.getElementById("userId");
                  userIdElement.value = "<%=result%>";
                </script>
          <%
              }
            }

          %>
          <input type="button" id="checkDuplicateBtn" value="아이디 중복 검사" onclick="checkDuplicate()">
        </div>
        <div id="joinPwd" role="inputPwd">
          <p>비밀번호</p>
          <input type="password" id="inputPwd" name="userPwd" placeholder="영문 2자이상, 특수문자,숫자 하나 이상 조합" class="input">

        </div>
        <div id="joinEmail" role="inputEmail">
          <p>이메일</p>
          <input type="email" name="userEmail" class="input">
        </div>
        <input type="button" id="buttonJoin" name="buttonJoin" onclick="checkForm()"  value="회원가입">
      </form>
    </div>
  </div>

  <div id="footer" role="contentinfo">

  </div>

</body>
</html>
