<%--
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

  /**
   * $(document).ready() : ready 내부의 코드가 html 문서가 로드된 이휴에 실행되도록 설정
   * $('#버튼 name').click() : click 내부의 코드는 버튼이 클릭되었을 때 실행되는 이벤트 핸들러 정의
   * $.ajax() : ajax 내부의 코드를 통해 Ajax 요청을 전송
   *  - type : 요청 전송 방식
   *  - url : 요청을 보낼 url
   *  - data : 요청에 포함될 테이터를 설정 { id : 값 }
   *  - success : 요청이 성공적으로 완료되었을 때 실행되는 callback 메소드 -> 응답 결과를 result 로 받아옴
   *  - error : 요청이 실패했을 때 실행되는 callback 메소드
   * */
  $(document).ready(function() {

    var isDuplicate = true;

    $('#checkDuplicateBtn').click(function() {
      var userId = $('#userId').val();
      $.ajax({
        type: 'POST',
        url: 'checkDuplicate.jsp',
        data: { userId : userId },
        success: function(response) {
          if (response.isDuplicate) {
            $('#duplicateMsg').text('이미 사용 중인 아이디입니다.')
            isDuplicate = true;
          } else {
            $('#duplicateMsg').text('사용 가능한 아이디입니다.');
            isDuplicate = false;
          }
        },
        error: function() {
          alert('중복 검사에 실패했습니다.');
        }
      });
    });
    /* Todo : 중복처리 */
    /*$('#buttonJoin').click(function(event){
      if (isDuplicate){
        event.preventDefault();
        alert('아이디 중복검사를 실행해주세요!');
      }
      else {
        checkForm();
      }
    });*/

    /*$('#userId').keypress(function(event){
      if (event.key != 'Enter'){
        isDuplicate = true;
      }
    });*/

  });
</script>

<body>
  <div id="header" role="banner">
    <p><a href="../login/loginPage.jsp">Home</a></p>
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
          <input type="text" name="userId" placeholder="영문,숫자 조합" class="input"/><br>
          <span id="duplicateMsg"></span><br>
          <input type="button" id="checkDuplicateBtn" value="아이디 중복 검사">
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
