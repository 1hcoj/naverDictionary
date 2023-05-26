<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>나의 사전</title>
    <style>
        body{
            text-align: center;
            color: #FFF;
            width: 100%;
        }
        #wrapper {
            width: 100%;
            text-align: left;
            min-height: 300px;
            margin: 0 auto;
        }
        header, footer,section, nav, aside{

            margin : 5px;
            padding: 10px;
        }
        header {
            height: 50px;
            background-color: #03c75a;
        }
        section {
            color: black;
            width: 100%;
            height: 300px;

        }
    </style>
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
    String center = request.getParameter("center");
    String logout = request.getParameter("logout");

    if (logout != null){
        session.invalidate();

    }
    if (center == null){
        center = "main/Search.jsp";
    }
%>
<div id="wrapper">

    <header>
        <jsp:include page="main/Top.jsp"/>
    </header>

    <section>
        <%-- Todo : 세션을 가지고 있는 경우와 가지고 있지 않은 경우 페이지 화면 다르게 구성...!! --%>
        <jsp:include page="<%=center%>"/>
    </section>

    <footer>

    </footer>

</div>
</body>
</html>