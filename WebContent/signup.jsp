<%--회원 회원가입 페이지. 회원가입 성공시 로그인페이지로 이동, 실패시 회원가입 페이지 다시 로드 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
     import="java.sql.*, cinema.*, functions.*" %>
<%@ page import="java.sql.*" %>
<% String memID = (String)session.getAttribute("memID"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/tab.css">
	<style type="text/css">
    	@import url("css/signup.css");
	</style>
</head>

<body>
    <div class="logo">
    	<input type="image" src="image/logo.png" width="230" onClick="location.href='mainAfLogin.jsp'">
    </div>
    <p class="subtitle"><input type="image" src="image/l_culture.png"></p><br>
    <div class="menu"><strong>
        <a class="menu" href="mainAfLogin.jsp">영화</a>
        <a class="menu" href="reserv.jsp">예매</a>
        <a class="menu" href="theater.jsp">극장</a>
        <%--로그인 전엔 로그인, 후엔 마이페이지 띄우기 --%>
        <%if(memID != null) { %>
        	<a class="menu" href="mypage.jsp">마이페이지</a><br>
        	<p><%=memID%>님 환영합니다!
			<a href="sessionLogout.jsp">LOG OUT</a></p>
        	<%} 
        	else { %>
        <a class="menu" href="sessionLoginuser.jsp">로그인</a>
        <%} %>
    </div><br></strong>

	<div class="container">
		회원가입 <br><br>
            <form action="signupCheck.jsp" method="post">
                <div>
                    <label for="memID"><b>아이디</b></label><br>
                    <input class="signup" type="text" placeholder=" 아이디를 입력하세요" name="memID" required><br><br>


                    <label for="memPW"><b>비밀번호</b></label><br>
                    <input class="signup" type="password" placeholder=" 비밀번호를 입력하세요" name="memPW" required><br><br>

                    <label for="memName"><b>이름</b></label><br>
                    <input class="signup" type="text" placeholder=" 이름을 입력하세요" name="memName" required><br><br>

                    <label for="telno"><b>휴대전화</b></label><br>
                    <input class="signup" type="text" placeholder=" 휴대폰 번호를 입력하세요" name="telno" required><br><br>

                    <br>
                    <input type="submit" value="가입하기">
                </div>
            </form>
    </div>
    
</body>

</html>