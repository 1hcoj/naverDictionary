<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인 페이지</title>

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
      #buttonLogin {
        margin-top: 16px;
        width: 180px;
        height: 36px;
        background-color: #03c75a;
        color: white;
        border-radius: 8px 8px 8px 8px;
        border-color: transparent;
      }
      a {
        text-decoration-line: none;
        color: gray;
      }
    </style>
</head>

<script type="text/javascript">
  function checkForm(){
    let form = document.loginForm
    let id = form.userId.value;
    let pwd = form.userPwd.value;
    /** 정규 표현식
    *  ID : 영문 + 숫자 조합
    *  PWD : 숫자, 특수문자 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
     * */
    let regExpId = /^[0-9a-z]+$/;
    let regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;

    if (!regExpId.test(id)){
      alert("아이디 입력을 확인해주세요!!")
      return;
    }
    if (!regExpPw.test(pwd)) {
      alert("비밀번호 입력을 확인해주세요!!")
      return;
    }
    form.submit();
  }
</script>
<body>

  <div id="header" role="banner">
  </div>
  <div class="wrapper">

    <div id="container" role="main" >

      <form name="loginForm" method="post" action="userCheck.jsp">
        <div id="id" role="inputId">
          <p>아이디</p>
          <input type="text" name="userId">
        </div>

        <div id="password" role="inputPwd">
          <p>비밀번호</p>
          <input type="password" name="userPwd">
        </div>

        <div id="submit" role="login" >
          <input type="button" value="로그인" onclick="checkForm()" id="buttonLogin" >
        </div>
      </form>

      <p id="textJoin" style="text-align: center"><a href="joinPage.jsp">회원가입</a></p>

    </div>

  </div>

  <div id="footer" role="contentinfo">

  </div>
</body>
</html>
